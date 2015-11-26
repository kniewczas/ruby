## Ruby, v2.2.3

## HASH
Tablice hashowe pozwalaja na przechowywanie objektow.

#### Zasady
Tablice indeksujemy od 0.

*Tworzenie nowej tablicy*
```ruby  
  myArray = [1, "string"]
```
#### INICJOWANIE

*Inicjowanie*
```ruby  
  myArray = Array.new
```
*Ilosc elementow podajemy w nawiasie*
```ruby  
  myArray = Array.new(2)
```
*Inicjowanie gotowymi elementami*
```ruby    
  myArray = Array.new(3, 4.3)
```
*Tworzenie tablicy obiektow*
```ruby  
  myArray = Array.new(4) { Array.new(3) }
```
#### GRANICE

*Precyzowanie granicy tablic*
```ruby  
  myArray.fetch(100)
  myArray.fetch(100, "WARNING!")
```

#### OTRZYMYWANIE ELEMENTOW

*Uzyskiwanie danego elementu*
  * inicjowanie
```ruby  
myArray = [1,3,5,2,7,7]
```
  * uzyskiwanie elementu
```ruby
myArray[1]
myArray[3]
```
  * otrzymywanie elementow + zakres
    myArray[1..4]

*pierwszy i ostatni element*
```ruby
  myArray.first
  myArray.last
```

*pierwsze X elementow - > arr.take(X)*
```ruby
  myArray.take(4)
```

*przeciwienstwo take => drop*
```ruby
  myArray.drop(4)
```

#### SPRAWDZANIE DLUGOSCI TABLICY

*dlugosc tablicy*
```ruby
  myArray.length

  LUB myArray.count
```

*sprawdz czy dany element istnieje?...*
```ruby
myArray.empty?  #= > RETURN BOOLEAN
```

*...lub element z dana wartoscia*
```ruby
myArray.include?('blbablalb')
```

#### DODAWANIE ELEMENTOW

*dodawanie elementow do tablicy prawie jak vector z C++*
```ruby
  myArray.push(5)
```

*dodanie elementu na poczatek*
```ruby
myArray.unshift(0)
```

*dodanie elementu do wybranego miejsca*
```ruby
myArray.insert(5, 'babalalba')
```

#### METODY STOSU NA TABLICY

```ruby
 # pop, shift etc, delete_at(particular_index)
```

#### USUWANIE

```ruby  
myArray.delete_at(3) # < - z danego miejsca 
``` 
```ruby  
myArray.delete('bla') # < - dla danej zawartosci
``` 

```ruby 
myArray.compact # < - usuwanie elementow
``` 
```ruby 
myArray.unique # < - usuwanie unikalnych elementow
``` 

#### ITEROWANIE

*szablon konstrukcji*
```ruby
myArray.each { |a| print a -= 10, " " }
```
 
*mapowanie*
```ruby
myArray.map{} ##creating new array ( with '!' the same)
```
```ruby
myArray.select{ |a| a > 3} ##reject, drop_while
```
  
## ENUMERABLE

Enumerable to kolekcja klas z metodami szukania, iterowania i z mozliwoscia sortowania. 

####
