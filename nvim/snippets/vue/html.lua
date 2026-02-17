local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Self-closing component
  s("vcomp", {
    t("<"),
    i(1, "ComponentName"),
    t({ "", "  :" }),
    i(2, "prop"),
    t('="'),
    i(3, "value"),
    t({ '"', "  @" }),
    i(4, "event"),
    t('="'),
    i(5, "handler"),
    t({ '"', "/>" }),
  }),

  -- Named slot with scoped props
  s("vslot", {
    t('<template #'),
    i(1, "slotName"),
    t('="{ '),
    i(2, "slotProps"),
    t({ ' }">', "  " }),
    i(3),
    t({ "", "</template>" }),
  }),

  -- Teleport
  s("vteleport", {
    t('<Teleport to="'),
    i(1, "body"),
    t({ '">', "  " }),
    i(2),
    t({ "", "</Teleport>" }),
  }),

  -- Transition
  s("vtransition", {
    t('<Transition name="'),
    i(1, "fade"),
    t({ '">', "  " }),
    i(2),
    t({ "", "</Transition>" }),
  }),

  -- TransitionGroup
  s("vtransitiongroup", {
    t('<TransitionGroup name="'),
    i(1, "list"),
    t('" tag="'),
    i(2, "ul"),
    t({ '">', "  " }),
    i(3),
    t({ "", "</TransitionGroup>" }),
  }),

  -- KeepAlive
  s("vkeepalive", {
    t({ "<KeepAlive>", "  " }),
    i(1),
    t({ "", "</KeepAlive>" }),
  }),

  -- Suspense
  s("vsuspense", {
    t({ "<Suspense>", "  <template #default>", "    " }),
    i(1),
    t({ "", "  </template>", "  <template #fallback>", "    " }),
    i(2, "Loading..."),
    t({ "", "  </template>", "</Suspense>" }),
  }),

  -- v-model directive
  s("vmodel", {
    t("v-model"),
    i(1),
    t('="'),
    i(2, "value"),
    t('"'),
  }),

  -- Custom v-model
  s("vmodelcustom", {
    t("v-model:"),
    i(1, "modelName"),
    t('="'),
    i(2, "value"),
    t('"'),
  }),

  -- @click event handler
  s("@click", {
    t('@click="'),
    i(1, "handler"),
    t('"'),
  }),

  -- @submit event handler with prevent
  s("@submit", {
    t('@submit.prevent="'),
    i(1, "handler"),
    t('"'),
  }),

  -- v-if / v-else block
  s("vif", {
    t("<"),
    i(1, "div"),
    t(' v-if="'),
    i(2, "condition"),
    t({ '">', "  " }),
    i(3),
    t({ "", "</" }),
    i(4, "div"),
    t({ ">", "<" }),
    i(5, "div"),
    t(" v-else>"),
    t({ "", "  " }),
    i(6),
    t({ "", "</" }),
    i(7, "div"),
    t(">"),
  }),

  -- v-show directive
  s("vshow", {
    t('v-show="'),
    i(1, "condition"),
    t('"'),
  }),

  -- v-bind directive
  s("vbind", {
    t(":"),
    i(1, "attr"),
    t('="'),
    i(2, "value"),
    t('"'),
  }),

  -- v-on directive
  s("von", {
    t("@"),
    i(1, "event"),
    t('="'),
    i(2, "handler"),
    t('"'),
  }),

  -- ref attribute
  s("ref", {
    t('ref="'),
    i(1, "refName"),
    t('"'),
  }),
}

