import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/scholarship.dart';

class FormScreen extends StatefulWidget {
  final Scholarship? existingData;
  const FormScreen({super.key, this.existingData});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late TextEditingController _nameCtrl;
  late TextEditingController _providerCtrl;
  late TextEditingController _reqCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.existingData?.scholarshipName ?? "");
    _providerCtrl = TextEditingController(text: widget.existingData?.provider ?? "");
    _reqCtrl = TextEditingController(text: widget.existingData?.keyRequirement ?? "");
  }

  Future<void> _save() async {
    if (_nameCtrl.text.isEmpty || _providerCtrl.text.isEmpty || _reqCtrl.text.isEmpty) return;

    final scholarshipData = {
      'scholarship_name': _nameCtrl.text,
      'provider': _providerCtrl.text,
      'key_requirement': _reqCtrl.text,
    };

    try {
      if (widget.existingData != null) {
        await Supabase.instance.client.from('scholarships').update(scholarshipData).match({'id': widget.existingData!.id!});
      } else {
        await Supabase.instance.client.from('scholarships').insert(scholarshipData);
      }
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e"), backgroundColor: Colors.red));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.existingData != null ? "Edit Beasiswa" : "Tambah Beasiswa")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: _nameCtrl, decoration: const InputDecoration(labelText: "Nama Beasiswa", border: OutlineInputBorder())),
            const SizedBox(height: 15),
            TextField(controller: _providerCtrl, decoration: const InputDecoration(labelText: "Penyelenggara", border: OutlineInputBorder())),
            const SizedBox(height: 15),
            TextField(controller: _reqCtrl, decoration: const InputDecoration(labelText: "Persyaratan", border: OutlineInputBorder())),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity, 
              height: 50, 
              child: ElevatedButton(onPressed: _save, child: const Text("Simpan"))
            ),
          ],
        ),
      ),
    );
  }
}