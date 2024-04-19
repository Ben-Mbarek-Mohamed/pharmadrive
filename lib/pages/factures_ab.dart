import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/widget/customAppBar.dart';
import 'package:dashboard/widget/menu_side.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class Factures extends StatefulWidget {
  const Factures({Key key}) : super(key: key);
  @override
  _OrdersScreen createState() => _OrdersScreen();
}

class _OrdersScreen extends State<Factures> {
  //  data will be replaced by a dynamic http request
  final _OrderInfoDataSource _orderInfoDataSource = _OrderInfoDataSource(
    dataSource: [OrderInfo("01", "800£", "500£", "22/05/2020"),
  OrderInfo("02", "800£", "500£", "22/05/2020"),
  OrderInfo("03", "800£", "500£", "22/05/2020"),
  OrderInfo("04", "800£", "500£", "22/05/2020"),
  OrderInfo("05", "800£", "500£", "22/05/2020"),
  OrderInfo("06", "800£", "500£", "22/05/2020"),
  OrderInfo("07", "800£", "500£", "22/05/2020"),
  OrderInfo("08", "800£", "500£", "22/05/2020"),
  OrderInfo("09", "800£", "500£", "22/05/2020"),
  OrderInfo("10", "800£", "500£", "22/05/2020"),
  OrderInfo("11", "800£", "500£", "22/05/2020"),
  OrderInfo("12", "800£", "500£", "22/05/2020"),
  OrderInfo("13", "800£", "500£", "22/05/2020"),
  OrderInfo("14", "800£", "500£", "22/05/2020"),
  OrderInfo("15", "800£", "500£", "22/05/2020"),
  OrderInfo("16", "800£", "500£", "22/05/2020"),
  OrderInfo("17", "800£", "500£", "22/05/2020"),
  OrderInfo("18", "800£", "500£", "22/05/2020"),
  OrderInfo("19", "800£", "500£", "22/05/2020"),
  OrderInfo("20", "800£", "500£", "22/05/2020"),
  OrderInfo("21", "800£", "500£", "22/05/2020"),
  OrderInfo("22", "800£", "500£", "22/05/2020"),
  OrderInfo("23", "800£", "500£", "22/05/2020"),
  OrderInfo("24", "800£", "500£", "22/05/2020"),

  ],
 
    paginatedDataSource: [],
    rowsPerPage: 8,
  );

  Widget _buildDataPager() {
    return Container(
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
           Container(
          
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left:249.5),
                   child: Center(
                     child: SfDataPager(
                        delegate: _orderInfoDataSource,
                        
                        pageCount:  3,//_orderInfoDataSource._dataSource.length.toDouble(),
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

  List<OrderInfo> orders = [];

  List<OrderInfo> paginatedOrders = [];

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
              appBar: CustomAppBar("Factures abonnement"),
                

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
                                child: buildDataGrid(constraint)),
                           
                             Container(
                                
                                height: dataPagerHeight,
                                child: Column(
                                  
                                  crossAxisAlignment:CrossAxisAlignment.center,
                                  children: [
                                  
                                    _buildDataPager(),
                                 
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

  Widget buildDataGrid(BoxConstraints constraint) {
    return SfDataGrid(
      source: _orderInfoDataSource,
      columnWidthMode: ColumnWidthMode.fill,
      columns: <GridColumn>[
        GridColumn(
          columnName: 'Numéro de facture',
          label: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: Text(
              'Numéro de facture',
              style: kSemiBoldTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        GridColumn(
            columnName: 'Montant à payer',
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Text(
                'Montant à payer',
                style: kSemiBoldTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            )),
        GridColumn(
          columnName: 'Reste à payer',
          label: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: Text(
              'Reste à payer',
              style: kSemiBoldTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        GridColumn(
          columnName: 'Date et heure',
          label: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: Text(
              'Date et heure',
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

  Widget buildStack(BoxConstraints constraints) {
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
  }
}

class _OrderInfoDataSource extends DataGridSource {
  _OrderInfoDataSource(
      {List<OrderInfo> dataSource,
      List<OrderInfo> paginatedDataSource,
      int rowsPerPage}) {
    _dataSource = dataSource;
    _paginatedDataSource = paginatedDataSource;
    _rowsPerPage = rowsPerPage;
  }

  List<OrderInfo> _dataSource;
  List<OrderInfo> _paginatedDataSource;
  int _rowsPerPage = 1;

  @override
  List<DataGridRow> get rows => _paginatedDataSource.map<DataGridRow>((e) {
        return DataGridRow(cells: [
          DataGridCell(columnName: 'Nom user', value: e.userName),
          DataGridCell(columnName: 'Médicaments', value: e.drogs),
          DataGridCell(columnName: 'Montant', value: e.money),
          DataGridCell(columnName: 'Date et heure', value: e.dateTime),
         
        ]);
      }).toList(growable: false);

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * _rowsPerPage;
    int endIndex = startIndex + _rowsPerPage;
    if (startIndex < _dataSource.length && endIndex <= _dataSource.length) {
      
      _paginatedDataSource =
          _dataSource.getRange(startIndex, endIndex).toList(growable: false);
      _paginatedDataSource.map<DataGridRow>((e) {
        return DataGridRow(cells: [
          DataGridCell(columnName: 'Nom user', value: e.userName),
          DataGridCell(columnName: 'Médicaments', value: e.drogs),
          DataGridCell(columnName: 'Montant', value: e.money),
          DataGridCell(columnName: 'Date et heure', value: e.dateTime),
         
        ]);
      }).toList(growable: false);
      notifyListeners();
    } else {
      _paginatedDataSource = [];
    }

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
         child: Padding(
           padding: const EdgeInsets.only(left:70.0),
           child: Row(
              children: [
                IconButton( icon:Icon(Icons.download),onPressed: (){}),
                SizedBox(width: 8,),
               IconButton(icon:Icon(Icons.visibility),onPressed: (){}),
              ],
            ),
         )
          ),
    ], color: Colors.white);
  }
}

class OrderInfo {
  OrderInfo(this.userName, this.drogs, this.money, this.dateTime);
  final String userName;
  final String drogs;
  final String money;
  final String dateTime;
  
}
 