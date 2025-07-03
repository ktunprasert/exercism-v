module main

struct CustomSet[T] {
mut:
	fields map[T]voidptr
}

// build a new CustomSet
pub fn CustomSet.new[T](elements []T) CustomSet[T] {
	mut set := CustomSet[T]{
		fields: map[T]voidptr{}
	}

	for element in elements {
		set.add(element)
	}

	return set
}

pub fn (mut s CustomSet[T]) add[T](element T) {
	if !s.contains(element) {
		s.fields[element] = unsafe { nil }
	}
}

pub fn (s CustomSet[T]) contains[T](element T) bool {
	return element in s.fields
}

pub fn (s CustomSet[T]) equal[T](other CustomSet[T]) bool {
	if s.fields.len != other.fields.len {
		return false
	}

	for key in s.fields.keys() {
		if !other.contains(key) {
			return false
		}
	}

	return true
}

pub fn (s CustomSet[T]) is_empty[T]() bool {
	return s.fields.len == 0
}

// @union to avoid conflict with reserved word 'union'
pub fn (s CustomSet[T]) @union(other CustomSet[T]) CustomSet[T] {
	mut unioned := CustomSet[T]{s.fields.clone()}

	for key in other.fields.keys() {
		if !unioned.contains(key) {
			unioned.add(key)
		}
	}

	return unioned
}

pub fn (s CustomSet[T]) intersection(other CustomSet[T]) CustomSet[T] {
	mut intersected := CustomSet[T]{s.fields.clone()}

	for key in s.fields.keys() {
		if !other.contains(key) {
			intersected.fields.delete(key)
		}
	}

	return intersected
}

pub fn (s CustomSet[T]) difference[T](other CustomSet[T]) CustomSet[T] {
	mut difference := CustomSet[T]{s.fields.clone()}
	for key in other.fields.keys() {
		if difference.contains(key) {
			difference.fields.delete(key)
		}
	}

	return difference
}

pub fn (s CustomSet[T]) is_subset[T](other CustomSet[T]) bool {
	for key in s.fields.keys() {
		if !other.contains(key) {
			return false
		}
	}

	return true
}

pub fn (s CustomSet[T]) is_disjoint[T](other CustomSet[T]) bool {
	for key in s.fields.keys() {
		if other.contains(key) {
			return false
		}
	}

	return true
}
