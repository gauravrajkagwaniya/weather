String baseUrl = 'http://api.weatherstack.com/';
bool isProduction = false;
String sentryDSNUrl = '';

//TODO to use this pass this variable while running app using => --dart-define=secretClientId=my_value
const secretClientId = String.fromEnvironment('e5e9ed5a38a1bb9a0cfcbfafa2a1d996');

void setupEnv(Environment env) {
  switch (env) {
    case Environment.dev:
      {
        baseUrl = 'http://api.weatherstack.com/';
        break;
      }

    case Environment.prod:
      {
        isProduction = true;
        baseUrl = 'http://api.weatherstack.com/';
        break;
      }
    case Environment.stag:
      {
        isProduction = true;
        baseUrl = 'http://api.weatherstack.com/';
        break;

      }
  }
}

enum Environment { dev, prod, stag }