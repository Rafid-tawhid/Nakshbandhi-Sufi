import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NamazTimings extends StatefulWidget {
  @override
  _NamazTimingsState createState() => _NamazTimingsState();
}

class _NamazTimingsState extends State<NamazTimings> {
  bool isHanafi = true;

  final List<Map<String, String>> prayerTimes = [
    {'name': 'Fajr', 'time': '04:15', 'color': 'pink'},
    {'name': 'Dhuhr', 'time': '13:06', 'color': 'green'},
    {'name': 'Asr', 'time': '17:54', 'color': 'orange'},
    {'name': 'Maghrib', 'time': '20:08', 'color': 'purple'},
    {'name': 'Isha', 'time': '21:59', 'color': 'red'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: Image.asset('images/masq.png',height: 140,)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Namaz Timings',style: TextStyle(fontSize: 22),),
                    Row(
                      children: [
                        const Text('Hanafi', style: TextStyle(color: Colors.black, fontSize: 14)),
                        Switch(
                          value: isHanafi,
                          onChanged: (value) {
                            setState(() {
                              isHanafi = value;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
                ...prayerTimes.map((prayer) => buildPrayerRow(prayer)).toList(),
                const SizedBox(height: 24),
                const Text('Next Prayer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('13:06', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text('4 Minutes left till Dhuhr', style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('View Qibla', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPrayerRow(Map<String, String> prayer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Container(
                width: 4,
                height: 40,
                decoration: BoxDecoration(
                  color: getColor(prayer['color']!),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                prayer['name']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.grey,
                  size: 16,
                ),
                SizedBox(width: 8),
                Text(
                  prayer['time']!,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Color getColor(String colorName) {
    switch (colorName) {
      case 'pink':
        return Colors.pink;
      case 'green':
        return Colors.green;
      case 'orange':
        return Colors.orange;
      case 'purple':
        return Colors.purple;
      case 'red':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}