import 'package:flutter/material.dart';
import 'package:hackwave/widgets/Bottom.dart';
import 'package:hackwave/widgets/button.dart';

class Supervisor extends StatefulWidget {
  @override
  State<Supervisor> createState() => _SupervisorState();
}

class _SupervisorState extends State<Supervisor> {
  String selectedRole = "MVP Colony"; // Set a valid default value
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAFBF1),
      body: Column(
        children: [
          AppBar(
            backgroundColor: const Color(0xFF4CAF50),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: GestureDetector(
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder:(context)=>),);
                  },
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.amber,
                  ),
                ),
              ),
            ],
            title: const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Supervisor',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Report daily waste percentage',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  value: selectedRole,
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Select Role',
                    labelStyle: const TextStyle(
                        color: Colors.green, fontSize: 16), // Label styling
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Colors.green, // Border color
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        width: 2.0,
                      ),
                    ),
                  ),
                  dropdownColor:
                      Colors.lightGreen[100], // Background color for dropdown
                  icon: const Icon(Icons.arrow_drop_down,
                      color: Colors.black), // Dropdown arrow icon
                  items: [
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
                  ]
                      .map((role) => DropdownMenuItem(
                            value: role,
                            child: Text(
                              role,
                              style: TextStyle(
                                color: Colors.green[800], // Text color
                                fontSize: 16, // Font size
                                fontWeight: FontWeight.bold, // Bold text
                              ),
                            ),
                          ))
                      .toList(),
                  style: TextStyle(
                    color: Colors.green[900], // Text style of the selected item
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Waset Percentage(1-100)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Button(text: 'Submit', funtion: () {})
              ],
            ),
          ),
          const Spacer(),
          Bottom(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}