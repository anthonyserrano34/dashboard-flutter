/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const os = require('os');

module.exports = {

	redis: {
		host: process.env.REDIS_PORT_6379_TCP_ADDR,
		port: process.env.REDIS_PORT_6379_TCP_PORT
	},

	mongodb: {
		url: `mongodb://${process.env.MONGODB_PORT_27017_TCP_ADDR}:${process.env.MONGODB_PORT_27017_TCP_PORT}/?maxPoolSize=25`
	},

	elastic(cb){
		const elastic = require("elasticsearch");
		const client = new elastic.Client({
			host: `http://${process.env.ELASTIC_PORT_9200_TCP_ADDR}:${process.env.ELASTIC_PORT_9200_TCP_PORT}`});
		return cb(null, client);
	},

	logs: {
		level: 'debug'
	},

	xtralife: {
		games: {
			"com.clanofthecloud.testgame": { 
				apikey:"testgame-key",
				apisecret:"testgame-secret",
				config: {
					enable:true,
					domains:[],
					eventedDomains:[],
					certs: {
						android: {
							enable: false,
							senderID: '',
							apikey: ''
						},
						ios: {
							enable: false,
							cert: '',
							key: ''
						},
						macos: {
							enable: false,
							cert: '',
							key: ''
						}
					},
					socialSettings: {
						facebookAppToken : ''
					}
				}
			},

			"com.clanofthecloud.cloudbuilder": { 
				apikey:"cloudbuilder-key",
				apisecret:"azerty",
				config: {
					enable:true,
					domains:["com.clanofthecloud.cloudbuilder.m3Nsd85GNQd3","com.clanofthecloud.cloudbuilder.test"],
					eventedDomains:["com.clanofthecloud.cloudbuilder.m3Nsd85GNQd3"],
					certs: {
						android: {
							enable: true,
							senderID: '',
							apikey: ''
						},
						ios: {
							enable: true,
							cert: '',
							key: ''
						},
						macos: {
							enable: true,
							cert: '',
							key:''
						}
					},
					socialSettings: {
						facebookAppToken : ''
					}
				}
			}
		}
	},
						
	dashboard: {
		users: {
			"user": {
				email:"user",
				password:"5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8",
				games:["com.clanofthecloud.cloudbuilder","com.clanofthecloud.testgame"]
			}
		}
	},	

	mailer: {
		transport: "sendgrid",
		user: "",
		password: ""
	},

	AWS: {
		S3: {
			bucket: 'CONFIGURE',
			credentials: {
				region: '',
				accessKeyId: '',
				secretAccessKey: ''
			}
		}
	},

	hooks: {
		recursionLimit: 5,
		definitions: {
			"com.clanofthecloud.cloudbuilder.m3Nsd85GNQd3": { // needed for unit tests
				'before-gamervfs-write': "return 'before';",
				'after-gamervfs-write':  `  if (customData != 'before') { throw new Error('Hook context lost'); }; \
return this.virtualfs.read('com.clanofthecloud.cloudbuilder.m3Nsd85GNQd3', params.user_id, null) \
.then(function(allkeys) \
{return 'DONE!';});`
			},
			"com.clanofthecloud.cloudbuilder.azerty": { // needed for unit tests
				'social-addprofile' : "return this.virtualfs.readmulti(params.domain, params.userids, ['key1', 'key2'], ['properties','balance']);",
				'before-transaction': "console.log('Before transaction');",
				'after-transaction': "console.log('After transaction');",
				'before-balance': "return null;",
				'__test1': "return {input: params.request.input, domain: this.game.getPrivateDomain()};",
				'__test2': "return {userFound: params.user_id};",
				'__test3': `var domain = this.game.getPrivateDomain(); \
return mod.Q.all( \
[this.virtualfs.read(domain, params.user_id, null), \
this.tx.balance(domain, params.user_id)] \
).spread(function (fs, balance) { \
return {fs: fs, balance: balance}; \
});`
			}
		},

		functions: {}
	}
};

