local definitions = require("definition-or-references.definitions")
local references = require("definition-or-references.references")
local methods = require("definition-or-references.methods_state")
local config = require("definition-or-references.config")

-- internal methods
local DefinitionOrReferences = {}

function DefinitionOrReferences.definition_or_references()
  config.get_config().before_start_callback()
  methods.clear_references()
  methods.clear_implementations()
  methods.clear_definitions()
  -- sending references (and implementations if enabled) requests before definitons to parallelize both requests
  references.send_references_request()

  if config.get_config().include_implementations then
    references.send_implementations_request()
  end
  definitions()
end

return DefinitionOrReferences
