import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

FirebaseAuth _auth = FirebaseAuth.instance;

Future<List> getUsers() async {
  List users = [];
  CollectionReference collectionReference = db.collection('users');
  QuerySnapshot queryUsers = await collectionReference.get();

  queryUsers.docs.forEach((document) {
    users.add(document.data());
  });

  return users;
}

final currentUserId = _auth.currentUser?.uid;
// Obtener ID del usuario
String? getUID() {
  return currentUserId;
}

// Agregar usuario a la base de datos
Future<void> addUser(String uid, String username, String email,
    String selectedGender, String country, String department, String city,
    {String? password, String? image, int? coins}) async {
  FirebaseFirestore.instance.collection('users').doc(uid).set({
    'username': username,
    'email': email,
    'password': password,
    'gender': selectedGender,
    'country': country,
    'department': department,
    'city': city,
    'image': image,
    'coins': coins
  }, SetOptions(merge: true));
}

// Obtener la cantidad actual de monedas del usuario
Future<int> getCoins() async {
  final documentSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(currentUserId).get();

  if (documentSnapshot.exists) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    final coins = data['coins'] as int;
    return coins;
  } else {
    // El documento no existe, puedes manejar esta situación según tus necesidades
    return 0; // Otra cantidad predeterminada si el documento no existe
  }
}

// Actualizar monedas de un usuario
Future<void> updateCoins(int newCoins) async {
  await FirebaseFirestore.instance.collection('users').doc(currentUserId).update({
    'coins': newCoins,
  });
}

// Obtener datos de un usuario específico basado en su id
Future<Map<String, dynamic>> getUserByID(String uid) async {
  DocumentReference docRef = db.collection('users').doc(uid);
  DocumentSnapshot docSnapshot = await docRef.get();

  if (docSnapshot.exists) {
    return docSnapshot.data() as Map<String, dynamic>;
  } else {
    return {}; // No existe el usuario
  }
}

// Agregar imagen del usuario
Future<String> uploadDefaultProfileImage(String uid, {File? image}) async {
  final Reference storageRef =
      FirebaseStorage.instance.ref().child('profile_images').child('$uid.jpeg');

  // Cargar la imagen
  if (image == null) {
    // Si no se proporciona una imagen, usa la predeterminada desde los assets
    final ByteData byteData =
        await rootBundle.load('assets/images/profileDefault.jpeg');
    final Uint8List imageData =
        Uint8List.fromList(byteData.buffer.asUint8List());
    final UploadTask uploadTask = storageRef.putData(imageData);
    await uploadTask.whenComplete(() => {});
  } else {
    // Si se proporciona una imagen, la sube
    final UploadTask uploadTask = storageRef.putFile(image);
    await uploadTask.whenComplete(() => {});
  }
  final String downloadUrl = await storageRef.getDownloadURL();

  await FirebaseFirestore.instance.collection('users').doc(uid).update({
    'image': downloadUrl,
  });

  return downloadUrl;
}
