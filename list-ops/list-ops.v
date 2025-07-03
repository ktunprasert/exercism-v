module main

pub fn append[T](front []T, back []T) []T {
	mut f := front.clone()
	for b in back {
		f << b
	}

	return f
}

pub fn concat[T](array [][]T) []T {
	mut fin := []T{}

	for arr in array {
		if arr.len == 0 {
			continue
		}
		for t in arr {
			fin << t
		}
	}

	return fin
}

pub fn foldl[T, U](array []T, initial U, folder fn (acc U, e T) U) U {
	mut res := initial

	for n in array {
		res = folder(res, n)
	}

	return res
}

pub fn foldr[T, U](array []T, initial U, folder fn (acc U, e T) U) U {
	return foldl(array.reverse(), initial, folder)
}

pub fn length[T](array []T) int {
	mut total := 0
	for _ in array {
		total++
	}

	return total
}

pub fn reverse[T](array []T) []T {
	mut rev := []T{cap: array.len}
	for i := array.len - 1; i >= 0; i-- {
		rev << array[i]
	}

	return rev
}

pub fn filter[T](array []T, predicate fn (e T) bool) []T {
	mut filtered := []T{}
	for a in array {
		if predicate(a) {
			filtered << a
		}
	}

	return filtered
}

// renamed 'map_of' as 'map' conflicts with V 'map' datatype

pub fn map_of[T, U](array []T, mapper fn (e T) U) []U {
	mut mapped := []U{cap: array.len}

	for a in array {
		mapped << mapper(a)
	}

	return mapped
}
