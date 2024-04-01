-- neo-tree --
vim.api.nvim_create_autocmd("VimEnter", {
	command = "set nornu nonu | Neotree toggle",
})
vim.api.nvim_create_autocmd("BufEnter", {
	command = "set rnu nu",
})

-- conform --
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
