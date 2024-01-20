import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_insta/flutter_insta.dart';

class download extends StatefulWidget {
  const download({super.key});

  @override
  State<download> createState() => _downloadState();
}

class _downloadState extends State<download> {

  @override
  void initState() {
    super.initState();
    initializeDownloader();
  }

  void initializeDownloader() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterDownloader.initialize(
        debug: true // optional: set false to disable printing logs to console
    );
  }


  /* Dio dio = new Dio();
  double progress = 0.0;

  */

  FlutterInsta FI = FlutterInsta();

  double _progresss = 0.0;
  TextEditingController url = TextEditingController();

  /*
  void download() async
  {
      String path = await _getFilePath(url);
      await dio.download(
        url,
        path ,
        onReceiveProgress: (count, total) {
            setState(() {
              progress = count / total;
            });
        },
        deleteOnError: true,
      ).then((value){
        print("Success");
      }).onError((error, stackTrace) {
        print("error");
      });

      print(path);
  }


  Future<String> _getFilePath(String file_url) async
  {
      final dir = await getExternalStorageDirectories();
      return "${dir}/bheem.jpg";
  }

   */

  /*
 //workin but not with user detail , work with default  link
  void download(String url)
  {
     FileDownloader.downloadFile(
         url: url,
        onProgress: (fileName, progress) {
           setState(() {
             _progresss = progress;
           });
        },
       onDownloadCompleted: (path) {
         print(path);
       },
       onDownloadError: (errorMessage) {
         print("error");
       },
     );

  }*/


  void download(String url) async {
    var myvideourl = await FI.downloadReels(url);

    await FlutterDownloader.enqueue(
      url: myvideourl,
      savedDir: '/storage/emulated/0/Download',
      showNotification: true,
      // show download progress in status bar (for Android)
      openFileFromNotification: true, // click on notification to open downloaded file (for Android)
    ).whenComplete(() {
      print("success");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Download File..."),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade400,
      ),


      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [

              TextField(
                decoration: InputDecoration(
                   border: OutlineInputBorder(),
                ),
                controller: url,
              ),

              SizedBox(height: 50.0,),

              ElevatedButton(
                child: Text("Download"),
                onPressed: (){
                   download(url.text.toString());
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}
