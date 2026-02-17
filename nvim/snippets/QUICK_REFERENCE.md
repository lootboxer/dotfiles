# 🚀 Быстрый справочник Vue сниппетов

## Самые используемые сниппеты

### 📦 Создание компонентов

```
v3simple  → Простой компонент с автоименем
v3comp    → Полный компонент с TypeScript
```

### ⚡ Reactivity

```
vref       → const name = ref<string>('')
vreactive  → const state = reactive({ key: value })
vcomputed  → const computed = computed(() => { return ... })
```

### 🎣 Lifecycle

```
vmounted   → onMounted(() => { ... })
vunmounted → onUnmounted(() => { ... })
```

### 📝 Props & Emits

```
vprops        → interface Props + defineProps
vpropsdefault → interface Props + withDefaults
vemits        → defineEmits с TypeScript
```

### 🏪 State Management

```
vpinia  → Pinia Store с Composition API
vrouter → useRouter + useRoute
```

### 🎨 HTML Директивы

```
vmodel  → v-model="modelValue"
vfor    → v-for="item in items" :key="item.id"
vif     → v-if/v-else блок
@click  → @click="handleClick"
@submit → @submit.prevent="handleSubmit"
```

### 📐 TypeScript типы

```
vpropsinterface → interface Props { ... }
vemitstype      → interface Emits { ... }
vreftype        → const name = ref<string>('')
vcomputedtype   → const computed = computed<string>(() => ...)
```

## Горячие клавиши

- `Tab` - Переход к следующему полю
- `Shift+Tab` - Переход к предыдущему полю
- `Ctrl+Space` - Показать список сниппетов

## Автоматическое именование

Файл `MyAwesomeComponent.vue`:
```vue
v3simple → class="my-awesome-component"
```

Автоматически преобразует PascalCase в kebab-case!

## Troubleshooting

Сниппеты не работают?

```vim
:lua print(vim.inspect(require('luasnip').available()))
```

Перезагрузить сниппеты:

```vim
:lua require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })
```

## Документация

- [README.md](vue/README.md) - Полная документация
- [SNIPPETS_LIST.md](vue/SNIPPETS_LIST.md) - Все 44 сниппета
- [USAGE.md](USAGE.md) - Инструкция по использованию
- [MIGRATION.md](vue/MIGRATION.md) - Миграция с JSON

## Примеры использования

### Создать простой компонент

1. Создайте `Button.vue`
2. Введите `v3simple` + Tab
3. Готово! class="button" уже подставлен

### Создать composable

1. Создайте `useCounter.ts`
2. Введите `v3composable` + Tab
3. Заполните параметры

### Добавить props с defaults

1. В `<script setup>` введите `vpropsdefault` + Tab
2. Укажите имя prop, тип и значение по умолчанию

## Полезные комбинации

**Компонент с props и emits:**
```
v3simple → vpropsdefault → vemits
```

**Composable с state и computed:**
```
v3composable → vref → vcomputed
```

**Form компонент:**
```
v3comp → vmodel → @submit
```
