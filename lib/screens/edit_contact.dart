import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/providers/authentication_provider.dart';
import 'package:sample/widgets/app_bar.dart';
import 'package:sample/widgets/button.dart';

class EditContact extends StatefulWidget {
  final Contact? contact;

  const EditContact({Key? key, this.contact}) : super(key: key);

  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  final key = GlobalKey<FormState>();

  String name = '';
  String number = '';
  String email = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.contact!= null) {
      setState(() {
        name = widget.contact!.name;
        number = widget.contact!.number;
        email = widget.contact!.email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var contactProvider = Provider.of<ContactProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myBar(context, title: widget.contact != null ? 'EDIT CONTACT': 'NEW CONTACT'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: key,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(hintText: 'Input Name', label: Text('Name')),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Invalid Input';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  name = value!;
                },
              ),
              TextFormField(
                initialValue: email,
                decoration: InputDecoration(hintText: 'Input Email', label: Text('Email')),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Invalid Input';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
              TextFormField(
                initialValue: number,
                decoration: InputDecoration(hintText: 'Input Number', label: Text('Number')),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Invalid Input';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  number = value!;
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                title: 'Save',
                onPressed: () {
                  bool valid = key.currentState!.validate();

                  if (valid) {
                    key.currentState?.save();
                    if (widget.contact != null) {
                      contactProvider.update(widget.contact!.id, data: {
                        'name': name,
                        'number': number,
                        'email': email,
                      });
                    } else {
                     Contact contact = Contact(
                       name: name,
                       number: number,
                       email: email,
                       id: "$number$name",
                     );
                      contactProvider.create(contact);
                    }
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
