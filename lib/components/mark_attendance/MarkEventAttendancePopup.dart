import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qrbats_sp/models/QRCodeDetails.dart';

void markEventAttendancePopup(BuildContext context, Function markAttendance,EventQRCodeDetails event) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero, // Remove default padding
        content: Container(
          decoration: _alertBoxDecoration, // Use the custom decoration
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Center(child: const Text("Mark Attendance",style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.eventName,
                        style: const TextStyle(fontSize: 12, color: Colors.black,fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Date : ${event!.eventDate}",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Start Time : ${event!.eventTime}",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "End Time : ${event!.eventEndTime}",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Venue : ${event!.eventVenue}",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),

                    ],
                  ),
                ),
              ),
              ButtonBar(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      markAttendance();
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.green),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      "Attend",
                      style: TextStyle(fontSize: 12, color: Colors.green),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

// Define the custom BoxDecoration
final BoxDecoration _alertBoxDecoration = BoxDecoration(
  color: Colors.white, // Background color
  borderRadius: BorderRadius.circular(15.0), // Corner radius
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.5), // Shadow color
      spreadRadius: 1, // Spread radius
      blurRadius: 10, // Blur radius
      offset: Offset(0, 3), // Shadow position
    ),
  ],
);
