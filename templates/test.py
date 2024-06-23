def maxCount(inp, exc):
	count = {}
	for i in inp:
		if not i in exc:
			count[i] += 1

	return max(count) or 0

inp = [1,1,1,5,3,3,2]
exc = [1,2]
print(maxCount(inp, exc))