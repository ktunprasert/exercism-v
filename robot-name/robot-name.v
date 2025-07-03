module main

struct Robot {
	name string
}

struct RobotIterator {
mut:
	name   chan string
	worker thread
}

fn (mut ri RobotIterator) init() {
	ri.worker = go worker(ri.name)
}

fn worker(ch chan string) {
	for c1 in `A` .. `Z` {
		for c2 in `A` .. `Z` {
			for i in 0 .. 1000 {
				if ch.closed {
					return
				}

				ch <- '${c1}${c2}${i:03}'
			}
		}
	}
}

fn create_robot_storage() RobotIterator {
	mut ri := RobotIterator{}
	ri.init()

	return ri
}

fn create_robot(mut robots RobotIterator) Robot {
	name := <-robots.name or { panic(err) }
    println(name)
	return Robot{name}
}

fn (mut r Robot) reset(mut robots RobotIterator) {
	// robots.name.close()
 //    robots.worker.wait()

	// robots.name = chan string{}
	// robots.init()
}
