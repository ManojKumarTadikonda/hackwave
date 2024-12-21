import 'package:flutter/material.dart';
import 'package:hackwave/pages/Users/userhome.dart';

class Userreport extends StatefulWidget {
  @override
  _UserreportState createState() => _UserreportState();
}

class _UserreportState extends State<Userreport> {
  bool isEvent = false; // Toggle value
  String? selectedLocation; // Selected location
  DateTime? eventDate; // Selected date
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _descriptionController = TextEditingController();

  final List<String> areas = [
  "MVP Colony",
  "Gajuwaka",
  "Dwaraka Nagar",
  "RK Beach",
  "Seethammadhara",
  "Kailasagiri",
  "Madhurawada",
  "Arilova",
  "Pendurthi",
  "Bheemunipatnam",
  "Anakapalle",
  "Yendada",
  "Chinna Waltair",
  "Kancharapalem",
  "Isukathota",
  "Simhachalam",
  "Town Kotha Road",
  "Old Gajuwaka",
  "Steel Plant Township",
  "Daba Gardens",
  "Lawsons Bay Colony",
  "Chodavaram",
  "NAD Junction",
  "Kancherapalem",
  "Malkapuram",
  "Pedagantyada",
  "Port Area",
  "Railway New Colony",
  "Adavivaram",
  "China Mushidiwada",
  "Beach Road",
  "Kapuluppada"
];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != eventDate) {
      setState(() {
        eventDate = pickedDate;
      });
    }
  }

  void _submitReport() {
    if (_formKey.currentState?.validate() ?? false) {
      final String description = _descriptionController.text;
      final String date = eventDate?.toLocal().toString().split(' ')[0] ?? '';
      final String location = selectedLocation ?? '';

      print("Event Description: $description");
      print("Event Date: $date");
      print("Event Location: $location");

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Report Submitted"),
            content: Text(
                "Description: $description\nDate: $date\nLocation: $location"),
            actions: [
              TextButton(
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Userhome()))
                },
                child: const Text("Close"),
              ),
            ],
          );
        },
      );

      setState(() {
        isEvent = false;
        selectedLocation = null;
        eventDate = null;
        _descriptionController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency Report"),
        backgroundColor: const Color(0xFF4CAF50),
      ),
      backgroundColor: const Color(0xFFEAFBF1),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Is there an event?",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        SwitchListTile(
                          title: Text(isEvent ? "Yes" : "No"),
                          value: isEvent,
                          onChanged: (bool value) {
                            setState(() {
                              isEvent = value;
                            });
                          },
                          activeColor: const Color(0xFF4CAF50),
                        ),
                        const SizedBox(height: 20),
                        if (isEvent) ...[
                          const Text(
                            "Event Description",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              hintText: "Enter event description",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a description";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Event Date",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () => _selectDate(context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(
                                eventDate == null
                                    ? "Select Date"
                                    : eventDate!
                                        .toLocal()
                                        .toString()
                                        .split(' ')[0],
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black87),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Event Location",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField<String>(
                            value: selectedLocation,
                            hint: const Text("Select Location"),
                            items: areas.map((String area) {
                              return DropdownMenuItem<String>(
                                value: area,
                                child: Text(area),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedLocation = newValue;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please select a location";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        const Spacer(),
                        Center(
                          child: ElevatedButton(
                            onPressed: _submitReport,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4CAF50),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              "Submit Report",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
