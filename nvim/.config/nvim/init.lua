local files = {
	"plugins",
	"editor",
	"bindings",
}

for _, file in ipairs(files) do
	require(file)
end
