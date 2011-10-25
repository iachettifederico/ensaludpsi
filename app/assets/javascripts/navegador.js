$(document).ready(function(){
	$('.tree-menu h2, .tree-menu h3, .tree-menu h4').parent().children('ul').hide();
	
	$('.tree-menu h2, .tree-menu h3, .tree-menu h4').click(function(){
			$(this).parent().children('ul').toggle(300);
			$(this).toggleClass('expanded');
	});
	
	
});
