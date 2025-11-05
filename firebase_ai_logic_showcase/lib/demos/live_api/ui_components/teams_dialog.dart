// Copyright 2025 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import '../../../../shared/models/team.dart';

class TeamsDialog extends StatelessWidget {
  const TeamsDialog({super.key, required this.teams});

  final List<Team> teams;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Teams', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            SingleChildScrollView(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Team Name')),
                  DataColumn(label: Text('Members')),
                ],
                rows: teams.map((team) {
                  return DataRow(
                    cells: [
                      DataCell(Text(team.teamName)),
                      DataCell(Text(team.teamMembers.join(', '))),
                    ],
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
