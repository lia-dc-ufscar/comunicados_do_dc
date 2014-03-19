if(Meteor.isServer)
	Meteor.startup ->
		Accounts.createUser({username:'Augusto', password:'UmaSenhaQualquer'}) unless Meteor.users.findOne({username:'Augusto'})