 # -*- coding: utf-8 -*-
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from django.http import HttpResponse, HttpResponseRedirect
from django.utils import simplejson
from datetime import datetime, timedelta
from apps.projeto.models import Projeto
from apps.conta.models import *

meses = [ 'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 
          'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro' 
]

def projeto(request):
    projetos = Projeto.objects.order_by('data_inicio');
    
    ano = [{'mes': meses[i], 'projetos': []} for i in xrange(12)]
    for projeto in projetos:
        ano[projeto.data_inicio.month - 1]['projetos'].append(projeto)

    agrupado = [ano[i:i+4] for i in xrange(0, 12, 4)]
    anos = range(2011, 2017)

    return render_to_response('PageProjetos.html', {
        'server_data': agrupado, 
        'anos': anos }, 
        context_instance=RequestContext(request)
    );

def cadatro_projeto_ajax(request):    
    if request.method == 'POST':
        nome = request.POST.get('nome_projeto', '')
        valor = float(request.POST.get('valor_projeto', 0.0))
        data_inicio = request.POST.get('data_inicio_projeto')
        data_termino = request.POST.get('data_termino_projeto')
        resp = request.POST.get('responsavel_projeto', '')
        desc = request.POST.get('descricao_projeto', '')
        
        data_termino = datetime.strptime(data_termino, '%d/%m/%Y')
        data_inicio = datetime.strptime(data_inicio, '%d/%m/%Y')
        
        projeto = Projeto(nome=nome, valor=valor, descricao=desc, responsavel=resp)
        projeto.data_inicio = data_inicio
        projeto.data_fim = data_termino
        projeto.save()

        conta_saida = Conta(tipo=1)
        conta_saida.nome = 'Projeto: ' + nome + ' (Conta Saida)'
        conta_saida.data = datetime.strptime(request.POST['data_saida'], '%d/%m/%Y')
        conta_saida.valor_total = float(request.POST['valor_saida'])
        conta_saida.parcelas = int(request.POST['parcelas_conta_saida'])
        conta_saida.livro = int(request.POST['tipo_saida'])
        conta_saida.descricao = request.POST['descricao_saida']
        conta_saida.save()

        for i in xrange(conta_saida.parcelas):
            transacao = Transacao(conta=conta_saida)
            transacao.nome = conta_saida.nome + ': Parcela %s' % i
            transacao.valor = conta_saida.valor_total/conta_saida.parcelas
            transacao.data_vencimento = conta_saida.data + timedelta(i*365/12)
            transacao.save()
    
        conta_entrada = Conta(tipo=0)
        conta_saida.nome = 'Projeto: ' + nome + ' (Conta Entrada)'
        conta_entrada.data = datetime.strptime(request.POST['data_entrada'], '%d/%m/%Y')
        conta_entrada.valor_total = float(request.POST['valor_entrada'])
        conta_entrada.parcelas = int(request.POST['parcelas_conta_entrada'])
        conta_entrada.livro = int(request.POST['tipo_entrada'])
        conta_entrada.descricao = request.POST['descricao_entrada']
        conta_entrada.save()

        for i in xrange(conta_entrada.parcelas):
            transacao = Transacao(conta=conta_entrada)
            transacao.nome = conta_entrada.nome + ': Parcela %s' % i
            transacao.valor = conta_entrada.valor_total/conta_entrada.parcelas
            transacao.data_vencimento = conta_entrada.data + timedelta(i*365/12)
            transacao.save()

        return HttpResponse()

    else:
        return HttpResponse() 
