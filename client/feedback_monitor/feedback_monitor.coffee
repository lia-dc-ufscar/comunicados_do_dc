Template.feedback_monitor.message = ->
	getLastMessage()

Template.show_message_monitor.subject = ->
	getLastMessage().subject

Template.show_message_monitor.content = ->
	getLastMessage().content

Template.show_message_monitor.date = ->
	current_message = getLastMessage().date

	dd = current_message.getDate()
	mm = current_message.getMonth() + 1
	yyyy = current_message.getFullYear()

	if ( dd < 10 )
		dd = '0' + dd 
	if ( mm < 10 )
		mm = '0' + mm

	current_message = dd + '/' + mm + '/' + yyyy

monitor_feelings = [ "happy", "medium_happy", "indiferent", "medium_sad", "sad" ]

Template.show_message_monitor.monitor_feelings = ->
	console.log "adasd"
	message = getLastMessage()
	total = monitor_feelings.reduce (count, monitor_feelings) ->
		count + message[monitor_feelings]
	, 0

	monitor_feelings.map (monitor_feelings) ->
		if total * 100 != 0
			{ label: monitor_feelings, percentage: message[monitor_feelings] / total * 100, qtd: message[monitor_feelings], total: total }
		else
			{ label: monitor_feelings, percentage: 0, qtd: 0, total: 0 }