# loldb - lua objects leveldb

this code snippet persists lua tables as json string to leveldb.

## requirements

* lua-cjson
* lua-leveldb

## example

    local loldb = require('loldb')
    local db = loldb.open('/tmp/my.lvldb')

    db.foo = {
      bla = 'bla',
      rofl = {
        mao = true
      }
    }

    local foo = db.foo
    db:close()
