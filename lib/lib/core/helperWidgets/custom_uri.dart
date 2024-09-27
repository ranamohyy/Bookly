import 'package:url_launcher/url_launcher.dart';

import '../../features/HomePage/data/models/book_model/view.dart';

Future<void> launchCustomUrl(context,String?url) async {
if(url != null){
  Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    await launchUrl(uri);

}else{
    throw Exception('Could not launch $url');
  }
  }



}
String getLabel(BookModel bookModel){
  if(bookModel.volumeInfo.previewLink==null){
    return'not available';
  }else{
    return 'preview';
  }
}
