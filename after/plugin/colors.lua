--require('rose-pine').setup({
--    disable_background = true
--})
--require('monokai').setup { palette = require('monokai').pro }

function ColorMyPencils(color)
	color = color or "monokai"
    vim.o.background = "dark"
	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
