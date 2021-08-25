package FoodBox_Test;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Buying_Kart_Testcase {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
		WebDriver driver=new ChromeDriver();
		 JavascriptExecutor js = (JavascriptExecutor) driver;

		driver.get("http://localhost:9090/FoodBox");
	//	driver.get("http://13.232.246.255:8080/medicare/admin.jsp");
		driver.manage().window().maximize();
	
		driver.findElement(By.xpath("//*[@id='signin']")).click();
		driver.findElement(By.xpath("//*[@id='container']//form/input[1]")).sendKeys("raja");
		driver.findElement(By.xpath("//*[@id='container']//form/input[2]")).sendKeys("123");
		driver.findElement(By.xpath("//*[@id='container']//form/input[3]")).click();
		driver.findElement(By.xpath("//*[@id='options']//a[2]")).click();
		driver.findElement(By.xpath("//*[@id='calculation']//a[1]")).click();
		
		driver.switchTo().alert().accept();
		Thread.sleep(1000);
		 WebElement l=driver.findElement(By.name("btn"));
		 ((JavascriptExecutor)driver).executeScript("arguments[0].scrollIntoView(true);", l);
	      Thread.sleep(1000);
		driver.findElement(By.name("btn")).click();
	      Thread.sleep(1000);

	      driver.findElement(By.xpath("//*[@id='sec2']//a")).click();
			Thread.sleep(1000);
		  driver.close();

	}

}
