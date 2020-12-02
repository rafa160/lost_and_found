class ApiRoutesIGBE {
  static const initialRoute = 'https://servicodados.ibge.gov.br/';
  static const version = 'api/v1/';
  static const statesRoutes = 'localidades/estados/';
  static const cities = 'municipios';

  static const  route = '$initialRoute$version$statesRoutes';


  //via cep api
  static const viaCepApi = 'http://viacep.com.br/ws/';
  static const jsonFormat = '/json';
  static const xmlFormat = '/xml';
}