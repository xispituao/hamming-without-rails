# frozen_string_literal: true

require_relative 'funcoes_descriptografar.rb'

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

posicoes_dos_bits_de_verificacao = []
posicoes_dos_bits_de_verificacao_com_soma = {}
posicoes_dos_bits_de_dado = []

posicoes_dos_bits_de_verificacao_function(mensagem,  posicoes_dos_bits_de_verificacao, posicoes_dos_bits_de_verificacao_com_soma,  posicoes_dos_bits_de_dado)
soma_dos_bits_de_dados_para_cada_de_verificacao(mensagem, posicoes_dos_bits_de_verificacao,  posicoes_dos_bits_de_verificacao_com_soma,  posicoes_dos_bits_de_dado)
bit_de_verificacao_com_erro = bits_error(mensagem, posicoes_dos_bits_de_verificacao_com_soma, paridade)

p "Mensagem original: #{mensagem_original}"
p "Posição dos bits de verificação: #{posicoes_dos_bits_de_verificacao.join(', ')}"
p "Posições dos bits de verificações com a soma de deus devidos bits de dados: #{hash_in_string(posicoes_dos_bits_de_verificacao_com_soma)}"
p "Posição dos bits de dados: #{posicoes_dos_bits_de_dado.join(', ')}"

if bit_de_verificacao_com_erro.empty?
  p 'Não foi encontrado erro.'
else
  p "Bits de verificação com erro: #{bit_de_verificacao_com_erro.join(', ')}"
  if bit_de_verificacao_com_erro.sum > mensagem.length + 1
    p "O bit acusado de erro foi o #{bit_de_verificacao_com_erro.sum}, porém esse índice não existe na mensagem indicando que há mais de um erro na mensagem."
  else
    p "O bit com erro foi o #{bit_de_verificacao_com_erro.sum}"
  end
end
