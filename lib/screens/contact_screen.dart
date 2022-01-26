import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/providers/authentication_provider.dart';
import 'package:sample/screens/edit_contact.dart';
import 'package:sample/widgets/app_bar.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  @override
  Widget build(BuildContext context) {
    var contactProvider = Provider.of<ContactProvider>(context);
    return RefreshIndicator(
      onRefresh: contactProvider.get,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: myBar( context, title: 'Contacts', actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> EditContact()));
          }, icon: Icon(Icons.add))

        ]),
        body: ListView.builder(
          itemCount: contactProvider.contacts.length,
          itemBuilder: (context, index) {
            Contact contact = contactProvider.contacts[index];
      return ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> EditContact(contact: contact,)));
        },
          onLongPress: () {
          contactProvider.delete(contact.id);
          },
        title: Text(contact.name),
        subtitle: Text(contact.email),
        trailing: Column(
          children: [
            Text(contact.likes.toString()),
          SizedBox(height: 2),
          GestureDetector(
            onTap: () {
contactProvider.update(contact.id, data: {'likes': contact.likes+1});
            },
              child: Icon(Icons.favorite)),
          ],
        )

      );
      })
      ),
    );
  }
}
