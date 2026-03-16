import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/scholarship.dart';
import '../widgets/scholarship_card.dart';
import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeChanged;
  const HomeScreen({super.key, required this.onThemeChanged});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manajemen Beasiswa"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.brightness_6), onPressed: widget.onThemeChanged),
          IconButton(icon: const Icon(Icons.logout), onPressed: () async {
            await supabase.auth.signOut();
            if (mounted) Navigator.pushReplacementNamed(context, '/');
          }),
        ],
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: supabase.from('scholarships').stream(primaryKey: ['id']),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (!snapshot.hasData || snapshot.data!.isEmpty) return const Center(child: Text("Belum ada data."));
          
          final listData = snapshot.data!.map((e) => Scholarship.fromMap(e)).toList();

          return ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) => ScholarshipCard(
              data: listData[index],
              onEdit: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FormScreen(existingData: listData[index]))),
              onDelete: () async {
                await supabase.from('scholarships').delete().match({'id': listData[index].id!});
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FormScreen())),
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}