jQuery(document).ready ->
	$('.tree-menu h2, .tree-menu h3, .tree-menu h4').parent().children('ul').hide()
	
	$('.tree-menu h2, .tree-menu h3, .tree-menu h4').click ->
			$(this).parent().children('ul').toggle 300
			$(this).toggleClass('expanded')
			
