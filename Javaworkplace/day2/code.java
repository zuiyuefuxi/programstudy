public class code {
    public static void main(String args[]){
	char ChinaWord = '好',JapanWord = 'き';
	char you = '\u4F60';
 	int Position = 20320;
 	System.out.println("汉字: " + ChinaWord + "的位置: " + (int)ChinaWord);
 	//System.out.println("日文: " + JapanWord + "的位置: " + (int）JapanWord);
        System.out.println(Position   + " 位置上的字符集是: " + (char)Position);
	Position =  21319;
	System.out.println(Position   + " 位置上的字符集是: " + (char)Position);
	System.out.println("you: " + you);
     }
}