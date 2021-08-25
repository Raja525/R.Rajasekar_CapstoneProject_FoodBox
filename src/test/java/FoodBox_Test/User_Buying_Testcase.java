package FoodBox_Test;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;

public class User_Buying_Testcase {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
		WebDriver driver=new ChromeDriver();
		 JavascriptExecutor js = (JavascriptExecutor) driver;

		driver.get("http://localhost:9090/FoodBox");
	//	driver.get("http://13.232.246.255:8080/medicare/admin.jsp");
		driver.manage().window().maximize();
		
		driver.findElement(By.id("signin")).click();
		driver.findElement(By.name("username")).sendKeys("raja");
		driver.findElement(By.name("password")).sendKeys("123");
		driver.findElement(By.xpath("//*[@id='container']//form/input[3]")).click();
		
		driver.findElement(By.xpath("//*[@id='options']//a[1]")).click();
		driver.findElement(By.xpath("//*[@id='item']")).click();
		driver.findElement(By.xpath("//*[@id='itemboxmsg']//div[4]/span/a")).click();
		
		//js.executeScript("window.scrollTo(0,document.body.scrollHeight)");
		 WebElement l=driver.findElement(By.xpath("//*[@id='sec2']//div[2]/div/a"));
		 ((JavascriptExecutor)driver).executeScript("arguments[0].scrollIntoView(true);", l);
	      Thread.sleep(1000);
		
		driver.findElement(By.xpath("//*[@id='sec2']//div[2]/div/a")).click();
		driver.switchTo().alert().accept();
		 Thread.sleep(1000);
		driver.close();
	}

}
