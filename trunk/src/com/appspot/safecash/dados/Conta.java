package com.appspot.safecash.dados;

import java.util.Date;

import com.appspot.safecash.enuns.EnumStatusConta;

public class Conta {
	
	private Date data;
	private String descricao;
	private double valor;
	private EnumStatusConta status;
	private Projeto projeto;
	
	public Conta(Date data, String descricao, double valor, EnumStatusConta status, Projeto projeto) {
		this.data = data;
		this.descricao = descricao;
		this.valor = valor;
		this.status = status;
		this.projeto = projeto;
	}

	public Date getData() {
		return data;
	}
	
	public void setData(Date data) {
		this.data = data;
	}
	
	public String getDescricao() {
		return descricao;
	}
	
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public double getValor() {
		return valor;
	}
	
	public void setValor(double valor) {
		this.valor = valor;
	}
	
	public EnumStatusConta getStatus() {
		return status;
	}
	
	public void setStatus(EnumStatusConta status) {
		this.status = status;
	}
	
	public Projeto getProjeto() {
		return projeto;
	}
	
	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}	
}