module main

fn spiral_matrix(n int) [][]int {
	mut x, mut y := 0, 0
	mut dx, mut dy := 1, 0
	mut matrix := [][]int{len: n, init: []int{len: n, init: 0}}

	for i in 1 .. n * n + 1 {
		matrix[y][x] = i

		if (x + dx >= n || y - dy >= n || y - dy < 0 || x + dx < 0) || matrix[y - dy][x + dx] != 0 {
			dx, dy = dy, -dx
		}

		x += dx
		y -= dy
	}

	return matrix
}
