local cjson = require('cjson')
local leveldb = require('lualeveldb')

local loldb = {}

function loldb.open(file)
  opt = leveldb.options()
  opt.createIfMissing = true
  opt.errorIfExists = false

  local _loldb = {}
  _loldb.db = leveldb.open(opt, file)

  _loldb.insert = function(self, key, data)
    local d = cjson.encode(data)
    self.db:put(key, d)
  end

  _loldb.select = function(self, key)
    local d = self.db:get(key)
    return cjson.decode(d)
  end

  _loldb.close = function(self)
    leveldb.close(self.db)
  end

  return _loldb
end

return loldb
