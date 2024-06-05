import 'package:virtual_cues/modules/models/schedule.dart';
import 'package:virtual_cues/modules/presentation/widgets/scrollable_widget.dart';
import 'package:virtual_cues/modules/presentation/widgets/tabbar.dart';
import 'package:flutter/material.dart';

class StudentsView extends StatefulWidget {
  const StudentsView({super.key});

  @override
  State<StudentsView> createState() => _StudentsViewState();
}

class _StudentsViewState extends State<StudentsView> {
  @override
  Widget build(BuildContext context) => const TabBarWidget(
        title: 'Students',
        tabs: [
          Tab(icon: Icon(Icons.schedule_outlined), text: 'Horario'),
          Tab(icon: Icon(Icons.grade_outlined), text: 'Notas'),
        ],
        children: [
          SortablePage(),
          GradesPage(),
        ],
      );
}

class SortablePage extends StatefulWidget {
  const SortablePage({super.key});

  @override
  _SortablePageState createState() => _SortablePageState();
}

class _SortablePageState extends State<SortablePage> {
  late List<Schedule> users;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['Dia', 'Asignatura', 'Semestre', 'Docente'];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map(
        (String column) => DataColumn(
          label: Text(column),
          onSort: onSort,
        ),
      )
      .toList();

  List<DataRow> getRows(List<Schedule> users) => users.map((Schedule user) {
        final cells = [user.day, user.subject, user.semester, user.teacher];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort(
        (user1, user2) => compareString(
          ascending,
          user1.day,
          user2.day,
        ),
      );
    } else if (columnIndex == 1) {
      users.sort(
        (user1, user2) => compareString(
          ascending,
          user1.subject,
          user2.subject,
        ),
      );
    } else if (columnIndex == 2) {
      users.sort(
        (user1, user2) => compareString(
          ascending,
          user1.semester,
          user2.semester,
        ),
      );
    }

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(
    bool ascending,
    String value1,
    String value2,
  ) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}

class GradesPage extends StatefulWidget {
  const GradesPage({super.key});

  @override
  _GradesPageState createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  late List<Schedule> users;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = [
      'Asignatura',
      'P. Parcial',
      'S. Parcial',
      'T. Parcial',
      'Inter',
      'Definitiva',
    ];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map(
        (String column) => DataColumn(
          label: Text(column),
          onSort: onSort,
        ),
      )
      .toList();

  List<DataRow> getRows(List<Schedule> users) => users.map((Schedule user) {
        final cells = [
          user.subject,
          user.pparcial,
          user.sparcial,
          user.tparcial,
          user.inter,
          user.definitiva,
        ];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort(
        (user1, user2) => compareString(
          ascending,
          user1.day,
          user2.day,
        ),
      );
    } else if (columnIndex == 1) {
      users.sort(
        (user1, user2) => compareString(
          ascending,
          user1.subject,
          user2.subject,
        ),
      );
    } else if (columnIndex == 2) {
      users.sort(
        (user1, user2) => compareString(
          ascending,
          user1.semester,
          user2.semester,
        ),
      );
    }

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(
    bool ascending,
    String value1,
    String value2,
  ) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}

final allUsers = <Schedule>[
  Schedule(
    day: 'Martes',
    subject: 'SEMINARIO HUMANISTICO V',
    semester: '37',
    teacher: 'Unknown',
    pparcial: '4.6',
    sparcial: '4.7',
    tparcial: '4.8',
    inter: '4.7',
    definitiva: '4.7',
  ),
  Schedule(
    day: 'Martes',
    subject: 'SEMINARIO DE ACTUALIZACION I',
    semester: '27',
    teacher: 'Unknown',
    pparcial: '4.8',
    sparcial: '4.9',
    tparcial: '4.9',
    inter: '4.8',
    definitiva: '4.8',
  ),
  Schedule(
    day: 'Miercoles',
    subject: 'PROGRAMACION VI',
    semester: '20',
    teacher: 'Unknown',
    pparcial: '4.5',
    sparcial: '4.6',
    tparcial: '4.7',
    inter: '4.6',
    definitiva: '4.6',
  ),
  Schedule(
    day: 'Jueves',
    subject: 'DERECHO CONSTITUCIONAL',
    semester: '21',
    teacher: 'Unknown',
    pparcial: '4.7',
    sparcial: '4.8',
    tparcial: '4.9',
    inter: '4.8',
    definitiva: '4.8',
  ),
  Schedule(
    day: 'Jueves',
    subject: 'PAQUETES COMERCIALES II',
    semester: '18',
    teacher: 'Unknown',
    pparcial: '4.9',
    sparcial: '5.0',
    tparcial: '5.0',
    inter: '4.9',
    definitiva: '4.9',
  ),
  Schedule(
    day: 'Viernes',
    subject: 'ENFASIS III',
    semester: '18',
    teacher: 'Unknown',
    pparcial: '4.8',
    sparcial: '4.9',
    tparcial: '5.0',
    inter: '4.9',
    definitiva: '4.9',
  ),
  Schedule(
    day: 'Sabado',
    subject: 'TRABAJO DE GRADO II',
    semester: '32',
    teacher: 'Unknown',
    pparcial: '4.7',
    sparcial: '4.8',
    tparcial: '4.9',
    inter: '4.8',
    definitiva: '4.8',
  ),
];
