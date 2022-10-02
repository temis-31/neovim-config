local status, mason_i = pcall(require, "mason-tool-installer")
if not status then
	return
end

mason_i.setup({
	ensure_installed = {
		"stylua",
	},
	auto_update = false,
	run_on_start = true,
	start_delay = 3000,
})
