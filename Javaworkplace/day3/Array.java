public class Array{
	public static void main(String args[]){
		int a[] = {1,2,3,4};
		int b[] = {100,200,300};
		System.out.println("数组a的元素个数 = " + a.length);
		System.out.println("数组b的元素个数 = " + b.length);
		System.out.println("数组a的引用 = " + a);
		System.out.println("数组b的引用 = " + b);
		
		a = b;
		System.out.println("将b赋给a后:");
		System.out.println("数组a的元素个数 = " + a.length);
		System.out.println("数组b的元素个数 = " + b.length);
		System.out.println("a[0] = " + a[0] + ", a[1] = " + a[1] + ", a[2] = " + a[2]);
		System.out.println("b[0] = " + b[0] + ", b[1] = " + b[1] + ", b[2] = " + b[2]);
		
		//以下是字符数组的特殊点
		char []ch = {'中','国','最','美'};
		System.out.println(ch);    //ch不是输出引用,而是输出全部元素
		System.out.println("" + ch);    //ch输出引用需要和字符串做并置运算
		
		
	}
}
		