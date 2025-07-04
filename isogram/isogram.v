module main

fn is_isogram(word string) bool {
	mut found := map[rune]bool{}

	for c in word.to_lower() {
		if c == ` ` || c == `-` {
			continue
		}

		if c in found {
			return false
		}

		found[c] = true
	}

	return true
}
