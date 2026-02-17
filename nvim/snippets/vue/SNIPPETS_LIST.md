# Полный список Vue сниппетов

## vue.lua - Основные сниппеты (19 штук)

| Префикс | Описание |
|---------|----------|
| `v3simple` | Простой Vue 3 компонент с автоименем файла |
| `v3comp` | Полный Vue 3 компонент с TypeScript |
| `v3composable` | Vue 3 composable функция |
| `vref` | ref с TypeScript типом |
| `vreactive` | reactive объект |
| `vcomputed` | computed свойство |
| `vwatch` | watch watcher |
| `vwatcheffect` | watchEffect |
| `vmounted` | onMounted hook |
| `vunmounted` | onUnmounted hook |
| `vprops` | defineProps с TypeScript |
| `vpropsdefault` | defineProps с defaults |
| `vemits` | defineEmits с TypeScript |
| `vexpose` | defineExpose |
| `vfor` | v-for с :key |
| `vpinia` | Pinia Store с Composition API |
| `vrouter` | Vue Router composables |
| `vtemplateref` | Template ref с TypeScript |

## html.lua - HTML сниппеты (15 штук)

| Префикс | Описание |
|---------|----------|
| `vcomp` | Самозакрывающийся компонент |
| `vslot` | Named slot с scoped props |
| `vteleport` | Teleport компонент |
| `vtransition` | Transition компонент |
| `vtransitiongroup` | TransitionGroup компонент |
| `vkeepalive` | KeepAlive компонент |
| `vsuspense` | Suspense компонент |
| `vmodel` | v-model директива |
| `vmodelcustom` | Кастомный v-model |
| `@click` | Click event handler |
| `@submit` | Submit event handler с prevent |
| `vif` | v-if/v-else блок |
| `vshow` | v-show директива |
| `vbind` | v-bind директива |
| `von` | v-on директива |
| `ref` | ref атрибут |

## typescript.lua - TypeScript типы (10 штук)

| Префикс | Описание |
|---------|----------|
| `vpropsinterface` | Props интерфейс |
| `vemitstype` | Emits тип |
| `vreftype` | Ref с явным типом |
| `vcomputedtype` | Computed с явным типом |
| `vinstancetype` | Component instance ref тип |
| `vreactivetype` | Reactive с интерфейсом |
| `vcomposablereturn` | ComposableReturn интерфейс |
| `vgenericprops` | Generic Component Props |
| `vwatchtype` | Watch с типом |
| `vinjectkey` | Provide/Inject ключ |

## Итого: 44 сниппета

Все сниппеты написаны на Lua и поддерживают:
- ✅ Автоматическую подстановку имени файла
- ✅ Динамические placeholder'ы
- ✅ TypeScript типизацию
- ✅ Tab-навигацию между полями
- ✅ Автоматическое форматирование
