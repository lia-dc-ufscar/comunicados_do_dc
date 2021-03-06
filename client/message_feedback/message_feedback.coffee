Template.message_feedback.message = ->
	getSelectedMessage()

Template.show_message.subject = ->
	getSelectedMessage().subject

Template.show_message.content = ->
	getSelectedMessage().content

window.getSelectedMessage = ->
	Messages.findOne(Session.get("selected_message"))

Template.message_feedback.events =
	"click .delete": (e) ->
		Messages.remove(getSelectedMessage()._id)

Template.show_message.date = ->
	current_message = getSelectedMessage().date

	dd = current_message.getDate()
	mm = current_message.getMonth() + 1
	yyyy = current_message.getFullYear()
	hh = current_message.getHours()
	min = current_message.getMinutes()

	if ( dd < 10 )
		dd = '0' + dd 
	if ( mm < 10 )
		mm = '0' + mm
	if ( min < 10 )
		mm = '0' + min

	current_message = dd + '/' + mm + '/' + yyyy + ' as ' + hh + ':' + min

feelings = [ "happy", "medium_happy", "indiferent", "medium_sad", "sad" ]

Template.show_message.feelings = ->
	message = getSelectedMessage()
	total = feelings.reduce (count, feeling) ->
		count + message[feeling]
	, 0

	feelings.map (feeling) ->
		if total * 100 != 0
			{ label: feeling, percentage: message[feeling] / total * 100, qtd: message[feeling], total: total }
		else
			{ label: feeling, percentage: 0, qtd: 0, total: 0 }

Template.show_message.showTotal = ->
	message = getSelectedMessage()
	total = feelings.reduce (count, feeling) ->
		count + message[feeling]
	, 0

	return total