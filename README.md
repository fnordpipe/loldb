# loldb - lua objects leveldb

this sippet persists lua tables as json string to leveldb.

## requirements

* lua-cjson
* lua-leveldb

## example

    local loldb = require('loldb')
    local db = loldb.open('/tmp/my.lvldb')

    db:insert('foo', { foo = 'bla', rofl = { mao = true } })
    db:select('foo')
    db:close()
