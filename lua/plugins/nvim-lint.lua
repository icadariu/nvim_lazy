return {
	"mfussenegger/nvim-lint",
	events = { "BufWritePost", "BufReadPost", "InsertLeave" },
	linters_by_ft = {
		-- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
		terraform = { "tflint" },
		ansiblelint = { "ansible_lint" },
		bash = { "bash" },
		markdownlint = { "markdownlint" },
		tflint = { "tflint" },
		tfsec = { "tfsec" },
		yq = { "yq" },
		zsh = { "zsh" },
	},
}
