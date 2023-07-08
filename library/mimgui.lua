---@meta mimgui

local imgui = {}

---
--- Строка, указывающая на версию библиотеки<br/>
---
imgui._VERSION = "1.7.0"

---@class ImVec2
---@field x number
---@field y number
---@operator add(ImVec2): ImVec2
---@operator sub(ImVec2): ImVec2
---@operator unm: ImVec2
---@operator mul(number): ImVec2

---
--- Создаёт двух-мерный вектор<br/>
---
---@return ImVec2
---
---@overload fun(other: ImVec2): ImVec2
---@overload fun(x: number, y: number): ImVec2
function imgui.ImVec2() end

---@class ImVec4
---@field x number
---@field y number
---@field z number
---@field w number

---
--- Создаёт четырёх-мерный вектор<br/>
---
---@return ImVec4 вектор
---
---@overload fun(other: ImVec4): ImVec4
---@overload fun(x: number, y: number, z: number, w: number): ImVec4
function imgui.ImVec4() end

---
--- Устанавливает функцию, которая будет вызвана,<br/>
--- когда ImGui будет инициализирован и готов к работе<br/>
---
---@param callback fun()
function imgui.OnInitialize(callback) end

---@class MimGuiFrame
---@field LockPlayer boolean Запрещает игроку передвигаться, пока меню открыто
---@field HideCursor boolean Скрывает курсор

---
--- Создаёт новый frame, внутри которого можно использовать<br/>
--- все функции ImGui для отрисовки.<br/>
--- Функция отрисовки будет вызвана, только если `condition` вернёт `true`<br/>
---
---@param condition fun(): boolean Если эта функция возвращает `true`, frame будет отрисовываться
---@param drawer fun(frame: MimGuiFrame) Функция отрисовки
---
---@overload fun(condition: fun(): boolean, before_frame: fun(), drawer: fun(frame: MimGuiFrame))
function imgui.OnFrame(condition, drawer) end

---@class ImGuiTexture

---
--- Создаёт текстуру из файла, которую можно использовать в функции `imgui.Image`<br/>
---
---@param filepath string Путь к файлу
---@return ImGuiTexture texture Текстура
function imgui.CreateTextureFromFile(filepath) end

---
--- Создаёт текстуру из данных в памяти, которую можно использовать в функции `imgui.Image`<br/>
---
---@param data ffi.cdata*|number Указатель на память
---@param size number Размер данных в памяти в байтах
---@return ImGuiTexture texture Текстура
function imgui.CreateTextureFromFileInMemory(data, size) end

---
--- Возвращает, инициализирован ли ImGui<br/>
---
---@return boolean result
function imgui.IsInitialized() end

---
--- Копирует Lua-строку в C-строку<br/>
---
---@param destination ffi.cdata* Указатель на строку
---@param source string Lua-строка
---@param length number? Длина строки (необязательно)
function imgui.StrCopy(destination, source, length) end

---
--- Превращяет цвет из 4 чисел в диапозоне [0, 1] в 32-битное число<br/>
---
---@param r number Значение красного
---@param g number Значение зелёного
---@param b number Значение синего
---@param a number? Прозрачность цвета. По умолчанию 1 (полностью непрозрачный)
---@return number color Цвет в формате ABGR
function imgui.U32(r, g, b, a) end

---@class ImVector_ImDrawVert
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImDrawVert, new_capacity: number): number
---@field back fun(self: ImVector_ImDrawVert): ffi.cdata*
---@field back_const fun(self: ImVector_ImDrawVert): ffi.cdata*
---@field begin fun(self: ImVector_ImDrawVert): ffi.cdata*
---@field begin_const fun(self: ImVector_ImDrawVert): ffi.cdata*
---@field capacity fun(self: ImVector_ImDrawVert): number
---@field clear fun(self: ImVector_ImDrawVert)
---@field empty fun(self: ImVector_ImDrawVert): boolean
---@field _end fun(self: ImVector_ImDrawVert): ffi.cdata*
---@field end_const fun(self: ImVector_ImDrawVert): ffi.cdata*
---@field erase fun(self: ImVector_ImDrawVert, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImDrawVert, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImDrawVert, it: ffi.cdata*)
---@field front fun(self: ImVector_ImDrawVert): ffi.cdata*
---@field front_const fun(self: ImVector_ImDrawVert): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImDrawVert, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImDrawVert, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImDrawVert)
---@field push_back fun(self: ImVector_ImDrawVert, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImDrawVert, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImDrawVert, new_capacity: number)
---@field resize fun(self: ImVector_ImDrawVert, new_size: number)
---@field resizeT fun(self: ImVector_ImDrawVert, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImDrawVert): number
---@field size_in_bytes fun(self: ImVector_ImDrawVert): number
---@field swap fun(self: ImVector_ImDrawVert, other: ImVector_ImDrawVert)

---
--- Создаёт вектор из элементов типа `ImDrawVert`<br/>
---
---@return ImVector_ImDrawVert vector
function imgui.ImVector_ImDrawVert() end

imgui.ImVector_ImDrawVert = {}

---
--- Копирует вектор из элементов типа `ImDrawVert`<br/>
---
---@param other ImVector_ImDrawVert
---@return ImVector_ImDrawVert vector
function imgui.ImVector_ImDrawVert.ImVector_ImDrawVertVector(other) end

---@class ImFontConfig
---@field FontData ffi.cdata*
---@field FontDataSize number
---@field FontDataOwnedByAtlas boolean
---@field FontNo number
---@field SizePixels number
---@field OversampleH number
---@field OversampleV number
---@field PixelSnapH boolean
---@field GlyphExtraSpacing ImVec2
---@field GlyphOffset ImVec2
---@field GlyphRanges ffi.cdata*
---@field GlyphMinAdvanceX number
---@field GlyphMaxAdvanceX number
---@field MergeMode boolean
---@field RasterizerFlags number
---@field RasterizerMultiply number
---@field Name ffi.cdata*
---@field DstFont ffi.cdata*

---
--- Создаёт объект типа `ImFontConfig`<br/>
---
---@return ImFontConfig object
function imgui.ImFontConfig() end

return imgui
