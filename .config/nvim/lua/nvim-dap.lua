local loaded, dap = require("dap")
if not loaded then
	print ("nvim-dap not installed!")
	return
end

dap.set_log_level("INFO")

dap.configurations = {
	c = {
		{
			type = "c",
			name = "Debug",
			request = "launch",
			program = "${file}"
		}
	}
}
