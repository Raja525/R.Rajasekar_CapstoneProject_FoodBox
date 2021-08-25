package FoodBox_Test;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

//------------------------------Passing-------------------------//
public class AdminUpdate_Testcase {

	public static void main(String[] args) throws InterruptedException {
		System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
		WebDriver driver=new ChromeDriver();
	
		driver.get("http://localhost:9090/FoodBox/home.jsp");
		//	driver.get("http://13.232.246.255:8080/medicare/admin.jsp");
			driver.manage().window().maximize();
			driver.manage().window().maximize();
			driver.findElement(By.xpath("//*[@id='signin']")).click();
			driver.findElement(By.xpath("//*[@id='container']//form/input[1]")).sendKeys("admin");
			driver.findElement(By.xpath("//*[@id='container']//form/input[2]")).sendKeys("123");
			driver.findElement(By.xpath("//*[@id='container']//form/input[3]")).click();
			
			driver.findElement(By.xpath("//*[@id='sidebar']//ul/li[3]/button")).click();
			driver.findElement(By.name("update")).click();
			driver.findElement(By.name("price")).clear();
		driver.findElement(By.name("price")).sendKeys("110");
		
		 WebElement l=driver.findElement(By.id("btn"));
		 ((JavascriptExecutor)driver).executeScript("arguments[0].scrollIntoView(true);", l);
	      Thread.sleep(1000);
	      
		driver.findElement(By.id("btn")).click();
		Thread.sleep(1000);
		driver.close();
	}

}
