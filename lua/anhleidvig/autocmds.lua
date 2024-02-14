local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

function R(name)
  require("plenary.reload").reload_module(name)
end

vim.filetype.add({
  extension = {
    templ = 'templ',
  }
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc", { clear = true }),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime", { clear = true }),
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd('checktime')
    end
  end
})

autocmd('TextYankPost', {
    group = augroup("yank_group", { clear = true }),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits", { clear = true }),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- wrap and check for spell in text filetypes
autocmd("FileType", {
  group = augroup("wrap_spell", { clear = true }),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Strip trailing whitespace
autocmd({"BufWritePre"}, {
    group = augroup("strip_trailing_whitespace", { clear = true }),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd("BufWritePre", {
  group = augroup("lsp_autoformat", { clear = true }),
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- Set up the LSP keybindings
autocmd('LspAttach', {
  group = augroup("lsp_keybindings", { clear = true }),
  callback = function(e)
    vim.keymap.set({"v", "n"}, "<leader>cl", "<cmd>LspInfo<cr>", { desc = "References" })
    vim.keymap.set("n", "gd", function()
        require("telescope.builtin").lsp_definitions({ reuse_win = true })
    end, { desc = "Goto Definition" })
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "References" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
    vim.keymap.set("n", "gI", function()
        require("telescope.builtin").lsp_implementations({ reuse_win = true })
    end, { desc = "Goto Implementation" })
    vim.keymap.set("n", "gy", function()
        require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
    end, { desc = "Goto T[y]pe Definition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
    vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
    vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
    vim.keymap.set({"v", "n"}, "<leader>ca", function()
        vim.lsp.buf.code_action()
    end, { desc = "Code Actions" })
    vim.keymap.set({"v", "n"}, "<leader>cA", function()
        vim.lsp.buf.code_action({
            context = {
                only = { "source" },
                diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
            },
        })
    end, { desc = "Source Actions" })
    vim.keymap.set({"n", "v"}, "<leader>crn", function()
        vim.lsp.buf.rename()
    end, { desc = "Rename" })
  end,
})

