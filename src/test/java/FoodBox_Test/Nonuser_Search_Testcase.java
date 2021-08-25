package FoodBox_Test;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class Nonuser_Search_Testcase {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
		WebDriver driver=new ChromeDriver();
		 JavascriptExecutor js = (JavascriptExecutor) driver;

		 driver.get("http://localhost:9090/FoodBox");
		//driver.get("http://13.232.246.255:8080/medicare/admin.jsp");
		driver.manage().window().maximize();
		
		driver.findElement(By.xpath("//*[@id='options']//a[1]")).click();
		
		driver.findElement(By.xpath("//*[@id='searchcontainer']//input")).sendKeys("indian");;
		driver.findElement(By.xpath("//*[@class='btn']")).click();
		Thread.sleep(3000);
		driver.findElement(By.xpath("//*[@id='searchcontainer']//input")).sendKeys("veg");
		driver.findElement(By.xpath("//*[@class='btn']")).click();
		Thread.sleep(3000);
		driver.findElement(By.xpath("//*[@id='searchcontainer']//input")).sendKeys("idly");
		driver.findElement(By.xpath("//*[@class='btn']")).click();
		Thread.sleep(3000);
		driver.findElement(By.xpath("//*[@id='logo']")).click();
		Thread.sleep(3000);
		
		driver.close();
	}

}
