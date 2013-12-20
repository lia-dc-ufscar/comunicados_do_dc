Template.feedback_monitor.message = ->
	getLastMessage()

Template.show_message_monitor.subject = ->
	console.log getSelectedMessage()

Template.show_message_monitor.content = ->
	getSelectedMessage().content

Template.show_message_monitor.date = ->
	current_message = getLastMessage().date

	dd = current_message.getDate()
	mm = current_message.getMonth() + 1
	yyyy = current_message.getFullYear()

	if ( dd < 10 )
		dd = '0' + dd 
	if ( mm < 10 )
		mm = '0' + mm

	console.log "asdas"
	current_message = dd + '/' + mm + '/' + yyyy

feelings = [ "happy", "medium_happy", "indiferent", "medium_sad", "sad" ]

Template.show_message.feelings = ->
	message = getSelectedMessage()
	total = feelings.reduce (count, feeling) ->
		count + message[feeling]
	, 0

	feelings.map (feeling) ->
		if total * 100 != 0
			{ label: feeling, percentage: message[feeling] / total * 100 }
		else
			{ label: feeling, percentage: 0 }