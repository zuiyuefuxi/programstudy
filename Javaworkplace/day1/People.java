public class People {
  int height;
  String ear;
  void speak(String s){
      System.out.println(s);
  }
}

class A {
  public static void main(String args[]) {
      People Bajie;
      Bajie = new People();
      Bajie.height = 80;
      Bajie.ear = "两只大耳朵";
      System.out.println("身高: "  + Bajie.height);
      System.out.println(Bajie.ear);
      Bajie.speak("老师傅，咱别去西天了，去月宫呗");
   }
} 