<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.appspot.safecash.fachada.Fachada"%>
<%
//Verifica consist�ncia da Se��o
if (session.getAttribute("login") == null) {
	response.sendRedirect("login.jsp");
	response.reset();
}

Fachada fachada = Fachada.getInstance();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="css/defalt.css" />
<link rel="stylesheet" href="css/projetos.css" />

<script type="text/javascript" src="js/jquery.tools.min.js"></script> 
<script type="text/javascript" src="js/projetos.js"></script>

<title>$afeCash - Administrador Financeiro</title>
</head>

<body>

<div id="tudo">
	<div id="dados">Usu&aacute;rio: <span class="cor"><% out.print(session.getAttribute("nome")); %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt; <a href="/logoff" class="cor" title="logout">logout</a></div>
	<div id="logo"></div>
	
	<div id="corpo">
		<jsp:include page="includes/menu.txt"></jsp:include>
		
		<div id="conteudo">
			<a href="#" id="botao" title="Adicionar Conta"></a>
			<form>
			
				<select name= "ano"onchange="scripting(this.value)">
					<option value="">ANO</option>
					<option value="2010">2010</option>
					<option value="2011">2011</option>
					<option value="2012">2012</option>
					<option value="2013">2013</option>
					<option value="2014">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
					<option value="2019">2019</option>
					<option value="2020">2020</option>
					<option value="2021">2021</option>
				</select>
			</form>
			<div id="livroConta" class="destaque cor">PROJETOS DO ANO DE 2010</div>
			<div id="separacao">
			
			<ul id="flowtabs" class="navi">
	<li><a id="t1" href="#"></a></li>
	<li><a id="t2" href="#"></a></li>
	<li><a id="t3" href="#"></a></li>
	
</ul>
			
			<div id="flowpanes">


	<!-- wrapper for scrollable items -->
	<div class="items">

		<div>
			<!-- jan-abril-->
			<div class="meses">
				<div id="esqUm">
					<div class="cabecario"><span>JANEIRO</span></div>
					<div class="corpo">
						<ul>
							<li><a href="#" title="Visualizar Projeto">Nome Projeto PROJETO1</a></li>
							<li><a href="#" title="Visualizar Projeto">Nome Projeto PROJETO2</a></li>
							<li><a href="#" title="Visualizar Projeto">Nome Projeto PROJETO2</a></li>
						</ul>
					</div>
				</div>
				<div id="dirUm">
					<div class="cabecario"><span>FEVEREIRO</span></div>
					<div class="corpo">
						<ul>
							<li><a href="#" title="Visualizar Projeto">Nome Projeto PROJETO1</a></li>
							<li><a href="#" title="Visualizar Projeto">Nome Projeto PROJETO2</a></li>
							<li><a href="#" title="Visualizar Projeto">Nome Projeto PROJETO2</a></li>
						</ul>
					</div>
				</div>
				<div id="esqDois">
					<div class="cabecario"><span>MAR&Ccedil;O</span></div>
					<div class="corpo">
						<ul>
							<li><a href="#" title="Visualizar Projeto">Nome Projeto PROJETO1</a></li>
							<li><a href="#" title="Visualizar Projeto">Nome Projeto PROJETO2</a></li>
							<li><a href="#" title="Visualizar Projeto">Nome Projeto PROJETO2</a></li>
						</ul>
					</div>
				</div>
				<div id="dirDois">
					<div class="cabecario"><span>ABRIL</span></div>
					<div class="corpo">
						<ul>
							<li><a href="#" title="Visualizar Projeto">Nome Projeto PROJETO1</a></li>
							<li><a href="#" title="Visualizar Projeto">Nome Projeto PROJETO2</a></li>
							<li><a href="#" title="Visualizar Projeto">Nome Projeto PROJETO2</a></li>
						</ul>
					</div>
				</div>
			</div>
			
		</div>
			<div class="meses">
				<div id="esqUm">
					<div class="cabecario"><span>MAIO</span></div>
					<div class="corpo"></div>
				</div>
				<div id="dirUm">
					<div class="cabecario"><span>JUNHO</span></div>
					<div class="corpo"></div>
				</div>
				<div id="esqDois">
					<div class="cabecario"><span>JULHO</span></div>
					<div class="corpo"></div>
				</div>
				<div id="dirDois">
					<div class="cabecario"><span>AGOSTO</span></div>
					<div class="corpo"></div>
				</div>
			</div>
		<div>

			<!-- maio-agost-->
			<div class="meses">
				<div id="esqUm">
					<div class="cabecario"><span>SETEMBRO</span></div>
					<div class="corpo"></div>
				</div>
				<div id="dirUm">
					<div class="cabecario"><span>OUTUBRO</span></div>
					<div class="corpo"></div>
				</div>
				<div id="esqDois">
					<div class="cabecario"><span>NOVEMBRO</span></div>
					<div class="corpo"></div>
				</div>
				<div id="dirDois">
					<div class="cabecario"><span>DEZEMBRO</span></div>
					<div class="corpo"></div>
				</div>
			</div>
			
		</div>

			
	</div>

</div>
		</div>
		</div>
	</div>

</div>
<div id="popUp"   class="esconder">
	<a class="fechar" href="#" title="voltar"></a>
	<span id="nomePopUp" class="cor">Inserir Projeto</span>
	
	
	
	<form action="#" method="post">
					<label id="labelNomeProjetos" for="nomeProjeto">NOME:&nbsp;</label><input type="text" name="nomeProjeto" id="nomeProjeto" />
					<label id="labelValorProjeto" for="valorProjeto" class="limpa">VALOR:&nbsp;</label><input type="text" name="valorProjeto" id="valorProjeto" size="41"/>
					<label id="labelDataIniProjeto" for="dataIniProjeto">DATA IN&Iacute;CIO:&nbsp;</label><input type="text" name="dataIniProjeto" id="dataIniProjeto" />
					<label id="labelDataTerProjeto" for="dataTerProjeto">DATA T&Eacute;RMINO:&nbsp;</label><input type="text" name="dataTerProjeto" id="dataTerProjeto" />
					<label id="labelResponsavelProjeto" for="responsavelProjeto">RESPONS&Aacute;VEL:&nbsp;</label>
					<select name="responsavel"  id="responsavelProjeto">
						<option value="user1">USER1</option>
						<option value="user2">USER2</option>
						<option value="user3">USER3</option>
					</select>
	</form>
	
	<span class="separacao">Inserir Conta de Entrada</span>
	<div id="ContaEntrada">
		
	
	
	<div id="conta"> 
		<form action="#" method="post">
			<div id="esq">
				<label for="dataConta">DATA:</label><input type="text" name="dataConta" id="dataConta" />
				<label for="valorConta" class="limpa">VALOR:</label><input type="text" name="valorConta" id="valorConta" />
				<label for="estadoConta" class="limpa">ESTADO:</label><select name="estadoConta" id="estadoConta">
															<option value="pendente">Pendente</option>
															<option value="ok">OK</option>
															<option value="atrasado">Atrasado</option>
														</select>
														
				<label class="limpa">TIPO:</label><input type="radio" name="tipoConta" id="tipoSaida" value="saida" /><label for="tipoSaida">SA&Iacute;DA</label><input type="radio" name="tipoConta" value="entrada"  id="tipoEntrada"/><label for="tipoEntrada">ENTRADA</label>
			</div>
			<div id="dir">
				<label for="descricaoConta">DESCRI&Ccedil;&Atilde;O:</label><textarea name="descricao" id="descricaoConta"></textarea>
			</div>
		</form>
	</div>
	<div id="transacao" class="arredonda">
		<div id="cabecarioTransacao" >
			<span>TRANSA&Ccedil;&Atilde;O</span>
		</div>
		<div id="corpoTransacao">
			<form action="#" method="post">
				<a href="#" class="adicionar" title="Adicionar Transa&ccedil;&atilde;o"></a>
				<label for="descricaoTransacao">DESCRI&Ccedil;&Atilde;O:</label><input type="text" name="descricaoTransacao" id="descricaoTransacao" />
				
				<label for="origemTransacao">ORIGEM:</label><label for="valorTransacao">VALOR:</label><label for="estadoTransacao">ESTADO:</label><label for="dataTransacao">DATA:</label>
				<select name="origemTransacao" id="origemTransacao">
															<option value="caixa">CAIXA</option>
															<option value="conta">CONTA</option>
			  </select>
				<input type="text" name="valorTransacao" id="valorTransacao" />
				<select name="tipoTransacao" id="tipoTransacao">
															<option value="entrada">Entrada</option>
															<option value="saida">Sa�da</option>
														</select>
				<input type="text" name="data" id="dataTransacao" /> 
												
														
			</form>
		</div>
	</div>
	
	<div id="listaTransacao" class="arredonda">
		<div id="cabecarioLista" >
			<span>LISTA DE TRANSA&Ccedil;&Otilde;ES</span>
		</div>
		<div id="cabecarioListaCorpo" >
			<span class="data"> DATA </span><span class="descricao">DESCRI&Ccedil;&Atilde;O</span><span class="valor">VALOR</span><span class="tipo">TIPO</span><span class="estado">ESTADO</span>
		</div>
		
		<div id="corpoLista">
		</div>
		
	</div>
	</div>	
	<span class="separacao" id="separa">Inserir Conta de Sa&iacute;da</span>
	<div id="ContaSaida"><div id="contaSaida"> 
		<form action="#" method="post">
			<div id="esqSaida">
				<label for="dataContaSaida">DATA:</label><input type="text" name="dataConta" id="dataContaSaida" />
				<label for="valorContaSaida" class="limpa">VALOR:</label><input type="text" name="valorConta" id="valorContaSaida" />
				<label for="estadoContaSaida" class="limpa">ESTADO:</label><select name="estadoConta" id="estadoContaSaida">
															<option value="pendente">Pendente</option>
															<option value="ok">OK</option>
															<option value="atrasado">Atrasado</option>
														</select>
														
				<label class="limpa">TIPO:</label><input type="radio" name="tipoContaSaida" id="tipoSaidaSaida" value="saida" /><label for="tipoSaida">SA&Iacute;DA</label><input type="radio" name="tipoContaSaida" value="entrada"  id="tipoEntradaSaida"/><label for="tipoEntrada">ENTRADA</label>
			</div>
			<div id="dirSaida">
				<label for="descricaoContaSaida">DESCRI&Ccedil;&Atilde;O:</label><textarea name="descricao" id="descricaoContaSaida"></textarea>
			</div>
		</form>
	</div>
	<div id="transacaoSaida" class="arredonda">
		<div id="cabecarioTransacaoSaida" >
			<span>TRANSA&Ccedil;&Atilde;O</span>
		</div>
		<div id="corpoTransacaoSaida">
			<form action="#" method="post">
				<a href="#" class="adicionar" title="Adicionar Transa&ccedil;&atilde;o"></a>
				<label for="descricaoTransacaoSaida">DESCRI&Ccedil;&Atilde;O:</label><input type="text" name="descricaoTransacao" id="descricaoTransacaoSaida" />
				
				<label for="origemTransacaoSaida">ORIGEM:</label><label for="valorTransacaoSaida">VALOR:</label><label for="estadoTransacaoSaida">ESTADO:</label><label for="dataTransacaoSaida">DATA:</label>
				<select name="origemTransacao" id="origemTransacaoSaida">
															<option value="caixa">CAIXA</option>
															<option value="conta">CONTA</option>
			  </select>
				<input type="text" name="valorTransacao" id="valorTransacaoSaida" />
				<select name="tipoTransacaoSaida" id="tipoTransacaoSaida">
															<option value="entrada">Entrada</option>
															<option value="saida">Sa�da</option>
														</select>
				<input type="text" name="data" id="dataTransacaoSaida" /> 
														
														
			</form>
		</div>
	</div>
	
	<div id="listaTransacaoSaida" class="arredonda">
		<div id="cabecarioListaSaida" >
			<span>LISTA DE TRANSA&Ccedil;&Otilde;ES</span>
		</div>
		<div id="cabecarioListaCorpoSaida" >
			<span class="data"> DATA </span><span class="descricao">DESCRI&Ccedil;&Atilde;O</span><span class="valor">VALOR</span><span class="tipo">TIPO</span><span class="estado">ESTADO</span>
		</div>
		
		<div id="corpoListaSaida">
		</div>
		
	  </div>
		<a href="#" title="Inserir Projeto" class="inserirProjeto"></a>
	</div>
		
		
</div>
</div>	

	
</div> 
<div id="tela"></div>

</body>
</html>
