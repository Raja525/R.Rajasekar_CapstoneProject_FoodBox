package FoodBox_Test;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.By.ById;
import org.openqa.selenium.chrome.ChromeDriver;

//------------------------------Passed------------------------//
public class SignUp_Testcase {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
		WebDriver driver=new ChromeDriver();
		
		driver.get("http://localhost:9090/FoodBox");
	//	driver.get("http://13.232.246.255:8080/medicare/admin.jsp");
		driver.manage().window().maximize();
		
		driver.findElement(By.id("signin")).click();
		driver.findElement(By.xpath("//*[@id='container']//form/a")).click();;
		driver.findElement(By.name("name")).sendKeys("Major");
		driver.findElement(By.name("mail")).sendKeys("raja525rs@gmial.com");	
		driver.findElement(By.name("mobile")).sendKeys("8347747470");
		driver.findElement(By.name("address")).sendKeys("Nadondee street,bachar road,chennai");
		driver.findElement(By.name("password")).sendKeys("major");
		driver.findElement(By.xpath("//*[@id='container']//input[6]")).click();
		Thread.sleep(2000);
		driver.findElement(By.id("signin")).click();
		driver.findElement(By.name("username")).sendKeys("Major");
		driver.findElement(By.name("password")).sendKeys("major");
		driver.findElement(By.xpath("//*[@id='container']//form/input[3]")).click();
	
		Thread.sleep(2000);
		driver.close();
	}

}
