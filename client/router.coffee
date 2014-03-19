class window.AppRouter extends Backbone.Router
	routes:
		"new_message": "newMessage"
		"vote": "vote"
		"feedback": "feedback"
		"home": "home"
		"message_feedback": "messageFeedback"
		"message_feedback/:id": "parameterizedMessageFeedback"
		"screen": "screen"
		"feedback_monitor": "feedback_monitor"
		"": "screen"
		"auth": "auth"
		"logout":"logout"

	newMessage: ->
		return unless @authenticated()
		Session.set "current_page", "new_message"

	vote: ->
		Session.set "current_page", "vote"

	feedback: ->
		return unless @authenticated()
		Session.set "current_page", "feedback"

	home: ->
		return unless @authenticated()
		Session.set "current_page", "home"

	messageFeedback: ->
		return unless @authenticated()
		Session.set "current_page", "message_feedback"

	parameterizedMessageFeedback: (id) ->
		return unless @authenticated()
		Session.set "selected_message", id
		Session.set "current_page", "message_feedback"

	screen: ->
		Session.set "current_page", "screen"


	feedback_monitor: ->
		Session.set "current_page", "feedback_monitor"

	auth: ->
		Session.set "current_page", "auth"

	logout: ->
		Meteor.logout()
		router.navigate "auth", {trigger: true}
		
	authenticated: =>
		if Meteor.userId()
			true
		else
			router.navigate "auth", {trigger: true}
			false