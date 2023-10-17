import 'package:hive/hive.dart';
import 'package:todo/models/notes_model.dart';

class Home_Controller{
  List<MyModel> MyList =[
    

  ]; 
  
final Mybox = Hive.box('notbox');
  void addnew(MyModel newModel){
    MyList.add(newModel);
    //loadbox();
    updatedb();
    
  }

  void delete(int index){
    MyList.removeAt(index);
    updatedb();
  }
  loadbox()  {
    MyList = Mybox.get('newmodel')!.cast<MyModel>();  }
  updatedb(){
    Mybox.put('newmodel',MyList);
  }
}