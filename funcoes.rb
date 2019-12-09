def  bits_de_dados_para_cada_de_verificacao(mensagem, posicao_bits_de_dados, posicao_bits_de_verificacao, bits_de_verificacao,  bits_de_verificacao_valor)
  posicao_bits_de_dados.each do |bit_dados_posicao|
    bit_dados_posicao_aux = bit_dados_posicao
    posicao_bits_de_verificacao.each do |bit_verificacao_posicao|
      if bit_dados_posicao_aux - bit_verificacao_posicao >= 0
        bits_de_verificacao["v#{bit_verificacao_posicao}"].append(bit_dados_posicao)
        bits_de_verificacao_valor["v#{bit_verificacao_posicao}"].append(mensagem[bit_dados_posicao - 1].to_i)
        bit_dados_posicao_aux -= bit_verificacao_posicao
      end

      break if bit_dados_posicao_aux.zero?
    end
  end
  bits_de_verificacao
end

def valor_bits_verificacao(mensagem, bits_de_verificacao_valor, paridade)
  bits_de_verificacao_valor.keys.each do |key|
    if paridade == 'par'
      soma = bits_de_verificacao_valor[key].sum
      p soma
      if soma.even?
        mensagem[mensagem.index(key.to_s)] = '0'
      else
        mensagem[mensagem.index(key.to_s)] = '1'
      end
    else
      soma = bits_de_verificacao_valor[key].sum
      if soma.even?
        mensagem[mensagem.index(key.to_s)] = '1'
      else
        mensagem[mensagem.index(key.to_s)] = '0'
      end
    end
  end
end