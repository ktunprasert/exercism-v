module main

fn slices(series string, slice_length int) ![]string {
	match true {
		series.len == 0 { return error('series cannot be empty') }
		slice_length == 0 { return error('slice length cannot be zero') }
		slice_length < 0 { return error('slice length cannot be negative') }
		slice_length > series.len { return error('slice length cannot be greater than series length') }
		else { none }
	}

	mut slices := []string{}
	for i in 0 .. series.len - slice_length + 1 {
		slices << series[i..i + slice_length]
	}

	return slices
}
