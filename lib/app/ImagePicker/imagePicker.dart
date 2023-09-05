
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController{

  RxString image_path=''.obs;
  Future <void> getImagefromGallery()async
  {
    final ImagePicker _picker = ImagePicker();
     final _image=  await _picker.pickImage(source: ImageSource.gallery);
     if(_image!=Null)
     {
        image_path.value= _image!.path.toString();
     }
  }
  Future reset() async {
    image_path.value = '';
  }


}