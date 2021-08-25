package FoodBox_Test;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class User_Kart_Testcase {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
		WebDriver driver=new ChromeDriver();
		 JavascriptExecutor js = (JavascriptExecutor) driver;

	//	driver.get("http://localhost:8081/Medicare");
		driver.get("http://13.232.246.255:8080/medicare/admin.jsp");
		driver.manage().window().maximize();
		
		driver.findElement(By.id("signin")).click();
		driver.findElement(By.xpath("//*[@id='in1']")).sendKeys("Raja");
		driver.findElement(By.xpath("//*[@id='in2']")).sendKeys("123");
		driver.findElement(By.xpath("//*[@id='in3']")).click();
		
		driver.findElement(By.xpath("//*[@id='searchcontainer']//form/button")).click();
		driver.findElement(By.xpath("//*[@id='item']")).click();
		driver.findElement(By.name("kart")).click();
		driver.switchTo().alert().accept();
		driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
		driver.findElement(By.id("kart")).click();
		driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
		driver.close();
		
	}

}
