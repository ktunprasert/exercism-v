module main

struct CircularBuffer[T] {
mut:
	t_chan chan T
    capacity int
}

fn (b CircularBuffer[T]) is_full() bool {
    return b.t_chan.len == b.capacity
}

pub fn create_buffer[T](capacity int) CircularBuffer[T] {
	return CircularBuffer[T]{chan T{cap: capacity}, capacity}
}

pub fn (mut b CircularBuffer[T]) write(value T) ! {
	if b.is_full() {
		return error('Buffer is full')
	}

	b.t_chan <- value
}

pub fn (mut b CircularBuffer[T]) read() !T {
	if b.t_chan.len == 0 {
		return error('Buffer is empty')
	}

	return <-b.t_chan
}

pub fn (mut b CircularBuffer[T]) overwrite(value T) {
	if b.is_full() {
        b.read() or { return }
	}

	b.write(value) or { return }
}

pub fn (mut b CircularBuffer[T]) clear() {
	b.t_chan = chan T{cap: b.capacity}
}
