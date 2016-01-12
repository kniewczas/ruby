require 'simplecov'
require 'RSpec'
SimpleCov.start

require_relative '../lib/kantor.rb'

RSpec.describe 'kantor.rb' do
	describe 'Kursy' do 
		
		it 'No error' do
		kurs = Kursy.new()
		end

		it ' ' do 
		kurs.dodajKurs(nil,'2.80','2.720','EUR')
		end

		it ' ' do 
		expected { kurs.zwrocSprzedaz('EUR').to_eq('2.80')}
		end

		it ' ' do
		expected { kurs.zwrocKupno('EUR').to_eq('2.720')}
		end

		id ' ' do  
		expected { kurs.pokazKursy()}.not_to raise_error
		end

	describe 'Portfel' do 
		it ' ' do
		portfel = Portfel.new()
		end

		it ' ' do
		portfel.dodajKurs(nil,'2.80','2.720','EUR')
		end

		it ' ' do 
		expected { portfel.dodajDoPortfela('PLN','344').not_to raise_error }
		end
		end
	end
