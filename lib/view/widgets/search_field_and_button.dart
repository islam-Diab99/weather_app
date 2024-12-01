import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

class SearchFieldAndButton extends StatelessWidget {
  const SearchFieldAndButton({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 222, 219, 219),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              controller: searchController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'Enter City',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                filled: false,
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                border: InputBorder.none,
                
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            final city = searchController.text.trim();

            if (city.isEmpty) {
               ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please enter a city name.'),
                  backgroundColor: Colors.red,
                ),
              );
              return;
            }

            final weatherProvider =
                Provider.of<WeatherProvider>(context, listen: false);
            weatherProvider.fetchWeather(city);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 222, 219, 219),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15), // Button color
          ),
          child: const Icon(Icons.search, color: Colors.teal),
        ),
      ],
    );
  }
}
