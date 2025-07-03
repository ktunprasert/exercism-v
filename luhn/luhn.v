module main

fn valid(value string) bool {
	if value.trim_space().len < 2 {
		return false
	}

	mut digits := []int{}
	for c in value {
		if c.is_digit() {
			digits << int(c - `0`)
		} else if c != ` ` {
			return false
		}
	}

	index_cond := digits.len % 2

	mut total := 0
	for i, mut d in digits {
		if i % 2 == index_cond {
			d *= 2
		}

		if d > 9 {
			d -= 9
		}

		total = total + d
	}

	return total % 10 == 0
}
