import 'package:flutter/material.dart';
import 'base_card_container.dart';
import 'assignment_card_header.dart';
import 'assignment_card_footer.dart';

class AssignmentCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String subject;
  final String desc;
  final String due;
  final String type;
  final String status;
  final Color? statusColor;
  final bool showUpload;
  final bool isOverdue;

  const AssignmentCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.subject,
    required this.desc,
    required this.due,
    required this.type,
    required this.status,
    this.statusColor,
    required this.showUpload,
    this.isOverdue = false,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCardContainer(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AssignmentCardHeader(
            icon: icon,
            iconColor: iconColor,
            subject: subject,
            desc: desc,
            type: type,
          ),
          const SizedBox(height: 12),
          AssignmentCardFooter(
            due: due,
            status: status,
            statusColor: statusColor,
            showUpload: showUpload,
            isOverdue: isOverdue,
          ),
        ],
      ),
    );
  }
}
