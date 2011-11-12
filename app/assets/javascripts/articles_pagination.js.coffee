/* articles_pagination.js.coffee */
$(document).ready ->
	currentpage = 1
	show_buttons = true
	$('#cargando').hide()
	$('#cargar_mas_articulos').click ->
		$('#cargando').show()
		
		currentpage++;
		url = '/articles'
		
		$.get url, {escape:false, layout:"none", page:currentpage}, (data) ->
			$('#articulos').append( data )
			$('#cargando').hide()
			if(data.length == 1)
				$('#cargar_mas_articulos').hide()
			false
