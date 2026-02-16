return {
	provider = "claude",
	providers = {
		claude = {
			endpoint = "https://api.anthropic.com",
			model = "claude-sonnet-4-5-20250929",
			timeout = 30000, -- Timeout in milliseconds
			extra_request_body = {
				temperature = 0.75,
				max_tokens = 20480,
			},
		},
	},
}
