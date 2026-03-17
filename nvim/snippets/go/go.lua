local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	-- Main function
	s("main", {
		t({ "func main() {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- Error handling
	s("iferr", {
		t("if err != nil {"),
		t({ "", "\t" }),
		i(0, "return err"),
		t({ "", "}" }),
	}),

	-- HTTP handler
	s("handler", {
		t("func "),
		i(1, "handlerName"),
		t("(w http.ResponseWriter, r *http.Request) {"),
		t({ "", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- Struct
	s("struct", {
		t("type "),
		i(1, "Name"),
		t({ " struct {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- Interface
	s("interface", {
		t("type "),
		i(1, "Name"),
		t({ " interface {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- Test function
	s("test", {
		t("func Test"),
		i(1, "Name"),
		t("(t *testing.T) {"),
		t({ "", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- Table-driven test
	s("testtable", {
		t({ "func Test" }),
		i(1, "Name"),
		t({ "(t *testing.T) {", "\ttests := []struct {", "\t\tname string", "\t\t" }),
		i(2, "// Add fields"),
		t({ "", "\t}{", "\t\t{", '\t\t\tname: "' }),
		i(3, "test case"),
		t({ '",', "\t\t},", "\t}", "", "\tfor _, tt := range tests {", "\t\tt.Run(tt.name, func(t *testing.T) {", "\t\t\t" }),
		i(0),
		t({ "", "\t\t})", "\t}", "}" }),
	}),

	-- JSON tags
	s("json", {
		t('`json:"'),
		i(1),
		t('"`'),
	}),

	-- Error wrap
	s("errwrap", {
		t('fmt.Errorf("'),
		i(1, "message"),
		t(': %w", err)'),
	}),
}

