# redis_lua_bulk_pop

`bulk_pop`

当队列大于0的时候, 就一直调用lpop, 并把数据append到lua table里, 一直会循环到指定的次数.
