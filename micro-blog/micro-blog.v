module main

fn truncate(phrase string) string {
	if phrase.runes().len > 5 {
		return phrase.runes()[..5].string()
	}

	return phrase
}
