module main

import arrays
import encoding.utf8

fn freqs(text string) map[rune]int {
	return arrays.map_of_counts(text.to_lower().runes().filter(utf8.is_letter(it)))
}

fn calculate_frequencies(texts []string) map[rune]int {
	threads := texts.map(spawn freqs(it))
	mut freqmap := map[rune]int{}
	for freq in threads.wait() {
        for key, count in freq {
            freqmap[key] += count
        }
	}

    return freqmap
}
