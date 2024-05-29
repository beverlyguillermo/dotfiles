local opt = vim.opt

opt.guicursor = ""

opt.number = true

opt.listchars = {
    -- eol = "↵",
    tab = "»·",
    -- lead = "·",
    trail = "·"
}
opt.list = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = "/tmp/beverlyguillermo/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true


opt.termguicolors = true
opt.colorcolumn = "120"

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

