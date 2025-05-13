local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font_with_fallback({
	{
		family = "Operator Mono Lig",
		weight = "Bold",
		italic = true,
	},
	"Apple Color Emoji",
})

config.window_background_opacity = 0.8
config.macos_window_background_blur = 20

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false
config.use_fancy_tab_bar = false
config.window_close_confirmation = "NeverPrompt"

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane_title = tab.active_pane.title
	local user_title = tab.active_pane.user_vars.panetitle

	if user_title ~= nil and #user_title > 0 then
		pane_title = user_title
	end

	return {
		{ Text = " " .. pane_title .. " " },
	}
end)

return config
