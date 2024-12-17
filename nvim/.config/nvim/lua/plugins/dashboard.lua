return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        opts = {
            theme = 'doom',
            disable_move = true,
            config = {
                header = vim.split(
                    string.rep('\n', 2) .. [[
⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢿⣿⡀⢀⠾⣿⡹⢧⣛⢧⣟⡏⣼⢻⣽⣻⣿⣿⣿⣿⢿⢹⣳⡻⣿⣿⡟⢸⣽⢳⣻⣿⣿⣿⣿⣿⣿⣞⠩⣿⡼⣇⣿⣇⠠⢻⣧⢂⢣⢻⣿⣿⣿⣷⣙⣿⣿⣿⣇
⠀⠀⠀⠀⠀⠀⢀⣾⣷⡄⢢⠠⠈⢀⡾⣛⡿⣝⡳⣏⢿⣽⢠⣟⢻⣷⣿⣿⠿⣛⣯⠏⣳⢷⡻⣽⢞⠅⣻⢸⣏⣷⢻⡼⣏⡿⣏⡿⣽⡂⣽⡃⣯⢟⣻⠀⢃⢿⣎⡆⢏⣿⣿⣿⣿⣿⠹⣿⣿⣿
⠀⠀⠀⠀⠀⠀⣾⡻⣟⡿⠆⠡⢀⡾⡵⣏⡿⣱⢯⡽⣾⡌⣴⣋⣾⣿⠟⣡⢟⡾⠅⢸⣛⡾⣝⣧⡟⢀⡏⢰⣻⡼⢯⡷⣏⡷⣏⡇⣳⠇⣳⡅⢯⣛⡷⠂⠘⡖⢻⡶⡘⣞⣶⢲⣭⣛⠇⢿⣿⣿
⠀⠀⠀⠀⠀⠀⣖⢯⣳⡀⢐⠀⣸⢳⣝⡞⣷⢫⣷⣽⣼⡁⡷⣭⣿⢋⡾⢁⣮⠇⡄⡿⣭⡟⣽⢶⡃⢸⡇⢸⣳⣻⢻⡼⣏⡷⣏⣇⢽⡃⡷⡆⣹⣏⡇⡀⣇⢹⡈⡷⣇⠻⣼⣛⡶⢯⣗⠘⣿⢿
⠀⠀⠀⠀⠀⠀⢠⠀⠄⡁⢈⠀⣯⢻⡼⣹⣷⣯⣾⣿⣿⠁⣇⣿⡿⢸⠃⣸⡞⢰⠸⣝⣧⢿⣹⡞⢱⢸⡅⠸⣧⡟⣯⣗⢯⡽⣝⡞⢸⣁⡷⡇⢼⢧⡃⡇⣿⡄⣷⠸⣳⠈⡷⢯⣽⣛⡎⡀⣿⣫
⠀⠀⠀⠀⠀⠀⠐⢥⡘⢄⠂⢰⣏⢷⡻⣷⣿⢿⣿⣿⣿⠀⡇⡿⡽⡇⢠⢷⡃⡌⣾⡽⢾⣹⢮⡅⡎⢸⠃⡀⣷⣻⢷⣞⡯⣟⡾⡅⢻⢠⢿⡅⡾⢋⢀⡇⡻⣷⢸⡅⢹⡇⢹⣛⡶⣏⡯⠇⣷⣫
⠀⠀⠀⠀⠀⠀⠀⠈⣾⡀⠆⢸⣞⣳⣿⣿⣿⣿⣿⣿⡿⢀⠇⣿⡽⠀⡼⣯⢡⢃⡷⠻⠯⠛⢋⢐⡃⣋⢀⡃⣁⣉⣉⣉⠛⣽⣳⠆⡏⢸⢯⢰⡇⡞⢸⢂⢿⣮⡌⣯⠈⣿⡀⢸⣳⢯⣽⢂⡷⢯
⠀⠀⠀⠀⠀⠀⠀⢰⣟⠻⠀⣻⣿⣿⣿⣿⣿⢺⣿⣟⡟⢠⠘⣷⠏⠀⣿⠃⣋⢨⡶⣶⢯⡟⡈⣼⡇⡟⣼⡇⠀⣿⡿⣽⡇⣿⡽⢰⠃⣾⠇⣾⢰⢣⢸⢘⣓⠋⠃⠿⡀⡸⡇⠆⣿⣿⢾⣸⢼⣻
⠀⠀⠀⠀⠀⠀⠀⠸⢈⣵⡇⣿⣿⣿⡟⠙⠻⣸⢷⡾⣹⠀⠘⣯⠂⢸⣯⠁⡏⢸⡽⣞⡷⢰⢡⣿⢃⠇⣿⣿⠀⣿⣿⣽⠰⣯⡇⡞⢠⡿⢰⠃⡎⣾⠘⣾⣿⣿⣷⢠⠄⣅⠛⠀⢹⣯⣿⢸⣻⢷
⠀⠀⠀⠀⠀⠀⠀⠀⠻⣽⠀⣿⣿⡟⣼⡀⠜⣯⣟⣳⣟⠀⠀⣿⡀⣼⡳⠀⣇⢸⡿⡽⢃⢃⣿⡿⡘⢐⣻⢿⠀⣿⣳⡏⢸⣷⠃⢀⣾⢡⠇⡸⣸⡏⢠⣿⣿⣿⣷⢸⢢⣿⡸⢠⢘⠻⣽⢸⣿⡏
⠀⠀⠀⠀⠀⢀⡒⡀⠀⠉⠄⢹⣿⢰⣟⣇⢂⠰⣯⢷⢯⡀⠄⢟⠀⣷⡇⢲⠹⠘⠁⠁⠀⠀⠉⠁⠁⠹⣻⣿⠀⢹⣿⠇⣾⠇⢀⡾⢡⢪⢆⢳⣿⠃⡾⣛⣛⡿⠿⢸⢸⣿⣇⠃⢸⣿⣮⠈⣷⠇
⠀⠀⠀⠀⠀⢆⡱⠨⢄⠀⠈⠸⣧⠸⣻⢾⡄⠂⢹⣞⣟⡆⠀⢬⠀⠋⠀⠀⠀⠀⢀⠠⠀⡔⠠⠰⣶⣦⣤⣉⠀⡀⣿⢡⡿⢠⡞⠁⣵⠏⣠⣿⠃⣼⠯⠛⠋⠙⠛⠘⠸⠟⣿⠀⢸⣿⢾⢰⣿⢀
⠀⠀⠀⢠⠘⠤⢒⡉⢦⠀⡄⠀⢻⡄⢫⣟⢷⡘⡀⢹⡞⣷⡀⠸⠈⠀⢀⣤⠐⡂⢌⡘⢡⣿⣿⠂⢿⣿⣿⣿⣤⣧⣄⡜⠡⠋⣠⣾⣟⣰⣿⣯⣾⡇⠀⡀⠠⣀⠀⢀⠀⠈⠛⠇⢽⣿⡇⣼⡏⣸
⠀⠀⢀⠆⠘⢬⡁⡈⢠⡇⠐⡆⠈⢳⡄⠻⣎⠳⣌⠀⠙⣍⣁⠀⠀⠀⣾⣷⠠⣵⡀⢘⡀⣼⢣⠇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠰⠠⢮⡿⢄⢋⡈⣷⣄⠀⠀⠠⣴⢠⡿⢱⣻
⠀⠀⣌⠂⣍⠢⢀⡇⢸⠇⣦⠈⡅⠀⠘⢄⠈⠳⡝⢦⡂⠈⠛⣧⡘⣦⡙⢿⡄⢳⣿⡟⡾⣭⡐⢿⣿⣿⣿⣿⣿⢿⣿⡿⣿⡿⣿⣿⣿⣿⣿⣿⣿⢰⠈⠆⢰⣊⢦⠅⣿⣿⣇⠀⠀⠁⡾⢁⣿⠍
⠀⡔⢢⠁⡆⠁⡼⡆⢸⡃⣽⠀⠆⣴⡶⢀⠁⠀⠈⠳⣍⠂⡀⠀⠑⠈⠿⣷⣿⣦⣨⣭⣥⢴⣶⣿⣿⣿⣿⠅⣽⣿⣿⡿⣿⣟⣯⠿⢿⣽⣿⣿⣿⡈⡷⣖⣿⢞⣍⣰⣿⣿⠇⡠⠂⠔⢠⡾⠋⡰
⠰⡈⠦⠑⣠⢯⣝⡃⢸⡇⢀⡘⠠⣿⢸⢻⠛⡖⡀⠤⡈⠛⠒⠤⡀⠑⣶⣌⣙⠛⣾⣾⢞⡷⡻⣞⣺⢹⣽⣿⣿⢷⣿⡷⢟⣹⣗⡿⣿⣿⣿⣻⣯⣷⣦⢍⡈⢃⢹⣿⣻⢯⣾⠀⠀⠴⠋⠁⡴⠁
⠡⡅⠃⣰⢯⣳⢾⠀⢸⡇⢸⣃⠀⣿⡈⣿⡆⢹⠀⢶⣥⣉⠒⠄⠀⢠⣝⡻⡛⡸⢿⢺⣙⣟⢋⣿⣿⣯⡯⣿⣹⣼⣻⣩⣶⣽⣺⣵⣾⡭⣻⣯⠿⣿⣽⣶⠿⣾⢻⣾⣷⣯⡇⠀⡔⠀⢌⠊⢀⡀
⠱⢀⡃⣽⢺⡵⣫⠀⠊⡅⢰⣻⠀⠘⢷⣬⡳⣈⡁⢸⡾⣝⡿⡆⣮⠈⣷⢟⣰⣛⣗⠾⡼⣪⣴⢔⡨⣶⣷⢽⣾⣿⡽⣯⡾⣜⣿⣾⣿⣧⣭⣚⣋⡻⡿⣯⣾⣿⣯⣿⣿⣷⢀⠓⢀⡜⢬⠇⠸⡄
⠁⠼⢐⡃⠿⣜⠷⠀⢂⠅⣤⡟⣆⢄⠀⠙⢿⣮⣕⠸⣽⣫⢷⢁⣵⠀⣱⣊⣼⢬⣿⢿⣶⣻⣹⣾⣶⣿⣷⣞⣽⣿⣿⢿⡷⠿⣵⠞⣽⣿⢯⣤⣵⡾⣏⣩⣼⣿⣾⡿⢿⡏⣠⢡⣞⡟⡏⠀⣇⠇
⠀⠀⠌⡐⠀⠀⠀⠈⠂⠆⢸⣳⠈⡌⡴⣄⡀⠙⠿⢠⢿⣵⡏⢸⣽⠀⢸⣟⣾⣿⣾⣿⢯⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⢫⣾⣿⣶⣝⡿⣿⣿⣿⣿⣷⣷⣾⡿⣟⣵⣿⣷⡅⢡⣟⡾⡽⠐⢰⣊⢧
⠀⠀⢣⠀⠀⠀⠀⠀⡁⠄⠘⢽⡆⠰⠀⢻⣳⡄⠀⠘⣿⣞⠇⣟⣾⠁⢸⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⡿⢟⣯⣾⣿⣿⣿⣿⣿⣿⣿⣶⣔⠙⣿⣿⡿⣫⣾⣿⣿⣿⢿⣿⣦⡙⡾⢡⠃⢦⡙⣮
⠀⠀⢂⠆⠀⠀⠀⠀⢐⠈⠐⡀⠻⣄⠣⠈⢷⣻⡄⠈⣷⡟⢨⣟⣾⠀⡇⠻⣿⣿⣿⣿⣿⣿⡿⢫⣵⣶⣿⣿⣿⣿⣿⣿⢏⣽⣛⠿⣿⣿⡿⠼⣿⠏⣾⣿⣿⢋⡋⠘⣿⢿⣿⣿⣦⡙⢰⢢⡝⣳
⢀⠀⠀⠂⠀⡀⠀⠀⢈⠜⡀⠐⠄⡈⠂⡡⠀⢻⣽⠀⣿⠇⣼⣟⡾⠈⣇⢸⣮⡛⢿⣿⠟⣡⣾⣿⣿⣿⣿⣿⣿⠿⣫⣿⣿⣿⣿⣷⡘⢿⡀⠀⠁⢀⣾⢟⡵⠋⠀⡇⢈⠻⠯⣿⡿⣻⣦⣬⣘⠳
⠀⠈⠀⠀⠀⠀⠀⠀⢀⠊⡔⠈⠰⠠⠁⠄⠁⠀⠹⡀⣿⢀⣿⣿⣽⠃⣯⠀⢿⡿⢃⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣭⡻⢿⣿⣿⣿⣿⣮⣑⣀⣤⣭⡷⠋⠀⠀⢰⢁⡾⣷⠀⣩⣾⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠌⠀⠀⠀⠐⠠⠈⡐⠀⠀⠀⡏⣼⣿⣿⣯⡇⣿⠄⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣍⣻⢿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠼⣸⡽⡞⣰⣿⣿⣿⣿⡿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠡⡁⢄⡈⠐⠀⠃⣿⣿⣿⡿⢃⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣍⠛⠿⢿⣿⣿⣿⣿⣷⣝⠛⠁⠀⠀⠀⠀⠀⠀⠀⡇⣟⢎⣼⣿⣿⣿⠟⠉⣴⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡁⠂⠐⠡⠂⢠⣿⠟⣫⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣀⠈⠛⢿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠈⠀⡿⢣⣾⣿⣿⠟⢡⢎⣾⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡐⡀⠀⠀⠀⠘⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣟⡿⣿⣿⣿⣿⣿⣿⣦⡀⠈⠻⢿⣿⣿⣿⣆⡀⠀⠀⠀⠀⢃⣿⣿⡿⠁⠀⢠⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢄⠡⡁⢆⢀⣿⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣽⡻⢿⣿⣿⠟⠀⠀⠀⠀⠙⠻⣿⣿⣿⣄⠀⠀⢠⡿⣿⠞⣽⡅⠀⢜⡿⡿⣻⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠢⠁⠀⠘⡉⢉⠀⡀⠀⠙⠛⠿⠿⠿⠛⠿⠋⠉⠛⠛⠻⢿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⡟⠁⠀⠁⢈⠏⣶⢹⠆⠀⠀⠉⠀⠹⢿⡿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢡⠐⡈⠰⢀⠂⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠂⠀⢀⣪⣶⡹⡎⡇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢂⠁⠆⢡⠈⢂⠡⢂⠐⡀⠆⡐⠀⠀⠀⠀⠐⠀⢀⠀⠀⠀⠀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⡕⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢂⠉⡐⢂⠡⠌⡐⢂⠡⠐⠂⡔⠀⢠⠀⠄⡀⢂⠀⠀⠀⠀⠄⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡈⠤⢁⠂⠆⢂⡁⠆⣈⠡⠡⣀⠃⠀⢧⠐⠁⠀⡀⠆⡐⠠⢀⠀⡀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣷⣄⠀⠀⠀⠀⠀
                    ]], '\n'),
                center = {
                    {
                        icon = '󰻭 ',
                        icon_hl = '@keyword',
                        desc = 'New file',
                        desc_hl = 'String',
                        key = 'n',
                        key_hl = 'Number',
                        action = "new | wincmd j | quit"
                    },
                    {
                        icon = ' ',
                        icon_hl = '@keyword',
                        desc = 'Latest File',
                        desc_hl = 'String',
                        key = 'l',
                        key_hl = 'Number',
                        action = "'0"
                    },
                    {
                        icon = '󰙰 ',
                        icon_hl = '@keyword',
                        desc = 'Recent Files',
                        desc_hl = 'String',
                        key = 'r',
                        key_hl = 'Number',
                        action = 'Telescope oldfiles' 
                    },
                    {
                        icon = '󰍉 ',
                        icon_hl = '@keyword',
                        desc = 'Find Files',
                        desc_hl = 'String',
                        key = 'f',
                        key_hl = 'Number',
                        action = 'Telescope find_files'
                    },
                    {
                        icon = '󰙅 ',
                        icon_hl = '@keyword',
                        desc = 'File Explorer',
                        desc_hl = 'String',
                        key = 'e',
                        key_hl = 'Number',
                        action = 'NvimTreeOpen' 
                    },
                    {
                        icon = ' ',
                        icon_hl = '@keyword',
                        desc = 'Git Changes',
                        desc_hl = 'String',
                        key = 'g',
                        key_hl = 'Number',
                        action = 'lua git()' 
                    },
                    {
                        icon = '󰆼 ',
                        icon_hl = '@keyword',
                        desc = 'Open Database',
                        desc_hl = 'String',
                        key = 'd',
                        key_hl = 'Number',
                        action = 'lua db()' 
                    },
                },
            }
        }
    }
}