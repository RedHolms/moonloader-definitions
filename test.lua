---@param a number
---@param b string
local function thread_worker(a, b)
  return a, b
end

lua_thread.create(thread_worker)

