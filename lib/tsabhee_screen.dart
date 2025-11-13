
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nakshbandhi/widgets/globar_counting_tasbhee.dart';

class TasbihCounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TasbihCounterWidget(),
              Divider(height: 32),
              Text(
                'My Submission Summary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(

                  children: [
                    buildSubmissionRow('Durud', Colors.pink, 0),
                    buildSubmissionRow('Dalayl al-Khayrat', Colors.green, 0),
                    buildSubmissionRow('Hizb al-Bahr', Colors.orange, 0),
                    buildSubmissionRow('Khatam e Khwajgan', Colors.purple, 0),
                    buildSubmissionRow('Qur\'an - Full', Colors.red, 0),
                    buildSubmissionRow('Qur\'an - Surah', Colors.blue, 0),
                    CollectionPeriodWidget()

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildSubmissionRow(String name, Color color, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              name,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Text('$count', style: TextStyle(fontSize: 16))
        ],
      ),
    );
  }
}


class TasbihCounterWidget extends StatefulWidget {
  const TasbihCounterWidget({super.key});

  @override
  State<TasbihCounterWidget> createState() => _TasbihCounterWidgetState();
}

class _TasbihCounterWidgetState extends State<TasbihCounterWidget> {
  final TextEditingController _controller = TextEditingController();
  String _selectedItem = 'Durud';
  final List<String> _items = ['Durud', 'Tasbih', 'Kalima', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40,),
        const Text(
          'Tasbih Counter',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Submit your recitation for the Annual Milad-un-Nabi ﷺ gathering in Leeds. Event date: Sunday 30th June 2024',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedItem,
              isExpanded: true,
              items: _items
                  .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value!;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter here',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  // Handle submission logic here
                  debugPrint(
                      'Submitted: ${_controller.text} for $_selectedItem');
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
