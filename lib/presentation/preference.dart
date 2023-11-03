import 'package:flutter/material.dart';

class PreferencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Preference Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              delegate: SliverChildListDelegate(
                [
                  buildPreferenceBuilder(), // First Builder
                  buildAllergiesBuilder(), // Second Builder
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Allergies Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPreferenceBuilder() {
    // Your code for the first builder (Preference Builder)
    return Container(
      color: Colors.blue,
      height: 150, // Set your preferred height
      child: Center(
        child: Text('Preference Builder'),
      ),
    );
  }

  Widget buildAllergiesBuilder() {
    // Your code for the second builder (Allergies Builder)
    return Container(
      color: Colors.orange,
      height: 150, // Set your preferred height
      child: Center(
        child: Text('Allergies Builder'),
      ),
    );
  }
}
