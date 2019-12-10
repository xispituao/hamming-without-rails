# frozen_string_literal: true

require_relative 'funcoes_criptografar.rb'

p 'Digite a sequência de bits que representa a mensagem'
mensagem_original = gets.chomp
mensagem = mensagem_original.split('')
p 'Digite a paridade'
paridade = gets.chomp
caracteres_irregulares = mensagem.select { |caractere| caractere != '1' && caractere != '0'}

loop do
  break if caracteres_irregulares.nil? || caracteres_irregulares.empty?

  p 'Únicos caracteres que podem ser inputados na mensagem são 0 e 1!'
  p 'Digite a sequência de bits que representa a mensagem'
  mensagem_original = gets.chomp
  mensagem = mensagem_original.split('')
  caracteres_irregulares = mensagem.select { |caractere| caractere != '1' && caractere != '0'}
end

loop do
  break if paridade.include?('par') || paridade.include?('ímpar')

  p 'Paridade só pode ser ou par ou ímpar!'
  p 'Digite a paridade'
  paridade = gets.chomp
end


# parte da criacao dos bits de paridade
bits_de_verificacao = {}
bits_de_verificacao_valor = {}
inicializar_arrays_de_posicoes(mensagem, bits_de_verificacao, bits_de_verificacao_valor)

# declarar o array que vai ter as posicoes dos bit de dados
posicao_bits_de_dados = []
posicao_bits_de_verificacao = []
# armazenar as posicoes dos bits de dados e de verificacao
mensagem.each_with_index do |bit, index|
  posicao_bits_de_verificacao.insert(0, index + 1) if bit.include?('v')
  posicao_bits_de_dados.append(index + 1) unless bit.include?('v')
end

# preenche a lista debits de verificacao com seus devidos bits de dados
bits_de_dados_para_cada_de_verificacao(mensagem, posicao_bits_de_dados, posicao_bits_de_verificacao, bits_de_verificacao,  bits_de_verificacao_valor)

valor_bits_verificacao(mensagem, bits_de_verificacao_valor, paridade)


bits_de_verificacao = hash_in_string(bits_de_verificacao)
bits_de_verificacao_valor = hash_in_string(bits_de_verificacao_valor)

p "Mensagem original: #{mensagem_original}"
p "Paridade: #{paridade}"
p "Posição dos bits de verificação: #{posicao_bits_de_verificacao.reverse.join(', ')}"
p "Posição dos bits de dados: #{posicao_bits_de_dados.join(', ')}"
p "Bits de verificação com seus devidos bits de dados: #{bits_de_verificacao}"
p "Bits de verificação com o valor de seus devidos bits de dados: #{bits_de_verificacao_valor}"
p "Mensagem criptografada a ser enviada: #{mensagem.join('')}"
