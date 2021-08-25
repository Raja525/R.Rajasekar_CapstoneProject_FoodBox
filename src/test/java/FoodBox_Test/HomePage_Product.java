package FoodBox_Test;


import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class HomePage_Product {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
		WebDriver driver=new ChromeDriver();
		 JavascriptExecutor js = (JavascriptExecutor) driver;

	//	driver.get("http://localhost:8081/Medicare");
		driver.get("http://13.232.246.255:8080/medicare/admin.jsp");
		driver.manage().window().maximize();
		
		 WebElement l=driver.findElement(By.xpath("//*[@id='n1']"));
		 ((JavascriptExecutor)driver).executeScript("arguments[0].scrollIntoView(true);", l);
	      Thread.sleep(1000);
	      
	      driver.findElement(By.xpath("//*[@id='n1']")).click();
	      driver.findElement(By.xpath("//*[@id='itemboxmsg']//button")).click();
	      
	      WebElement l1=driver.findElement(By.xpath("//*[@id='row']//form/input[5]"));
			 ((JavascriptExecutor)driver).executeScript("arguments[0].scrollIntoView(true);", l1);
		      Thread.sleep(1000);
		      
	      driver.findElement(By.xpath("//*[@id='form5']")).sendKeys("Raja");
			driver.findElement(By.xpath("//*[@id='form6']")).sendKeys("raja525@gmail.com");
			driver.findElement(By.xpath("//*[@id='form7']")).sendKeys("83344094");
			driver.findElement(By.xpath("//*[@id='form8']")).sendKeys("siva engineering works,kovilpatti");
			driver.findElement(By.xpath("//*[@id='row']//form/input[5]")).click();
			Thread.sleep(1000);
			driver.close();

		
	}

}
