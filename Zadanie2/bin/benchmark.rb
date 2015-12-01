require 'benchmark'
require_relative '../lib/algorytmy.rb'

array_a = (1..500).map {rand}
array_b = (1..1000).map {rand}
array_c = (1..5000).map {rand}

Benchmark.bm(10) do |x|
  x.report('[stack sort] 500 elements:  ') {stackSort(array_a)}
  x.report('[stack sort] 1000 elements: ') {stackSort(array_b)}
  x.report('[stack sort] 5000 elements: ') {stackSort(array_c)}

  x.report('[bubble sort] 500 elements: ') {bubbleSort(array_a)}
  x.report('[bubble sort] 1000 elements:') {bubbleSort(array_b)}
  x.report('[bubble sort] 5000 elements:') {bubbleSort(array_c)}

  x.report('[shake sort] 500 elements:  ') {shakeSort(array_a)}
  x.report('[shake sort] 1000 elements: ') {shakeSort(array_b)}
  x.report('[shake sort] 5000 elements: ') {shakeSort(array_c)}
  end
