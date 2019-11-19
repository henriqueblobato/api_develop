from django.db import models
from django.db.models import TextField


from django.contrib.auth.hashers import (
    PBKDF2PasswordHasher, SHA1PasswordHasher,
)

class Token(models.Model):
    """
    Armazenam-se aqui as duas chaves de comunicação para a conversa com a api. Foram geradas depois da validação do token
    """
    communic_token  = models.TextField(max_length=100)
    cookie          = models.TextField(max_length=50)
    time_remaining  = models.PositiveSmallIntegerField()

class User(models.Model):
    """
    Armazenam-se aqui os dados de usuário com seu respectivo token de acesso.
    Espera-se que o usuário receba um token de acesso após o cadastro no site, podendo assim, fazer sua autenticação na api
    """
    username        = models.TextField(max_length=100)
    password        = models.TextField(max_length=100)
    userToken       = models.TextField(max_length=100)

    def encode(self, password, salt, iterations=None):
        _, _, sha1_hash = SHA1PasswordHasher().encode(password, salt).split('$', 2)
        return self.encode_sha1_hash(sha1_hash, salt, iterations)
