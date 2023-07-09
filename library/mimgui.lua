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

---@class ImVector_float
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_float, new_capacity: number): number
---@field back fun(self: ImVector_float): ffi.cdata*
---@field back_const fun(self: ImVector_float): ffi.cdata*
---@field begin fun(self: ImVector_float): ffi.cdata*
---@field begin_const fun(self: ImVector_float): ffi.cdata*
---@field capacity fun(self: ImVector_float): number
---@field clear fun(self: ImVector_float)
---@field empty fun(self: ImVector_float): boolean
---@field _end fun(self: ImVector_float): ffi.cdata*
---@field end_const fun(self: ImVector_float): ffi.cdata*
---@field erase fun(self: ImVector_float, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_float, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_float, it: ffi.cdata*)
---@field front fun(self: ImVector_float): ffi.cdata*
---@field front_const fun(self: ImVector_float): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_float, it: ffi.cdata*): number
---@field insert fun(self: ImVector_float, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_float)
---@field push_back fun(self: ImVector_float, value: ffi.cdata*)
---@field push_front fun(self: ImVector_float, value: ffi.cdata*)
---@field reserve fun(self: ImVector_float, new_capacity: number)
---@field resize fun(self: ImVector_float, new_size: number)
---@field resizeT fun(self: ImVector_float, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_float): number
---@field size_in_bytes fun(self: ImVector_float): number
---@field swap fun(self: ImVector_float, other: ImVector_float)

---
--- Создаёт вектор из элементов типа `float`<br/>
---
---@return ImVector_float vector
function imgui.ImVector_float() end

imgui.ImVector_float = {}

---
--- Копирует вектор из элементов типа `float`<br/>
---
---@param other ImVector_float
---@return ImVector_float vector
function imgui.ImVector_float.ImVector_floatVector(other) end

---@class ImVector_ImWchar
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImWchar, new_capacity: number): number
---@field back fun(self: ImVector_ImWchar): ffi.cdata*
---@field back_const fun(self: ImVector_ImWchar): ffi.cdata*
---@field begin fun(self: ImVector_ImWchar): ffi.cdata*
---@field begin_const fun(self: ImVector_ImWchar): ffi.cdata*
---@field capacity fun(self: ImVector_ImWchar): number
---@field clear fun(self: ImVector_ImWchar)
---@field empty fun(self: ImVector_ImWchar): boolean
---@field _end fun(self: ImVector_ImWchar): ffi.cdata*
---@field end_const fun(self: ImVector_ImWchar): ffi.cdata*
---@field erase fun(self: ImVector_ImWchar, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImWchar, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImWchar, it: ffi.cdata*)
---@field front fun(self: ImVector_ImWchar): ffi.cdata*
---@field front_const fun(self: ImVector_ImWchar): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImWchar, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImWchar, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImWchar)
---@field push_back fun(self: ImVector_ImWchar, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImWchar, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImWchar, new_capacity: number)
---@field resize fun(self: ImVector_ImWchar, new_size: number)
---@field resizeT fun(self: ImVector_ImWchar, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImWchar): number
---@field size_in_bytes fun(self: ImVector_ImWchar): number
---@field swap fun(self: ImVector_ImWchar, other: ImVector_ImWchar)

---
--- Создаёт вектор из элементов типа `ImWchar`<br/>
---
---@return ImVector_ImWchar vector
function imgui.ImVector_ImWchar() end

imgui.ImVector_ImWchar = {}

---
--- Копирует вектор из элементов типа `ImWchar`<br/>
---
---@param other ImVector_ImWchar
---@return ImVector_ImWchar vector
function imgui.ImVector_ImWchar.ImVector_ImWcharVector(other) end

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

---@class ImVector_ImFontGlyph
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImFontGlyph, new_capacity: number): number
---@field back fun(self: ImVector_ImFontGlyph): ffi.cdata*
---@field back_const fun(self: ImVector_ImFontGlyph): ffi.cdata*
---@field begin fun(self: ImVector_ImFontGlyph): ffi.cdata*
---@field begin_const fun(self: ImVector_ImFontGlyph): ffi.cdata*
---@field capacity fun(self: ImVector_ImFontGlyph): number
---@field clear fun(self: ImVector_ImFontGlyph)
---@field empty fun(self: ImVector_ImFontGlyph): boolean
---@field _end fun(self: ImVector_ImFontGlyph): ffi.cdata*
---@field end_const fun(self: ImVector_ImFontGlyph): ffi.cdata*
---@field erase fun(self: ImVector_ImFontGlyph, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImFontGlyph, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImFontGlyph, it: ffi.cdata*)
---@field front fun(self: ImVector_ImFontGlyph): ffi.cdata*
---@field front_const fun(self: ImVector_ImFontGlyph): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImFontGlyph, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImFontGlyph, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImFontGlyph)
---@field push_back fun(self: ImVector_ImFontGlyph, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImFontGlyph, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImFontGlyph, new_capacity: number)
---@field resize fun(self: ImVector_ImFontGlyph, new_size: number)
---@field resizeT fun(self: ImVector_ImFontGlyph, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImFontGlyph): number
---@field size_in_bytes fun(self: ImVector_ImFontGlyph): number
---@field swap fun(self: ImVector_ImFontGlyph, other: ImVector_ImFontGlyph)

---
--- Создаёт вектор из элементов типа `ImFontGlyph`<br/>
---
---@return ImVector_ImFontGlyph vector
function imgui.ImVector_ImFontGlyph() end

imgui.ImVector_ImFontGlyph = {}

---
--- Копирует вектор из элементов типа `ImFontGlyph`<br/>
---
---@param other ImVector_ImFontGlyph
---@return ImVector_ImFontGlyph vector
function imgui.ImVector_ImFontGlyph.ImVector_ImFontGlyphVector(other) end

---@class ImVector_ImGuiTextRange
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImGuiTextRange, new_capacity: number): number
---@field back fun(self: ImVector_ImGuiTextRange): ffi.cdata*
---@field back_const fun(self: ImVector_ImGuiTextRange): ffi.cdata*
---@field begin fun(self: ImVector_ImGuiTextRange): ffi.cdata*
---@field begin_const fun(self: ImVector_ImGuiTextRange): ffi.cdata*
---@field capacity fun(self: ImVector_ImGuiTextRange): number
---@field clear fun(self: ImVector_ImGuiTextRange)
---@field empty fun(self: ImVector_ImGuiTextRange): boolean
---@field _end fun(self: ImVector_ImGuiTextRange): ffi.cdata*
---@field end_const fun(self: ImVector_ImGuiTextRange): ffi.cdata*
---@field erase fun(self: ImVector_ImGuiTextRange, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImGuiTextRange, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImGuiTextRange, it: ffi.cdata*)
---@field front fun(self: ImVector_ImGuiTextRange): ffi.cdata*
---@field front_const fun(self: ImVector_ImGuiTextRange): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImGuiTextRange, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImGuiTextRange, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImGuiTextRange)
---@field push_back fun(self: ImVector_ImGuiTextRange, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImGuiTextRange, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImGuiTextRange, new_capacity: number)
---@field resize fun(self: ImVector_ImGuiTextRange, new_size: number)
---@field resizeT fun(self: ImVector_ImGuiTextRange, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImGuiTextRange): number
---@field size_in_bytes fun(self: ImVector_ImGuiTextRange): number
---@field swap fun(self: ImVector_ImGuiTextRange, other: ImVector_ImGuiTextRange)

---
--- Создаёт вектор из элементов типа `ImGuiTextRange`<br/>
---
---@return ImVector_ImGuiTextRange vector
function imgui.ImVector_ImGuiTextRange() end

imgui.ImVector_ImGuiTextRange = {}

---
--- Копирует вектор из элементов типа `ImGuiTextRange`<br/>
---
---@param other ImVector_ImGuiTextRange
---@return ImVector_ImGuiTextRange vector
function imgui.ImVector_ImGuiTextRange.ImVector_ImGuiTextRangeVector(other) end

---@class ImVector_ImGuiStoragePair
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImGuiStoragePair, new_capacity: number): number
---@field back fun(self: ImVector_ImGuiStoragePair): ffi.cdata*
---@field back_const fun(self: ImVector_ImGuiStoragePair): ffi.cdata*
---@field begin fun(self: ImVector_ImGuiStoragePair): ffi.cdata*
---@field begin_const fun(self: ImVector_ImGuiStoragePair): ffi.cdata*
---@field capacity fun(self: ImVector_ImGuiStoragePair): number
---@field clear fun(self: ImVector_ImGuiStoragePair)
---@field empty fun(self: ImVector_ImGuiStoragePair): boolean
---@field _end fun(self: ImVector_ImGuiStoragePair): ffi.cdata*
---@field end_const fun(self: ImVector_ImGuiStoragePair): ffi.cdata*
---@field erase fun(self: ImVector_ImGuiStoragePair, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImGuiStoragePair, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImGuiStoragePair, it: ffi.cdata*)
---@field front fun(self: ImVector_ImGuiStoragePair): ffi.cdata*
---@field front_const fun(self: ImVector_ImGuiStoragePair): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImGuiStoragePair, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImGuiStoragePair, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImGuiStoragePair)
---@field push_back fun(self: ImVector_ImGuiStoragePair, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImGuiStoragePair, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImGuiStoragePair, new_capacity: number)
---@field resize fun(self: ImVector_ImGuiStoragePair, new_size: number)
---@field resizeT fun(self: ImVector_ImGuiStoragePair, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImGuiStoragePair): number
---@field size_in_bytes fun(self: ImVector_ImGuiStoragePair): number
---@field swap fun(self: ImVector_ImGuiStoragePair, other: ImVector_ImGuiStoragePair)

---
--- Создаёт вектор из элементов типа `ImGuiStoragePair`<br/>
---
---@return ImVector_ImGuiStoragePair vector
function imgui.ImVector_ImGuiStoragePair() end

imgui.ImVector_ImGuiStoragePair = {}

---
--- Копирует вектор из элементов типа `ImGuiStoragePair`<br/>
---
---@param other ImVector_ImGuiStoragePair
---@return ImVector_ImGuiStoragePair vector
function imgui.ImVector_ImGuiStoragePair.ImVector_ImGuiStoragePairVector(other) end

---@class ImVector_ImDrawChannel
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImDrawChannel, new_capacity: number): number
---@field back fun(self: ImVector_ImDrawChannel): ffi.cdata*
---@field back_const fun(self: ImVector_ImDrawChannel): ffi.cdata*
---@field begin fun(self: ImVector_ImDrawChannel): ffi.cdata*
---@field begin_const fun(self: ImVector_ImDrawChannel): ffi.cdata*
---@field capacity fun(self: ImVector_ImDrawChannel): number
---@field clear fun(self: ImVector_ImDrawChannel)
---@field empty fun(self: ImVector_ImDrawChannel): boolean
---@field _end fun(self: ImVector_ImDrawChannel): ffi.cdata*
---@field end_const fun(self: ImVector_ImDrawChannel): ffi.cdata*
---@field erase fun(self: ImVector_ImDrawChannel, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImDrawChannel, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImDrawChannel, it: ffi.cdata*)
---@field front fun(self: ImVector_ImDrawChannel): ffi.cdata*
---@field front_const fun(self: ImVector_ImDrawChannel): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImDrawChannel, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImDrawChannel, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImDrawChannel)
---@field push_back fun(self: ImVector_ImDrawChannel, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImDrawChannel, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImDrawChannel, new_capacity: number)
---@field resize fun(self: ImVector_ImDrawChannel, new_size: number)
---@field resizeT fun(self: ImVector_ImDrawChannel, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImDrawChannel): number
---@field size_in_bytes fun(self: ImVector_ImDrawChannel): number
---@field swap fun(self: ImVector_ImDrawChannel, other: ImVector_ImDrawChannel)

---
--- Создаёт вектор из элементов типа `ImDrawChannel`<br/>
---
---@return ImVector_ImDrawChannel vector
function imgui.ImVector_ImDrawChannel() end

imgui.ImVector_ImDrawChannel = {}

---
--- Копирует вектор из элементов типа `ImDrawChannel`<br/>
---
---@param other ImVector_ImDrawChannel
---@return ImVector_ImDrawChannel vector
function imgui.ImVector_ImDrawChannel.ImVector_ImDrawChannelVector(other) end

---@class ImVector_char
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_char, new_capacity: number): number
---@field back fun(self: ImVector_char): ffi.cdata*
---@field back_const fun(self: ImVector_char): ffi.cdata*
---@field begin fun(self: ImVector_char): ffi.cdata*
---@field begin_const fun(self: ImVector_char): ffi.cdata*
---@field capacity fun(self: ImVector_char): number
---@field clear fun(self: ImVector_char)
---@field empty fun(self: ImVector_char): boolean
---@field _end fun(self: ImVector_char): ffi.cdata*
---@field end_const fun(self: ImVector_char): ffi.cdata*
---@field erase fun(self: ImVector_char, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_char, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_char, it: ffi.cdata*)
---@field front fun(self: ImVector_char): ffi.cdata*
---@field front_const fun(self: ImVector_char): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_char, it: ffi.cdata*): number
---@field insert fun(self: ImVector_char, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_char)
---@field push_back fun(self: ImVector_char, value: ffi.cdata*)
---@field push_front fun(self: ImVector_char, value: ffi.cdata*)
---@field reserve fun(self: ImVector_char, new_capacity: number)
---@field resize fun(self: ImVector_char, new_size: number)
---@field resizeT fun(self: ImVector_char, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_char): number
---@field size_in_bytes fun(self: ImVector_char): number
---@field swap fun(self: ImVector_char, other: ImVector_char)

---
--- Создаёт вектор из элементов типа `char`<br/>
---
---@return ImVector_char vector
function imgui.ImVector_char() end

imgui.ImVector_char = {}

---
--- Копирует вектор из элементов типа `char`<br/>
---
---@param other ImVector_char
---@return ImVector_char vector
function imgui.ImVector_char.ImVector_charVector(other) end

---@class ImVector_ImU32
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImU32, new_capacity: number): number
---@field back fun(self: ImVector_ImU32): ffi.cdata*
---@field back_const fun(self: ImVector_ImU32): ffi.cdata*
---@field begin fun(self: ImVector_ImU32): ffi.cdata*
---@field begin_const fun(self: ImVector_ImU32): ffi.cdata*
---@field capacity fun(self: ImVector_ImU32): number
---@field clear fun(self: ImVector_ImU32)
---@field empty fun(self: ImVector_ImU32): boolean
---@field _end fun(self: ImVector_ImU32): ffi.cdata*
---@field end_const fun(self: ImVector_ImU32): ffi.cdata*
---@field erase fun(self: ImVector_ImU32, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImU32, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImU32, it: ffi.cdata*)
---@field front fun(self: ImVector_ImU32): ffi.cdata*
---@field front_const fun(self: ImVector_ImU32): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImU32, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImU32, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImU32)
---@field push_back fun(self: ImVector_ImU32, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImU32, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImU32, new_capacity: number)
---@field resize fun(self: ImVector_ImU32, new_size: number)
---@field resizeT fun(self: ImVector_ImU32, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImU32): number
---@field size_in_bytes fun(self: ImVector_ImU32): number
---@field swap fun(self: ImVector_ImU32, other: ImVector_ImU32)

---
--- Создаёт вектор из элементов типа `ImU32`<br/>
---
---@return ImVector_ImU32 vector
function imgui.ImVector_ImU32() end

imgui.ImVector_ImU32 = {}

---
--- Копирует вектор из элементов типа `ImU32`<br/>
---
---@param other ImVector_ImU32
---@return ImVector_ImU32 vector
function imgui.ImVector_ImU32.ImVector_ImU32Vector(other) end

---@class ImVector_ImFontAtlasCustomRect
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImFontAtlasCustomRect, new_capacity: number): number
---@field back fun(self: ImVector_ImFontAtlasCustomRect): ffi.cdata*
---@field back_const fun(self: ImVector_ImFontAtlasCustomRect): ffi.cdata*
---@field begin fun(self: ImVector_ImFontAtlasCustomRect): ffi.cdata*
---@field begin_const fun(self: ImVector_ImFontAtlasCustomRect): ffi.cdata*
---@field capacity fun(self: ImVector_ImFontAtlasCustomRect): number
---@field clear fun(self: ImVector_ImFontAtlasCustomRect)
---@field empty fun(self: ImVector_ImFontAtlasCustomRect): boolean
---@field _end fun(self: ImVector_ImFontAtlasCustomRect): ffi.cdata*
---@field end_const fun(self: ImVector_ImFontAtlasCustomRect): ffi.cdata*
---@field erase fun(self: ImVector_ImFontAtlasCustomRect, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImFontAtlasCustomRect, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImFontAtlasCustomRect, it: ffi.cdata*)
---@field front fun(self: ImVector_ImFontAtlasCustomRect): ffi.cdata*
---@field front_const fun(self: ImVector_ImFontAtlasCustomRect): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImFontAtlasCustomRect, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImFontAtlasCustomRect, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImFontAtlasCustomRect)
---@field push_back fun(self: ImVector_ImFontAtlasCustomRect, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImFontAtlasCustomRect, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImFontAtlasCustomRect, new_capacity: number)
---@field resize fun(self: ImVector_ImFontAtlasCustomRect, new_size: number)
---@field resizeT fun(self: ImVector_ImFontAtlasCustomRect, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImFontAtlasCustomRect): number
---@field size_in_bytes fun(self: ImVector_ImFontAtlasCustomRect): number
---@field swap fun(self: ImVector_ImFontAtlasCustomRect, other: ImVector_ImFontAtlasCustomRect)

---
--- Создаёт вектор из элементов типа `ImFontAtlasCustomRect`<br/>
---
---@return ImVector_ImFontAtlasCustomRect vector
function imgui.ImVector_ImFontAtlasCustomRect() end

imgui.ImVector_ImFontAtlasCustomRect = {}

---
--- Копирует вектор из элементов типа `ImFontAtlasCustomRect`<br/>
---
---@param other ImVector_ImFontAtlasCustomRect
---@return ImVector_ImFontAtlasCustomRect vector
function imgui.ImVector_ImFontAtlasCustomRect.ImVector_ImFontAtlasCustomRectVector(other) end

---@class ImVector_ImTextureID
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImTextureID, new_capacity: number): number
---@field back fun(self: ImVector_ImTextureID): ffi.cdata*
---@field back_const fun(self: ImVector_ImTextureID): ffi.cdata*
---@field begin fun(self: ImVector_ImTextureID): ffi.cdata*
---@field begin_const fun(self: ImVector_ImTextureID): ffi.cdata*
---@field capacity fun(self: ImVector_ImTextureID): number
---@field clear fun(self: ImVector_ImTextureID)
---@field empty fun(self: ImVector_ImTextureID): boolean
---@field _end fun(self: ImVector_ImTextureID): ffi.cdata*
---@field end_const fun(self: ImVector_ImTextureID): ffi.cdata*
---@field erase fun(self: ImVector_ImTextureID, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImTextureID, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImTextureID, it: ffi.cdata*)
---@field front fun(self: ImVector_ImTextureID): ffi.cdata*
---@field front_const fun(self: ImVector_ImTextureID): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImTextureID, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImTextureID, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImTextureID)
---@field push_back fun(self: ImVector_ImTextureID, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImTextureID, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImTextureID, new_capacity: number)
---@field resize fun(self: ImVector_ImTextureID, new_size: number)
---@field resizeT fun(self: ImVector_ImTextureID, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImTextureID): number
---@field size_in_bytes fun(self: ImVector_ImTextureID): number
---@field swap fun(self: ImVector_ImTextureID, other: ImVector_ImTextureID)

---
--- Создаёт вектор из элементов типа `ImTextureID`<br/>
---
---@return ImVector_ImTextureID vector
function imgui.ImVector_ImTextureID() end

imgui.ImVector_ImTextureID = {}

---
--- Копирует вектор из элементов типа `ImTextureID`<br/>
---
---@param other ImVector_ImTextureID
---@return ImVector_ImTextureID vector
function imgui.ImVector_ImTextureID.ImVector_ImTextureIDVector(other) end

---@class ImVector_ImFontConfig
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImFontConfig, new_capacity: number): number
---@field back fun(self: ImVector_ImFontConfig): ffi.cdata*
---@field back_const fun(self: ImVector_ImFontConfig): ffi.cdata*
---@field begin fun(self: ImVector_ImFontConfig): ffi.cdata*
---@field begin_const fun(self: ImVector_ImFontConfig): ffi.cdata*
---@field capacity fun(self: ImVector_ImFontConfig): number
---@field clear fun(self: ImVector_ImFontConfig)
---@field empty fun(self: ImVector_ImFontConfig): boolean
---@field _end fun(self: ImVector_ImFontConfig): ffi.cdata*
---@field end_const fun(self: ImVector_ImFontConfig): ffi.cdata*
---@field erase fun(self: ImVector_ImFontConfig, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImFontConfig, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImFontConfig, it: ffi.cdata*)
---@field front fun(self: ImVector_ImFontConfig): ffi.cdata*
---@field front_const fun(self: ImVector_ImFontConfig): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImFontConfig, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImFontConfig, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImFontConfig)
---@field push_back fun(self: ImVector_ImFontConfig, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImFontConfig, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImFontConfig, new_capacity: number)
---@field resize fun(self: ImVector_ImFontConfig, new_size: number)
---@field resizeT fun(self: ImVector_ImFontConfig, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImFontConfig): number
---@field size_in_bytes fun(self: ImVector_ImFontConfig): number
---@field swap fun(self: ImVector_ImFontConfig, other: ImVector_ImFontConfig)

---
--- Создаёт вектор из элементов типа `ImFontConfig`<br/>
---
---@return ImVector_ImFontConfig vector
function imgui.ImVector_ImFontConfig() end

imgui.ImVector_ImFontConfig = {}

---
--- Копирует вектор из элементов типа `ImFontConfig`<br/>
---
---@param other ImVector_ImFontConfig
---@return ImVector_ImFontConfig vector
function imgui.ImVector_ImFontConfig.ImVector_ImFontConfigVector(other) end

---@class ImVector_ImFontPtr
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImFontPtr, new_capacity: number): number
---@field back fun(self: ImVector_ImFontPtr): ffi.cdata*
---@field back_const fun(self: ImVector_ImFontPtr): ffi.cdata*
---@field begin fun(self: ImVector_ImFontPtr): ffi.cdata*
---@field begin_const fun(self: ImVector_ImFontPtr): ffi.cdata*
---@field capacity fun(self: ImVector_ImFontPtr): number
---@field clear fun(self: ImVector_ImFontPtr)
---@field empty fun(self: ImVector_ImFontPtr): boolean
---@field _end fun(self: ImVector_ImFontPtr): ffi.cdata*
---@field end_const fun(self: ImVector_ImFontPtr): ffi.cdata*
---@field erase fun(self: ImVector_ImFontPtr, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImFontPtr, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImFontPtr, it: ffi.cdata*)
---@field front fun(self: ImVector_ImFontPtr): ffi.cdata*
---@field front_const fun(self: ImVector_ImFontPtr): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImFontPtr, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImFontPtr, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImFontPtr)
---@field push_back fun(self: ImVector_ImFontPtr, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImFontPtr, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImFontPtr, new_capacity: number)
---@field resize fun(self: ImVector_ImFontPtr, new_size: number)
---@field resizeT fun(self: ImVector_ImFontPtr, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImFontPtr): number
---@field size_in_bytes fun(self: ImVector_ImFontPtr): number
---@field swap fun(self: ImVector_ImFontPtr, other: ImVector_ImFontPtr)

---
--- Создаёт вектор из элементов типа `ImFontPtr`<br/>
---
---@return ImVector_ImFontPtr vector
function imgui.ImVector_ImFontPtr() end

imgui.ImVector_ImFontPtr = {}

---
--- Копирует вектор из элементов типа `ImFontPtr`<br/>
---
---@param other ImVector_ImFontPtr
---@return ImVector_ImFontPtr vector
function imgui.ImVector_ImFontPtr.ImVector_ImFontPtrVector(other) end

---@class ImVector_ImDrawCmd
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImDrawCmd, new_capacity: number): number
---@field back fun(self: ImVector_ImDrawCmd): ffi.cdata*
---@field back_const fun(self: ImVector_ImDrawCmd): ffi.cdata*
---@field begin fun(self: ImVector_ImDrawCmd): ffi.cdata*
---@field begin_const fun(self: ImVector_ImDrawCmd): ffi.cdata*
---@field capacity fun(self: ImVector_ImDrawCmd): number
---@field clear fun(self: ImVector_ImDrawCmd)
---@field empty fun(self: ImVector_ImDrawCmd): boolean
---@field _end fun(self: ImVector_ImDrawCmd): ffi.cdata*
---@field end_const fun(self: ImVector_ImDrawCmd): ffi.cdata*
---@field erase fun(self: ImVector_ImDrawCmd, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImDrawCmd, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImDrawCmd, it: ffi.cdata*)
---@field front fun(self: ImVector_ImDrawCmd): ffi.cdata*
---@field front_const fun(self: ImVector_ImDrawCmd): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImDrawCmd, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImDrawCmd, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImDrawCmd)
---@field push_back fun(self: ImVector_ImDrawCmd, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImDrawCmd, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImDrawCmd, new_capacity: number)
---@field resize fun(self: ImVector_ImDrawCmd, new_size: number)
---@field resizeT fun(self: ImVector_ImDrawCmd, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImDrawCmd): number
---@field size_in_bytes fun(self: ImVector_ImDrawCmd): number
---@field swap fun(self: ImVector_ImDrawCmd, other: ImVector_ImDrawCmd)

---
--- Создаёт вектор из элементов типа `ImDrawCmd`<br/>
---
---@return ImVector_ImDrawCmd vector
function imgui.ImVector_ImDrawCmd() end

imgui.ImVector_ImDrawCmd = {}

---
--- Копирует вектор из элементов типа `ImDrawCmd`<br/>
---
---@param other ImVector_ImDrawCmd
---@return ImVector_ImDrawCmd vector
function imgui.ImVector_ImDrawCmd.ImVector_ImDrawCmdVector(other) end

---@class ImVector_ImVec4
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImVec4, new_capacity: number): number
---@field back fun(self: ImVector_ImVec4): ffi.cdata*
---@field back_const fun(self: ImVector_ImVec4): ffi.cdata*
---@field begin fun(self: ImVector_ImVec4): ffi.cdata*
---@field begin_const fun(self: ImVector_ImVec4): ffi.cdata*
---@field capacity fun(self: ImVector_ImVec4): number
---@field clear fun(self: ImVector_ImVec4)
---@field empty fun(self: ImVector_ImVec4): boolean
---@field _end fun(self: ImVector_ImVec4): ffi.cdata*
---@field end_const fun(self: ImVector_ImVec4): ffi.cdata*
---@field erase fun(self: ImVector_ImVec4, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImVec4, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImVec4, it: ffi.cdata*)
---@field front fun(self: ImVector_ImVec4): ffi.cdata*
---@field front_const fun(self: ImVector_ImVec4): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImVec4, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImVec4, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImVec4)
---@field push_back fun(self: ImVector_ImVec4, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImVec4, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImVec4, new_capacity: number)
---@field resize fun(self: ImVector_ImVec4, new_size: number)
---@field resizeT fun(self: ImVector_ImVec4, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImVec4): number
---@field size_in_bytes fun(self: ImVector_ImVec4): number
---@field swap fun(self: ImVector_ImVec4, other: ImVector_ImVec4)

---
--- Создаёт вектор из элементов типа `ImVec4`<br/>
---
---@return ImVector_ImVec4 vector
function imgui.ImVector_ImVec4() end

imgui.ImVector_ImVec4 = {}

---
--- Копирует вектор из элементов типа `ImVec4`<br/>
---
---@param other ImVector_ImVec4
---@return ImVector_ImVec4 vector
function imgui.ImVector_ImVec4.ImVector_ImVec4Vector(other) end

---@class ImVector_ImDrawIdx
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImDrawIdx, new_capacity: number): number
---@field back fun(self: ImVector_ImDrawIdx): ffi.cdata*
---@field back_const fun(self: ImVector_ImDrawIdx): ffi.cdata*
---@field begin fun(self: ImVector_ImDrawIdx): ffi.cdata*
---@field begin_const fun(self: ImVector_ImDrawIdx): ffi.cdata*
---@field capacity fun(self: ImVector_ImDrawIdx): number
---@field clear fun(self: ImVector_ImDrawIdx)
---@field empty fun(self: ImVector_ImDrawIdx): boolean
---@field _end fun(self: ImVector_ImDrawIdx): ffi.cdata*
---@field end_const fun(self: ImVector_ImDrawIdx): ffi.cdata*
---@field erase fun(self: ImVector_ImDrawIdx, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImDrawIdx, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImDrawIdx, it: ffi.cdata*)
---@field front fun(self: ImVector_ImDrawIdx): ffi.cdata*
---@field front_const fun(self: ImVector_ImDrawIdx): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImDrawIdx, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImDrawIdx, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImDrawIdx)
---@field push_back fun(self: ImVector_ImDrawIdx, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImDrawIdx, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImDrawIdx, new_capacity: number)
---@field resize fun(self: ImVector_ImDrawIdx, new_size: number)
---@field resizeT fun(self: ImVector_ImDrawIdx, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImDrawIdx): number
---@field size_in_bytes fun(self: ImVector_ImDrawIdx): number
---@field swap fun(self: ImVector_ImDrawIdx, other: ImVector_ImDrawIdx)

---
--- Создаёт вектор из элементов типа `ImDrawIdx`<br/>
---
---@return ImVector_ImDrawIdx vector
function imgui.ImVector_ImDrawIdx() end

imgui.ImVector_ImDrawIdx = {}

---
--- Копирует вектор из элементов типа `ImDrawIdx`<br/>
---
---@param other ImVector_ImDrawIdx
---@return ImVector_ImDrawIdx vector
function imgui.ImVector_ImDrawIdx.ImVector_ImDrawIdxVector(other) end

---@class ImVector_ImVec2
---@field Size number Размер вектора в элементах
---@field Capacity number Максимальное количество элементов, которое можно вместить вектор
---@field Data ffi.cdata* Данные вектора
---@field _grow_capacity fun(self: ImVector_ImVec2, new_capacity: number): number
---@field back fun(self: ImVector_ImVec2): ffi.cdata*
---@field back_const fun(self: ImVector_ImVec2): ffi.cdata*
---@field begin fun(self: ImVector_ImVec2): ffi.cdata*
---@field begin_const fun(self: ImVector_ImVec2): ffi.cdata*
---@field capacity fun(self: ImVector_ImVec2): number
---@field clear fun(self: ImVector_ImVec2)
---@field empty fun(self: ImVector_ImVec2): boolean
---@field _end fun(self: ImVector_ImVec2): ffi.cdata*
---@field end_const fun(self: ImVector_ImVec2): ffi.cdata*
---@field erase fun(self: ImVector_ImVec2, it: ffi.cdata*)
---@field eraseTPtr fun(self: ImVector_ImVec2, it: ffi.cdata*, it_last: ffi.cdata*)
---@field erase_unsorted fun(self: ImVector_ImVec2, it: ffi.cdata*)
---@field front fun(self: ImVector_ImVec2): ffi.cdata*
---@field front_const fun(self: ImVector_ImVec2): ffi.cdata*
---@field index_from_ptr fun(self: ImVector_ImVec2, it: ffi.cdata*): number
---@field insert fun(self: ImVector_ImVec2, it: ffi.cdata*, value: ffi.cdata*): ffi.cdata*
---@field pop_back fun(self: ImVector_ImVec2)
---@field push_back fun(self: ImVector_ImVec2, value: ffi.cdata*)
---@field push_front fun(self: ImVector_ImVec2, value: ffi.cdata*)
---@field reserve fun(self: ImVector_ImVec2, new_capacity: number)
---@field resize fun(self: ImVector_ImVec2, new_size: number)
---@field resizeT fun(self: ImVector_ImVec2, new_size: number, value: ffi.cdata*)
---@field size fun(self: ImVector_ImVec2): number
---@field size_in_bytes fun(self: ImVector_ImVec2): number
---@field swap fun(self: ImVector_ImVec2, other: ImVector_ImVec2)

---
--- Создаёт вектор из элементов типа `ImVec2`<br/>
---
---@return ImVector_ImVec2 vector
function imgui.ImVector_ImVec2() end

imgui.ImVector_ImVec2 = {}

---
--- Копирует вектор из элементов типа `ImVec2`<br/>
---
---@param other ImVector_ImVec2
---@return ImVector_ImVec2 vector
function imgui.ImVector_ImVec2.ImVector_ImVec2Vector(other) end

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

---@class ImFontGlyphRangesBuilder
---@field UsedChars ImVector_ImU32
---@field AddChar fun(self: ImFontGlyphRangesBuilder, char: number)
---@field AddRanges fun(self: ImFontGlyphRangesBuilder, ranges: ffi.cdata*)
---@field AddText fun(self: ImFontGlyphRangesBuilder, text: string|ffi.cdata*, text_end: ffi.cdata*?)
---@field BuildRanges fun(self: ImFontGlyphRangesBuilder, out_ranges: ImVector_ImWchar)
---@field Clear fun(self: ImFontGlyphRangesBuilder)
---@field GetBit fun(self: ImFontGlyphRangesBuilder, index: number): boolean
---@field SetBit fun(self: ImFontGlyphRangesBuilder, index: number)

---
--- Создаёт объект типа `ImFontGlyphRangesBuilder`<br/>
---
---@return ImFontGlyphRangesBuilder object
function imgui.ImFontGlyphRangesBuilder() end

return imgui
