import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:found_and_lost_app/helpers/strings.dart';
import 'package:found_and_lost_app/store_controllers/create_item_store.dart';
import 'package:found_and_lost_app/store_controllers/zip_code_store.dart';
import 'package:found_and_lost_app/widgets/text_field_container.dart';
import 'package:brasil_fields/brasil_fields.dart';

class ZipCodeField extends StatelessWidget {

  ZipCodeField(this.createStore) : zipCodeStore = createStore.zipCodeStore;

  final CreateStore createStore;
  final ZipCodeStore zipCodeStore;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFieldContainer(
            child: TextFormField(
              onChanged: zipCodeStore.setZipCode,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
              decoration: InputDecoration(
                hintText: Strings.ZIP_CODE_TEXT_FORM_HINT,
                labelStyle: TextStyle(fontWeight: FontWeight.w800),
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
            ),
          ),
          Observer(
            builder: (_){
              if(zipCodeStore.address == null && zipCodeStore.error == null && !zipCodeStore.loading){
                return Container();
              } else if (zipCodeStore.address == null && zipCodeStore.error == null){
                return Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.yellowAccent,
                    valueColor: AlwaysStoppedAnimation(
                      Colors.yellow,
                    ),
                  ),
                );
              } else if (zipCodeStore.error != null){
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red.withAlpha(100),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(8),
                  child: Text(zipCodeStore.error, style: TextStyle(color: Colors.white),),
                );
              } else {
                final address = zipCodeStore.address;
                return Container(
                  margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.yellow.withAlpha(100),
                      borderRadius: BorderRadius.circular(29),
                    ),
                    alignment: Alignment.center,
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      '${Strings.ZIP_CODE_LOCATION_TEXT} ${address.district}, ${address.city.name} - ${address.uf.initials}',
                      style: TextStyle(
                        color: Colors.black54
                      ),
                    ),
                );
              }
            },
          ),
        ],
    );
  }
}
