vim.g.mapleader = ","

local map = vim.keymap.set

-- open ex file navigation
map("n", "<leader>pv", vim.cmd.Ex)

-- move highlighted lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in place for join
map("n", "J", "mzJ`z")

-- keep cursor in the middle as paginate and search
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- keep same content as paste
map("x", "<leader>p", [["_dP]])

-- yanking to system clipboard
map({"n", "v"}, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- deleting
map({"n", "v"}, "<leader>d", [["_d]])

-- format per lsp
map("n", "<leader>f", vim.lsp.buf.format)

-- quickfix nav
map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- quick substitution at cursor
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make a file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

map("n", "<leader><leader>", function()
    vim.cmd("so")
end)
