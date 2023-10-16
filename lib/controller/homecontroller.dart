import 'package:hive/hive.dart';
import 'package:todo/models/notes_model.dart';

class Home_Controller{
  List<MyModel> MyList =[
    

  ]; 
final Mybox = Hive.box('notbox');
  void addnew(MyModel newModel){
    MyList.add(newModel);
    updatedb();
  }

  void delete(int index){
    MyList.removeAt(index);
    updatedb();
  }
  loadbox() async {
   MyList = await Mybox.get('notedatalist') ?? [];
  }
  updatedb(){
    Mybox.put("notedatalist", MyList);
  }
}