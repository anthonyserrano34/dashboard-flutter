/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const os = require('os');
const xlenv = global.xlenv = require("xtralife-env");

global.logger = require('winston');

const Promise = require('bluebird');
Promise.promisifyAll(require('redis'));

xlenv.override(null, {
	nbworkers: 1,
	privateKey: "CONFIGURE : This is a private key and you should customize it",

	logs: {
		level: 'error',
		slack: {
			enable: false
		}
	},

	redis: {
		host: "localhost",
		port: 6378
	},

	redisClient(cb) {
		const client = require('redis').createClient(xlenv.redis.port, xlenv.redis.host);
		return client.info(err => cb(err, client));
	},

	redisChannel(cb) {
		const client = require('redis').createClient(xlenv.redis.port, xlenv.redis.host);
		return client.info(err => cb(err, client));
	},

	mongodb: {
		dbname: 'xtralife',

		url: "mongodb://localhost:27018",
		options: { // see http://mongodb.github.io/node-mongodb-native/driver-articles/mongoclient.html
			
			w: 1,
			readPreference: "primaryPreferred",
			promiseLibrary: require('bluebird')
		}
	},


	mongoCx(cb) {
		return require("mongodb").MongoClient.connect(xlenv.mongodb.url, xlenv.mongodb.options, (err, mongodb) => cb(err, mongodb));
	},

	elastic(cb) {	
		const elastic = require("elasticsearch");
		const client = new elastic.Client();
		return cb(null, client);
	},

	options: {

		useMongodbPushall: false,

		notifyUserOnBrokerTimeout: true,

		removeUser: true,

		timers: {
			enable: true,
			listen: true
		},

		hostnameBlacklist: []
	}, // used to restrict this.game.http.* apis

	//profileFields: ['displayName'] # show nothing but displayName in profile

	mailer: null, // CONFIGURE HERE


	xtralife: {
		games: {
			"com.clanofthecloud.testgame": {
				apikey: "testgame-key",
				apisecret: "testgame-secret",
				config: {
					enable: true,
					domains: [],
					eventedDomains: [],
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
						facebookAppToken: '',
						gameCenterBundleIdRE: /^not.the.correct.bundleId$/
					}
				}
			},


			"com.clanofthecloud.cloudbuilder": {
				apikey: "cloudbuilder-key",
				apisecret: "azerty",
				config: {
					enable: true,
					domains: ["com.clanofthecloud.cloudbuilder.m3Nsd85GNQd3", "com.clanofthecloud.cloudbuilder.test"],
					eventedDomains: [],
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
						facebookAppToken: '',
						gameCenterBundleIdRE: /^cloud\.xtralife\..*$/
					}
				}
			}
		}
	},


	AWS: null, // this is not used for xtralife-api tests but may in the future

	hooks: {
		functions: require('./batches.js'),
		definitions: {}
	}
});
