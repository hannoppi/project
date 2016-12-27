$(function () {
	$('.visual-wide-slide-area').css({
		'background': 'url("/front/upload/images/slide/wide/img1_bg.gif")'
		
	});
	
	$('.tab-button').on('click', function () {
		$('.tab-button').removeClass('current');
		$(this).addClass('current');
	});
	
	if($('.login input[type = text]').val() != '') {
		$('.login input[type = text]').siblings('label').hide();
	}
	
	if($('.login input[type = password]').val() != '') {
		$('.login input[type = password]').siblings('label').hide();
	}
	
	$('.login input[type = text], .login input[type = password]').on('focus', function () {
		$(this).siblings('label').hide();
	}).on('blur', function () {
		if($('.login input[type = text]').val() == '') {
			$(this).siblings('label').show();
		}
		
		if($('.login input[type = password]').val() == '') {
			$(this).siblings('label').show();
		}
	});
	
	
});