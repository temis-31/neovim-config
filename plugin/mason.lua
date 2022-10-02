local status, nvim_mason = pcall(require, "mason")
if (not status) then return end

nvim_mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_uninstalled = "✗",
      package_pending = "⟳",
    }
  }
})

