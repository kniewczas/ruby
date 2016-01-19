require 'simplecov'
require 'RSpec'
SimpleCov.start

require_relative '../lib/kantor.rb'

#LISTA FUNKCJI I METOD PRZYJAZNYCH TESTOM:
#	[+]kursy.dodajKurs(waluta, sprzedaz, kupno, wzrost)
#	[+]kursy.sprawdzWaluteKurs(waluta)
#	[+]kursy.zwrocTabliceKursow()
#	[+]kursy.zwrocSprzedaz(waluta)
#	[+]kursy.zwrocKupno(waluta)
#	[+]kursy.zwrocNajwiekszyWzrost()
#	[+]kursy.zwrocNajwiekszySpadek()
#[-]portfel.pobierzZPortfela(waluta, ilosc)
#[+]portfel.sprawdzWalutePortfel(waluta)
#[+]portfel.zwrocIloscWaluty(waluta)
#[+]portfel.obliczKapital(kursy)

describe '#Symulator Kantora' do
	describe 'Kursy' do 	


		it 'Zdefiniowanie tabeli kursy' do
    		expect { kursy = Kursy.new() }.not_to raise_error
  		end

  		it 'Dodanie kursu' do
  			kursy = Kursy.new()
  			expect { kursy.dodajKurs(nil,'2.80','2.720','EUR') }.not_to raise_error
  			expect(kursy.dodajKurs(nil,'-2.80','2.720','EUR')).to eq(nil)
  			expect(kursy.dodajKurs(nil,'1.0','1.0','PLN')).to eq([['EUR', '2.720','2.80', nil], ['PLN','1.0','1.0',nil]])
  		end

  		it 'Sprawdzenie waluty w kursach' do
  			kursy = Kursy.new()
  			kursy.dodajKurs(nil,'2.80','2.720','EUR')
  			expect { kursy.sprawdzWaluteKurs('EUR') }.not_to raise_error
  			expect(kursy.sprawdzWaluteKurs('EUR')).to eq(1)
  			expect(kursy.sprawdzWaluteKurs('EURO')).to eq(0)
  		end

  		it 'Otrzymanie zwrotu tabeli kursow' do
  			kursy = Kursy.new()
  			kursy.dodajKurs(nil,'2.80','2.720','EUR')
			kursy.dodajKurs(nil,'1.0','1.0','PLN')
			expect{ kursy.zwrocTabliceKursow() }.not_to raise_error
			expect(kursy.zwrocTabliceKursow()).to eq([['EUR', '2.720','2.80', nil], ['PLN','1.0','1.0',nil]])
  		end

		it 'Otrzymanie zwrotu sprzedazy' do
			kursy = Kursy.new()
			kursy.dodajKurs(nil,'2.80','2.720','EUR')
			expect(kursy.zwrocSprzedaz('EUR')).to eq('2.720')
			expect(kursy.zwrocSprzedaz('EURO')).to eq(0)
		end

		it 'Otrzymanie zwrotu kupna' do
			kursy = Kursy.new()
			kursy.dodajKurs(nil,'2.80','2.720','EUR')
			expect(kursy.zwrocKupno('EUR')).to eq('2.80')
			expect(kursy.zwrocKupno('EURO')).to eq(0)
		end

		it 'Otrzymanie waluty o najwiekszym wzroscie' do
			kursy = Kursy.new()
  			kursy.dodajKurs('0.09','2.80','2.720','EUR')
			kursy.dodajKurs('-0.042','1.0','1.0','PLN')
			kursy.dodajKurs('0.13','1.60','1.58','AUD')
			expect { kursy.zwrocNajwiekszyWzrost() }.not_to raise_error
			expect(kursy.zwrocNajwiekszyWzrost()).to eq ('AUD (+13.0%)')
		end

		it 'Otrzymanie waluty o najwiekszym spadku' do
			kursy = Kursy.new()
  			kursy.dodajKurs('-0.09','2.80','2.720','EUR')
			kursy.dodajKurs('-0.042','1.0','1.0','PLN')
			kursy.dodajKurs('0.13','1.60','1.58','AUD')
			expect { kursy.zwrocNajwiekszySpadek() }.not_to raise_error
			expect(kursy.zwrocNajwiekszySpadek()).to eq ('EUR (-9.0%)')
		end

	end

	describe 'Portfel' do


		it 'Zdefiniowanie tabeli portfel' do
			expect { portfel = Portfel.new() }.not_to raise_error
		end

		it 'Sprawdzenie waluty w portfelu' do
  			kursy = Kursy.new()
  			kursy.dodajKurs(nil,'2.80','2.720','EUR')
  			portfel = Portfel.new()
			portfel.dodajDoPortfela('EUR', '10', kursy)
  			expect { portfel.sprawdzWalutePortfel('EUR') }.not_to raise_error
  			expect(portfel.sprawdzWalutePortfel('EUR')).to eq(1)
  			expect(portfel.sprawdzWalutePortfel('EURO')).to eq(0)
  		end

  		it 'Otrzymanie ilosci waluty' do 
			kursy = Kursy.new()
  			kursy.dodajKurs(nil,'2.80','2.720','EUR')
  			portfel = Portfel.new()
			portfel.dodajDoPortfela('EUR', '10', kursy)
			expect { portfel.zwrocIloscWaluty('EUR') }.not_to raise_error
			expect(portfel.zwrocIloscWaluty('EUR')).to eq('10.0')
			expect(portfel.zwrocIloscWaluty('EURO')).to eq(0)
  		end

  		it 'Otrzymanie wartosci kapitalu' do
  			kursy = Kursy.new()
  			kursy.dodajKurs(nil,'2.80','2.720','EUR')
  			kursy.dodajKurs(nil,'1.0','1.0','PLN')
  			portfel = Portfel.new()
			portfel.dodajDoPortfela('EUR', '10', kursy)
			portfel.dodajDoPortfela('PLN', '22', kursy)
			expect { portfel.obliczKapital(kursy) }.not_to raise_error
			expect(portfel.obliczKapital(kursy)).to eq('50.0')
  		end

		it 'Pobranie waluty z portfela' do
			kursy = Kursy.new()
			kursy.dodajKurs(nil,'2.80','2.720','EUR')
			portfel = Portfel.new()
			portfel.dodajDoPortfela('EUR', '10', kursy)
			#portfel.pobierzZPortfela('EUR','8')
			puts('' + portfel.zwrocIloscWaluty('EUR')).to_s
			#expect { portfel.pobierzZPortfela('EUR','10') }.not_to raise_error
     		expect(portfel.pobierzZPortfela('EUR','8')).to eq(1)
			expect(portfel.pobierzZPortfela('EUR','13')).to eq(0)
		end

	end
end