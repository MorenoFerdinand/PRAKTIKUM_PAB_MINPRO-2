import 'package:flutter/material.dart';
import '../models/scholarship.dart';

class ScholarshipCard extends StatelessWidget {
  final Scholarship data;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ScholarshipCard({
    super.key, 
    required this.data, 
    required this.onDelete, 
    required this.onEdit
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        onTap: onEdit,
        title: Text(data.scholarshipName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("${data.provider}\n${data.keyRequirement}"),
        trailing: Wrap(
          children: [
            IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: onEdit),
            IconButton(icon: const Icon(Icons.delete_outline, color: Colors.redAccent), onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}