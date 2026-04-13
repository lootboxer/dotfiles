local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- Props interface
	s(
		"vpropsinterface",
		fmt(
			[[
interface Props {
	@#: @#
	@#?: @#
}
@#]],
			{ i(1, "requiredProp"), i(2, "string"), i(3, "optionalProp"), i(4, "number"), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Emits type
	s(
		"vemitstype",
		fmt(
			[[
interface Emits {
	@#: [@#: @#]
	@#: []
}
@#]],
			{ i(1, "eventName"), i(2, "payload"), i(3, "any"), i(4, "anotherEvent"), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Ref with explicit type
	s(
		"vreftype",
		fmt([[const @# = ref<@#>(@#)@#]], { i(1, "name"), i(2, "string"), i(3, "''"), i(0) }, { delimiters = "@#" })
	),

	-- Computed with explicit type
	s(
		"vcomputedtype",
		fmt(
			[[
const @# = computed<@#>(() => {
	return @#
})
@#]],
			{ i(1, "computedName"), i(2, "string"), i(3), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Component instance ref type
	s(
		"vinstancetype",
		fmt(
			[[
const @# = ref<InstanceType<typeof @#> | null>(null)
@#]],
			{ i(1, "componentRef"), i(2, "ComponentName"), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Reactive type
	s(
		"vreactivetype",
		fmt(
			[[
interface @# {
	@#: @#
}

const @# = reactive<@#>(@#)
@#]],
			{ i(1, "StateInterface"), i(2, "key"), i(3, "string"), i(4, "state"), i(1), i(5, "{}"), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- ComposableReturn type
	s(
		"vcomposablereturn",
		fmt(
			[[
export interface @#Return {
	@#: Ref<@#>
	@#: ComputedRef<@#>
	@#: (@#: @#) => @#
}
@#]],
			{
				i(1, "Composable"),
				i(2, "state"),
				i(3, "any"),
				i(4, "computed"),
				i(5, "string"),
				i(6, "method"),
				i(7, "param"),
				i(8, "any"),
				i(9, "void"),
				i(0),
			},
			{ delimiters = "@#" }
		)
	),

	-- Generic Component Props
	s(
		"vgenericprops",
		fmt(
			[[
interface Props<T = @#> {
	items: T[]
	selected?: T
}
@#]],
			{ i(1, "any"), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Watch source type
	s(
		"vwatchtype",
		fmt(
			[[
watch<@#>(@#, (newValue, oldValue) => {
	@#
})
@#]],
			{ i(1, "string"), i(2, "source"), i(3), i(0) },
			{ delimiters = "@#" }
		)
	),

	-- Provide/Inject key
	s(
		"vinjectkey",
		fmt(
			[[
import type { InjectionKey } from 'vue'

export const @#: InjectionKey<@#> = Symbol('@#')
@#]],
			{ i(1, "myKey"), i(2, "string"), i(3, "description"), i(0) },
			{ delimiters = "@#" }
		)
	),
}

