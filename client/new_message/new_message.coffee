Template.new_message.events =
	"click a[name=post]": ->
		subject = $('textarea[name=subject]').val().split("\n").join("<br/>")		
		content = $('textarea[name=message]').val().split("\n").join("<br/>")
		if ( content != "" )
			Messages.insert {subject: subject, content: content, happy: 0, medium_happy: 0, indiferent: 0, medium_sad: 0, sad: 0, date: com_date}
			$.notify "Comunicado enviado para a TV.", {position: "top center", className: "success"}
			router.navigate "feedback", {trigger: true}
		else
			button = $("#post")
			$("textarea[name=message]").notify "Digite o conteúdo do comunicado", "error"

	"keydown textarea[name=subject]": (e) ->
		false if e.keyCode == 13

Template.new_message.com_date = ->
	today = new Date
	dd = today.getDate()
	mm = today.getMonth() + 1
	yyyy = today.getFullYear()
	hh = today.getHours()
	min = today.getMinutes()
	if ( dd < 10 )
		dd = '0' + dd 
	if ( mm < 10 )
		mm = '0' + mm

	today = dd + '/' + mm + '/' + yyyy + ' as ' + hh + ':' + min
