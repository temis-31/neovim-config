local status, nvim_masonlsp = pcall(require, "mason-lspconfig")
if (not status) then return end

nvim_masonlsp.setup()
