from django.shortcuts import render
from django.http import JsonResponse, HttpResponse
from django.views.decorators.csrf import csrf_protect
from django.utils.datastructures import MultiValueDictKeyError

from .models import Pessoa, Transacoes, Conta

from datetime import datetime

# Data
from data.views import deauth_inative_users

# SERVER_RESPONSE_OK           = 200
# SERVER_RESPONSE_MOVED        = 301
# SERVER_RESPONSE_UNAUTHORIZED = 401
# SERVER_RESPONSE_NOT_FOUND    = 404
# SERVER_INTERNAL_SERVER_ERROR = 500

INDICE_LIMITE_SAQUE_DIARIO = 0.15

response_model = {'status_code':0,
                  'messages':[],
                  'token_timeout':-1,
                  'response':{}}


def check_request(func):
    def wrap():
        deauth_inative_users(func.request) # TODO: get user id by request
        func()
    return wrap()

@check_request
def pessoa_create(request, id=None):

    if request.method == 'GET':
        try:
            r = response_model.copy()

            nome            = request.GET['nome']
            cpf             = request.GET['cpf']
            data_nascimento = request.GET['dataNascimento']
            renda           = request.GET['renda']

            p = Pessoa(nome=nome, cpf=cpf, dataNascimento=data_nascimento,renda=renda)
            p.save()

            r['status_code'] = 200

        except Exception as e:
            r['status_code'] = 500
            r['messages'].append(type(e))
        finally:
            return JsonResponse(r)
    return JsonResponse({})

def conta_create(request, id=None):
    if request.method == 'GET':
        try:
            r = response_model.copy()

            p = Pessoa.objects.get(pk=id)

            # saldo
            # limiteSaqueDiario
            # flagAtivo
            # tipoConta
            # dataCriacao
            # idPessoa

            saldo               = 0
            limiteSaqueDiario   = INDICE_LIMITE_SAQUE_DIARIO * float(p.renda)
            flagAtivo           = True
            tipoConta           = 1
            dataCriacao         = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

            c = Conta(saldo=saldo,
                        limiteSaqueDiario=limiteSaqueDiario,
                        flagAtivo=flagAtivo,
                        tipoConta=tipoConta,
                        dataCriacao=dataCriacao,
                        idPessoa=p)
            c.save()

            r['status_code'] = 200

        except Exception as e:
            r['status_code'] = 500
            r['messages'].append(type(e))
            if type(e) == ValueError:
                return JsonResponse(r)
        finally:
            return JsonResponse(r)
    return JsonResponse({})

@check_request
def deposito(request, id=None):
    if request.method == 'GET':
        valor_deposito = int(request.GET['v'])
        simbolo_moeda  = request.GET['s']
        
        if valor_deposito >= 1:
            try:
                r = response_model.copy()

                data_transacao = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                t = Transacoes(valor_deposito, data_transacao, simbolo_moeda, id)
                t.save()

                c = Conta.objects.get(pk=id)
                Conta.objects.filter(pk=id).update(saldo=c.saldo + valor_deposito)

                r['status_code'] = 200

            except Exception as e:
                r['status_code'] = 500
                r['messages'].append(type(e))
            finally:
                return JsonResponse(r)
    return JsonResponse({})

@check_request
def info_saldo(request, id=None):
    if request.method == 'GET':
        
        try:
            r = response_model.copy()
            c = Conta.objects.get(pk=id)
            r['response']['saldo'] = c.saldo
        except Exception as e:
                r['status_code'] = 500
                r['messages'].append(type(e))
        finally:
            return JsonResponse(r)

    return JsonResponse({})

@check_request
def saque(request, id=None):
    if request.method == 'GET':
        valor_saque = float(request.GET['v'])
        simbolo_moeda = request.GET['s']
        
        c = Conta.objects.get(pk=id)
        limite_saque = float(c.limiteSaqueDiario)
        
        if valor_saque <= limite_saque and valor_saque >= 1:
            try:
                r = response_model.copy()

                data_transacao = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                t = Transacoes( valor=valor_saque,
                                dataTransacao=data_transacao,
                                simbolo_moeda=simbolo_moeda,
                                idConta=c)
                t.save()

                novo_saldo = float(c.saldo) - valor_saque
                Conta.objects.filter(pk=id).update(saldo=novo_saldo)

                r['status_code'] = 200

            except Exception as e:
                r['status_code'] = 500
                r['messages'].append(type(e))
            finally:
                return JsonResponse(r)
    return JsonResponse({})

@check_request
def block(request, id=None):
    try:
        r = response_model.copy()
        Conta.objects.filter(pk=id).update(flagAtivo=False)
        r['status_code'] = 200
    except Exception as e:
        r['status_code'] = 500
        r['messages'].append(type(e))
    finally:
        return JsonResponse(r)
    return JsonResponse({})

@check_request
def unblock(request, id=None):
    try:
        r = response_model.copy()
        Conta.objects.filter(pk=id).update(flagAtivo=True)
        r['status_code'] = 200
    except Exception as e:
        r['status_code'] = 500
        r['messages'].append(type(e))
    finally:
        return JsonResponse(r)
    return JsonResponse({})

# Tuesday, 1 January 2019 16:25:24
# 1546359924
#
# Tuesday, 31 December 2019 16:26:14
# 1577809574
@check_request
def extrato(request, id=None):
    if request.method == 'GET':
        r = response_model.copy()
        try:

            if(len(request.GET) == 2):
                begin_date = int(request.GET['begin'])
                end_date = int(request.GET['end'])
                begin_date = datetime.fromtimestamp(begin_date).strftime("%Y-%m-%d %H:%M:%S")
                end_date = datetime.fromtimestamp(end_date).strftime("%Y-%m-%d %H:%M:%S")
                
                transacoes = Transacoes.objects.filter( idConta=id,
                    dataTransacao__range=[begin_date, end_date]).values('valor',
                                                                        'dataTransacao',
                                                                        'simbolo_moeda').order_by('dataTransacao')
            else:
                transacoes = Transacoes.objects.filter(idConta=id).values('valor', 'dataTransacao', 'simbolo_moeda')
            
            r['response']['extrato'] = list(transacoes)
        except Exception as e:
                r['status_code'] = 500
                r['messages'].append(type(e))
        finally:
            return JsonResponse(r)
    return JsonResponse({})


def index(request):
    return JsonResponse({'api':'online'})


# Modelo escopo função genérica
# def function(request, id=None):
#     if request.method == 'GET':
#         r = response_model.copy()
#         try:
#             pass
#         except Exception as e:
#                 r['status_code'] = 405
#                 r['messages'].append(type(e))
#         finally:
#             return JsonResponse(r)
#     return JsonResponse({})
