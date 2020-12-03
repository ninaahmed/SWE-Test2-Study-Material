# Relations in Python notes
# All from Downing's Notes

'''
Select
Passes in a relation, then a unary predicate
'''
def select(r, c):
	return (d for d in r if c(d))

'''
Project
Passes in a relation, then a set str
Returns a relation with the fields in the set
'''
def project(r, *t):
	for d in r:
		x = {}
		for a in t:
			if a in d:
				x[a] = d[a]
		yield x

'''
Cross Join
Size of returned relation = size of first * size of second
'''
def cross_join(r, s):
	for u in r:
		for v in s:
			yield {**u, **v}

'''
Theta Join
Takes in two relations and a predicate
'''
def theta_join(r, s, f):
	for u in r:
		for v in s:
			if f(u, v):
				yield {**u, **v}

'''
Natural Join
Uses Theta Join, defines the predicate to check if the fields
that exist in both entries are equal
'''
def natural_join(r, s):
	def check(u, v):
		for k in u:
			if (k in v) and (u[k] != v[k]):
				return False
		return True
	return theta_join(r, s, check)
