$(document).ready(function() {
       
	
		$('#calendario').calendario({
			target:'#calendario',
			closeClick:false,
			top:120,
			left:235,
			referencePosition : '#popUp'
		});
	
		$('div.calendario ul li a').click(function(){
			var html = $(this).html();
			$(this).remove();
			//$(':text').attr({value:html});
			
			$('div.calendario ul li.default').removeClass('default');
			$('div.calendario ul li:empty').addClass('default');
			$('div.calendario ul li:empty').html('<a href="#">'+html + '</a>');
		});
	
		
	

            $('#botao').click(function(e){
								     
									  var largura = $('body').outerWidth(true);
									  var altura =  $('body').outerHeight(true);
									  var alturaJanela = $(window).height();
									  var modelo = $(this).text();
									  var idModelo = $(this).attr('id');
									  var descricao = $.post("nomedomapeamento", { id: idModelo} );
									  
									 // $('body').text(id);
									  $('#tela').css({width:largura,height:altura});
									  $('#tela').fadeIn(200);
									  $('#popUp').css({top:alturaJanela/2 -260/2,left:largura/2 - 434/2});
									  $('#nomePopUp').text(modelo);
									  $('#PopUp p').text(descricao);
									  $('#valor').val( idModelo);
									  $('#popUp').fadeIn(200);
									  $('.informativo').hide();
									  						  										  
								   } );
			
      
		
		$(".fechar").click(function(e){
									$('#popUp').fadeOut(200);
									$('#tela').fadeOut(200);
																										
									});
		
		$(".remover").click(function(e){
									
									  var idModelo =  $('#valor').val();
									var pagina = $.post("nomedomapeamento", { id: idModelo} );
									$('#popUp').fadeOut(200);
									 $('#tela').fadeOut(200);
									 $('body').text(pagina);
									 
									
									
									});
		$(".download").click(function(e){
									 var idModelo =  $('#valor').val();
									var pagina = $.post("nomedomapeamento", { id: idModelo} );
									$('#popUp').fadeOut(200);
									 $('#tela').fadeOut(200);
									 $('body').text(pagina);
									
									
									});
		
    });

