module main

import arrays

fn transpose(lines []string) []string {
	if lines.len == 0 {
		return []string{}
	}

	lens := lines.map(it.len)
	trim_from := arrays.min(lens) or { panic('huh') }
	// println('trim_from: ${trim_from}')
	max_row := arrays.max(lens) or { panic('huh') }
	// mut transposed := [][]u8{len: max_row, init: []u8{len: lines.len, init: ` `}}
	mut transposed := [][]rune{len: max_row, init: []rune{len: lines.len, init: ` `}}

	for i, line in lines {
		for j, c in line {
			transposed[j][i] = c
		}
	}

	mut output := []string{cap: transposed.len}
	for i, row in transposed {
		mut row_str := '${row.string()}'

		if i > trim_from {
			row_str = row_str.trim_space_right()
		}

		output << row_str
	}

	return output
}
