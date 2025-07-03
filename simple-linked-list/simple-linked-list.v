module main

struct Empty {}

struct Node {
	data int
mut:
	next Leaf
}

type Leaf = Node | Empty

struct LinkedList {
mut:
	node Leaf
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
    mut node := list.node
    if node is Empty {
        list.node = Node{data, Empty{}}
        list.len++
        return
    }

    for node !is Empty {
        tmp := node.next or { Empty{} }
    }

// for mut node := list.node; node is Node == true; node = node.next {
//     }

    // for mut node = list.node; node !is Empty; node = node.next {

    // }

	// mut node := list.node
	// for {
	// 	match node.next {
	// 		Empty {
	// 			break
	// 		}
	// 		Node {
	// 			node = node.next
	// 		}
	// 		else {}
	// 	}
	// }

	// // defer { println('push data=${data} list=${list}') }
	// if list.is_empty() {
	// 	list.node = &Node{data, none}
	// 	list.len++
	// 	return
	// }

	// unsafe {
	// 	mut node := list.node or { nil }

	// 	for {
	// 		tmp := node.next or { nil }
	// 		if tmp == nil {
	// 			break
	// 		}

	// 		list.len++
	// 		node = tmp
	// 	}

	// 	node.next = &Node{data, none}
	// }
}

fn (mut list LinkedList) pop() ?int {
	mut node := list.node?

	unsafe {
		mut prev := node
		for {
			tmp := node.next or { nil }
			if tmp == nil {
				break
			}

			prev = node
			node = tmp
		}

		data := node.data
		println('pop data=${data} list=${list} node=${node} prev=${prev}')
		prev.next = nil

		return data
	}
	// println('pop list=${list}')
	// if list.len == 1 {
	// 	node := list.node?
	// 	list.len = 0
	// 	list.node = none

	// 	println('list.node=${list.node}')
	// 	return node.data
	// }

	// node := list.node?
	// v := node.data
	// list.node = node.next?
	// list.len--

	// println('list.node=${list.node}')
	// return v
}

fn (list LinkedList) peek() ?int {
	return list.node?.data
}

fn (list LinkedList) to_array() []int {
	array := []int{cap: list.len}

	unsafe {
		mut node := list.node or { nil }
		if node == nil {
			return array
		}

		for {
			node = node.next or { nil }
			if node == nil {
				break
			}

			array << node.data
		}
	}
	return array
}

fn (list LinkedList) reverse() LinkedList {
	mut new_list := new()

	unsafe {
		mut node := list.node or { nil }
		if node == nil {
			return new_list
		}

		for {
			node = node.next or { nil }
			if node == nil {
				break
			}

			new_list.push(node.data)
		}
	}
	return new_list
}
