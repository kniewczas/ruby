
require 'simplecov'
SimpleCov.start

require_relative '../lib/algorytmy.rb'

RSpec.describe 'algorytmy.rb' do
	describe '#stackSort' do 

		it 'No error' do
			expect { stackSort([4,3,25,25,53])}.not_to raise_error
		end

		it 'Sorted list' do
			expect { stackSort([5,7,81,32,5]).to eq([5,5,7,32,81])}
			expect { stackSort([5,-7,81,32,-5]).to eq([-5,-7,5,32,81])}
		end

		it 'Dealing with the same elements'	do
			expect { stackSort([4,4,4,4]).to eq([4,4,4,4])}
		end

		it 'Already sorted array' do
			expect { stackSort([1,2,3,4,5,6,7]).to eq([1,2,3,4,5,6,7])}
		end

		it 'Small array' do
			expect { stackSort([2,1]).to eq([1,2])}
			expect { stackSort([3,4,0]).to eq([0,3,4])}
		end

	end

	describe '#bubbleSort' do 

		it 'No error' do
			expect { bubbleSort([4,3,25,25,53])}.not_to raise_error
		end

		it 'Sorted list' do
			expect { bubbleSort([5,7,81,32,5]).to eq([5,5,7,32,81])}
			expect { bubbleSort([5,-7,81,32,-5]).to eq([-5,-7,5,32,81])}
		end

		it 'Dealing with the same elements'	do
			expect { bubbleSort([4,4,4,4]).to eq([4,4,4,4])}
		end

		it 'Already sorted array' do
			expect { bubbleSort([1,2,3,4,5,6,7]).to eq([1,2,3,4,5,6,7])}
		end

		it 'Small array' do
			expect { bubbleSort([2,1]).to eq([1,2])}
			expect { bubbleSort([3,4,0]).to eq([0,3,4])}
		end

	end

	describe '#shakeSort' do 

		it 'No error' do
			expect { shakeSort([4,3,25,25,53])}.not_to raise_error
		end

		it 'No error' do
			expect { shakeSort([4,3,25,25,53])}.not_to raise_error
		end

		it 'Sorted list' do
			expect { shakeSort([5,7,81,32,5]).to eq([5,5,7,32,81])}
			expect { shakeSort([5,-7,81,32,-5]).to eq([-5,-7,5,32,81])}
		end

		it 'Dealing with the same elements'	do
			expect { shakeSort([4,4,4,4]).to eq([4,4,4,4])}
		end

		it 'Already sorted array' do
			expect { shakeSort([1,2,3,4,5,6,7]).to eq([1,2,3,4,5,6,7])}
		end

		it 'Small array' do
			expect { shakeSort([2,1]).to eq([1,2])}
			expect { shakeSort([3,4,0]).to eq([0,3,4])}
		end
	end
end
