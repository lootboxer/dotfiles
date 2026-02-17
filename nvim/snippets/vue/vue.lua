local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

-- Функция для получения имени файла без расширения в kebab-case
local function get_filename_kebab()
	local filename = vim.fn.expand("%:t:r")
	if filename == "" then
		return "component-name"
	end
	-- Преобразуем PascalCase в kebab-case
	local kebab = filename:gsub("(%u)", function(c)
		return "-" .. c:lower()
	end):gsub("^%-", "")
	return kebab
end

return {
	-- Простой Vue 3 компонент
	s(
		"v3simple",
		fmt(
			[[
<script setup lang="ts">
@#
</script>

<template>
	<div class="@#">
		@#
	</div>
</template>

<style scoped lang="scss">
.@# {
	@#
}
</style>
]],
			{
				i(1),
				f(get_filename_kebab),
				i(0),
				f(get_filename_kebab),
				i(2),
			},
			{ delimiters = "@#" }
		)
	),

	-- Полный Vue 3 компонент с TypeScript
	s(
		"v3comp",
		fmt(
			[[
<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'

// Props
interface Props {
	@#?: @#
}

const props = withDefaults(defineProps<Props>(), {
	@#: '@#'
})

// Emits
const emit = defineEmits<{
	@#: [@#: @#]
}>()

// State
const @# = ref<@#>(@#)

// Computed
const @# = computed(() => {
	return @#
})

// Methods
const @# = () => {
	@#
}

// Lifecycle
onMounted(() => {
	// component mounted
})
</script>

<template>
	<div class="@#">
		@#
	</div>
</template>

<style scoped lang="scss">
.@# {
	@#
}
</style>
]],
			{
				i(1, "propName"),
				i(2, "string"),
				i(1),
				i(3, "defaultValue"),
				i(4, "eventName"),
				i(5, "payload"),
				i(6, "any"),
				i(7, "stateName"),
				i(8, "string"),
				i(9, "initialValue"),
				i(10, "computedName"),
				i(11, "// computation"),
				i(12, "methodName"),
				i(13),
				f(get_filename_kebab),
				i(0),
				f(get_filename_kebab),
				i(14),
			},
			{ delimiters = "@#" }
		)
	),

	-- Vue 3 Composable
	s(
		"v3composable",
		fmt(
			[[
import { ref, computed, type Ref } from 'vue'

export function use@#(@#) {
	// State
	const @# = ref<@#>(@#)

	// Computed
	const @# = computed(() => {
		return @#
	})

	// Methods
	const @# = async () => {
		@#
	}

	return {
		@#,
		@#,
		@#
	}
}

export type @#Return = ReturnType<typeof use@#>
@#]],
			{
				i(1, "ComposableName"),
				i(2, "params"),
				i(3, "state"),
				i(4, "any"),
				i(5, "null"),
				i(6, "computedValue"),
				i(7, "// computation"),
				i(8, "methodName"),
				i(9),
				i(3),
				i(6),
				i(8),
				i(1),
				i(1),
				i(0),
			},
			{ delimiters = "@#" }
		)
	),

	-- Vue 3 Ref
	s("vref", fmt([[const @# = ref<@#>(@#)@#]], { i(1, "name"), i(2, "string"), i(3, "''"), i(0) }, { delimiters = "@#" })),

	-- Vue 3 Reactive
	s(
		"vreactive",
		fmt(
			[[
const @# = reactive({
	@#: @#
})
@#]],
			{ i(1, "state"), i(2, "key"), i(3, "value"), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Vue 3 Computed
	s(
		"vcomputed",
		fmt(
			[[
const @# = computed(() => {
	return @#
})
@#]],
			{ i(1, "computedName"), i(2, "// computation"), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Vue 3 Watch
	s(
		"vwatch",
		fmt(
			[[
watch(@#, (newValue, oldValue) => {{
	@#@#
}})
]],
			{ i(1, "source"), i(2), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Vue 3 WatchEffect
	s(
		"vwatcheffect",
		fmt(
			[[
watchEffect(() => {{
	@#@#
}})
]],
			{ i(1), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Vue 3 onMounted
	s(
		"vmounted",
		fmt(
			[[
onMounted(() => {{
	@#@#
}})
]],
			{ i(1), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Vue 3 onUnmounted
	s(
		"vunmounted",
		fmt(
			[[
onUnmounted(() => {{
	@#@#
}})
]],
			{ i(1), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Vue 3 defineProps
	s(
		"vprops",
		fmt(
			[[
interface Props {{
	@#: @#
}}

const props = defineProps<Props>()@#
]],
			{ i(1, "propName"), i(2, "string"), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Vue 3 defineProps with defaults
	s(
		"vpropsdefault",
		fmt(
			[[
interface Props {{
	@#?: @#
}}

const props = withDefaults(defineProps<Props>(), {{
	@#: '@#'
}})@#
]],
			{ i(1, "propName"), i(2, "string"), i(1), i(3, "defaultValue"), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Vue 3 defineEmits
	s(
		"vemits",
		fmt(
			[[
const emit = defineEmits<{{
	@#: [@#: @#]
}}>@#()
]],
			{ i(1, "eventName"), i(2, "payload"), i(3, "any"), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Vue 3 defineExpose
	s(
		"vexpose",
		fmt(
			[[
defineExpose({{
	@#@#
}})
]],
			{ i(1, "methodName"), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Vue 3 v-for
	s("vfor", fmt([[v-for="@# in @#" :key="@#.@#"@#]], { i(1, "item"), i(2, "items"), i(1), i(3, "id"), i(0) }, { delimiters = "@#" })),

	-- Vue 3 Pinia Store
	s(
		"vpinia",
		fmt(
			[[
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const use@#Store = defineStore('@#', () => {
	// State
	const @# = ref<@#>(@#)

	// Getters
	const @# = computed(() => {
		return @#
	})

	// Actions
	const @# = async () => {
		@#
	}

	return {
		@#,
		@#,
		@#
	}
})
@#]],
			{
				i(1, "Store"),
				i(2, "storeName"),
				i(3, "state"),
				i(4, "any"),
				i(5, "null"),
				i(6, "getter"),
				i(7, "// computation"),
				i(8, "action"),
				i(9),
				i(3),
				i(6),
				i(8),
				i(0),
			},
			{ delimiters = "@#" }
		)
	),

	-- Vue Router composable
	s(
		"vrouter",
		fmt(
			[[
import {{ useRouter, useRoute }} from 'vue-router'

const router = useRouter()
const route = useRoute()
@#
]],
			{ i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Vue 3 Template Ref
	s(
		"vtemplateref",
		fmt(
			[[
const @# = ref<@# | null>(null)

onMounted(() => {{
	if (@#.value) {{
		@#@#
	}}
}})
]],
			{ i(1, "elementRef"), i(2, "HTMLElement"), i(1), i(3), i(0) },
			{ delimiters = "@#" }
		)
	),
}

