module main

import arrays

pub enum Number {
	perfect
	abundant
	deficient
}

fn factorise(n int) []int {
	mut factors := []int{}

	for d := 1; d * d < n; d++ {
		if n % d == 0 {
			factors << d
			factors << n / d
		}
	}

	return factors.filter(it != n)
}

// returns a `Result` type
pub fn classify(candidate int) !Number {
	if candidate <= 0 {
		return error('Classification is only possible for positive integers.')
	}

	factors := factorise(candidate)
	sum := arrays.sum(factors) or { 0 }

	return match true {
		sum == candidate { .perfect }
		sum < candidate { .deficient }
		else { .abundant }
	}
}
