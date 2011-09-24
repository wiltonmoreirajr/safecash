package com.appspot.safecash.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.safecash.dados.Conta;
import com.appspot.safecash.dados.Transacao;
import com.appspot.safecash.enuns.EnumOrigemTransacao;
import com.appspot.safecash.enuns.EnumStatusConta;
import com.appspot.safecash.enuns.EnumTipoConta;
import com.appspot.safecash.enuns.EnumTipoTransacao;
import com.appspot.safecash.fachada.Fachada;
import com.appspot.safecash.negocio.exception.TransacaoJaExisteException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class ContaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private Conta newConta = new Conta(null, null, 0.0, null, null);
	private Fachada fachada = Fachada.getInstance();
	private List<Transacao> trans = new ArrayList<Transacao>();
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String action = req.getParameter("action");
		if (action.equalsIgnoreCase("trans"))	
			this.addTrans(req, res);
		else
			this.add(req, res);
	}

	private void addTrans(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String descricao = req.getParameter("descricao");
		String data = req.getParameter("data");
		String valorString = req.getParameter("valor");
		EnumTipoTransacao tipo = req.getParameter("tipo").equalsIgnoreCase("ENTRADA") ? EnumTipoTransacao.ENTRADA : EnumTipoTransacao.SAIDA;
		EnumOrigemTransacao origem = req.getParameter("origem").equalsIgnoreCase("CONTA") ? EnumOrigemTransacao.CONTA : EnumOrigemTransacao.CAIXA;
		
		try {
			Date date = new SimpleDateFormat("dd/MM/yyyy").parse(data);
			valorString = CashValidator.validate(valorString);
			Double valorDouble = Double.parseDouble(valorString);

			long key = (long) (Math.random() * 100000000);
			Key newKey = KeyFactory.createKey(Transacao.class.getSimpleName(), key);
			Transacao transacao = new Transacao(descricao, date, valorDouble, tipo, origem);
			transacao.setKey(newKey);
			
			transacao.setConta(true);
			
			this.newConta.getChavesTransacoes().add(newKey);
			this.trans.add(transacao);
			
			req.setAttribute("trans", this.trans);
			
			SendMsg.send(req, res, "Transa��o inserida com sucesso.", "append/contaPost.jsp?action=trans");
		} catch (ParseException e) {
			SendMsg.send(req, res, "Erro ao inserir transa��o.", "append/contaPost.jsp?action=trans");
		}
	}
	
	private void add(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			String descricao = req.getParameter("descricao");
			Date data = new SimpleDateFormat("dd/MM/yyyy").parse(req.getParameter("data"));
			
			double valor = Double.parseDouble(CashValidator.validate(req.getParameter("valor")));
			EnumTipoConta tipo = req.getParameter("tipo").equalsIgnoreCase("ENTRADA") ? EnumTipoConta.ENTRADA : EnumTipoConta.SAIDA;
			
			String estadoStr = req.getParameter("estado");
			EnumStatusConta estado = null;
			if (estadoStr.equalsIgnoreCase("pendente"))
				estado = EnumStatusConta.PENDENTE;
			else if (estadoStr.equalsIgnoreCase("atrasado"))
				estado = EnumStatusConta.ATRASADO;
			else
				estado = EnumStatusConta.PAGO;
			
			newConta.setDescricao(descricao);
			newConta.setData(data);
			newConta.setValor(valor);
			newConta.setTipo(tipo);
			newConta.setStatus(estado);
			
			for (Transacao t : this.trans)
				this.fachada.inserirTransacao(t);
			
			fachada.inserirConta(newConta);
			
			this.newConta = new Conta(null, null, 0.0, null, null);
			this.trans = new ArrayList<Transacao>();
			
			SendMsg.send(req, res, "Conta inserida com sucesso.", "append/contaPost.jsp?action=final");
		} catch (ParseException e) {
			SendMsg.send(req, res, "Erro ao inserir uma conta.", "append/contaPost.jsp?action=final");
		} catch (TransacaoJaExisteException e) {
			SendMsg.send(req, res, "Erro ao inserir transa��o.", "append/contaPost.jsp?action=final");
		}
	}
}
