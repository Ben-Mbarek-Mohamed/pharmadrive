import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/widget/customAppBar.dart';
import 'package:dashboard/widget/menu_side.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class Visio extends StatefulWidget {
  const Visio({Key key}) : super(key: key);
  @override
  _OrdersScreen createState() => _OrdersScreen();
}

class _OrdersScreen extends State<Visio> {
  //  data will be replaced by a dynamic http request
  final _OrderInfoDataSource _orderInfoDataSource = _OrderInfoDataSource(
    dataSource: [
      OrderInfo("Foilen ben foulen 1", "lorempsuom@gmail.com", "22 556 987", "Sfax,Tina",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 2", "lorempsuom@gmail.com", "22 556 987", "Sfax",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 3", "lorempsuom@gmail.com", "22 556 987", "Sfax",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 4", "lorempsuom@gmail.com", "22 556 987", "Sfax",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 5", "lorempsuom@gmail.com", "22 556 987", "Sfax",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 6", "lorempsuom@gmail.com", "100£", "Sfax",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 7", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 8", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 9", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 10", "lorem ipsuom", "780£", "14/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 11", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 12", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 13", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 14", "lorem ipsuom", "140£", "04/03/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 15", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 16", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 17", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 18", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 19", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 20", "lorem ipsuom", "770£", "04/05/2021",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 21", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 22", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 23", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 24", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 25", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 26", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 27", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 28", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 29", "lorem ipsuom", "100£", "04/05/2020",
          "lorem ipsuim"),
      OrderInfo("Foilen ben foulen 30", "lorem ipsuom", "100£", "04/05/2019",
          "lorem ipsuim"),
            OrderInfo("Foilen ben foulen 31", "lorem ipsuom", "100£", "04/05/2019",
          "lorem ipsuim"),
    ],
    paginatedDataSource: [
      
    ],
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
    Size size = MediaQuery.of(context).size;
    return Container(
      child: (size.width>1200)?Scaffold(
          body: Row(
        children: [
          Expanded(
            flex: 5,
            child: MenuSide(),
          ),
          Expanded(
            flex: 20,
            child: Scaffold(
              appBar: CustomAppBar("Vidéo conférence"),
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
      ),
      ):Scaffold(
        drawer: Drawer(child: MenuSide(),),
        appBar: CustomAppBar("Vidéo conférence"),
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
    );
  }

  Widget buildDataGrid(BoxConstraints constraint) {
    return SfDataGrid(
      source: _orderInfoDataSource,
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
          columnName: 'Adresse',
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
      int rowsPerPage})
       {
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
          DataGridCell(columnName: 'Actions', value: e.actions),
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
          DataGridCell(columnName: 'Actions', value: e.actions),
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
                IconButton(icon:Icon(Icons.phone_outlined,color: kprimaryColor,),onPressed: (){}),
                SizedBox(width: 8,),
               IconButton(icon:Icon(Icons.video_call_rounded,color: kprimaryColor),onPressed: (){}),
                   ],
              ),
            )
          ),
    ], color: Colors.white);
  }
}

class OrderInfo {
  OrderInfo(this.userName, this.drogs, this.money, this.dateTime, this.actions);
  final String userName;
  final String drogs;
  final String money;
  final String dateTime;
  final String actions;
}
