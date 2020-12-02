import 'package:dio/dio.dart';
import 'package:found_and_lost_app/helpers/api/api_routes_ibge.dart';
import 'package:found_and_lost_app/models/address.dart';
import 'package:found_and_lost_app/models/location/city.dart';
import 'package:found_and_lost_app/service/ibge_service.dart';

class ZipCodeService {

  Dio dio = new Dio();

 // ignore: missing_return
 Future<Address> getAddressFromApi(String zipCode) async {
    if (zipCode == null || zipCode.isEmpty) {
      return Future.error('CEP inválido');
    }
    final clearedZipCode = zipCode.replaceAll(RegExp('[^0-9]'), '');
    if (clearedZipCode.length != 8) {
      return Future.error('CEP inválido');
    }

    final endpoint = '${ApiRoutesIGBE.viaCepApi}$clearedZipCode${ApiRoutesIGBE.jsonFormat}';

    try{
      final response = await dio.get<Map>(endpoint);

      if(response.data.containsKey('erro') && response.data['erro'])
        return Future.error('CEP inválido');

      final ufList = await IbgeService().getUFList();

      return Address(
          zipCode: response.data['cep'],
          district: response.data['bairro'],
          city: City(name: response.data['localidade']),
          uf: ufList.firstWhere((uf) => uf.initials == response.data['uf']));
    } catch (e){
      Future.error('Falha ao buscar CEP');
    }
  }
}
