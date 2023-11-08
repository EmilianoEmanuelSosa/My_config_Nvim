-- Definición de la función addCommand
function addCommand(command)
    return "<cmd>" .. command .. "<cr>"
end

-- Intento de requerir el archivo which-key
local okWhichKey, with_key = pcall(require, "which-key")

-- Verificar si el requerimiento de which-key fue exitoso
if not okWhichKey then
    return
end

-- Configuración de atajos con which-key y Telescope
with_key.register({
    p = {
        name = "TELESCOPE",
      f = { addCommand("Telescope find_files"), "find file" },
      h = { addCommand("Telescope help_tags"), "find help" },
      g = { addCommand("Telescope live_grep"), "find live grep" },
      b = { addCommand("Telescope buffers"), "find buffers" },
  },
}, { prefix = "<leader>" })

