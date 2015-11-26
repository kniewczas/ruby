def stackSort(array)

	if array.empty?
		return 
	end

	stackL = Array.new(array.length + 2)
	stackP = Array.new(array.length + 2)
	stackLPeak = 1
	stackPPeak = 1

	stackL[0] = -2147
	stackP[0] = 21474

	for i in 0..(array.length-1)

		while stackL[stackLPeak-1] > array[i] do
			stackLPeak = stackLPeak - 1	
			stackP[stackPPeak] = stackL[stackLPeak]		
			stackPPeak = stackPPeak + 1	
		end

		while stackP[stackPPeak-1] < array[i] do
			stackPPeak = stackPPeak - 1
			stackL[stackLPeak] = stackP[stackPPeak]	
			stackLPeak = stackLPeak + 1
		end
		stackL[stackLPeak] = array[i]
		stackLPeak = stackLPeak + 1
	end

	while stackLPeak > 0 do
		stackLPeak = stackLPeak - 1
		stackP[stackPPeak] = stackL[stackLPeak]
		stackPPeak = stackPPeak + 1
	end

	stackPPeak = stackPPeak - 1

	stackP.delete_at(0)	
	stackP.delete_at(stackP.length-1)
	return stackP
end

def shakeSort(array)
	bottom = 0
	top = array.length - 1
	replace = true

	while replace do 
		replace = false

		for i in (bottom)..(top-1)
			if array[i] > array[i+1]
			array[i], array[i+1] = array[i+1], array[i]
			replace = true
			end	
		end
		
		top = top - 1

		for i in top.downto(bottom+1)
			if array[i] < array[i-1]
			array[i], array[i-1] = array[i-1], array[i]
			replace = true	
			end
		end

		bottom = bottom + 1
	end
	return array
end

def bubbleSort(array)
	if array.empty?
		return raise "Array can't be empty"
	end
change = false

until change
   	change = true
	
	for i in 0..(array.length-2)
	 	if array[i] > array[i+1]
		change = false
		array[i], array[i+1] = array[i+1], array[i]
		end
  	end
end
return array
end
