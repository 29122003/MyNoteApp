import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/database.dart';
import 'package:noteapp/person.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream? PersonStream;
  getpersonload() async {
    PersonStream = await DatabaseMethod().getPersonData();
    setState(() {});
  }
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
  void initState() {
    getpersonload();
    super.initState();
  }

  Widget AllPersonDetails() {
    return StreamBuilder(
        stream: PersonStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Name : " + ds["Name"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.pink[800]),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      NameController.text = ds["Name"];
                                          FatherNameController.text =
                                              ds["FatherName"];
                                          RegistrationNumberController.text =
                                              ds["RegistrationNumber"];
                                          AgeController.text = ds["Age"];
                                          DateofBirthController.text =
                                              ds["DateofBirth"];
                                          GenderController.text = ds["Gender"];
                                          PhoneNumberController.text =
                                              ds['PhoneNumber'];
                                          EmailController.text = ds["Email"];
                                          AddressController.text =
                                              ds["Address"];
                                          CityController.text = ds["City"];
                                          NationalityController.text =
                                              ds["Nationality"];
                                          EducationController.text =
                                              ds['Education'];
                                          BloodGroupController.text =
                                              ds['BloodGroup'];
                                          ReligionController.text =
                                              ds['Religion'];
                                          ExperienceController.text =
                                              ds['Experience'];
                                          FavoriteColorController.text =
                                              ds['FavoriteColor'];
                                          LanguageSpokenController.text =
                                              ds['LanguageSpoken'];
                                          EditPersonDetails(ds["id"]);
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  GestureDetector(
                                      onTap: () async {
                                        await DatabaseMethod()
                                            .DeleteUserInfo(ds["id"]);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Text('FatherName : ' +ds['FatherName'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                              color: Colors.purple)),
                          Text('RegistrationNumber : ' +ds['RegistrationNumber'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                              color: Colors.purple)),
                          Text(
                            "Age :  " + ds["Age"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),

                          Text(
                            "DateofBirth : " + ds["DateofBirth"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                          Text(
                            "Gender : " + ds["Gender"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                          Text(
                            "PhoneNumber : " + ds["PhoneNumber"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                          Text(
                            "Email : " + ds["Email"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                          Text(
                            "Address : " + ds["Address"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                          Text(
                            "City : " + ds["City"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                          Text(
                            "Nationality : " + ds["Nationality"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                          Text(
                            "Education : " + ds["Education"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                          Text(
                            "BloodGroup : " + ds["BloodGroup"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                          Text(
                            "Religion : " + ds["Religion"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                          Text(
                            "Experience : " + ds["Experience"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                          Text(
                            "FavoriteColor : " + ds["FavoriteColor"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                          Text(
                            "LanguageSpoken : " + ds["LanguageSpoken"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Myperson()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text(
                "People",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[800]),
              ),
              SizedBox(width: 7,),
              Text(
                "Record App",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[800]),
              ),
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
          child: Column(
            children: [Expanded(child: AllPersonDetails())],
          ),
        ),
      ),
    );
  }

  Future EditPersonDetails(String id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit Details",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[800]),
                  ),
                  GestureDetector(
                    child: Icon(Icons.cancel),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
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
padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
child: SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
                    mainAxisSize: MainAxisSize.min,
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
                  decoration: InputDecoration(border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10)),

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
                    backgroundColor: Colors.lightBlueAccent,
                    minimumSize: Size(double.infinity, 50)),
                onPressed: () async {
                  Map<String, dynamic> PersonUpdatedMap = {
                    'Name': NameController.text,
                    'FatherName': FatherNameController.text,
                    'RegistrationNumber': RegistrationNumberController.text,
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
                    "id": id,
                  };
                  await DatabaseMethod()
                      .UpdataUserInfo(id, PersonUpdatedMap)
                      .then((value) => Navigator.pop(context));
                },
                child: Text(
                  "Update",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
        ),
      )
      )
  );
}