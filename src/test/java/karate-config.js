/* eslint-disable */
function fn() {
	var env = karate.env;
	if (!env) {
		env = 'integracion';
	}

	var config = {
		tokenUrl: '',
		tokenResource: '',
		tokenBearer: '',
		tokenSubscriptionKey: '',
		baseUrl:''
	};

	if (env == 'integracion') {
        config.baseUrl='https://serverest.dev/'
	}

	if (env == 'certificacion') {
		config.tokenUrl = '';
		config.tokenResource = '';
		config.tokenBearer = ''
		config.subscriptionKey = '';
	}
	
	if (env == 'produccion') {
		config.tokenUrl = '';
		config.tokenResource = '';
		config.tokenBearer = ''
		config.subscriptionKey = '';
	}

	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);
	karate.configure('logPrettyRequest', true);
	karate.configure('logPrettyResponse', true);
	karate.configure('ssl', true);
	return config;
}