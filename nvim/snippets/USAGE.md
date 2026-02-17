# Инструкция по использованию сниппетов

## Структура файлов

```
nvim/snippets/
├── USAGE.md         # Данная инструкция
└── vue/
    ├── vue.lua          # Основные Vue 3 сниппеты
    ├── html.lua         # HTML сниппеты для template
    ├── typescript.lua   # TypeScript типы
    └── README.md        # Подробная документация Vue сниппетов
```

## Формат сниппетов

Все сниппеты написаны на Lua для LuaSnip. Это дает следующие преимущества:

- **Динамическое содержимое** - автоматическая подстановка имени файла, текущей даты и т.д.
- **Лучшая производительность** - нативная интеграция с Neovim
- **Гибкость** - использование любых функций Lua и Vim API
- **Удобство** - проще редактировать и поддерживать, чем JSON
- **Типизация** - поддержка LSP для редактирования сниппетов

## Использование

### 1. LuaSnip сниппеты (основной формат)

**Vue 3 сниппеты:**
- `v3simple` - Простой Vue 3 компонент с автоименем
- `v3comp` - Полный Vue 3 компонент с автоименем
- `v3composable` - Vue 3 composable функция
- `vref`, `vreactive`, `vcomputed` - Reactivity API
- `vprops`, `vemits` - Props и Events
- `vpinia`, `vrouter` - State management

**HTML сниппеты:**
- `vslot`, `vteleport`, `vtransition` - Built-in компоненты
- `vmodel`, `@click`, `@submit` - Директивы и события

**TypeScript сниппеты:**
- `vpropsinterface`, `vemitstype` - Интерфейсы
- `vreftype`, `vcomputedtype` - Типизация

**Пример использования:**
1. Создайте файл `MyAwesomeComponent.vue`
2. Введите `v3simple` и нажмите Tab
3. Результат: class и style автоматически получат имя `my-awesome-component`

### 2. Автоматическая загрузка

Сниппеты автоматически загружаются через конфигурацию в `blink.cmp`:

```lua
sources = {
  providers = {
    snippets = {
      opts = {
        search_paths = { vim.fn.stdpath("config") .. "/snippets" }
      }
    }
  }
}
```

## Проверка работоспособности

После перезапуска Neovim:

1. Откройте `.vue` файл
2. Введите `v3simple` в режиме вставки
3. Должно появиться автодополнение со сниппетом

## Troubleshooting

Если сниппеты не работают:

1. **Проверьте конфигурацию blink.cmp:**
   ```lua
   :lua print(vim.inspect(require('blink.cmp').config.sources.providers.snippets.opts))
   ```

2. **Проверьте загрузку LuaSnip:**
   ```lua
   :lua print(vim.inspect(require('luasnip').available()))
   ```

3. **Проверьте пути к сниппетам:**
   ```lua
   :lua print(vim.fn.stdpath("config") .. "/snippets")
   ```

4. **Перезагрузите сниппеты:**
   ```vim
   :LuaSnipUnlinkCurrent
   :lua require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })
   ```

## Добавление своих сниппетов

### Структура директорий

Создайте директорию для вашего языка/фреймворка:

```
nvim/snippets/
└── <language>/
    ├── <category1>.lua
    ├── <category2>.lua
    └── README.md
```

### Lua формат (для динамических сниппетов)

Создайте файл `nvim/snippets/<language>/<category>.lua`:

```lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Простой сниппет
  s("prefix", fmt([[
<template>
  {}
</template>
]], {
    i(1, "content")
  })),

  -- Сниппет с функцией
  s("dynsnip", fmt([[
const {} = {}
]], {
    i(1, "name"),
    f(function()
      return vim.fn.expand("%:t:r")
    end)
  }))
}
```

### Filetype mapping

LuaSnip автоматически загружает сниппеты по имени директории:

- `nvim/snippets/vue/` → filetype `vue`
- `nvim/snippets/typescript/` → filetype `typescript`
- `nvim/snippets/lua/` → filetype `lua`

Для кастомного mapping создайте файл `nvim/snippets/<filetype>.lua` в корне директории snippets.

## Полезные ссылки

- [LuaSnip документация](https://github.com/L3MON4D3/LuaSnip)
- [Vue 3 сниппеты README](./vue/README.md)
- [Примеры сниппетов](https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua)

## Дополнительные возможности

### Динамические placeholder'ы

```lua
-- Получение имени файла
f(function() return vim.fn.expand("%:t:r") end)

-- Получение текущей даты
f(function() return os.date("%Y-%m-%d") end)

-- Преобразование текста
f(function(args) return args[1][1]:upper() end, {1})
```

### Условные сниппеты

```lua
s({
  trig = "if",
  condition = function()
    return vim.bo.filetype == "vue"
  end
}, fmt([[
v-if="{}"
]], { i(1) }))
```

### Повторяющиеся узлы

```lua
s("dup", fmt([[
const {} = ref({})
console.log({})
]], {
  i(1, "name"),
  i(2, "value"),
  i(1) -- Повторяет первый placeholder
}))
```
