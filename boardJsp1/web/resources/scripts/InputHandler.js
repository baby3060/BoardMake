function checkLangName(event) {
	var textid = jQuery(this).attr("id");
	var text = $(this).val();
	var hangul = new RegExp("[\u1100-\u11FF|\u3130-\u318F|\uA960-\uA97F|\uAC00-\uD7AF|\uD7B0-\uD7FF]"); 
	
	if(hangul.test(text)) {
		limit = 4;
		
		jQuery('#'+textid).attr("maxlength", limit);
		
		// 크롬에서는 maxlength를 설정해줘도 하나가 더 들어가므로, 막아준다.
		if ($(this).val().length > $(this).attr('maxlength')) {
			$(this).val($(this).val().substr(0, $(this).attr('maxlength')));
		}
	} else {
		$(this).val("");
	}
	
	
}