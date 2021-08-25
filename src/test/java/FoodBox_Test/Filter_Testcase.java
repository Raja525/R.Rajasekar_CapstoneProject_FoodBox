package FoodBox_Test;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Filter_Testcase {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
		WebDriver driver=new ChromeDriver();
		 JavascriptExecutor js = (JavascriptExecutor) driver;

		 driver.get("http://localhost:9090/FoodBox");
		//driver.get("http://13.232.246.255:8080/medicare/admin.jsp");
		driver.manage().window().maximize();
		
		driver.findElement(By.xpath("//*[@id='options']//a[1]")).click();
		
		driver.findElement(By.id("flush-headingOne")).click();
		Thread.sleep(2000);
		driver.findElement(By.xpath("//*[@id='flush-collapseOne']//div/span/form[1]")).click();
		Thread.sleep(2000);
		
		
		driver.findElement(By.id("flush-headingTwo")).click();
		Thread.sleep(2000);
		driver.findElement(By.xpath("//*[@id='flush-collapseTwo']//div/span/form[1]")).click();
		Thread.sleep(2000);
		
		driver.findElement(By.id("flush-headingThree")).click();
		Thread.sleep(2000);
		driver.findElement(By.xpath("//*[@id='flush-collapseThree']//div/span/form[3]")).click();
		Thread.sleep(2000);
		
		driver.findElement(By.xpath("//*[@id='Filter2']//div/form/input[1]")).click();
		driver.findElement(By.xpath("//*[@id='Filter2']//div/form/input[5]")).click();
		 WebElement l=driver.findElement(By.xpath("//*[@id='Filter2']//div/form/button"));
		 ((JavascriptExecutor)driver).executeScript("arguments[0].scrollIntoView(true);", l);
	      Thread.sleep(1000);
		driver.findElement(By.id("//*[@id='Filter2']//div/form/button")).click();
		Thread.sleep(3000);
		driver.close();
	}

}
