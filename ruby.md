## Ruby, v2.2.3
notatki

Hash
Hash are assocciate arrays. Hash allows you to use object instead of Integer.

For example:

#ARRAY
INFO:
Array starts at 0 !

#Creating a new Array
  myArray = [1, "string"]

[INITIALIZE]

#Initialize
  myArray = Array.new

#Deciding how much elements (EMPTY) array should have
  myArray = Array.new(2)

#When initializing with some beginnig parameters are wanted use this:
  myArray = Array.new(3, 4.3)

#Creating separate objects
  myArray = Array.new(4) { Array.new(3) }

[BOUNDS]

#Array bounds
  myArray.fetch(100)
  myArray.fetch(100, "WARNING!")

[GETTING ELEMENT]

#Retrieving specific element
  #initialize
    myArray = [1,3,5,2,7,7]
  #getting elements
    myArray[1]
    myArray[3]
  #getting elements + RANGE
    myArray[1..4]

#first and last element
  myArray.first
  myArray.last

#first X elements - > arr.take(X)
  myArray.take(4)

#opposie of take => drop
  myArray.drop(4)

[CHCECKING LENGTH / ELEMENT EXISTANCE]

#LENGTH of ARRAY
  myArray.length OR myArray.count

#Check if any elements exist?
  myArray.empty?  #= > RETURN BOOLEAN

#..or.. if SPECIFIC elements exist
  myArray.include?('blbablalb')

[ADDING ELEMENTS]

#adding almost the same as a vector/stack class C++
  myArray.push(5)

#adding at the BEGINNING
  myArray.unshift(0)

#adding at the SPECIFIC place
  myArray.insert(5, 'babalalba')

#if more attributes on the second place will be given then those elements
#will be include at the table

[STACK METHODS ON ARRAY]
 # -----pop, shift etc, delete_at(particular_index)

 [ DELETE]
  myArray.delete_at(3) # < - on specific index
  myArray.delete('bla') # < - delete elements with specific content

  myArray.compact # < - deleting NIL elements

  myArray.unique # < - deleteing unique elements

  [ ITERATING ]
#construction
  myArray.each { |a| print a -= 10, " " }
#reverse_each for reversing
  myArray.map{} ##creating new array ( with '!' the same)

  myArray.select{ |a| a > 3} ##reject, drop_while
  
