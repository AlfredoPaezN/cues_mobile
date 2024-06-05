import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:virtual_cues/core/utils/colors.dart';
import 'package:virtual_cues/modules/models/teacher.dart';
import 'package:virtual_cues/modules/presentation/widgets/scrollable_widget.dart';
import 'package:virtual_cues/modules/presentation/widgets/tabbar.dart';
import 'package:virtual_cues/routes/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TeachersView extends StatefulWidget {
  const TeachersView({super.key});

  @override
  State<TeachersView> createState() => _TeachersViewState();
}

class _TeachersViewState extends State<TeachersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Evaluaion Docente'),
        centerTitle: true,
        flexibleSpace: Container(
          height: 200.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(CUES_Colors.primary), Colors.blue],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        elevation: 20,
        titleSpacing: 20,
      ),
      body: const TeacherTable(),
    );
  }
}

class TeacherTable extends StatefulWidget {
  const TeacherTable({super.key});

  @override
  _TeacherTableState createState() => _TeacherTableState();
}

class _TeacherTableState extends State<TeacherTable> {
  late List<Teacher> users;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    users = List.of(allTeachers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = [
      'Docente',
      'Asignatura',
      'Evaluar',
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

  List<DataRow> getRows(List<Teacher> users) => users.map((Teacher user) {
        final cells = <Widget>[
          Text(user.name),
          Text(user.subject),
          if (user.isEvaluated)
            const Icon(
              Ionicons.checkmark_circle,
              color: Colors.green,
            )
          else
            const Icon(
              Ionicons.book,
              color: Color(CUES_Colors.primary),
            ),
        ];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<Widget> cells) =>
      cells.map(DataCell.new).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort(
        (user1, user2) => compareString(
          ascending,
          user1.name,
          user2.name,
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
          user1.subject,
          user2.subject,
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

final allTeachers = <Teacher>[
  Teacher(
    name: 'OLIVEROS LUNA MARLON',
    subject: 'TRABAJO DE GRADO II',
    isEvaluated: true,
  ),
  Teacher(
    name: 'MANJARRES ALARCON ORLANDO ENRIQUE',
    subject: 'DERECHO CONSTITUCIONAL',
    isEvaluated: false,
  ),
  Teacher(
    name: 'VILLAREAL DE HOYOS HILLARY ISABEL',
    subject: 'PAQUETES COMERCIALES II',
    isEvaluated: true,
  ),
  Teacher(
    name: 'CASTILLA PONCE JORGE MARIO',
    subject: 'ENFASIS III',
    isEvaluated: true,
  ),
  Teacher(
    name: 'BELTRAN MEDINA ROBERTO CARLOS',
    subject: ' SEMINARIO DE ACTUALIZACION I',
    isEvaluated: false,
  ),
  Teacher(
    name: 'PRESTAN GOMEZ STEPHANIE TATIANA',
    subject: 'SEMINARIO HUMANISTICO V',
    isEvaluated: false,
  ),
  Teacher(
    name: 'DE LA ROSA BOLIVAR JOHNNY DE JESUS',
    subject: 'PROGRAMACION VI',
    isEvaluated: false,
  ),
];
