local state = {
  definitions = {
    name = "textDocument/definition",
    is_pending = false,
    cancel_function = nil,
    result = nil,
  },
  implementations = {
    name = "textDocument/implementation",
    is_pending = false,
    cancel_function = nil,
    result = nil,
  },
  references = {
    name = "textDocument/references",
    is_pending = false,
    cancel_function = nil,
    result = nil,
  },
}

local function clear_references()
  if state.references.is_pending then
    state.references.cancel_function()
  end
  state.references.cancel_function = nil
  state.references.result = nil
  state.references.is_pending = nil
end

local function clear_implementations()
  if state.implementations.is_pending then
    state.implementations.cancel_function()
  end
  state.implementations.cancel_function = nil
  state.implementations.is_pending = nil
  state.implementations.result = nil
end

local function clear_definitions()
  if state.definitions.is_pending then
    state.definitions.cancel_function()
  end
  state.definitions.cancel_function = nil
  state.definitions.is_pending = nil
  state.definitions.result = nil
end

return vim.tbl_extend("error", state, {
  clear_references = clear_references,
  clear_definitions = clear_definitions,
  clear_implementations = clear_implementations,
})
