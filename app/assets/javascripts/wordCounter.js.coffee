$(document).ready ->
		$('.char_counter textarea').keyup ->
			$('.char_counter span').html @.value.length
