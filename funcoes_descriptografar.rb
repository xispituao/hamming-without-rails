# frozen_string_literal: true

def multiplo_de_dois?(numero)
  numero.to_s(2).count('1') == 1
end

def posicoes_dos_bits_de_verificacao_function(mensagem, posicoes_dos_bits_de_verificacao, posicoes_dos_bits_de_verificacao_com_soma,  posicoes_dos_bits_de_dado)
  mensagem.each_with_index do |bit, index|
    posicoes_dos_bits_de_verificacao.append(index.to_i + 1) if multiplo_de_dois?(index + 1)
    posicoes_dos_bits_de_verificacao_com_soma[(index + 1).to_s] = 0 if multiplo_de_dois?(index + 1)
    posicoes_dos_bits_de_dado.append(index.to_i + 1) unless multiplo_de_dois?(index + 1)
  end
end

def soma_dos_bits_de_dados_para_cada_de_verificacao(mensagem, posicoes_dos_bits_de_verificacao,  posicoes_dos_bits_de_verificacao_com_soma,  posicoes_dos_bits_de_dado)
  posicoes_dos_bits_de_dado.each do |posicao_bit_dado|
    aux = posicao_bit_dado
    posicoes_dos_bits_de_verificacao.reverse.each do |posicao_bit_verificacao|
      if aux - posicao_bit_verificacao >= 0
        aux -= posicao_bit_verificacao
        posicoes_dos_bits_de_verificacao_com_soma[posicao_bit_verificacao.to_s] += mensagem[posicao_bit_dado - 1].to_i
      end

      break if aux.zero?
    end
  end
end
