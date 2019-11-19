
from django.contrib import admin
from django.urls import path

from api import views as api_views
from data import views as data_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', api_views.index),
]

# Pessoa
urlpatterns += (
    path('v1/pessoa/create/', api_views.pessoa_create, name='v1_pessoa_create'),
)

# Conta
urlpatterns += (
    path('v1/conta/create/<int:id>', api_views.conta_create, name='v1_conta_create'),
    path('v1/conta/info_saldo/<int:id>/', api_views.info_saldo, name='v1_conta_info_saldo'),
    path('v1/conta/block/<int:id>/', api_views.block, name='v1_conta_block'),
    path('v1/conta/unblock/<int:id>/', api_views.unblock, name='v1_conta_unblock'),
)

# Transacoes
urlpatterns += (
    path('v1/transacoes/deposito/<int:id>/', api_views.deposito, name='v1_transacoes_deposito'),
    path('v1/transacoes/saque/<int:id>/', api_views.saque, name='v1_transacoes_saque'),
    path('v1/transacoes/extrato/<int:id>/', api_views.extrato, name='v1_transacoes_extrato'),
)

# Data
urlpatterns += (
    path('v1/data/login/', data_views.login, name='v1_data_login'),
)
