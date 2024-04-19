import 'package:dashboard/api/fetchData/get_livreurs.dart';
import 'package:dashboard/api/models/livreurs_model.dart';
import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/widget/customAppBar.dart';
import 'package:dashboard/widget/menu_side.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class LivraisonPerso extends StatefulWidget {
  const LivraisonPerso({Key key}) : super(key: key);
  @override
  _OrdersScreen createState() => _OrdersScreen();
}

GetLivreurs fetch = GetLivreurs();

class _OrdersScreen extends State<LivraisonPerso> {
  //  data will be replaced by a dynamic http request
  LivreursDataGridSource1 LivreursDataGridSource = LivreursDataGridSource1(
    dataSource: [],
    paginatedDataSource: [],
    rowsPerPage: 3
  );
  Widget _buildDataPager(List<LivreursModel> listLivreurs) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 249.5),
                  child: Center(
                    child: SfDataPager(
                      delegate: LivreursDataGridSource,
                      pageCount: 3,
                      direction: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool showLoadingIndicator = true;
  final double dataPagerHeight = 60.0;

  List<LivreursModel> orders = [];

  List<LivreursModel> paginatedOrders = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: Row(
        children: [
          Expanded(
            flex: 5,
            child: MenuSide(),
          ),
          Expanded(
            flex: 20,
            child: Scaffold(
              appBar: CustomAppBar("Livreurs"),
              ///// body will change with widgets dynamiclly

              body: Container(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SfDataPagerTheme(
                    data: SfDataPagerThemeData(
                      itemColor: Colors.white,
                      selectedItemColor: kprimaryColor,
                      disabledItemTextStyle: TextStyle(color: kprimaryColor),
                      itemBorderRadius: BorderRadius.circular(20),
                      backgroundColor: Colors.white,
                    ),
                    child: LayoutBuilder(builder: (context, constraint) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            SizedBox(
                                height: constraint.maxHeight - 120,
                                width: constraint.maxWidth,
                                child: FutureBuilder(
                                    future: getLivreursDataSource(),
                                    builder: (context, snapshot) {
                                      return snapshot.hasData
                                          ? buildDataGrid(
                                              constraint, snapshot.data)
                                          : Center(
                                              child:
                                                  CircularProgressIndicator());
                                    })),
                            Container(
                              height: dataPagerHeight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FutureBuilder(
                                      future: fetch.fetchLivreurs(),
                                      builder: (ctx, snapshot) {
                                        return _buildDataPager(snapshot.data);
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget buildDataGrid(BoxConstraints constraint, data) {
    return SfDataGrid(
      source: data,
      columnWidthMode: ColumnWidthMode.fill,
      columns: <GridColumn>[
        GridColumn(
          columnName: 'Nom',
          label: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: Text(
              'Nom ',
              style: kSemiBoldTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        GridColumn(
            columnName: 'Email',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text(
                'Email',
                style: kSemiBoldTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            )),
        GridColumn(
          columnName: 'Téléphone',
          label: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: Text(
              'Téléphone',
              style: kSemiBoldTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        GridColumn(
          columnName: 'Véhicule',
          label: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: Text(
              'Adresse',
              style: kSemiBoldTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        GridColumn(
          columnName: 'Actions',
          label: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: Text(
              'Actions',
              style: kSemiBoldTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

/*Widget buildStack(BoxConstraints constraints) {
    List<Widget> _getChildren() {
      final List<Widget> stackChildren = [];
      stackChildren.add(buildDataGrid(constraints));

      if (showLoadingIndicator) {
        stackChildren.add(Container(
          color: Colors.black12,
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        ));
      }

      return stackChildren;
    }

    return Stack(
      children: _getChildren(),
    );
  }*/
}

Future<LivreursDataGridSource> getLivreursDataSource() async {
  var livreursList = await fetch.fetchLivreurs();
  return LivreursDataGridSource(livreursList);
}

class LivreursDataGridSource1 extends DataGridSource {
  LivreursDataGridSource1(
      {List<LivreursModel> dataSource,
      List<LivreursModel> paginatedDataSource,
      int rowsPerPage}) {
    dataSource = dataSource;
    paginatedDataSource = paginatedDataSource;
    rowsPerPage = rowsPerPage;
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    // TODO: implement buildRow
    throw UnimplementedError();
  }
}

class LivreursDataGridSource extends DataGridSource {
  LivreursDataGridSource(this.livreursList) {
    buildDataGridRow();
  }
  List<DataGridRow> dataGridRows;
  List<LivreursModel> livreursList;

  List<LivreursModel> _dataSource;
  List<LivreursModel> _paginatedDataSource;
  int _rowsPerPage;

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * _rowsPerPage;
    int endIndex = startIndex + _rowsPerPage;
    _paginatedDataSource =
        _dataSource.getRange(startIndex, endIndex).toList(growable: false);
    notifyDataSourceListeners();
    return true;
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.center,
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: Text(
            row.getCells()[1].value.toString(),
            overflow: TextOverflow.ellipsis,
          )),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: Text(
            row.getCells()[2].value.toString(),
            overflow: TextOverflow.ellipsis,
          )),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: Text(
            row.getCells()[3].value.toString(),
            overflow: TextOverflow.ellipsis,
          )),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: Text(
            row.getCells()[4].value.toString(),
            overflow: TextOverflow.ellipsis,
          )),
    ], color: Colors.white);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;
  void buildDataGridRow() {
    dataGridRows = livreursList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'orderID', value: dataGridRow.name),
        DataGridCell<String>(
            columnName: 'customerID', value: dataGridRow.email),
        DataGridCell<String>(
            columnName: 'employeeID', value: dataGridRow.phone),
        DataGridCell<String>(columnName: 'orderDate', value: dataGridRow.car),
        DataGridCell<String>(columnName: 'freight', value: dataGridRow.addresse)
      ]);
    }).toList(growable: false);
  }
}
