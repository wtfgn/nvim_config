if vim.g.neovide then
    -- font
    vim.o.guifont = "DepartureMono_Nerd_Font_Mono, JuliaMono:h14"

    -- Paste from system clipboard in Insert mode
    vim.keymap.set('i', '<C-v>', '<C-r>+')
    -- Paste from system clipboard in Command mode
    vim.keymap.set('c', '<C-v>', '<C-r>+')
    -- Paste from system clipboard in Normal/Visual mode (replaces selected text)
    vim.keymap.set('v', '<C-v>', '"++p')

    -- Corner Preference
    vim.g.neovide_corner_preference = "default"

    -- Scroll Animation Length
    vim.g.neovide_scroll_animation_length = 0.2

    -- Progress Bar
    vim.g.neovide_progress_bar_enabled = true
    vim.g.neovide_progress_bar_height = 5.0
    vim.g.neovide_progress_bar_animation_speed = 200.0
    vim.g.neovide_progress_bar_hide_delay = 0.2

    -- Transparency
    -- vim.g.neovide_opacity = 0.85
    -- vim.g.neovide_normal_opacity = 0.85

    -- Floating window blur (works on all platforms)
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0

    -- Optional: make floating windows / popup menus transparent via Neovim options
    vim.opt.winblend = 20 -- 0 = opaque, 100 = fully transparent
    vim.opt.pumblend = 20

    vim.g.neovide_cursor_vfx_mode = "wireframe"
    vim.g.neovide_cursor_vfx_opacity = 200.0
    vim.g.neovide_cursor_vfx_particle_lifetime = 0.5
    vim.g.neovide_cursor_vfx_particle_highlight_lifetime = 0.2
    vim.g.neovide_cursor_vfx_particle_density = 0.8
    vim.g.neovide_cursor_vfx_particle_speed = 10.0
    -- "railgun" only
    -- vim.g.neovide_cursor_vfx_particle_phase = 1.5
    -- vim.g.neovide_cursor_vfx_particle_curl = 1.0



end
