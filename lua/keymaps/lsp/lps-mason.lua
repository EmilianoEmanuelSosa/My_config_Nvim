local okWhich, with_key = pcall(require, "which-key")
local ok, cmp = pcall(require, "cmp_nvim_lsp")
local addCommand = require("keymaps.config.which-key")
local capabilities = vim.lsp.protocol.make_client_capabilities()
local M = {}

function addCommand(command)
	return "<cmd>" .. command .. "<cr>"
end

if not ok or not okWhich then
	return
end

M.capabilities = cmp.default_capabilities(capabilities)

M.on_attach = function(client, bufnr)
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })

	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>f",
		"<cmd>lua vim.lsp.buf.format()<cr>",
		{ noremap = true, silent = true }
	)
end

-- Adjusted key mappings to match the format used in your working example
with_key.register({
	["<leader>f"] = {
		name = "LSP",
		a = { addCommand("lua vim.lsp.buf.code_action()"), "Code Action" },
		r = { addCommand("lua vim.lsp.buf.rename()"), "Rename" },
		d = { addCommand("lua vim.lsp.buf.definition()"), "goto definition" },
		i = { addCommand("lua vim.lsp.buf.implementation()"), "goto implementation" },
		F = { addCommand("lua require('telescope.builtin').lsp_references()"), "goto references" },
		p = { addCommand("lua vim.lsp.buf.type_definition()"), "Type definition" },
		K = { addCommand("lua vim.lsp.buf.signature_help()"), "Signature Documentation" },
		k = { addCommand("lua vim.lsp.buf.hover()"), "Hover Documentation" },
		-- f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
		-- ds = { addCommand("lua require('telescope.builtin').lsp_document_symbols()"), "Documents Symbols" },
		-- ws = { addCommand("lua require('telescope.builtin').lsp_dynamic_workspace_symbols()"), "Workspace Symbols" },
		-- nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		-- nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
		-- nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	},
})

return M
