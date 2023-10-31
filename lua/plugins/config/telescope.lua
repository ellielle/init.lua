-- import telescope safely
local status, telescope = pcall(require, "telescope")
if not status then
  print("telescope failed to load")
  return
end

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules" },
    path_display = { "truncate" }, -- hidden, tail, absolute, smart, shorten, truncate (truncate can = a number like "truncate = 3")
    preview = {
      treesitter = false,          -- Disable treesitter in the preview window so large files don't hang
      filesize_limit = 0.1,
      timeout = 250,
    },
  },
})
