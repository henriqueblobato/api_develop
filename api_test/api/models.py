
# # Pessoa Tipo
# idPessoa Numérico
# nome Texto
# cpf Texto
# dataNascimento Data

# # Conta Tipo
# idConta Numérico
# idPessoa Numérico
# saldo Monetário (131.999.999.999)
# limiteSaqueDiario	Monetário
# flagAtivo	Condicional
# tipoConta	Numérido
# dataCriacao Data

# # Transacoes Tipo
# idTransacao Numérico
# idConta Numérico
# valor	Monetário
# dataTransacao Data

from django.db import models
from django.conf import settings
from django.db.models import BooleanField
from django.db.models import CharField
from django.db.models import DateField
from django.db.models import DateTimeField
from django.db.models import DecimalField
from django.db.models import PositiveSmallIntegerField
from django.db.models import TextField

class Pessoa(models.Model):

    nome           = models.TextField(max_length=100)
    cpf            = models.CharField(max_length=11)
    # lastDevice     = models.CharField(max_length=100)
    dataNascimento = models.DateField()
    renda          = models.DecimalField(max_digits=10, decimal_places=2)

class Conta(models.Model):

    saldo               = models.DecimalField(max_digits=12, decimal_places=2)
    limiteSaqueDiario   = models.DecimalField(max_digits=10, decimal_places=2)
    flagAtivo           = models.BooleanField()
    tipoConta           = models.PositiveSmallIntegerField()
    dataCriacao         = models.DateTimeField()

    idPessoa            = models.ForeignKey('api.Pessoa',
                                            on_delete=models.CASCADE,
                                            related_name="contas",)


class Transacoes(models.Model):

    valor           = models.DecimalField(max_digits=10, decimal_places=2)
    dataTransacao   = models.DateTimeField(auto_now=True)
    simbolo_moeda   = models.CharField(max_length=3)

    idConta = models.ForeignKey('api.Conta',
                                 on_delete=models.CASCADE,
                                 related_name="transacoes",)

    # idContaOrigem   = models.ForeignKey('api.Conta',
    #                                     on_delete=models.CASCADE,
    #                                     related_name="transacoes_orig", )
    
    # idContaDestino  = models.ForeignKey('api.Conta',
    #                                     on_delete=models.CASCADE,
    #                                     related_name="transacoes_dest",)
