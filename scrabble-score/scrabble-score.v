module main

fn score(word string) int {
	mut total := 0

	for c in word.to_lower_ascii() {
		match c {
			`d`, `g` { total += 2 }
			`b`, `c`, `m`, `p` { total += 3 }
			`f`, `h`, `v`, `w`, `y` { total += 4 }
			`k` { total += 5 }
			`j`, `x` { total += 8 }
			`q`, `z` { total += 10 }
			else { total++ }
		}
	}

	return total
}
