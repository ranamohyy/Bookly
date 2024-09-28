import 'package:flutter/material.dart';
import 'package:google_books/lib/features/HomePage/data/models/book_model/view.dart';
import 'package:google_books/lib/features/HomePage/presentation/views/widgets/custom_book_image.dart';
import 'package:google_books/lib/features/book_details/peresentaion/widgets/similar_books.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../core/helperWidgets/custom_uri.dart';
import '../../../../core/helperWidgets/styleText/stlyes.dart';
import '../../../HomePage/presentation/views/widgets/item_rate_view.dart';

class BookDetailsBody extends StatefulWidget {
 const   BookDetailsBody({super.key, required this.bookModel});
       final BookModel bookModel;

  @override
  State<BookDetailsBody> createState() => _BookDetailsBodyState();
}

class _BookDetailsBodyState extends State<BookDetailsBody> {
     late final List labels= ['Free',getLabel(widget.bookModel)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: (){
         Navigator.of(context).pop()
          ;
        },
        icon: const Icon(Icons.close),
      ),
      actions: [
        IconButton(onPressed: (){},
            icon:const Icon(Icons.shopping_cart_outlined))

      ],),
      body:
      SingleChildScrollView(
      scrollDirection: Axis.vertical,
         child:   Padding(
           padding: const EdgeInsets.symmetric(horizontal: 30.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                      height: 300,
                        width: 200,
                        child: CustomBookImage(
                            imageUrl: widget.bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
                      ),
                    ),
                   const SizedBox(height: 20,),
                    Text(
                      widget.bookModel.volumeInfo.title!, style: Styles.textStyle18.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,),
                    const SizedBox(height: 10,),
                    Center(
                      child: Opacity(
                               opacity: 0.5,
                         child: Text(widget.bookModel.volumeInfo.authors![0],
                                         style: Styles.textStyle18.copyWith(
                                           fontWeight: FontWeight.w300,
                          color:

                          const Color(0xffFFFFFF),
                          ),),),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ItemRateView(
                      mainAxisAlignment: MainAxisAlignment.center,
                        count: widget.bookModel.volumeInfo.averageRating?.round() ?? 0
                        , rating: widget.bookModel.volumeInfo.ratingsCount ?? 0),
                    const SizedBox(
                      height: 15,
                    ),
                   Center(
                     child:
                     ToggleSwitch(
                       activeBgColor: const[Color(0xffEF8262)],
                       minHeight: 50.0,
                       minWidth: 150.0,
                       fontSize: 12,
                       totalSwitches: 2,
                       initialLabelIndex: 0,
                       inactiveBgColor: Colors.white,
                       labels:labels.cast(),
                       activeFgColor: Colors.white,
                       inactiveFgColor: Colors.black,
                          onToggle: (index) async{
                         labels[index!]==labels[1]?
                         launchCustomUrl(context,widget.bookModel.volumeInfo.previewLink!) :index;
                          },
                     ),
                   ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      textAlign: TextAlign.start,
                      'You can also like',
                      style: Styles.textStyle15.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                     const SimilarBooksListview(),

                  ],
                ),
         )

 ),


      );

}
}





