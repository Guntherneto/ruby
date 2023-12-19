def da_boas_vindas
  puts 'Bem-vindo ao jogo da adivinhação'
  puts 'Qual é o seu nome?'
  nome = gets.strip
  puts "\n" * 6
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def pede_dificuldade
  puts 'Qual o nível de dificuldade que deseja? (1 fácil, 5 difícil)'
  gets.to_i
end

def sorteia_numero_secreto(dificuldade)
  maximo = case dificuldade
           when 1 then 30
           when 2 then 60
           when 3 then 100
           when 4 then 150
           else 200
           end

  puts "Escolhendo um número secreto entre 1 e #{maximo}..."
  rand(maximo) + 1
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
  puts "\n" * 4
  puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
  puts "Chutes até agora: #{chutes.join(', ')}"
  puts 'Entre com o número'
  gets.strip.to_i
end

def verifica_se_acertou(numero_secreto, chute)
  if numero_secreto == chute
    puts 'Acertou!'
    true
  else
    maior = numero_secreto > chute
    puts maior ? 'O número secreto é maior!' : 'O número secreto é menor!'
    false
  end
end

def joga(_nome, dificuldade)
  numero_secreto = sorteia_numero_secreto(dificuldade)
  pontos_ate_agora = 1000
  limite_de_tentativas = 5
  chutes = []

  (1..limite_de_tentativas).each do |tentativa|
    chute = pede_um_numero(chutes, tentativa, limite_de_tentativas)
    chutes << chute

    pontos_a_perder = (chute - numero_secreto).abs / 2.0
    pontos_ate_agora -= pontos_a_perder

    break if verifica_se_acertou(numero_secreto, chute)
  end

  puts "Você ganhou #{pontos_ate_agora} pontos."
end

def quer_jogar
  puts 'Deseja jogar novamente? (S/N)'
  quero_jogar = gets.strip
  quero_jogar.upcase == 'S'
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
  joga(nome, dificuldade)
  break unless quer_jogar
end
