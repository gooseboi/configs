-- List of all files to source
local files = {
	"plugins",
	"bindings",
	"editor",
	"colours",
}

for _, file in ipairs(files) do
	require(file)
end
