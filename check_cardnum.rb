require 'sinatra'

get '/check_cardnum/:num' do |n|
 
  def luhnCheckSum(a)
	odds =  a.reverse.values_at(* a.each_index.select {|i| i.even?})
	even =   a.reverse.values_at(* a.each_index.select {|i| i.odd?})
	checksum = 0
	checksum = odds.inject(0) {|sum, i|  sum + i }
	even.map!{|d| checksum += (d*2).to_s.split('').map(&:to_i).inject(0) {|sum,f| sum +f}}
	return checksum % 10
	end

def isLuhnValid(a)
	return luhnCheckSum(a) == 0
end 

array = n.to_s.split(//).map(&:to_i)
"This Credit Card has #{isLuhnValid(array)} check digit!"

end