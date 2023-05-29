import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataTarefaField extends StatelessWidget {
  final TextEditingController dateInput;
  final Function salvarDateInicio;
  final String text;

  const DataTarefaField(
      {super.key,
      required this.dateInput,
      required this.salvarDateInicio,
      required this.text});

  void initState() {
    dateInput.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        height: MediaQuery.of(context).size.width / 4,
        child: Center(
            child: TextField(
          controller: dateInput,
          decoration: InputDecoration(
              icon: const Icon(Icons.calendar_today), labelText: text),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2100));

            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);

              salvarDateInicio(formattedDate);
            } else {}
          },
        )));
  }
}
