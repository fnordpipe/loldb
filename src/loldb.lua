local cjson = require('cjson')
local leveldb = require('lualeveldb')

local loldb = {}

function loldb.open(file)
  opt = leveldb.options()
  opt.createIfMissing = true
  opt.errorIfExists = false

  local _loldb = {
    db = leveldb.open(opt, file),
    close = function(self) leveldb.close(self.db) end
  }

  _loldb = setmetatable(_loldb, {
    __index = function(t, k)
      if t.db:has(k) then
        return cjson.decode(t.db:get(k))
      end
      return nil
    end,
    __newindex = function(t, k, v)
      t.db:put(k, cjson.encode(v))
    end,
    __gc = function(t)
      t:close()
    end
  })

  return _loldb
end

return loldb
