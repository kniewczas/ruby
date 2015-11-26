## Ruby, v2.2.3

### HASH
Tablice hashowe pozwalaja na przechowywanie objektow.

#### Zasady
Tablice indeksujemy od 0.

*Tworzenie nowej tablicy*
  myArray = [1, "string"]

#### INICJOWANIE

*Inicjowanie*
  myArray = Array.new

*Ilosc elementow podajemy w nawiasie*
  myArray = Array.new(2)

*Inicjowanie gotowymi elementami*
  myArray = Array.new(3, 4.3)

*Tworzenie tablicy obiektow*
  myArray = Array.new(4) { Array.new(3) }

#### GRANICE

*Precyzowanie granicy tablic*
  myArray.fetch(100)
  myArray.fetch(100, "WARNING!")

#### OTRZYMYWANIE ELEMENTOW

*Uzyskiwanie danego elementu*
  * inicjowanie
    myArray = [1,3,5,2,7,7]
  * uzyskiwanie elementu
    myArray[1]
    myArray[3]
  * otrzymywanie elementow + zakres
    myArray[1..4]

*pierwszy i ostatni element*
  myArray.first
  myArray.last

*pierwsze X elementow - > arr.take(X)*
  myArray.take(4)

*przeciwienstwo take => drop*
  myArray.drop(4)

#### SPRAWDZANIE DLUGOSCI TABLICY

*dlugosc tablicy*
  myArray.length LUB myArray.count

*sprawdz czy dany element istnieje?...*
  myArray.empty?  #= > RETURN BOOLEAN

*...lub element z dana wartoscia*
  myArray.include?('blbablalb')

#### DODAWANIE ELEMENTOW

*dodawanie elementow do tablicy prawie jak vector z C++*
  myArray.push(5)

*dodanie elementu na poczatek*
  myArray.unshift(0)

*dodanie elementu do wybranego miejsca*
  myArray.insert(5, 'babalalba')

#### METODY STOSU NA TABLICY

 # pop, shift etc, delete_at(particular_index)

#### USUWANIE

  myArray.delete_at(3) # < - z danego miejsca
  myArray.delete('bla') # < - dla danej zawartosci

  myArray.compact # < - usuwanie elementow

  myArray.unique # < - usuwanie unikalnych elementow

#### ITEROWANIE

*szablon konstrukcji*
  myArray.each { |a| print a -= 10, " " }
*mapowanie*
  myArray.map{} ##creating new array ( with '!' the same)

  myArray.select{ |a| a > 3} ##reject, drop_while
  
