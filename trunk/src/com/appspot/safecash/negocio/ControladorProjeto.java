package com.appspot.safecash.negocio;

import com.appspot.safecash.dados.Projeto;
import com.appspot.safecash.negocio.exception.ProjetoJaExisteException;
import com.appspot.safecash.negocio.exception.ProjetoNaoExisteExeception;
import com.appspot.safecash.repositorio.RepositorioProjeto;

public class ControladorProjeto {
	
	RepositorioProjeto repositorio;
	
		//fatal o construtor!!!!!!!!!!!!!
	public void inserirProjeto(Projeto projeto)throws ProjetoJaExisteException
	{
		if(!this.existe(projeto))
		{
			this.repositorio.inserir(projeto);
		}
		else
		{
			throw new ProjetoJaExisteException();
		}
	}
	
	public void atualizarProjeto(Projeto projeto) throws ProjetoNaoExisteExeception
	{
		if(this.existe(projeto))
		{
			this.repositorio.atualizar(projeto);
		}
		else
		{
			throw new ProjetoNaoExisteExeception();
		}
	}
	
	public void removerProjeto(Projeto projeto)throws ProjetoNaoExisteExeception
	{
		if(this.existe(projeto))
		{
			this.repositorio.remover(projeto);
		}
		else
		{
			throw new ProjetoNaoExisteExeception();
		}
	}
	
	private boolean existe(Projeto projeto)
	{
		return this.repositorio.existe(projeto);
	}

}