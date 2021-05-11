import 'package:bytebank_db/dao/contact_dao.dart';
import 'package:bytebank_db/models/Contact.dart';
import 'package:flutter/material.dart';

const String _appBarTitle = 'New contact';
const String _fullName = 'Full name';
const String _accountNumber = 'Account number';
const String _createButtonText = 'Create';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
  TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: _fullName,
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: _accountNumber,
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text(
                    _createButtonText,
                  ),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int accountNumeber =
                    int.tryParse(_accountNumberController.text);
                    final Contact newContact = Contact(0, name, accountNumeber);
                    _dao.save(newContact).then(
                          (id) => Navigator.pop(context),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
