
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler{




  //Méthode
  start() async {
    if(Platform.isAndroid){
      PermissionStatus storage = await Permission.storage.status;
      checkStorageAndroid(storage);

    }
    else
      {
        PermissionStatus photo = await Permission.photos.status;
        checkPhotosIos(photo);
      }
  }

  Future<PermissionStatus>checkStorageAndroid(PermissionStatus status) async{
    switch(status){
      case PermissionStatus.permanentlyDenied : return Future.error("L'utilisateur ne souhaite qu'on accède à ses photos");
      case PermissionStatus.denied : return Permission.storage.request().then((value) => checkStorageAndroid(value));
      case PermissionStatus.restricted : return Permission.storage.request().then((value) => checkStorageAndroid(value));
      case PermissionStatus.limited : return Future.error("Autoristion accepté");
      case PermissionStatus.granted : return Future.error("Autoristion accepté");
      default: return Future.error("L'application n'a pas pu récupérer le statuts");

    }
  }



  Future<PermissionStatus>checkPhotosIos(PermissionStatus status) async{
    switch(status){
      case PermissionStatus.permanentlyDenied : return Future.error("L'utilisateur ne souhaite qu'on accède à ses photos");
      case PermissionStatus.denied : return Permission.photos.request().then((value) => checkPhotosIos(value));
      case PermissionStatus.restricted : return Permission.photos.request().then((value) => checkPhotosIos(value));
      case PermissionStatus.limited : return Future.error("Autoristion accepté");
      case PermissionStatus.granted : return Future.error("Autoristion accepté");
      default: return Future.error("L'application n'a pas pu récupérer le statuts");

    }
  }



}