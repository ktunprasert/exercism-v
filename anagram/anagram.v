module main

fn find_anagrams(subject string, candidates []string) []string {
	target := subject.to_lower().runes().sorted(a < b)
	return candidates.filter(fn [target, subject] (s string) bool {
		return s.to_lower() != subject.to_lower() && target == s.to_lower().runes().sorted(a < b)
	})
}
