# interesting behavior
s = "hello"

p s.object_id 
t = s           # t.object id == s.object_id
p t.object_id
s.replace('hi') # now both t and s are 'hi'

s = 'hi'        # s is now a diff objet
p t.object_id
p t
p s
p t
p s.object_id
p t.object_id
