module main

fn calculate_frequencies(texts []string) map[rune]int {
	mut freqmap := map[rune]int{}
	mut handles := []thread{}
	result_ch := chan &map[rune]int{cap: texts.len}

	for text in texts {
		handles << spawn fn (t string, ch chan &map[rune]int) {
			mut freq := map[rune]int{}
			for c in t.runes() {
				if c.length_in_bytes() > 1 {
					freq[c]++
				} else if c.bytes().all(it.is_letter()) {
					freq[c.to_lower()]++
				}
			}
			ch <- &freq
		}(text, result_ch)
	}

	handles.wait()
	result_ch.close()

	for {
		result := <-result_ch or { break }

		for key, count in result {
			freqmap[key] += count
		}
	}

	return freqmap
}
