# Making Hello Word more difficult than it needs to me because why not!

def print_hello_world():
	output = ['Hello',' ','World']
	for str in output:
		yield str

str = ''

for p in print_hello_world():
	str += p

print(str)