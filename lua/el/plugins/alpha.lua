return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.buttons.val = {
      dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("g", "󰷾 " .. " Find text", ":Telescope live_grep <CR>"),
      --			dashboard.button("b", " " .. " File browser", ":NvimTreeFocus <CR>"),
      dashboard.button("r", "󰄉 " .. " Recent files", ":Telescope oldfiles <CR>"),
      --			dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
      --			dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
      --			dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }

    -- Header ASCII
    local header_art = {
      {
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣶⣿⡿⠛⠁⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⢼⡶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⠟⠃⠁⠀⠀⠀⠀⠀⠀⣷⠀⠀⠀⠀⣠⣴⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢀⣺⠃⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⠛⢀⡯⠀⠀⠀⠀⠀⢀⣻⣿⠀⠀⠀⠠⣿⠿⠓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣬⡷⢸⠛⠀⠀⠀⠀⠀⣠⣤⠀⠀⢸⣿⣿⣿⣅⣰⣷⠀⠀⠀⠀⠀⣼⣿⡏⠀⠀⠀⢀⡟⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡁⠸⣖⠀⠀⠀⠀⢀⣿⠀⠀⠀⢸⣿⣿⣿⣿⣿⡇⠀⣀⡶⠁⢸⡟⠉⠀⠀⡀⠀⠈⠁⠀⠀⠀⠀⠀⠀⢀⢰⡅⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⢿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣷⡂⠀⠀⠀⣀⠀⠈⣿⣿⠀⣀⣿⣿⣿⣿⣿⣿⣿⣷⣾⣧⠀⠀⠀⣦⠆⣴⡇⢀⡀⠀⠀⠀⠀⠀⠀⠀⣺⡿⠁⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢳⠀⠀⠀⠀⠀⠀⢶⠀⠀⠀⠀⣿⣿⣿⣤⠀⠀⢹⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠉⣿⡋⠀⢠⣾⠁⠀⡿⠃⣽⡂⠀⠀⠀⣶⠃⠀⢸⡏⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⠀⠀⠀⠀⢙⣷⡆⠀⢠⠈⢹⣿⣯⣄⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⡙⠈⠀⣐⣾⣿⣿⣠⣧⢠⣿⣷⠀⠀⢘⣿⠁⠀⠈⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⠀⣀⠀⠀⡀⠸⣷⣶⡀⠀⠀⠀⠓⠀⠘⣆⢤⣿⣇⣼⣀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣼⣿⣧⣴⣾⣿⣿⣿⣿⠀⣤⣿⣿⡟⠀⠀⢠⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⣷⡄⠀⠀⠹⣶⡀⣮⠄⠙⢿⣿⣄⠀⢰⡄⠀⣰⢙⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⣹⡿⠟⢱⠀⠀⠀⢻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠽⣿⡀⠀⠀⢺⣿⡽⣿⡄⠈⣿⣿⡃⠈⣧⣐⣿⣄⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣵⣿⣟⣧⣿⣿⣿⣿⣿⣿⡛⢿⣿⣿⣏⢸⡯⢁⠨⣿⣄⡀⠀⢸⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠘⠹⣇⠀⠀⠸⣿⣿⣿⡻⡄⠽⣿⡆⠀⢿⣽⣿⣿⣿⣿⣿⡯⡿⣟⣿⣿⣻⣿⣿⡿⣾⣿⣿⣟⣾⣿⣿⣿⣧⣿⣯⣿⣿⣿⣺⣷⡰⣯⣿⣿⡇⣸⠟⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠁⣀⠀⠙⢿⡿⠊⣹⢄⡽⣇⣰⡬⣿⣿⣿⣿⣿⣿⣿⣴⡘⣷⣟⣿⣿⣿⣿⣿⣿⡿⣽⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⡮⣿⠇⣻⣿⡟⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⢼⡃⠀⠀⠀⠀⢙⣔⠀⠀⣑⣾⣿⣿⣿⣿⣿⣿⡽⣿⣿⣿⡟⣿⣿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣹⣹⣿⣿⣿⣿⣿⣿⠛⠏⠿⣿⣷⣿⠴⣿⣟⣐⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠙⠂⠀⠀⠀⢠⣷⣆⠀⡟⡉⠉⠉⠍⣝⡻⣛⢃⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⢿⣿⢻⣿⣿⣿⣚⣿⣿⣿⣿⣿⠛⠁⠀⠀⠀⢩⣿⡼⣾⡿⣳⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣣⣂⣿⡿⣿⠀⢠⠘⢿⣶⣿⣿⡥⠬⡈⠙⡷⢹⣿⣿⡿⣿⣿⣿⣧⢺⣿⣼⣿⣿⣿⣿⣿⣿⣿⡿⠊⠀⠀⠀⠀⠀⣰⣿⣯⣿⡇⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⣽⣿⣿⣿⣤⠀⠻⢷⣎⣇⡇⣿⣷⣸⢁⠀⠸⢟⠻⣿⣿⢿⣿⣿⣯⣋⠿⠽⣿⣿⣿⠿⠏⣅⣿⡇⠀⠀⠀⠀⠠⣾⣿⣯⣿⣷⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⠛⠄⡀⢀⡟⡻⣾⣷⢅⣽⡇⢠⡴⢀⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣤⣌⠀⡀⠀⠈⠁⠁⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⠈⠻⣿⣿⡇⢀⣾⣦⣬⢃⠴⢿⣮⣦⡝⠙⢈⠁⠿⠛⠾⡛⢿⣿⣿⣿⣟⣻⣾⣿⣿⣿⣟⣶⢧⡤⢤⣤⡿⣿⣟⣿⣿⣿⣿⣿⠇⠀⣾⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢧⣤⠛⣿⣏⠸⣿⣽⣿⣛⠶⣶⣾⣶⣶⣿⣿⠟⢀⡶⢸⡿⢨⡛⣿⣿⣿⣿⣿⢻⣿⣿⣍⣟⢿⣿⣿⣿⣿⠿⠿⢏⣿⣿⣿⠏⠈⢷⣄⠹⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢉⣀⡀⠩⠟⣯⠙⠶⡷⣷⣭⢭⠝⠉⠉⣀⣄⠸⣿⡂⠀⣿⠷⣿⣿⣿⣿⣿⣷⣾⡹⣿⣿⣿⣴⣔⣤⣠⣾⣿⡿⢿⡭⣾⣿⣇⠀⠻⣿⡏⣿⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣧⠀⠀⢻⠀⠀⠀⠀⠀⠀⠀⢀⣀⣿⣿⡷⣾⣿⡇⢰⣿⣿⣿⣿⣿⣿⠟⢿⣷⠈⠹⢿⣿⣿⣿⣿⣿⣿⣹⣿⣿⣎⠹⣿⢫⣀⠹⡷⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠀⠀⠀⠀⠀⠀⠀⣤⣿⣿⣿⣿⡿⣉⣷⣿⣿⠀⡨⢽⣿⣿⣿⡏⠀⣴⣾⡟⣰⣴⣶⣦⣴⣝⣿⣿⠟⠙⡻⣿⣿⠷⠀⠈⠙⢛⡟⣻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠄⠀⠀⠻⣣⣶⣧⡽⠹⠻⣿⠿⣿⣤⠝⠛⠻⠻⠛⠁⠀⢩⣷⣾⣿⣫⣭⣭⡟⣿⣿⡟⠂⠀⠀⠀⠉⠸⣿⣿⣶⣾⣿⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⣤⣿⣿⣿⣿⢸⣿⢵⡿⣴⡎⣴⠀⠸⣿⣿⣾⣿⡿⠏⠋⢸⣿⣿⣿⣿⣞⣿⣦⡄⠀⠀⠀⠀⠀⠈⠉⠉⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣶⣿⣿⣿⣿⡿⢏⠁⠀⠀⠈⠀⠀⠉⠀⠀⠈⠀⠁⠈⠁⠀⠀⣬⠝⢿⣿⣿⣿⣿⣧⣡⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠴⢶⣿⣿⣿⣿⡿⠿⡛⠉⠀⢸⣷⣠⡀⡀⣀⢀⣀⣀⣀⣀⠀⢀⣀⣀⣀⣴⣿⠀⠀⠊⡙⢻⢿⣿⣿⣿⣿⣶⣶⡤⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢾⣿⣷⡄⠀⠸⠿⢿⣚⣵⣶⣿⣿⡿⠿⠿⣿⣿⣿⣯⣚⡿⠛⠀⢀⣠⣿⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠝⢿⣿⣿⣶⣿⣿⣿⣟⡉⣉⣀⣀⢀⣀⣀⡉⣝⠿⢿⣿⣷⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⣷⣾⡿⣋⣾⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⡏⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠈⢳⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢮⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠛⠛⠘⠛⠛⠛⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⡶⠶⠶⠶⠶⠆⠀⣲⣶⣶⣶⠀⠀⣶⣶⣶⠀⢀⣴⣶⣶⡖⣶⣶⠀⠀⠀⣶⣶⢲⣶⣶⠶⠶⣶⣶⣆⢴⣶⣶⣶⡀⠀⣶⣶⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣤⣀⣠⠀⠀⢨⣿⣿⢿⣿⣧⠀⣿⣿⣿⣧⣾⣿⣿⣿⡇⣿⣿⠀⠀⠀⣿⣿⢸⣿⣿⣀⣠⣿⣿⢧⡿⠿⠽⣿⣧⡀⢛⣛⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠿⠻⢿⣿⣿⣆⣼⣿⡇⠘⣿⠿⡀⠿⣿⣿⣿⣛⣻⣛⣿⣧⢿⣯⣤⠀⠀⢹⣿⣾⣾⣷⣾⣿⣿⡿⠯⣾⣿⡇⢸⣿⣧⢼⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠶⠶⠿⠿⠟⠀⠈⠿⠿⢾⠿⢿⢿⠿⠿⠃⡿⢿⠸⠿⠿⠶⠤⠿⠿⢿⠿⠿⠇⢹⡿⠿⢸⠿⠿⠀⠀⠿⠿⡾⠿⢿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
        [[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
      },
      {
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠟⠛⠻⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠸⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠻⢿⣿⣿⡉⠛⠛⠿⠿⣿⠿⠟⠛⠛⠛⠛⠛⠻⠟⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⢀⠀⠀⠀⠀⠀⡆⢹⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠂⠊⠀⠀⠀⠀⠁⠀⠄⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢂⣀⡀⠀⠀⠀⠀⠀⠂⠀⢠⢼⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠡⠀⡀⠀⠄⣨⣦⣄⣀⢀⣀⣤⣴⣯⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠀⠙⣿⣿⣿⣿⣟⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⣼⣿⣿⣿⣿⣿⣿⡄⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⠅⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⠏⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⡟⠋⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣤⣤⣤⣤⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⣀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣷⣦⣄⡀⠀⠀⠀⠀⢀⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
        [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      },
    }

    math.randomseed(os.time())
    local idx = math.random(#header_art)
    dashboard.section.header.val = header_art[idx]

    local layouts = {
      -- Samurai layout
      {
        {
          type = "text",
          val = dashboard.section.header.val,
          opts = { position = "center", hl = "DiagnosticError" },
        },
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 2 },
        dashboard.section.footer,
      },
      -- Maxwell layout
      {
        { type = "padding", val = 6 },
        {
          type = "text",
          val = dashboard.section.header.val,
          opts = { position = "center" },
        },
        { type = "padding", val = 2 },
        {
          type = "text",
          val = "NEVER FALTER",
          opts = { position = "center" },
        },
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 2 },
        dashboard.section.footer,
      },
    }

    -- Layout for the dashboard, top to bottom order
    dashboard.opts.layout = layouts[idx]
    return dashboard
  end,
  config = function(_, dashboard)
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    -- set up alpha with above options
    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local loadtime_ms = math.floor(stats.startuptime * 100 + 0.5) / 100

        dashboard.section.footer.val = "⚡ Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. loadtime_ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
