return {
  -- mark files and easily move between them
  "ThePrimeagen/harpoon",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local hm_status, harpoon_mark = pcall(require, "harpoon.mark")
    if not hm_status then
      vim.notify(harpoon_mark, vim.log.levels.ERROR)
      return
    end
    local hui_status, harpoon_ui = pcall(require, "harpoon.ui")
    if not hui_status then
      vim.notify(harpoon_ui, vim.log.levels.ERROR)
      return
    end
    local wk_status, wk = pcall(require, "which-key")
    if not wk_status then
      vim.notify(wk, vim.log.levels.ERROR)
      return
    end

    wk.register({
      a = { harpoon_mark.add_file, "harpoon: Mark file" },
      h = {
        n = { harpoon_ui.nav_next, "harpoon: Go to next mark" },
        p = { harpoon_ui.nav_prev, "harpoon: Go to previous mark" },
        f = { harpoon_ui.toggle_quick_menu, "harpoon: Show marks" },
      },
    }, { prefix = "<leader>" })
  end,
}
