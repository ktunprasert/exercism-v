module main

fn calculate_frequencies(texts []string) map[rune]int {
	mut freqmap := map[rune]int{}
	mut handles := []thread map[rune]int{cap: texts.len}

	for text in texts {
		handles << spawn fn (t string) map[rune]int {
			mut freq := map[rune]int{}
			for c in t.to_lower().runes() {
				if c.length_in_bytes() > 1 {
					freq[c]++
				} else if c.bytes().all(it.is_letter()) {
					freq[c]++
				}
			}

			return freq
		}(text)
	}

	data := handles.wait()

	for result in data {
		for key, count in result {
			freqmap[key] += count
		}
	}

	return freqmap
}
