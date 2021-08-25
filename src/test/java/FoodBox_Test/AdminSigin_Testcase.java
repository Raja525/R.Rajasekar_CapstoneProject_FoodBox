package FoodBox_Test;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.By.ById;
import org.openqa.selenium.chrome.ChromeDriver;

public class AdminSigin_Testcase {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
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
		Thread.sleep(4000);
		driver.findElement(By.xpath("//*[@id='title']/div/a")).click();
		Thread.sleep(1000);
		driver.close();
	}

}
