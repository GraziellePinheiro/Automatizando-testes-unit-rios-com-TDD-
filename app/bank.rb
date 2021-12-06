
class Conta
  attr_accessor :saldo, :msg

  def initialize(saldo)
    self.saldo = saldo
  end

  def saca(valor, max, taxa)
    if (valor > saldo)
      self.msg = "Saldo insuficiente para saque :("
    elsif (valor > max)
      self.msg = "Limite máximo por saque é de R$ " + max.to_s
    else
     self.saldo -= valor + taxa
    end
  end
end

class ContaCorrente < Conta
  def saca(valor, max = 700, taxa = 5.00)
    super
  end
end


class ContaPoupanca < Conta 
  def saca(valor, max = 500, taxa = 2.00)
    super
  end
end
