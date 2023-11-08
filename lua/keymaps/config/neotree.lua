-- Función para generar los comandos
function addCommand(command)
    return "<cmd>" .. command .. "<cr>"
end

-- Intento de requerir el archivo which-key
local okWhichKey, with_key = pcall(require, "which-key")

-- Verificar si el requerimiento de which-key fue exitoso
if not okWhichKey then
    return
end

-- Configuración de atajos con which-key y NeoTree
with_key.register({
    n = {
        name = "NEOTREE",
        n = { addCommand("Neotree right"), "Right Neotree" },
        ["<leader>"] = { addCommand("Neotree close"), "Close Neotree" },
    },
}, { prefix = "<leader>" })

