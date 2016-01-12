class Kursy

	#TABLICA KURSOW	
	def initialize()
	@arr = Array.new() 
	end

	#DODAWANIE KURSU
	def dodajKurs(waluta, sprzedaz, kupno, wzrost)
		if((sprzedaz.to_f > 0) && (kupno.to_f > 0))
		tempArray = Array.new()
		tempArray.push(wzrost)
		tempArray.push(kupno)
		tempArray.push(sprzedaz)
		tempArray.push(waluta)
		@arr.push(tempArray)
		else
			puts 'Za male liczby.'
		end
	end

	def zwrocTabliceKursow()
	return @arr
	end

	#ZWRACANIE KURSU SPRZEDAZY DANEJ WALUTY
	def zwrocSprzedaz(waluta)
		for i in 0..(@arr.length-1)
			if (@arr[i][0]) == waluta
				return @arr[i][1]
			end
		end
		puts 'Nie obslugujemy takiej waluty.'
		return 0
	end

	#ZWRACANIE KURSU KUPNA DANEJ WALUTY
	def zwrocKupno(waluta)
		for i in 0..(@arr.length-1)
			if (@arr[i][0]) == waluta
				return @arr[i][2]
			end
		end
		puts 'Nie obslugujemy takiej waluty'
		return 0
	end

	#ZWRACANIE KURSU O NAJWIEKSZYM WZROSCIE
	def zwrocNajwiekszyWzrost()
		procent = -5
		for i in 0..(@arr.length-1)
			if (procent.to_f) == (@arr[i][3].to_f)
				wynik = ((wynik.to_s) + ' & ' + (@arr[i][0].to_s))
			end
			if (procent.to_f) < (@arr[i][3].to_f)
				procent = (@arr[i][3].to_s)
				wynik = (@arr[i][0].to_s)
				pamiec = (i.to_f)
			end
		end
		wynik = ((wynik.to_s) + ' (+' + (((@arr[pamiec][3].to_f)*100).to_s) + '%)')
		return wynik
	end

	#ZWRACANIE KURSU O NAJWIEKSZYM SPADKU
	def zwrocNajwiekszySpadek()
		procent = 0
		for i in 0..(@arr.length-1)
			if (procent.to_f) == (@arr[i][3].to_f)
				wynik = ((wynik.to_s) + ' & ' + (@arr[i][0].to_s))
			end
			if (procent.to_f) > (@arr[i][3].to_f)
				procent = (@arr[i][3].to_s)
				wynik = (@arr[i][0].to_s)
				pamiec = (i.to_f)
			end
		end
		wynik = ((wynik.to_s) + ' (' + (((@arr[pamiec][3].to_f)*100).to_s) + '%)')
		return wynik
	end

	#GENEROWANIE ZMIANY KURSOW
	def aktualizujKursy()
		for i in 0..(@arr.length-1)
			x = rand(0..100)
				@arr[i][3] = ((x-50.0)/1000.0).to_s
				@arr[i][1] = (@arr[i][1].to_f + (@arr[i][1].to_f * ((x-50.0)/1000.0))).to_s
				@arr[i][2] = (@arr[i][2].to_f + (@arr[i][2].to_f * ((x-50.0)/1000.0))).to_s
		end
	end

	#POKAZ KURSY
	def pokazKursy()
		puts '======================================================================================================'
		puts ' Aktualne kursy walut:'
		for i in 0..(@arr.length-1)
			if(@arr[i][0]) != 'JPY'
				puts "\n"
				print ' ' + @arr[i][0] + '->  SPRZEDAZ: ' + @arr[i][1] + '   	KUPNO: ' + @arr[i][2]
			else
				puts "\n"
				print ' ' + @arr[i][0] + '->  SPRZEDAZ: ' + @arr[i][1] + ' 	KUPNO: ' + @arr[i][2]
			end
			if (@arr[i][3].to_f) >= 0
				print '    		+' + ((@arr[i][3].to_f)*100).to_s + '%'
			else
				print '    		' + ((@arr[i][3].to_f)*100).to_s + '%'
			end
		end
		puts "\n\n"
	end
end


class Portfel

	def initialize()
	@tab = Array.new() 
	end

	#DODAJ PIENIADZE
	def dodajDoPortfela(waluta, ilosc, kursy)	
		if(@tab.length == 0)
				outArray = Array.new()
				outArray = kursy.zwrocTabliceKursow()
				for i in 0..(outArray.length-1)
					if outArray[i][0] == waluta
						tempArray = Array.new()
						tempArray.push(waluta)
						tempArray.push(ilosc)
						@tab.push(tempArray)
						return
					end
				end
				puts 'Nie masz takiej waluty'
		end

		for i in 0..(@tab.length-1)
			if waluta == (@tab[i][0])
			    @tab[i][1] = (@tab[i][1].to_f + ilosc.to_f).to_s
			    return
			end
		end

		outArray = Array.new()
		outArray = kursy.zwrocTabliceKursow()
		for i in 0..(outArray.length-1)
			if outArray[i][0] == waluta
				tempArray = Array.new()
				tempArray.push(waluta)
				tempArray.push(ilosc)
				@tab.push(tempArray)
				return
			end
		end
		puts 'Nie masz takiej waluty'
	end

	#ODEJMIJ PIENIADZE
	def pobierzZPortfela(waluta, ilosc)
		for i in 0..(@tab.length-1)
			if waluta == (@tab[i][0])
				if (@tab[i][1].to_f - ilosc.to_f) < 0
					puts 'Operacja nie zostala wykonana, nie posiadasz takiej ilosci tej waluty!'
					return 0
				else
			    	@tab[i][1] = (@tab[i][1].to_f - ilosc.to_f).to_s
			    	if (@tab[i][1].to_f) == 0
			    		@tab.delete_at(i)
			    	end
			    	return 1
				end
			end
			puts 'Nie masz takiej waluty'
		end
	end

	#ZWROC ILOSC WALUTY
	def zwrocIloscWaluty(waluta)
		for i in 0..(@tab.length-1)
			if waluta == (@tab[i][0])
				return @tab[i][1]
			end
		end
	end

	#ZAWARTOSC PORTFELA
	def pokazPortfel()
		puts "\n"
		for i in 0..(@tab.length-1)
			puts ' ' + @tab[i][0] + ': ' + (@tab[i][1].to_s)
		end
		print ''
	end

	#WARTOSC KAPITALU
	def obliczKapital(kursy)
		kapitalCalkowity = 0
		for i in 0..(@tab.length-1)
			kapitalCalkowity = ((kapitalCalkowity.to_f) + (@tab[i][1].to_f)*(kursy.zwrocKupno(@tab[i][0]).to_f))
		end
		return kapitalCalkowity
	end
end


def StanKonta(kursy, portfel)
	puts "\n"
	puts '======================================================================================================'
	puts '   BANK '
	puts '======================================================================================================'
	puts ' Aktualnie posiadane waluty:'
	puts portfel.pokazPortfel()
	puts "\n"
	puts ' Aktualna wartosc kapitalu: 	' + (portfel.obliczKapital(kursy).to_s)
end


def Kantor(kursy, portfel)
	r = 0
	puts "\n"
	while 1 do
		puts '======================================================================================================'
		puts '   KANTOR'
		puts '======================================================================================================'
		puts "\n"
		puts ' 1 - Kup walute'
		puts ' 2 - Sprzedaj walute'
		puts ' 3 - Wyjdz z kantoru'
		puts "\n"
		print '>>Wybieram: '
		r = gets.chomp
		puts "\n"
		case r
			when "1"
			kursy.pokazKursy()
			puts '======================================================================================================'
			puts ' Co chcesz kupic?'
			puts "\n"
			print '>>Podaj walute: '
			walutaKupowana = gets.chomp
			print '>>Podaj jej ilosc: '
			iloscKupowana = gets.chomp
			puts "\n"
			StanKonta(kursy, portfel)
			puts '======================================================================================================'
			puts ' Co chcesz sprzedac?'
			puts "\n"
			print '>>Podaj walute: '
			walutaSprzedawana = gets.chomp

			if(walutaKupowana == walutaSprzedawana)
				puts "\n"
				puts "!Operacja nie zostala wykonana, nie mozesz wybrac tej samej waluty!"
			else
				iloscSprzedawana = (((iloscKupowana.to_f)*(kursy.zwrocKupno(walutaKupowana).to_f))/(kursy.zwrocSprzedaz(walutaSprzedawana)).to_f)
				result = portfel.pobierzZPortfela(walutaSprzedawana, iloscSprzedawana)
				if(result != 0)
					portfel.dodajDoPortfela(walutaKupowana, iloscKupowana, kursy)
					StanKonta(kursy, portfel)
				end
			end
			puts "\n\n"
					puts '(wcisnij ENTER, aby wyjsc z transakcji)'
					gets.chomp

			when "2"
			StanKonta(kursy, portfel)
			puts '======================================================================================================'
			puts ' Co chcesz sprzedac? Jako ilosc mozesz podac "wszystko", aby wyprzedac cala posiadana walute.'
			puts "\n"
			print '>>Podaj walute: '
			walutaSprzedawana = gets.chomp
			print '>>Podaj jej ilosc: '
			iloscSprzedawana = gets.chomp
			if (iloscSprzedawana.to_s) == 'wszystko'
				iloscSprzedawana = portfel.zwrocIloscWaluty(walutaSprzedawana)
			end
			puts "\n"
			kursy.pokazKursy()
			puts '======================================================================================================'
			puts ' Co chcesz kupic?'
			puts "\n"
			print '>>Podaj walute: '
			walutaKupowana = gets.chomp
			if(walutaKupowana == walutaSprzedawana)
				puts "\n"
				puts "!Nie mozesz wybrac tej samej waluty!"
			else
				iloscKupowana = (((iloscSprzedawana.to_f)*(kursy.zwrocSprzedaz(walutaSprzedawana).to_f))/(kursy.zwrocKupno(walutaKupowana)).to_f)
				result = portfel.pobierzZPortfela(walutaSprzedawana, iloscSprzedawana)
				if(result != 0)
					portfel.dodajDoPortfela(walutaKupowana, iloscKupowana, kursy)
					StanKonta(kursy, portfel)
				end
					puts "\n\n"
					puts '(wcisnij ENTER, aby wyjsc z transakcji)'
					gets.chomp
			end

			when "3"
			break
		end
	end
end


def ZakonczDzien(kursy, portfel, aktualny)

	saldoDnia = (aktualny.to_f)
	kursy.aktualizujKursy()
	puts "\n"
	puts '======================================================================================================'
	puts '   PODSUMOWANIE DNIA'
	puts '======================================================================================================'
	puts ' Raport dzienny z najwazniejszymi informacjami:'
	najwiekszyWzrost = kursy.zwrocNajwiekszyWzrost()
	puts "\n"
	print ' Najwiekszy wzrost wartosci: 		' + najwiekszyWzrost.to_s
	najwiekszySpadek = kursy.zwrocNajwiekszySpadek()
	puts "\n"
	print ' Najwiekszy spadek wartosci: 		' + najwiekszySpadek.to_s
	aktualny = portfel.obliczKapital(kursy)
	saldoDnia = (((aktualny.to_f) - (saldoDnia.to_f)).to_s)
	puts "\n"
	print ' Saldo dnia: 	'
	if (saldoDnia.to_f) > 0
		print '+' + saldoDnia.to_s
	else
		print '' + saldoDnia.to_s
	end
	puts "\n\n\n"
	puts '(wcisnij ENTER, aby rozpoczac nowy dzien)'
	exit = gets.chomp
end


def Podsumowanie(startowy, aktualny)
	puts "\n"
	puts '======================================================================================================'
	puts '   SESJA ZAKONCZONA'
	puts '======================================================================================================'
	puts ' Kapital startowy: ' + startowy.to_s
	puts ' Kapital koncowy: ' + aktualny.to_s
	puts "\n"
	puts ' Procent kapitalu koncowego w stosunku do startowego: ' + ((aktualny.to_f)/(startowy.to_f)*100).to_s + '%'
	puts "\n"
	puts '======================================================================================================'
	puts "\n"
	puts '(wcisnij ENTER, aby wyjsc z sesji)'
	exit = gets.chomp
end


def Menu()

	#KURSY
	kursy = Kursy.new()
	kursy.dodajKurs(nil,'2.80418251000000','2.72005703470000','AUD')
	kursy.dodajKurs(nil,'4.02127531000000','3.90063705070000','CHF')
	kursy.dodajKurs(nil,'4.36583428000000','4.23485925160000','EUR')
	kursy.dodajKurs(nil,'5.85402268000000','5.67840199960000','GBP')
	kursy.dodajKurs(nil,'0.03402605530000','0.03300527364100','JPY')
	kursy.dodajKurs(nil,'1.00000000000000','1.00000000000000','PLN')
	kursy.dodajKurs(nil,'4.01345309000000','3.89304949730000','USD')
	kursy.zwrocTabliceKursow()
	#TWORZYMY PORTFEL
	portfel = Portfel.new()

	puts "\n\n\n"
	puts '======================================================================================================'
	puts '   WYBIERZ KAPITAL STARTOWY'
	puts '======================================================================================================'
	puts "\n"

	#POCZATKOWA KWOTA W PLN
	print '>>Chce zaczac z (PLN): '
	kapitalStartowy = gets.chomp
	portfel.dodajDoPortfela('PLN',kapitalStartowy.to_s, kursy)

	#DZIEN
	dzien = 1

	#WYJSCIE Z PROGRAMU
	wyjscie = 0
	
	#PETLA DNI
	while 1 do
		puts "\n"
		puts '======================================================================================================'
		puts '   DZIEN: ' + dzien.to_s
		kursy.pokazKursy()
		kapitalAktualny = portfel.obliczKapital(kursy)

		#OPCJE
		while 1 do
			
			puts '======================================================================================================'
			puts '   MENU GLOWNE'
			puts '======================================================================================================'
			puts "\n"
			puts ' 1 - Sprawdz stan konta'
			puts ' 2 - Przejdz do kantoru'
			puts ' 3 - Pokaz kursy walut'
			puts ' 4 - Zakoncz dzien'
			puts ' 5 - Zakoncz sesje'
			puts "\n"

			#POBIERZ OPCJE
			print '>>Wybieram: '
			option = gets.chomp

			#ZESTAW OPCJI
			case option
				when "1"
				StanKonta(kursy, portfel)
				when "2"
				Kantor(kursy, portfel)
				when "3"
				puts "\n"
				kursy.pokazKursy()
				puts "\n"
				puts '(wcisnij ENTER, aby wyjsc)'
				gets.chomp
				when "4"
				ZakonczDzien(kursy, portfel, kapitalAktualny)
				dzien = dzien + 1
				break
				when "5"
				wyjscie = 1
				Podsumowanie(kapitalStartowy, kapitalAktualny)
				break
			end
		end
		#WYJDZ Z GRY
		if wyjscie == 1 
			break
		end
	end
	return nil
end

Menu()
puts '======================================================================================================'
puts "\n\n"
