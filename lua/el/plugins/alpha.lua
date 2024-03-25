return {
  "goolord/alpha-nvim",
  requires = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local ok, alpha = pcall(require, "alpha")
    if not ok then
      vim.notify(alpha, vim.log.levels.ERROR)
      return
    end
    local dashboard = require("alpha.themes.dashboard")

    -- Header ASCII
    dashboard.section.header.val = {
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣢⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣾⡿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣾⣷⣿⣿⡿⠁⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⢐⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣾⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⢸⡞⠀⠀⠀⠀⠀⣸⣿⡿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⢀⡿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⡟⠁⢿⡇⠀⠀⠀⠀⠀⠀⣨⣿⡿⠀⠀⠀⢠⣼⡿⠟⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⡶⠇⣾⡅⠀⠀⠀⠀⠀⠀⣤⡄⠀⠀⢸⣿⣿⣿⡧⠀⣼⡇⠀⠀⠀⠀⠀⢠⣾⣿⠓⠀⠀⠀⠈⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⢵⠄⠀⠀⠀⠀⢀⣾⠇⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⡄⠀⢀⣠⠶⠰⣾⠟⠏⠀⠀⠀⠀⠐⠿⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣿⣿⡇⠀⠁⠀⠀⠀⠀⠈⢿⣷⡆⠀⢠⣾⣿⣿⣿⣿⣿⣿⣧⣴⣽⣿⠀⠈⠁⠀⣐⡀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣿⠿⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣅⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⣽⣿⣿⡦⠀⠀⠰⢷⡄⣠⣼⣿⣧⣤⣿⣿⣿⣿⣿⣿⣿⣾⣿⢻⣿⡯⠀⠀⢠⡿⠁⢀⣿⡇⣶⡃⠀⠀⠀⠀⣠⠀⠀⠀⣿⠋⠁⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠀⠀⠀⠀⠀⠀⢸⣿⡀⠀⠀⠀⠒⣿⣿⣿⡇⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⢸⠟⠁⠀⢠⣿⣧⡄⢺⡏⠀⣿⡆⠀⠀⠀⢠⣿⠁⠀⢀⠛⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣀⠀⠀⠀⠀⠛⣿⣧⠀⢠⠀⠈⢻⣿⣷⡤⠨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣻⡟⠃⠀⢠⣴⣿⣿⣿⡇⠛⢣⣴⣿⣿⠀⠀⠀⣽⣯⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⡂⠀⠀⠀⢀⡀⠀⠀⡀⠨⣿⣿⣷⡀⠀⠀⠈⠈⠀⠘⣿⣄⣿⣿⣿⡏⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣷⣾⣿⣿⣿⣿⣿⠏⠀⣲⣿⣿⡿⠀⠀⠀⢸⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡆⠀⠀⠀⢳⣅⡀⣧⡄⠀⠿⣿⣧⡄⠀⢆⠄⠀⣸⠓⢸⣿⣿⣿⣳⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⣸⡿⠻⢢⣎⠀⠀⠈⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⣯⣀⠀⠀⠀⣿⣮⣾⣿⣄⠈⢻⣿⣟⠀⢹⡦⣀⣿⣏⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢾⡿⣿⣾⣾⡟⣿⣿⣿⣿⣿⠏⠺⣿⣿⣿⡇⣱⡏⢁⠀⣽⣷⠀⠀⠀⣿⡯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⡄⠀⠀⣹⣿⣷⣿⣿⡄⢸⣿⣿⠀⠈⢿⣺⣿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣾⣽⣿⣿⣿⢯⣿⣿⣿⣿⣧⣦⣴⣿⣿⣿⣿⣿⣧⣼⣶⣿⣿⡇⠀⡴⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠽⠃⠀⠀⠸⠿⢿⣿⡯⢽⡀⠻⣿⠀⢀⡸⣿⣿⣿⣿⣾⣿⣿⣗⡀⠹⣷⣿⣹⣿⣿⣿⣿⣿⣿⣿⣟⣾⠿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣯⢺⣿⠽⣿⣿⣿⠇⠈⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⢲⠆⠀⠀⠀⠀⠨⣦⡀⠀⠹⢅⣱⣿⣦⣿⣻⣽⣿⣧⠿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣿⣿⣿⣿⣿⣿⣿⣿⣿⢯⣿⣳⣿⣿⣿⣿⣿⣿⣿⠿⢿⢿⣿⣸⣿⢃⣾⣿⠿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠸⢧⠀⠀⠀⠀⠀⣼⣆⣀⠈⣾⡿⠿⠿⠿⠿⣿⣿⣿⣏⣿⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣿⣿⣧⣿⣿⣿⣿⣿⣿⡿⠟⠀⠀⠀⠠⢻⣗⣿⢵⣿⡧⣷⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⢀⡀⠀⢀⣾⣯⣗⠐⠣⢲⣄⡄⢄⣴⣶⡖⢲⠁⣿⣿⢹⣿⣿⣿⣿⣿⣿⣿⣿⠹⣿⡇⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⢿⠀⠀⠀⠀⠀⠠⢼⣿⣝⣺⡟⣿⣿⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⣼⣿⣿⣿⠀⢸⣆⡹⣿⢼⣿⠷⢛⡚⢆⠀⠛⠊⣿⣿⣿⢿⣿⣿⢿⣿⡭⢿⣷⣻⣿⣿⣿⣿⣿⣿⣿⡿⣫⡅⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣧⢿⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡏⣿⣿⣿⣿⡅⠀⠈⠻⣿⢻⣺⣀⠿⡿⢸⡄⠀⠨⠟⣫⠹⣿⢿⣯⣿⣿⣿⣌⡘⠷⢿⡿⣿⡿⠟⠏⢹⣄⠷⡃⠀⠀⠀⠀⠀⣺⣿⣿⣻⣿⣿⢼⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⠛⠇⢀⢀⣔⠈⡷⣵⣳⣶⣿⡏⠈⣾⠂⣽⣿⣿⣾⣿⣿⣿⣿⣿⣿⡷⣤⣤⣄⡀⢀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⣿⣿⣿⣿⣿⣿⣾⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⢹⣿⣿⣿⡗⡀⣾⣯⣬⠏⠠⢾⣭⣗⣊⣝⠃⡘⠉⡺⠿⠻⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣶⠿⣤⣤⣤⣼⣿⡿⣿⣿⣿⣿⡿⣿⣿⢧⠰⣿⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⣶⣠⡍⣿⣿⡛⢸⣯⣛⣛⣿⢶⣶⣬⣤⣴⣿⣶⣾⣿⠆⢠⡦⢶⡟⢘⡛⣿⣿⣿⣿⣷⡿⢿⣿⣮⣿⢿⢿⣿⣿⣿⣿⣿⣿⣿⢿⢛⣯⣾⣿⡟⠀⣶⣥⠹⣷⣔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠄⠀⠙⢿⣲⡟⡿⢦⣭⣽⣞⣛⣛⡛⠛⠛⠉⡁⠀⣿⡅⠈⠠⣾⠏⣿⣿⣿⣿⣿⣷⣿⣉⢿⣿⣿⣷⣮⣁⣉⠉⠁⣉⣷⣶⣾⡿⢛⣵⣾⡂⠐⢻⣶⣘⢿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣾⡅⠀⠠⢿⠀⠀⠈⠉⠉⠁⠀⠀⠀⠀⣰⣿⣮⡉⣿⣶⡌⢉⣴⣿⣿⣿⣿⣿⣿⣿⣿⣷⠉⢿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣷⣷⣄⡹⢿⣿⡶⢀⠻⣿⡌⣿⡦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⡇⠀⠀⠘⠀⠀⠀⠀⠀⠀⣼⣷⣾⣾⣿⣿⠿⣲⣿⣿⠇⠘⡿⣛⣿⣿⣿⠻⠃⢀⣹⣿⠀⠀⠀⣋⡛⡿⣿⣿⣿⣿⠞⢿⣿⣿⣾⣾⠉⠚⢷⣾⣭⣧⡿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⣾⣟⠛⡻⣿⡿⣠⣴⣿⣿⣿⢰⢖⣺⣿⣿⣿⡿⠀⢠⡾⣻⣣⣶⣿⣿⢿⣿⣿⣿⣿⣿⡏⠁⠈⢹⠿⡿⣯⣴⣀⠈⠐⣭⣥⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡆⠀⠀⠈⢙⣵⣿⣿⣯⢟⣋⣻⣟⡿⠿⠶⠍⠉⢹⣍⣏⡈⣀⣀⣴⣾⣿⣛⣥⣶⣶⣧⣍⣿⣿⢻⠀⠀⠀⠀⠀⠀⠙⢿⢿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⣿⡸⣿⢷⠿⡧⢾⠏⡿⠀⠘⢿⡿⡿⠿⣿⠿⠿⠀⠘⢿⣿⣿⣿⣿⣯⣿⣾⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⣀⣠⣴⣾⣿⣿⣿⣿⣿⠋⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡰⠻⣿⣿⣿⣿⣿⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠤⢴⣷⣿⣿⣿⣿⣿⣿⣿⠛⠁⠀⢸⣿⣆⢀⢀⠠⣀⠀⡀⠀⡀⡀⠀⢀⠀⡀⣀⠀⣠⣿⡇⠀⠀⠙⡛⠿⣿⣿⣿⣿⣿⣷⣷⣤⣦⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠓⣶⣿⣧⠄⠀⠘⢿⣿⢯⣜⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣿⡝⠿⢿⠃⠀⠀⣠⣿⣷⡆⠁⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠸⣿⣿⣿⣾⣤⣶⣾⣿⣿⡿⠛⠋⠉⠁⠀⠀⠉⠩⠟⣿⣿⣿⣷⣶⣶⣾⣾⣿⡿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⠻⠿⣿⣻⣷⣾⢏⣱⣷⣿⣿⣷⣾⣿⣿⣶⣿⣾⣿⣿⡿⠿⠿⠿⠏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠿⢿⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⡿⣿⣿⣿⣿⣻⣿⣿⣿⣿⣿⡏⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠉⠉⠉⠈⠉⠉⠁⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⢿⠿⠿⠿⠿⠿⠀⢰⣿⣿⣿⣷⠁⠀⣿⣿⣿⣆⠀⢨⣿⣿⣿⡇⣿⣿⡇⠀⠀⢸⣿⣿⢹⣿⣿⠿⠿⠿⣿⣿⡆⢰⣿⣿⣿⣇⠀⢸⣿⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣴⣄⣀⣀⡀⠀⠈⣾⣿⡿⣿⣿⡏⠀⣿⣿⣿⣿⣧⣿⣿⣿⣿⡇⣿⣿⡇⠀⠀⢸⣿⣿⢸⣿⣿⣀⣀⣤⣿⣿⠏⣿⣿⡿⠿⠿⢄⡸⢿⣛⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⢿⢿⣿⣿⣿⡄⢰⣿⣿⠉⢽⣿⣿⢀⣿⣿⣿⡿⠿⠿⡿⣿⣿⣗⡛⣛⣃⡄⠀⠘⢫⣭⣮⢩⣿⣿⣷⣶⣶⣾⠿⣹⣿⣿⠉⣿⣿⡇⢼⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠫⣭⣭⣽⣿⣷⡇⠀⢲⣷⣶⣼⣿⣿⡟⣿⣿⣿⡏⣿⣿⡇⣿⣿⣧⣀⣰⣼⣿⣿⢸⣿⣿⠉⣿⣿⣷⢤⣿⣿⠿⠀⢽⣿⣿⣼⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠁⠀⠀⠉⠉⠉⠉⠉⠁⠉⠉⠉⠈⠉⠉⠁⠉⠉⠉⠉⠉⠉⠉⠉⠈⠉⠉⠀⠈⠉⠉⠉⠉⠉⠁⠀⠈⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("g", "󰷾 " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("b", " " .. " File browser", ":NvimTreeFocus <CR>"),
      dashboard.button("r", "󰄉 " .. " Recent files", ":Telescope oldfiles <CR>"),
      --			dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
      --			dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
      --			dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }

    -- Layout for the dashboard, top to bottom order
    dashboard.opts.layout = {
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
    }

    alpha.setup(dashboard.config)
  end,
}
