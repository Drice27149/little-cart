import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Calculator extends JFrame{
	private JTextField[] block = new JTextField[5];
	private JButton[] op = new JButton[5];
	private int errorCode = -1;
	private int errorFormat = 0;
	private int errorLen = 0;

	public int getNumber(String s){
		int maxLen = 4;
		if(s.length()==0 || s.length()>maxLen){ 
			errorLen = 1;	
			return errorCode;
		}
		int res = 0; int sign = 1;
		int start = 0;
		if(s.charAt(0)=='-'){
			sign = -1;
			start++;
		}
		else if(s.charAt(0)=='+'){ 
			sign = 1;
			start++;
		}
		char[] num = new char[]{
		'0','1','2','3','4','5','6','7','8','9'
		};
		for(int i = start; i < s.length(); i++){
			int find = -1;
			for(int j = 0; j <= 9; j++) if(num[j]==s.charAt(i)) find = j;
			if(find==-1) return errorCode;
			else res = res*10+find;	
		}		
		errorFormat = 0;
		return res*sign;
	}
	public void setNumber(int number){
		int []keep = new int[]{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
		String res = "";
		if(number<0){
			res = res+"-";
			number *= -1;
		}	
		int size = 0;
		while(number!=0){
			size++;
			keep[size] = number%10;
			number /= 10;
		}
		char[] num = new char[]{
        '0','1','2','3','4','5','6','7','8','9'
        };
		for(int i = size; i >= 1; i--) res = res+num[keep[i]];
		block[4].setText(res); 
	}

	public void recieveAction(String key){
		//to be deleted...		
		//System.out.printf("%s\n",key);
		if(key!="="){
			block[1].setText("   "+key);	
		}
		else{
			int ok = 0;
			errorLen = 0; errorFormat = 1;
			int n0 = getNumber(block[0].getText());
			int n1 = getNumber(block[2].getText());
			if(errorLen!=0 || errorFormat!=0){
				System.out.printf("Error: ");
				if(errorLen!=0) System.out.printf("Length of number is invalid.\n");
				else System.out.printf("Format of number is invalid.\n");	
			}
			else{ 
				key = block[1].getText();
				if(key.length()<3) System.out.printf("Error: operator is empty.\n");
				else if(key.charAt(3)=='/' && n1==0) System.out.printf("Error: Divison by zero.\n");
				else{		
					if(key.charAt(3)=='+'){ 
						ok = 1;
						setNumber(n0+n1);
					}
					else if(key.charAt(3)=='-'){ 
						ok = 1;
						setNumber(n0-n1);
					}
					else if(key.charAt(3)=='*'){ 
						ok = 1;
						setNumber(n0*n1);
					}
					else{
						ok = 1; 
						if(n0%n1==0) setNumber(n0/n1); 
						else{
							double a = n0;
							double b = n1; 
							block[4].setText(String.format("%.2f",a/b));
						}
					}
				}
			}
			if(ok==0) block[4].setText("ERROR"); 
		}
	}

	public JButton createButton (String key) {
        JButton button = new JButton(key);
        button.setFont(new Font("Serief", Font.PLAIN, 25));

        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent event) {
                JButton sourceBtn = (JButton) event.getSource();
                String bottonKey = sourceBtn.getText();
                recieveAction(bottonKey);
            }
        });
      return button;
    }


    private void init() {
		//textFiled: number input and display
		//panel: put button in it
		int x = 8, y = 10;	
		int gap = 20;
		int small = 50; int big = 200;
		for(int i = 0; i < 5; i++){
			int sizeX = big, sizeY = small;
			if(i==3 || i==1) sizeX = small;
			block[i] = new JTextField();		
			block[i].setBounds(x,y,sizeX,sizeY);
			block[i].setFont(new Font(null,Font.PLAIN,23));
			if(i==3 || i==1 || i==4) block[i].setEditable(false);
			else block[i].setEditable(true);
			x = x+sizeX+gap;
		}
		block[3].setText("  =");
		String []name = new String[]{
			"+","-","*","/","="
		};
		int size = 60;
		x = 10; y = 90;
		for(int i = 0; i < 5; i++){
			op[i] = createButton(name[i]);
			op[i].setBounds(x,y,size,size);
			x += size+gap;
		}	
		Container container = getContentPane();
        container.setLayout(null);
        for(int i = 0; i < 5; i++){ 
			container.add(block[i]);	
			container.add(op[i]);
		}
	}

	public static void main(String[] args){
		Calculator calculator = new Calculator();
        calculator.setTitle("Calculator");
        calculator.setSize(800,200);
        calculator.setResizable(false);
        calculator.setLocationRelativeTo(null);
        calculator.setDefaultCloseOperation(EXIT_ON_CLOSE);
        calculator.init();
        calculator.setVisible(true);		
		System.out.printf("Running Calculator...\n");
	}	
}
