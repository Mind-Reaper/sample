import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactProvider with ChangeNotifier {
  final contactRef = FirebaseFirestore.instance.collection('contacts');

  List<Contact> contacts = [];

  create(Contact contact) {
    contactRef.doc(contact.id).set(contact.toJson());
    get();
  }

  update(String id, {Map<String, Object?>? data}) {
    contactRef.doc(id).update(data!);
    get();
  }



  delete(String id)  {
    contactRef.doc(id).delete();
    get();
  }

  Future<void> get() async  {
  QuerySnapshot contacts = await contactRef.get();
  List<Contact> list  = contacts.docs.map<Contact>((doc) => Contact.fromJson(doc.data())).toList();
  this.contacts = list;
  notifyListeners();
  }

 // Future<Contact> getPersonal(String id) async {
 //    DocumentSnapshot snapshot = await contactRef.doc(id).get();
 //    Contact contact = Contact.fromJson(snapshot.data());
 //    return contact;
 //
 // }


}

class Contact {
  final String name;
  final String number;
  final String email;
  final String id;
  final int likes;

  Contact(
      {this.name: 'daniel',
      this.number: '343452469',
      this.email: 'onadipedaniel@gmail.com',
      this.id: '1',
      this.likes: 0});

  factory Contact.fromJson(doc) {
    return Contact(
      name: doc['name'],
      number: doc['number'],
      email: doc['email'],
      id: doc['id'],
     likes: doc['likes']
    );
  }

  Map<String, Object> toJson () {
    return {
      'name': name,
      'number': number,
      "email": email,
      'id': id,
     'likes': likes
    };
  }


}
