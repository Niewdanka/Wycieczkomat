import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wycieczkomat_app/back_button_widget.dart';
import 'package:wycieczkomat_app/models/activity.dart';
import 'package:wycieczkomat_app/models/enums.dart';
import 'package:wycieczkomat_app/models/place.dart';

import 'package:wycieczkomat_app/models/user_trip.dart';
import 'package:wycieczkomat_app/providers/user_trips.dart';

class AddUserTripScreen extends StatefulWidget {
  const AddUserTripScreen({Key? key}) : super(key: key);
  static const routeName = '/add-user-trip';

  @override
  _AddUserTripScreenState createState() => _AddUserTripScreenState();
}

class _AddUserTripScreenState extends State<AddUserTripScreen> {
  final _pictureFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _cityFocusNode = FocusNode();
  final _ratingFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  var _newUserTrip = UserTrip(
    personalOpinion: '',
    transportType: TransportType.Bus,
    accomodation: Accomodation.HotelRoom,
    activities: [
      Activity(
        category: '',
        name: '',
      ),
    ],
    description: '',
    id: '',
    name: '',
    pictures: [''],
    place: Place(
      city: '',
      country: Country.Greece,
      description: '',
      safetyLevel: '',
    ),
    price: 0,
    rating: 0,
  );

  Widget buildTextField(
    String name,
    IconData icon,
    TextInputAction textInputAction,
    String? Function(String?)? validator,
    void Function(String)? onFieldSubmitted,
    FocusNode focusNode,
    void Function(String?)? onSaved,
    TextInputType keyboartType,
  ) {
    return Container(
      margin: EdgeInsets.all(12),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: name,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorStyle: TextStyle(color: Colors.red),
          prefixIcon: Icon(
            icon,
          ),
        ),
        keyboardType: keyboartType,
        textInputAction: textInputAction,
        validator: validator,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
      ),
    );
  }

  void _saveForms() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    Provider.of<UserTrips>(
      context,
      listen: false,
    ).addUserTrip(_newUserTrip);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _cityFocusNode.dispose();
    _pictureFocusNode.dispose();
    _priceFocusNode.dispose();
    _ratingFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(color: Colors.black),
        title: Text(
          'Dodaj wycieczkę',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField(
                'Nazwa',
                Icons.assessment_outlined,
                TextInputAction.next,
                (value) {
                  if (value!.isEmpty) {
                    return 'Proszę wypełnić pole';
                  }
                  return null;
                },
                (_) => FocusScope.of(context).requestFocus(_priceFocusNode),
                FocusNode(),
                (value) => {
                  _newUserTrip = UserTrip(
                    personalOpinion: _newUserTrip.personalOpinion,
                    transportType: _newUserTrip.transportType,
                    accomodation: _newUserTrip.accomodation,
                    activities: _newUserTrip.activities,
                    description: _newUserTrip.description,
                    id: _newUserTrip.id,
                    name: value,
                    pictures: _newUserTrip.pictures,
                    place: _newUserTrip.place,
                    price: _newUserTrip.price,
                    rating: _newUserTrip.rating,
                  ),
                },
                TextInputType.text,
              ),
              buildTextField(
                'Cena',
                Icons.attach_money_outlined,
                TextInputAction.next,
                (value) {
                  if (value!.isEmpty) {
                    return 'Proszę wypełnić pole';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Proszę wpisać liczbę';
                  }
                  if (double.tryParse(value)! <= 0) {
                    return 'Proszę wpisać liczbę większa od 0';
                  }
                  return null;
                },
                (_) => FocusScope.of(context).requestFocus(_cityFocusNode),
                _priceFocusNode,
                (value) => {
                  _newUserTrip = UserTrip(
                    personalOpinion: _newUserTrip.personalOpinion,
                    transportType: _newUserTrip.transportType,
                    accomodation: _newUserTrip.accomodation,
                    activities: _newUserTrip.activities,
                    description: _newUserTrip.description,
                    id: _newUserTrip.id,
                    name: _newUserTrip.name,
                    pictures: _newUserTrip.pictures,
                    place: _newUserTrip.place,
                    price: double.parse(value!),
                    rating: _newUserTrip.rating,
                  ),
                },
                TextInputType.number,
              ),
              buildTextField(
                'Miasto',
                Icons.location_city,
                TextInputAction.next,
                (value) {
                  if (value!.isEmpty) {
                    return 'Proszę wypełnić pole';
                  }
                  return null;
                },
                (_) => FocusScope.of(context).requestFocus(_pictureFocusNode),
                _cityFocusNode,
                (value) => {
                  _newUserTrip = UserTrip(
                    personalOpinion: _newUserTrip.personalOpinion,
                    transportType: _newUserTrip.transportType,
                    accomodation: _newUserTrip.accomodation,
                    activities: _newUserTrip.activities,
                    description: _newUserTrip.description,
                    id: _newUserTrip.id,
                    name: _newUserTrip.name,
                    pictures: _newUserTrip.pictures,
                    place: Place(
                      city: value,
                      country: Country.Greece,
                      description: 'null',
                      safetyLevel: 'null',
                    ),
                    price: _newUserTrip.price,
                    rating: _newUserTrip.rating,
                  ),
                },
                TextInputType.text,
              ),
              buildTextField(
                'Zdjęcie',
                Icons.add_photo_alternate_outlined,
                TextInputAction.next,
                (value) {
                  if (value!.isEmpty) {
                    return 'Proszę wypełnić pole';
                  }
                  return null;
                },
                (_) => FocusScope.of(context).requestFocus(_ratingFocusNode),
                _pictureFocusNode,
                (value) => {
                  _newUserTrip = UserTrip(
                    personalOpinion: _newUserTrip.personalOpinion,
                    transportType: _newUserTrip.transportType,
                    accomodation: _newUserTrip.accomodation,
                    activities: _newUserTrip.activities,
                    description: _newUserTrip.description,
                    id: _newUserTrip.id,
                    name: _newUserTrip.name,
                    pictures: [value],
                    place: _newUserTrip.place,
                    price: _newUserTrip.price,
                    rating: _newUserTrip.rating,
                  ),
                },
                TextInputType.text,
              ),
              buildTextField(
                'Ocena',
                Icons.star_border_outlined,
                TextInputAction.done,
                (value) {
                  if (value!.isEmpty) {
                    return 'Proszę wypełnić pole';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Proszę wpisać liczbę';
                  }
                  if (double.tryParse(value)! <= 0) {
                    return 'Proszę wpisać liczbę większa od 0';
                  }
                  if (double.tryParse(value)! > 5) {
                    return 'Proszę wpisać liczbę nie większa niż 5';
                  }
                  return null;
                },
                (_) => null,
                _ratingFocusNode,
                (value) => {
                  _newUserTrip = UserTrip(
                    personalOpinion: _newUserTrip.personalOpinion,
                    transportType: _newUserTrip.transportType,
                    accomodation: _newUserTrip.accomodation,
                    activities: _newUserTrip.activities,
                    description: _newUserTrip.description,
                    id: _newUserTrip.id,
                    name: _newUserTrip.name,
                    pictures: _newUserTrip.pictures,
                    place: _newUserTrip.place,
                    price: _newUserTrip.price,
                    rating: int.parse(value!),
                  ),
                },
                TextInputType.number,
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: _saveForms,
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
