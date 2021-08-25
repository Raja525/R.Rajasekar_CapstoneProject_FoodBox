package FoodBox_Test;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.By.ById;
import org.openqa.selenium.chrome.ChromeDriver;

public class SignIn_Testcase {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
		WebDriver driver=new ChromeDriver();
		
		driver.get("http://localhost:9090/FoodBox");
	//	driver.get("http://13.232.246.255:8080/medicare/admin.jsp");
		driver.manage().window().maximize();
		
		driver.findElement(By.id("signin")).click();
		driver.findElement(By.name("username")).sendKeys("raja");
		driver.findElement(By.name("password")).sendKeys("123");
		driver.findElement(By.xpath("//*[@id='container']//form/input[3]")).click();
		Thread.sleep(3000);
		driver.close();
	}

}
