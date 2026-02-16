# Custom Vue 3 Snippets

Коллекция кастомных сниппетов для Vue 3 с TypeScript.

## Основные компоненты (vue.json)

### Структура компонента
- `v3comp` - Полный Vue 3 компонент с TypeScript, props, emits, lifecycle
- `v3composable` - Vue 3 composable функция с TypeScript

### Reactivity
- `vref` - ref с TypeScript типом
- `vreactive` - reactive объект
- `vcomputed` - computed свойство
- `vwatch` - watch watcher
- `vwatcheffect` - watchEffect

### Lifecycle Hooks
- `vmounted` - onMounted hook
- `vunmounted` - onUnmounted hook

### Props & Emits
- `vprops` - defineProps с TypeScript интерфейсом
- `vpropsdefault` - defineProps с defaults
- `vemits` - defineEmits с TypeScript
- `vexpose` - defineExpose

### Directives
- `vfor` - v-for с :key
- `vif` - v-if/v-else блок

### State Management
- `vpinia` - Pinia Store с Composition API
- `vrouter` - Vue Router composables (useRouter, useRoute)

### Template Refs
- `vtemplateref` - Template ref с TypeScript и onMounted

## HTML шаблоны (html.json)

- `vcomp` - Самозакрывающийся компонент
- `vslot` - Named slot с scoped props
- `vteleport` - Teleport компонент
- `vtransition` - Transition компонент
- `vtransitiongroup` - TransitionGroup компонент
- `vkeepalive` - KeepAlive компонент
- `vsuspense` - Suspense компонент
- `vmodel` - v-model директива
- `vmodelcustom` - Кастомный v-model
- `@click` - Click event handler
- `@submit` - Submit event handler с prevent

## TypeScript типы (typescript.json)

- `vpropsinterface` - Props интерфейс
- `vemitstype` - Emits тип
- `vreftype` - Ref с явным типом
- `vcomputedtype` - Computed с явным типом
- `vinstancetype` - Component instance ref тип

## Использование

В `.vue` файле начните вводить префикс (например, `v3comp`) и нажмите Tab для раскрытия сниппета.

Сниппеты автоматически загружаются через конфигурацию blink.cmp:
```lua
search_paths = { vim.fn.stdpath("config") .. "/snippets" }
```

