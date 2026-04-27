# struct is a library for manipulating
# data in and out of bytes
import struct

mydata = bytearray(10)
print(mydata)
# Not a useful way of handling, but we'll try this
mydata[0:3] = b"hey"
print(mydata)
#mydata[0] = 12345
# pack_into(format ,  bytearray, offset, value)
#format is a string indicating type of what's going
# in there, which affects how many bytes are used

print('A short is this many bytes', struct.calcsize('h'))
struct.pack_into('h',  mydata, 0, 12345)
print(mydata)

# Go to next spot
struct.pack_into('h',  mydata, 2, -12345)
print(mydata)

# Get values back
val1 = struct.unpack_from('h', mydata, 0)
val2 = struct.unpack_from('h', mydata, 2)
print(val1)
print(val2)

multiple = struct.unpack_from('2h, mydata, 0)
print(multiple)
