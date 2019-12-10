# frozen_string_literal: true

require_relative 'funcoes_descriptografar.rb'

p 'Digite a sequência de bits que representa a mensagem'
mensagem = gets.chomp.split('')
p 'Digite a paridade'
paridade = gets.chomp

caracteres_irregulares = mensagem.select { |caractere| caractere != '1' && caractere != '0'}

if caracteres_irregulares.nil? || caracteres_irregulares.empty?
  posicoes_dos_bits_de_verificacao = []
  posicoes_dos_bits_de_verificacao_com_soma = {}
  posicoes_dos_bits_de_dado = []

  posicoes_dos_bits_de_verificacao_function(mensagem,  posicoes_dos_bits_de_verificacao, posicoes_dos_bits_de_verificacao_com_soma,  posicoes_dos_bits_de_dado)
  soma_dos_bits_de_dados_para_cada_de_verificacao(mensagem, posicoes_dos_bits_de_verificacao,  posicoes_dos_bits_de_verificacao_com_soma,  posicoes_dos_bits_de_dado)
else
  p 'Únicos caracteres que podem ser inputados são 0 e 1!'
end

p posicoes_dos_bits_de_verificacao
p posicoes_dos_bits_de_verificacao_com_soma
p posicoes_dos_bits_de_dado