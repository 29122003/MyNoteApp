import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noteapp/database.dart';
import 'package:random_string/random_string.dart';

class Myperson extends StatefulWidget {
  const Myperson({super.key});


  @override
  State<Myperson> createState() => _MypersonState();
}

class _MypersonState extends State<Myperson> {
  TextEditingController NameController=new TextEditingController();
  TextEditingController FatherNameController = new TextEditingController();
  TextEditingController RegistrationNumberController = new TextEditingController();
  TextEditingController AgeController=new TextEditingController();
  TextEditingController DateofBirthController=new TextEditingController();
  TextEditingController GenderController=new TextEditingController();
  TextEditingController PhoneNumberController = new TextEditingController();
 TextEditingController EmailController = new TextEditingController();
  TextEditingController AddressController=new TextEditingController();
  TextEditingController CityController=new TextEditingController();
  TextEditingController NationalityController = new TextEditingController();
  TextEditingController EducationController = new TextEditingController();
  TextEditingController BloodGroupController = new TextEditingController();
  TextEditingController ReligionController = new TextEditingController();
  TextEditingController ExperienceController = new TextEditingController();
  TextEditingController FavoriteColorController = new TextEditingController();
  TextEditingController LanguageSpokenController = new TextEditingController();
  String? gender='Male';



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text('Person', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink[800]),
              ),
              SizedBox(width: 7,),
              Text('Firebase Form', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                  color: Colors.pink[800]),
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: NameController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Father Name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: FatherNameController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10),
                Text('Registration Number', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: RegistrationNumberController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Age', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: AgeController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Date of Birth', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: DateofBirthController,
                    onTap: ()async{
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (selectedDate != null) {
                        String formattedDate = "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                        DateofBirthController.text = formattedDate;
                      }
                    },
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Gender', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),

                  child: Row(
                    children: [

                      Radio(
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                            GenderController.text = gender!;
                          });
                        },
                      ),
                      Text('Male'),
                      Radio(
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                            GenderController.text = gender!;
                          });
                        },
                      ),
                      Text('Female'),
                      Radio(
                        value: 'Other',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                            GenderController.text = gender!;
                          });
                        },
                      ),
                      Text('Other'),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text('Phone Number', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: PhoneNumberController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Email', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: EmailController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Address', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: AddressController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10,),
                Text('City', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: CityController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Nationality', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: NationalityController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Education', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: EducationController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Blood Group', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: BloodGroupController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),

                  ),
                ),
                SizedBox(height: 10,),
                Text('Religion', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: ReligionController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Experience', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: ExperienceController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Favorite Color', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: FavoriteColorController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10),
                Text('Language Spoken', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: LanguageSpokenController,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),

                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple
                  ),
                  onPressed: ()async{
                    String Id=randomAlphaNumeric(5);
                    Map<String,dynamic> PersonInfoMap= {
                      'Name': NameController.text,
                      'FatherName': FatherNameController.text,
                      'RegistrationNumber': RegistrationNumberController.text,
                      "id":Id,
                      'Age': AgeController.text,
                      'DateofBirth': DateofBirthController.text,
                      'Gender': GenderController.text,
                      'PhoneNumber': PhoneNumberController.text,
                      'Email': EmailController.text,
                      'Address': AddressController.text,
                      'City': CityController.text,
                      'Nationality': NationalityController.text,
                      'Education': EducationController.text,
                      'BloodGroup': BloodGroupController.text,
                      'Religion': ReligionController.text,
                      'Experience': ExperienceController.text,
                      'FavoriteColor': FavoriteColorController.text,
                  'LanguageSpoken': LanguageSpokenController.text,
                    };
                    await DatabaseMethod().addPersonRecord(PersonInfoMap, Id);
                    Fluttertoast.showToast(msg:"ADD RECORD SUCCESSFUL!");
                  },
                  child: Text('ADD RECORD',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}