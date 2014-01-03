Session.set "selected_message", "none"

Template.feedback.messages = ->
	getAllMessages()

window.getAllMessages = ->
	Messages.find({}, {sort: {date: -1}})

Template.message.formattedDate = ->
	console.log this.date

	dd = this.date.getDate()
	mm = this.date.getMonth() + 1
	yyyy = this.date.getFullYear()
	hh = this.date.getHours()
	min = this.date.getMinutes()
	if ( dd < 10 )
		dd = '0' + dd 
	if ( mm < 10 )
		mm = '0' + mm
	if ( min < 10 )
		mm = '0' + min

	formattedDate = dd + '/' + mm + '/' + yyyy + ' as ' + hh + ':' + min;

Template.feedback.events =
	"click a": (e) ->
		selected_message = $(e.target).attr "id"