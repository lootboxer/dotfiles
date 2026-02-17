# 📚 Neovim Snippets Collection

Коллекция пользовательских сниппетов для Neovim, написанных на Lua для LuaSnip.

## 🗂️ Структура

```
nvim/snippets/
├── README.md              # Этот файл
├── USAGE.md              # Инструкция по использованию
├── QUICK_REFERENCE.md    # Быстрый справочник
├── CHANGELOG.md          # История изменений
└── vue/                  # Vue 3 сниппеты
    ├── vue.lua           # 19 основных сниппетов
    ├── html.lua          # 15 HTML сниппетов
    ├── typescript.lua    # 10 TypeScript сниппетов
    ├── README.md         # Документация Vue
    ├── SNIPPETS_LIST.md  # Полный список
    └── MIGRATION.md      # Миграция с JSON
```

## 🚀 Быстрый старт

### 1. Установка

Сниппеты автоматически загружаются через конфигурацию blink.cmp:

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

### 2. Использование

1. Откройте `.vue` файл
2. Введите `v3simple` и нажмите Tab
3. Сниппет развернется автоматически

### 3. Навигация

- `Tab` - Следующее поле
- `Shift+Tab` - Предыдущее поле

## 📦 Доступные коллекции

### Vue 3 (44 сниппета)

- ✅ Компоненты с автоименованием
- ✅ Reactivity API
- ✅ Lifecycle hooks
- ✅ Props & Emits
- ✅ State management (Pinia, Router)
- ✅ HTML директивы
- ✅ TypeScript типы

[Подробнее →](vue/README.md) | [Список →](vue/SNIPPETS_LIST.md) | [Справочник →](QUICK_REFERENCE.md)

## 🎯 Популярные сниппеты

| Сниппет | Описание |
|---------|----------|
| `v3simple` | Простой Vue компонент с автоименем |
| `v3comp` | Полный Vue компонент с TypeScript |
| `vref` | Reactive ref |
| `vcomputed` | Computed property |
| `vprops` | Props с TypeScript |
| `vpinia` | Pinia Store |

## 📖 Документация

- [USAGE.md](USAGE.md) - Полная инструкция по использованию
- [QUICK_REFERENCE.md](QUICK_REFERENCE.md) - Быстрый справочник
- [CHANGELOG.md](CHANGELOG.md) - История изменений
- [vue/README.md](vue/README.md) - Документация Vue сниппетов

## 🔧 Troubleshooting

### Сниппеты не работают?

```vim
" Проверить загрузку LuaSnip
:lua print(vim.inspect(require('luasnip').available()))

" Перезагрузить сниппеты
:lua require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })
```

### Проверить пути

```vim
:lua print(vim.fn.stdpath("config") .. "/snippets")
```

## ✨ Особенности

### 1. Динамическое содержимое

Автоматическая подстановка имени файла:
```
MyComponent.vue → class="my-component"
```

### 2. TypeScript поддержка

Все сниппеты поддерживают TypeScript из коробки.

### 3. Модульная структура

Сниппеты разделены по категориям для удобства.

### 4. Автоматическая загрузка

Не требует ручной настройки, работает сразу.

## 📝 Добавление своих сниппетов

Создайте файл `nvim/snippets/<language>/<category>.lua`:

```lua
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("mysnippet", fmt([[
const {} = {}
]], {
    i(1, "name"),
    i(0, "value")
  }))
}
```

[Подробнее →](USAGE.md#добавление-своих-сниппетов)

## 🎨 Преимущества Lua формата

1. **Динамические функции** - автоподстановка имени файла, даты и т.д.
2. **Производительность** - нативная интеграция с Neovim
3. **Гибкость** - использование Lua и Vim API
4. **Удобство** - проще редактировать, чем JSON
5. **Типизация** - поддержка LSP

## 📊 Статистика

- **Коллекций**: 1 (Vue)
- **Всего сниппетов**: 44
- **Lua файлов**: 3
- **Строк кода**: ~300
- **Документации**: ~500 строк

## 🗺️ Roadmap

Планы на будущее:

- [ ] React сниппеты
- [ ] Svelte сниппеты
- [ ] JavaScript паттерны
- [ ] Тестирование (Vitest, Jest)
- [ ] API запросы (fetch, axios)
- [ ] CSS/SCSS сниппеты
- [ ] HTML5 сниппеты

## 📄 Лицензия

Эти сниппеты являются частью персональной конфигурации Neovim.

## 🤝 Вклад

Для добавления новых сниппетов:

1. Создайте файл в соответствующей категории
2. Следуйте существующему формату
3. Добавьте документацию
4. Проверьте синтаксис: `lua -e "loadfile('file.lua')"`

## 📚 Полезные ссылки

- [LuaSnip документация](https://github.com/L3MON4D3/LuaSnip)
- [LuaSnip примеры](https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua)
- [blink.cmp](https://github.com/Saghen/blink.cmp)
- [Vue 3 документация](https://vuejs.org/)

---

**Версия**: 1.0.0  
**Дата**: 2026-02-16  
**Формат**: Lua (LuaSnip)
