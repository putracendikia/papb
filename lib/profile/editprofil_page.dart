import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  DateTime? _dateTime = DateTime.now();
  String? _selectedTime = null;
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Versi Aplikasi',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Lengkap',
                      style: GoogleFonts.plusJakartaSans(
                        color: Color.fromARGB(255, 99, 99, 102),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: const Color.fromARGB(255, 199, 199, 204)),
                      ),
                      height: 52,
                      child: TextField(
                        keyboardType: TextInputType.name,
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(14.0),
                          hintText: 'Nama Anda',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 142, 142, 147),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nomor Telepon',
                      style: GoogleFonts.plusJakartaSans(
                        color: Color.fromARGB(255, 99, 99, 102),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: const Color.fromARGB(255, 199, 199, 204)),
                      ),
                      height: 52,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(14.0),
                          hintText: '080XXXXXXX',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 142, 142, 147),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jenis Kelamin',
                      style: GoogleFonts.plusJakartaSans(
                        color: Color.fromARGB(255, 99, 99, 102),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 1000,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 244, 225, 182),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      alignment: Alignment.center,
                      child: ToggleSwitch(
                        minWidth: 170.0,
                        minHeight: 44.0,
                        initialLabelIndex: 0,
                        totalSwitches: 2,
                        labels: const ['Pria', 'Wanita'],
                        cornerRadius: 8.0,
                        activeBgColor: const [
                          Color.fromARGB(255, 255, 250, 235)
                        ],
                        activeFgColor: Colors.black,
                        inactiveBgColor:
                            const Color.fromARGB(255, 244, 225, 182),
                        customTextStyles: [
                          GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600)
                        ],
                        fontSize: 14.0,
                        borderWidth: 5.0,
                        borderColor: const [Color.fromARGB(255, 244, 225, 182)],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanggal Lahir',
                      style: GoogleFonts.plusJakartaSans(
                        color: Color.fromARGB(255, 99, 99, 102),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: const Color.fromARGB(255, 199, 199, 204)),
                      ),
                      height: 52,
                      child: TextField(
                        controller: _date,
                        onTap: () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20.0))),
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: EdgeInsets.all(32.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Masukkan Tanggal lahirmu',
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      SizedBox(
                                        height: 200,
                                        child: CupertinoDatePicker(
                                            mode: CupertinoDatePickerMode.date,
                                            initialDateTime: _dateTime,
                                            onDateTimeChanged: (datetime) {
                                              setState(() {
                                                _dateTime = datetime;
                                                _selectedTime =
                                                    DateFormat('yMd')
                                                        .format(datetime);
                                              });
                                            }),
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _date.text =
                                                _selectedTime.toString();
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Container(
                                          width: 350,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 153, 110, 56),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Simpan',
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(14.0),
                          hintText: 'DD/MM/YY',
                          hintStyle: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 142, 142, 147),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kota Anda',
                      style: GoogleFonts.plusJakartaSans(
                        color: Color.fromARGB(255, 99, 99, 102),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: const Color.fromARGB(255, 199, 199, 204)),
                      ),
                      height: 52,
                      child: TextField(
                        keyboardType: TextInputType.name,
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(14.0),
                          hintText: 'Nama Kota Anda',
                          hintStyle: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 142, 142, 147),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    width: 350,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 153, 110, 56),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        'Simpan Profil',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
