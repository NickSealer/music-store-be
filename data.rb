str = "3 + 2 * 2"
str2 = "3/2"

def calc(str)
  res = str.split(' ').join('')
  # mult = res.include?('*')
  # suma = res.include?('+')
  # resta = res.include?('-')
  # div = res.include?('/')

  # res.split('').each_with_index do |e, i|
  #   puts e.to_s + i.to_s
  # end

  cont = 0
  result = 0

  (res.size + 1).times do |i|
    result = multi(res[cont].to_i, res[cont + 2].to_i) if res[cont - 1] == '*'
    result = div(res[cont].to_i, res[cont + 2].to_i) if res[cont - 1] == '/'
    result = sum(res[cont].to_i, res[cont + 2].to_i) if res[cont - 1] == '+'
    result = resta(res[cont].to_i, res[cont + 2].to_i) if res[cont - 1] == '-'
    cont += 2
  end

  puts result
end

def sum(a, b)
  a + b
end

def multi(a, b)
  a * b
end

def resta(a, b)
  a - b
end

def div(a, b)
  a / b
end

calc(str2)
