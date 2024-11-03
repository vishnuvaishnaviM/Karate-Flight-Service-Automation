function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }

  // to configure retry mechanism globally 
  // karate.configure( 'retry', {count:5, interval:5000 })

  
  var config = {
    env: env,
    myVarName: 'someValue',
    baseUrl: 'https://gorest.co.in',
    airlineUrl: 'https://api.instantwebtools.net/',
    tokenID: 'cad0b87bb3d1f8c6d2303c0447495d1d125a633d727950a1f22dbb2c533f6286',
    userId: '6942306'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  //to configure callonce 
  //config.accessToken = karate.callSingle('callFeature1.feature')


  return config;
}