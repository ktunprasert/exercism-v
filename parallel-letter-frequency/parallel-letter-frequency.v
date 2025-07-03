module main

fn worker(mut freqmap map[rune]int, rune_ch chan rune) {
	// for c := <-rune_ch {
	for {
		c := <-rune_ch or { break }
		freqmap[c]++
	}
}

fn calculate_frequencies(texts []string) map[rune]int {
	mut freqmap := map[rune]int{}
	rune_ch := chan rune{}

	spawn worker(mut &freqmap, rune_ch)

	// worker := spawn
	for text in texts {
		for c in text {
			rune_ch <- c
		}
	}
	rune_ch.close()

	// mut mu := sync.new_rwmutex()
	// for text in texts {
	// 	f := spawn fn [mut freqmap, mut mu] (t string) {
	// 		mu.lock()
	// 		defer { mu.unlock() }

	// 		for c in t {
	// 			freqmap[c]++
	// 		}
	// 	}(text)

	// 	f.wait()
	// }
	// println(freqmap)

	// worker.wait()

	return freqmap
}
