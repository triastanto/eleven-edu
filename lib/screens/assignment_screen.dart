import 'package:flutter/material.dart';
import '../widgets/assignment_info_box.dart';
import '../widgets/assignment_card.dart';
import '../widgets/app_top_section.dart';

/// Assignment screen
class AssignmentScreen extends StatefulWidget {
  final TabController tabController;
  const AssignmentScreen({super.key, required this.tabController});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.assignment, color: theme.colorScheme.primary, size: 32),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                'Daftar Tugas',
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: theme.iconTheme.color,
            onPressed: () {
              // Implement more action
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: widget.tabController,
        children: [
          _AllAssignmentsTab(),
          const Center(child: Text('Belum ada tugas yang disubmit.')),
          const Center(child: Text('Tidak ada tugas yang overdue.')),
        ],
      ),
    );
  }
}

class _AllAssignmentsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AssignmentInfoBox(
            message: '2 PR harus selesai dalam minggu ini!',
          ),
          AssignmentCard(
            icon: Icons.calculate_rounded,
            iconColor: Colors.deepPurple,
            subject: 'Matematika',
            desc: 'Probabilitas dan Statistik',
            due: '20 Juni 2025',
            type: 'PR',
            status: 'Submitted',
            statusColor: Colors.green,
            showUpload: false,
          ),
          AssignmentCard(
            icon: Icons.science_rounded,
            iconColor: Colors.blue,
            subject: 'Biologi',
            desc: 'Hasil Lab: Analisis Microba',
            due: '15 Juni 2025',
            type: 'Uji Praktek',
            status: 'Overdue',
            statusColor: Colors.red,
            showUpload: true,
            isOverdue: true,
          ),
          AssignmentCard(
            icon: Icons.bubble_chart_rounded,
            iconColor: Colors.purple,
            subject: 'Kimia',
            desc: 'Proton dan Elektron',
            due: '21 Juni 2025',
            type: 'PR',
            status: '',
            showUpload: true,
          ),
          AssignmentCard(
            icon: Icons.language_rounded,
            iconColor: Colors.indigo,
            subject: 'Bahasa Inggris',
            desc: 'Probabilitas dan Statistik',
            due: '30 Juni 2025',
            type: 'Quiz',
            status: '',
            showUpload: true,
          ),
          AssignmentCard(
            icon: Icons.public_rounded,
            iconColor: Colors.blueAccent,
            subject: 'Geografi',
            desc: 'Probabilitas dan Statistik',
            due: '16 Juni 2025',
            type: 'Homework',
            status: 'Submitted',
            statusColor: Colors.green,
            showUpload: false,
          ),
        ],
      ),
    );
  }
}

class AssignmentHeader extends StatelessWidget {
  final TabController tabController;
  const AssignmentHeader({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return AppTopSection(
      title: 'Daftar Tugas',
      leading: const Icon(Icons.menu_book_rounded, color: Colors.orange, size: 32),
      bottom: Container(
        color: Colors.white,
        child: TabBar(
          controller: tabController,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.orange,
          indicatorWeight: 2.5,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Submitted'),
            Tab(text: 'Overdue'),
          ],
        ),
      ),
    );
  }
}
