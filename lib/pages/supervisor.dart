import 'package:flutter/material.dart';
import 'package:hackwave/widgets/Bottom.dart';
import 'package:hackwave/widgets/button.dart';

class Supervisor extends StatefulWidget {
  @override
  State<Supervisor> createState() => _SupervisorState();
}

class _SupervisorState extends State<Supervisor> {
  String selectedRole = 'AREA1'; // Set a valid default value
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAFBF1),
      body: Column(
        children: [
          AppBar(
            backgroundColor: Color(0xFF4CAF50),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Icon(
                  Icons.notifications,
                  color: Colors.amber,
                ),
              )
            ],
            title: Padding(
              padding: const EdgeInsets.only(left: 20.0),
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
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Report daily waste percentage',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
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
                  items: ['AREA1', 'AREA2', 'AREA3']
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
                Button(text: 'Submit', funtion: (){})
              ],
            ),
          ),
          Spacer(),
          Bottom(),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
