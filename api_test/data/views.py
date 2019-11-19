from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render
from django.http import JsonResponse

from .models import Token, User

from uuid import uuid4


DEFAULT_TIMEOUT_SESSION = 60 * 2
 
response_model = {'status_code':0,
                  'messages':[],
                  'token_timeout':-1,
                  'response':{}}

@csrf_exempt
def login(request, token=None):
    """
    Pega a autenticação de usuário, senha e token. É esperado do front-um cadastro de pessoas que queiram
        utilizar a api. Assim que cadastrado e validado, o cliente recebe um token de acesso
        que será usado para login.
    Após checar no banco se o token já existe e se pertence ao usuário e senha criado, criam-se duas
        hashes responsáveis pela conexão client/server da api, que é verificada a nova requisição.
        Pode-se assim ocorrer a desautenticação de qualquer cliente no meio da conexão
    É importante ressaltar que essa verificação de token e autenticação é feita em um banco de dados separado
        do resto dos dados da aplicação principal (de usuários, e contas).
    A cada novo login um novo cookie é gerado
    """
    if request.method == 'POST':
            try:
                r = response_model.copy()

                user        = request.GET['user']
                password    = request.GET['pwd']
                token       = request.GET['token']

                token_validation = check_token(token)

                if not token_validation:
                    r['messages'].append('Not valid token')
                    raise Exception
                
                auth_cred   = generate_token()
                auth_cookie = generate_cookie()

                r['response']['acess_cookie'] = auth_cookie

                t_obj = Token(token=auth_cred, cookie=auth_cookie, time_remaining=DEFAULT_TIMEOUT_SESSION)
                t_obj.save()

                r['status_code'] = 200

            except Exception as e:
                r['status_code'] = 500
                r['messages'].append(type(e))
            finally:
                return JsonResponse(r)
        
        return JsonResponse({})


# def deauth_inative_users(request, id=None):
def deauth_inative_users(id=None):
    """
    A cada nvoa requisição feita pela aplicação api, verifica-se se o usuário informado está ativo.
    Caso esteja com irregularidades ou com timeout zerado, seu cookie de autenticação é removido
        do banco de dados, fazendo com que o cliente tenha que se autenticar de novo
    """
    if request.method == 'GET':

        try:
            r = response_model.copy()

            ut = Token.objects.all(time_reamining=id)
            if ut <= 0:
                Token.objects.filter(pk=id).update(communic_token='')
                Token.objects.filter(pk=id).update(cookie='')
                Token.objects.filter(pk=id).update(time_remaining=int(-1))
            
            r['status_code'] = 200
            r['messages'].append('Unauthorized user')

        except Exception as e:
            r['status_code'] = 500
            r['messages'].append(type(e))
        finally:
            return JsonResponse(r)


def generate_token():
    token_list = []
    for _ in range(3):
        token = uuid4().urn.split(':')[-1].replace('-','')
        token_list.append(token)
    token_final = "".join(token_list)    
    return token_final

def generate_cookie():
    cookie_list = []
    for _ in range(1):
        token = uuid4().urn.split(':')[-1].replace('-','')
        cookie_list.append(token)
    cookie_final = "".join(cookie_list)    
    return cookie_final

def check_token(tk):
    ut = User.objects.all(userToken=tk)
    if len(ut) == 0:
        return false
    return True

