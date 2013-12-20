Template.auth.events =
	"click input[name=submit]": (e) ->
		if $("#login-password").val() != "123mudar"
			Session.set "logged", true