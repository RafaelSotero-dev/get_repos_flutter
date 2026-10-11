import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class GetRepos extends StatefulWidget {
  const new({super.key});

  @override
  State<GetRepos> createState() => _GetRepos();
}

class _GetRepos extends State<GetRepos> {
  var _repos = [];
  final _font = TextStyle(fontSize: 10.0, color: Colors.black);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    var uri = Uri.https('api.github.com', 'users/RafaelSotero-dev/repos');
    http.Response response = await http.get(uri);
    setState(() {
      final reposJson = jsonDecode(response.body);

      for (Map<String, dynamic> repo in reposJson) {
        if (repo['description'] != null) {
          _repos.add(
            Repos(repo['id'], repo['name'], description: repo['description']),
          );
        }
      }
    });
  }

  Widget _buildRow(int index) {
    return Column(
      children: [
        ListTile(
          leading: Text("${_repos[index].id}", style: _font),
          title: Text(_repos[index].name, style: _font),
          minTileHeight: 8,
        ),
        ListTile(
          title: Text(_repos[index].description ?? '', style: _font),
          minTileHeight: 8,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(2),
        itemCount: _repos.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildRow(index);
        },
      ),
    );
  }
}

class Repos {
  int id;
  String name;
  String? description;

  Repos(this.id, this.name, {this.description});
}
