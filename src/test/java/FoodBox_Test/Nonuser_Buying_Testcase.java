package FoodBox_Test;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Nonuser_Buying_Testcase {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
		WebDriver driver=new ChromeDriver();
		 JavascriptExecutor js = (JavascriptExecutor) driver;

		driver.get("http://localhost:9090/FoodBox");
	//	driver.get("http://13.232.246.255:8080/medicare/admin.jsp");
		driver.manage().window().maximize();
		
		driver.findElement(By.xpath("//*[@id='options']//a[1]")).click();
		driver.findElement(By.id("item")).click();
		driver.findElement(By.xpath("//*[@id='itemboxmsg']//a[1]")).click();
		
		 WebElement l=driver.findElement(By.name("itemid"));
		 ((JavascriptExecutor)driver).executeScript("arguments[0].scrollIntoView(true);", l);
	      Thread.sleep(1000);
		
	      driver.findElement(By.name("name")).sendKeys("raja");
	      driver.findElement(By.name("mail")).sendKeys("raja@gmail.com");
	      driver.findElement(By.name("mobile")).sendKeys("832234094");
	      driver.findElement(By.name("address")).sendKeys("siva engineerings");
	      driver.findElement(By.name("itemid")).click();
	      Thread.sleep(1000);
	      WebElement l1=driver.findElement(By.xpath("//*[@id='sec2']//a"));
			 ((JavascriptExecutor)driver).executeScript("arguments[0].scrollIntoView(true);", l1);
		      Thread.sleep(1000);
	      
	      driver.findElement(By.xpath("//*[@id='sec2']//a")).click();
	      Thread.sleep(1000);
		  driver.close();

	
	}
}
