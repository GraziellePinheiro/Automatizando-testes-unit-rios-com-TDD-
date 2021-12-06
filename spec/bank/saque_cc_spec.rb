require_relative "../../app/bank"

describe ContaCorrente do 
    describe "Saque" do
        context " saldo positivo." do
            before(:all) do
                @cc = ContaCorrente.new(1000.00)
                @cc.saca(200.00)
            end

            it " saldo atualizado." do
                expect(@cc.saldo).to eql(795.00)
            end

        end

        context " saldo é negativo." do
            before(:all) do
                @cc = ContaCorrente.new(0.00)
                @cc.saca(100.00)
            end

            it " então exibe mensagem:" do
                expect(@cc.msg).to eql "Saldo insuficiente para saque :("
            end

            it " e o saldo permanece." do
                expect(@cc.saldo).to eql(0.00)
            end

        end

        context " saldo insuficiente." do
            before(:all) do
                @cc = ContaCorrente.new(500.00)
                @cc.saca(501.00)
            end

            it " então exibe mensagem: " do
                expect(@cc.msg).to eql "Saldo insuficiente para saque :("
            end

            it " e o saldo permanece." do
                expect(@cc.saldo).to eql(500.00)
            end

        end

        context " quando supera o limite de saque." do
            before(:all) do
                @cc = ContaCorrente.new(1000.00)
                @cc.saca(701.00)
            end

            it " então exibe mensagem:" do
                expect(@cc.msg).to eql "Limite máximo por saque é de R$ 700"
            end

            it " e o saldo permanece." do
                
                expect(@cc.saldo).to eql(1000.00)
            end
        end
    end
end
