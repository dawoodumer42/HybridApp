import 'package:flutter/material.dart';
import 'package:telcam_app/custom-widgets/loading_bar.dart';
import 'package:telcam_app/custom-widgets/my_app_bar.dart';
import 'package:telcam_app/error_handlers/http_error_handler.dart';
import 'package:telcam_app/services/navigation_service.dart';
import 'package:telcam_app/services/search_folders_service.dart';
import 'package:telcam_app/models/http_param_models/folder_search_params.dart';
import 'package:telcam_app/models/folder_entries.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class FoldersListScreen extends StatefulWidget {
  FoldersListScreen({Key key, this.title, this.folderPath}) : super(key: key);
  final String title;
  final String folderPath;

  @override
  _FoldersListScreenState createState() => _FoldersListScreenState();
}

class _FoldersListScreenState extends State<FoldersListScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  bool _isLoading = false;
  List<FolderEntries> _folderEntriesList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFoldersList();
  }

  void _getFoldersList() {
    setState(() {
      _isLoading = true;
    });

    FolderSearchParams params = new FolderSearchParams(
      path: widget.folderPath,
      recursive: false,
      includeDeleted: false,
      includeMediaInfo: false,
      includeHasExplicitSharedMembers: false,
      includeMountedFolders: false,
      includeNonDownloadableFiles: true,
    );
    SearchFoldersService.getFoldersList(params.toMap())
        .then((http.Response response) {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          var resBody = json.decode(response.body);
          //extract product types list
          final _typeItems = resBody['entries'].cast<Map<String, dynamic>>();
          _folderEntriesList = _typeItems.map<FolderEntries>((json) {
            return FolderEntries.fromJson(json);
          }).toList();
        });
      } else {
        HttpErrorHandler.dialogError(context, response.statusCode);
      }
    });
  }

  Widget _buildListViewItem(BuildContext context, int index) {
    return Container(
      width: double.infinity,
      height: 130,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: InkWell(
          onTap: () {
            if(_folderEntriesList[index].tag == 'folder'){
            NavigationService.navigateToFoldersListScreen(context, _folderEntriesList[index].name, _folderEntriesList[index].pathDisplay);
            }
          },
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _folderEntriesList[index].name,
                      maxLines: 2,
                      style: TextStyle(
                          color: Color(0xff21047a),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _folderEntriesList[index].pathDisplay,
                      maxLines: 2,
                      style: TextStyle(
                          color: Color(0xff3e1f9c),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
//              Container(
//                padding: EdgeInsets.all(15.0),
//                width: 100.0,
//                height: 100.0,
//                decoration: new BoxDecoration(
//                    shape: BoxShape.circle,
//                    image: new DecorationImage(
//                        fit: BoxFit.fill,
//                        image: new NetworkImage(
//                            '$IMAGE_BASE_URL/${_productTypesList[index].imageName}'))),
//              ),
              SizedBox(
                width: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        itemCount: _folderEntriesList == null ? 0 : _folderEntriesList.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildListViewItem(context, index);
        });
  }

  Widget _buildBodyOrLoading() {
    if (_isLoading) {
      return LoadingBar();
    }
    return _buildListView();
  }

//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: MyAppBar('Deals', true),
//      body: _buildBodyOrLoading(),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(widget.title),
      body: _buildBodyOrLoading()
    );
  }
}
