package FoodBox_Test;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class AdminDelete_Testcase {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
		WebDriver driver=new ChromeDriver();
		 JavascriptExecutor js = (JavascriptExecutor) driver;

		 driver.get("http://localhost:9090/FoodBox/home.jsp");
			//driver.get("http://13.232.246.255:8080/medicare/admin.jsp");
			driver.manage().window().maximize();
			driver.findElement(By.xpath("//*[@id='signin']")).click();
			driver.findElement(By.xpath("//*[@id='container']//form/input[1]")).sendKeys("admin");
			driver.findElement(By.xpath("//*[@id='container']//form/input[2]")).sendKeys("123");
			driver.findElement(By.xpath("//*[@id='container']//form/input[3]")).click();
			
		    driver.findElement(By.xpath("//*[@id='sidebar']//ul/li[4]/button")).click();
		    
		 WebElement l=driver.findElement(By.name("//*[@id='container']//div[15]"));
		 ((JavascriptExecutor)driver).executeScript("arguments[0].scrollIntoView(true);", l);
	      Thread.sleep(1000);
		
		driver.findElement(By.xpath("//*[@id='container']//div[15]")).click();
		Thread.sleep(1000);
		driver.close();
		
	}

}
