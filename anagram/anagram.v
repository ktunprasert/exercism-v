module main

fn find_anagrams(subject string, candidates []string) []string {
	target := subject.to_lower().runes().sorted(a < b)
	return candidates.filter(fn [target, subject] (s string) bool {
		slow := s.to_lower()
		return slow != subject.to_lower() && target == slow.runes().sorted(a < b)
	})
}
