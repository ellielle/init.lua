return {
	"rest-nvim/rest.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	ft = "http",
	event = { "BufReadPre *.http", "BufNewFile *.http" },
	config = function(_, opts)
		local ok, rest = pcall(require, "rest-nvim")
		if not ok then
			vim.notify("Rest is not installed", 3)
			return
		end
		local wk_status, wk = pcall(require, "which-key")
		if not wk_status then
			vim.notify(wk, vim.log.levels.ERROR)
			return
		end

		rest.setup({
			-- Open request results in a horizontal split
			result_split_horizontal = false,
			-- Keep the http file buffer above|left when split horizontal|vertical
			result_split_in_place = false,
			-- Skip SSL verification, useful for unknown certificates
			skip_ssl_verification = false,
			-- Encode URL before making request
			encode_url = true,
			-- Highlight request on run
			highlight = {
				enabled = true,
				timeout = 150,
			},
			result = {
				-- toggle showing URL, HTTP info, headers at top the of result window
				show_url = true,
				-- show the generated curl command in case you want to launch
				-- the same request via the terminal (can be verbose)
				show_curl_command = false,
				show_http_info = true,
				show_headers = true,
				-- executables or functions for formatting response body [optional]
				-- set them to false if you want to disable them
				formatters = {
					json = "jq",
					html = function(body)
						return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
					end,
				},
			},
			-- Jump to request line on run
			jump_to_request = false,
			env_file = ".env",
			custom_dynamic_variables = {},
			yank_dry_run = true,
		})

		wk.register({
			p = {
				r = { "<Plug>RestNvim", "rest: Execute request" },
				p = { "<Plug>RestNvimPreview", "rest: Preview request cURL command" },
				x = { "<Plug>RestNvimLast", "rest: Repeat request" },
			},
		}, { prefix = "<leader>" })
	end,
}
