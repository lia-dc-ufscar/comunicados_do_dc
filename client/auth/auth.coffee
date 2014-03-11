Template.auth.events =
	"click input[name=submit]": (e) ->
		login = $('input[name=login]').val()
		password = $('input[name=password]').val()
		#alert("Bem-vindo, " + login + "!")
		error = (erro) ->
			if erro
				alert("Usuario ou senha incorretos.") 
			else
				router.navigate "home", {trigger: true}
		Meteor.loginWithPassword login, password, error
