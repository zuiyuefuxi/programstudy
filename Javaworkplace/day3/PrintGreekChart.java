class PrintGreekChart{
	public static void main(String args[]){
		char FirstC = 'α', LastC = 'ω';
		
		int First = (int)FirstC;
		int Last = (int)LastC;
		int len = Last - First + 1;
		char Greek[] = new char[len];
		int count = 0;
		
		System.out.println("以下是输出所有的希腊字母");
		
		for(int i = First; i <= Last; i++){
			char GreekC =  (char)i;
			Greek[count++] = GreekC;
			
			//System.out.println(GreekC);
		}
		
		for(int i = 0; i < Greek.length; i++){
			System.out.print(Greek[i] + "   ");
			count++;
			
			if (count %5 == 0)
				System.out.println();
		}
			
			
	    System.out.println("以上是输出所有的希腊字母:" + "共有" + count +"个");
	}
}