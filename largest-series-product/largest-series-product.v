module main

import arrays { fold, max, window }

fn largest_product(digits string, span int) !int {
	if span < 0 {
		return error('span must not be negative')
	}

	if span > digits.len {
		return error('')
	}

	if span == 0 || digits.len == 0 {
		return 1
	}

	mut digs := []int{}
	for c in digits {
		if !c.is_digit() {
			return error('digits input must only contain digits')
		}

		digs << int(c - `0`)
	}

	return max(window(digs, size: span).map(fold(it, 1, |a, b| a * b)))
}
