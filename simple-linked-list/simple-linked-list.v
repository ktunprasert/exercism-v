module main

struct Node {
	data int
mut:
	next &Node = unsafe { nil }
}

struct LinkedList {
mut:
	node &Node = unsafe { nil }
	len  int
}

fn new() LinkedList {
	return LinkedList{}
}

fn from_array(array []int) LinkedList {
	mut list := new()

	for item in array {
		list.push(item)
	}

	return list
}

fn (list LinkedList) is_empty() bool {
	return list.len == 0
}

fn (mut list LinkedList) push(data int) {
	if list.is_empty() {
		list.node = &Node{
			data: data
		}
		list.len = 1
		return
	}

	mut node := list.node
	unsafe {
		for {
			if node.next == nil {
				break
			}

			node = node.next
		}
	}
	node.next = &Node{
		data: data
	}
	list.len++
}

fn (mut list LinkedList) pop() ?int {
	if list.is_empty() {
		return none
	}

	mut node := list.node
	unsafe {
		mut prev := node
		for {
			if node.next == nil {
				break
			}

			prev = node
			node = node.next
		}

		data := node.data
		prev.next = nil
		list.len--

		if list.len == 0 {
			list.node = nil
		}

		return data
	}
}

fn (list LinkedList) peek() ?int {
	unsafe {
		if list.node == nil {
			return none
		}

		return list.node.data
	}
}

fn (list LinkedList) to_array() []int {
	array := []int{cap: list.len}

	mut node := list.node
	unsafe {
		if node == nil {
			return array
		}

		for {
			if node == nil {
				break
			}
			array << node.data
			node = node.next
		}
	}
	return array
}

fn (list LinkedList) reverse() LinkedList {
	mut new_list := new()
	mut data := []int{cap: list.len}

	unsafe {
		mut node := list.node
		if node == nil {
			return new_list
		}

		for {
			if node == nil {
				break
			}

			data << node.data
			node = node.next
		}
	}

	for d in data.reverse() {
		new_list.push(d)
	}

	return new_list
}
