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


# Regex Functions in Python
# Split
# Splits second string at the first string
a = split("ab", "wekab 34babews")
assert a == ['wek', ' 34b', 'ews']

# Search and Group
# Search creates a match object, which has a group method
s = "b ab\naab 123"
m = search("(a*)b([^a]*)(a*)b", s)
assert m.group(0) == "b ab" # group 0 is the entire pattern
assert m.group(1) == ""		# match for first set of ()
assert m.group(2) == " "	# match for second set of ()
assert m.group(3) == "a"	# match for third set of ()
# the groups after group(0) are returning what in group 0
# matches that set of parentheses

# sub
# replace all instances of the first string with the second
s = "b ab\naab 123"
t = sub("b ", "xx", s)
assert s == "b ab\naab 123"
assert t == "xxab\naaxx123"

'''
Special Tokens
^ : at the start of a string ("^a")
$ : at the end of a string ("a$")
. : any character, no new lines
r"\d" : any digit
r"\D" : any non-digit
r"\w" : any alphanumeric
r"\W" : any non-alphanumeric
* : zero or more
[^_] : not _
? : zero or one
+ : one or more
'''

'''
Other Python Notes

Operator Overloading
	This looks like adding an __add__ method to a class you
	defined, so the plus operator ('+') is defined for
	objects of your class.
	Other common examples are defining __str__ and __eq__.
	Link: https://www.programiz.com/python-programming/operator-overloading

Closures
	Nested function that accesses nonlocal variables (variables
	from the outer function)
'''
