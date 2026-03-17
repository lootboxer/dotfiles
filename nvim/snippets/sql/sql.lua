local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("sel", {
		t("SELECT "),
		i(1, "*"),
		t({ "", "FROM " }),
		i(2, "table"),
		t({ "", "WHERE " }),
		i(0, "condition"),
	}),

	s("join", {
		t("INNER JOIN "),
		i(1, "table"),
		t(" ON "),
		i(2, "condition"),
	}),

	s("create", {
		t({ "CREATE TABLE " }),
		i(1, "table_name"),
		t({ " (", "\t" }),
		i(2, "id SERIAL PRIMARY KEY"),
		t({ "", "\t" }),
		i(0),
		t({ "", ");" }),
	}),

	s("index", {
		t("CREATE INDEX "),
		i(1, "idx_name"),
		t(" ON "),
		i(2, "table"),
		t("("),
		i(0, "column"),
		t(");"),
	}),

	s("insert", {
		t("INSERT INTO "),
		i(1, "table"),
		t(" ("),
		i(2, "columns"),
		t({ ")", "VALUES (" }),
		i(0, "values"),
		t(");"),
	}),
}

