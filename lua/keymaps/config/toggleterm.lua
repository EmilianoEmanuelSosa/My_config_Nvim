-- Esta función genera los comandos para abrir la terminal con toggleterm
function addCommand(command)
    return "<cmd>" .. command .. "<cr>"
end


-- Función para cambiar entre la terminal y el buffer anterior
function switch_buffer()
    vim.api.nvim_command('buffer#') -- Cambiar al buffer anterior
    vim.api.nvim_command('stopinsert') -- Detener la inserción en la terminal
end



-- Intentar requerir el archivo which-key
local okWhichKey, with_key = pcall(require, "which-key")

-- Verificar si el requerimiento de which-key fue exitoso
if not okWhichKey then
    return
end

-- Configuración de atajos con which-key y Toggleterm
require("toggleterm").setup {
    open_mapping = [[<leader>tt]], -- Atajo para abrir la terminal -- Configurar para que sea flotante
    float_opts = {
        border = 'single', -- Estilo del borde de la terminal flotante
        highlights = {
            border = "Normal",
            background = "Normal",
       },
        width = 200, -- Utilizar el 90% del ancho de la pantalla
        height = 10, -- Utilizar el 40% de la altura de la pantalla
        winblend = 3, -- Transparencia de la terminal flotante
        anchor = 'S', -- Posicionar la terminal en la parte inferior de la pantalla
        focus = false, -- No enfocar automáticamente la terminal flotante
    },
}

with_key.register({
    t = {
        name = "Toggleterm",
        t = { addCommand("ToggleTerm"), "Toggleterm" },
    },
}, { prefix = "<leader>" })

