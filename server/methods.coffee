Accounts.config
	forbidClientAccountCreation: true

Accounts.createUser({username:'Augusto', password:'UmaSenhaQualquer'}) unless Meteor.users.findOne({username:'Augusto'}) 