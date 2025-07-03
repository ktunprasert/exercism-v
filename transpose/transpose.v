module main

import arrays

fn transpose(lines []string) []string {
	if lines.len == 0 {
		return []string{}
	}

	mut max_len := arrays.max(lines.map(it.len)) or { panic('huh') }
	mut result := []string{}

	for col in 0 .. max_len {
		mut new_line := []rune{}
		for row_idx, line in lines {
			if col < line.len {
				new_line << line[col]
				continue
			}

			mut add_space := false
			for idx := row_idx + 1; idx < lines.len; idx++ {
				if col < lines[idx].len {
					add_space = true
					break
				}
			}

			if add_space {
				new_line << ` `
			}
		}

		result << new_line.string()
	}

	return result
}
