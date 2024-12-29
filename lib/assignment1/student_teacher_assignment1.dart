

main(){
  StudentManagementSystem studentManagementSystem = StudentManagementSystem();
  studentManagementSystem.run();

}
class StudentManagementSystem{
  void run(){
    Student student1 = Student(studentId: null, grade: null, courseScores: [90,85,82], name: 'John Doe', age: 20, address: '123 Main Street');
    print('Student Information:\n');
    student1.displayRole();
    print('Name:${student1.getName}');
    print("Age: ${student1.getAge}");
    print("Address: ${student1.getAddress}");
    student1.avgScore();

    Teacher teacher1 = Teacher(coursesTaught: ['Math','Bangla','English'], name: 'Mrs. Smith', age: 35, address: '456 Oak St');
    print('\n Teacher Information:\n');
    teacher1.displayRole();
    print('Name:${teacher1.getName}');
    print("Age: ${teacher1.getAge}");
    print("Address: ${teacher1.getAddress}");
    teacher1.displayCourse();
  }
}
abstract class Role{
  void displayRole();
}

class Person implements Role{
  String? name;
  int ? age;
  String? address;

  Person({required this.name,required this.age,required this.address});
  String? get getName => name;
  String? get getAddress => address;
  int? get getAge => age;

  @override
  void displayRole() {

  }
}

class Student extends Person{
  int? studentId;
  double? grade;
  List<double> courseScores = [];

  Student({required this.studentId,required this.grade, required this.courseScores, required super.name, required super.age, required super.address});
  @override
  void displayRole() {
    print('Role:Student');
  }

  void avgScore(){
    final avgScore = (courseScores[0]+courseScores[1]+courseScores[2])/3;
    print('Average Score:${avgScore.toStringAsFixed(2)}');
  }

}

class Teacher extends Person{
  int? teacherId;
  List<String> coursesTaught = [];

  Teacher({this.teacherId,required this.coursesTaught, required super.name, required super.age, required super.address});

  @override
  void displayRole() {

    print('Role:Teacher');
  }

  void displayCourse(){
    print('Course Taught:');
    for(var course in coursesTaught){
      print('-$course');
    }
  }
}

