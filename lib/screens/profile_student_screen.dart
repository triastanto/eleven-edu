import 'package:flutter/material.dart';
import '../widgets/base_card_container.dart';
import '../theme/app_colors.dart';

class ProfileStudentScreen extends StatelessWidget {
  const ProfileStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.primary),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person, color: theme.colorScheme.primary, size: 32),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                'Profile',
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: const _ProfileBody(),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ProfileCard(),
          SizedBox(height: 24),
          _StudentDetailsCard(),
          SizedBox(height: 32),
          _ProfileActions(),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = Theme.of(context).extension<AppColors>();
    return BaseCardContainer(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      color: theme.cardColor,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 48,
            backgroundImage: AssetImage('assets/profile_student.jpg'),
          ),
          const SizedBox(height: 16),
          Text('Ellen Smith', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text('Grade 7 - A', style: theme.textTheme.titleMedium?.copyWith(color: theme.hintColor)),
          const SizedBox(height: 16),
          Divider(color: appColors?.announcementInfoBox ?? theme.dividerColor),
          const SizedBox(height: 12),
          Text(
            'Lorem ipsum dolor sit amet consectetur. Pulvinar in at nunc bibendum. Diam a cras sit sapien aenean dolor egestas.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
          ),
        ],
      ),
    );
  }
}

class _StudentDetailsCard extends StatelessWidget {
  const _StudentDetailsCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseCardContainer(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      color: theme.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Student Details', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          const _DetailRow(label: 'Date of Birth', value: '12/03/2008'),
          const _DetailRow(label: 'Class', value: '7A'),
          const _DetailRow(label: 'No. Absen', value: '7'),
          const _DetailRow(label: 'No. HP', value: '12345678910'),
          const _DetailRow(label: 'Nama Ibu', value: 'Sri Mulyani'),
          const _DetailRow(label: 'Nama Ayah', value: 'Mulyono Widodo'),
          const _DetailRow(label: 'Alamat', value: 'Jl. H.A. Salim no 32\nTaman, Madiun'),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: theme.textTheme.bodyLarge),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileActions extends StatelessWidget {
  const _ProfileActions();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ActionButton(
          icon: Icons.settings,
          label: 'Settings',
          color: Colors.white,
          borderColor: theme.colorScheme.primary.withAlpha(60),
          textColor: theme.colorScheme.primary,
          onTap: () {},
        ),
        _ActionButton(
          icon: Icons.logout,
          label: 'Log Out',
          color: Colors.white,
          borderColor: theme.colorScheme.error.withAlpha(80),
          textColor: theme.colorScheme.error,
          onTap: () {},
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.borderColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: textColor, size: 28),
              const SizedBox(width: 8),
              Text(label, style: TextStyle(fontSize: 18, color: textColor)),
            ],
          ),
        ),
      ),
    );
  }
}
