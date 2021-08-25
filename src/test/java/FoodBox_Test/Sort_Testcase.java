package FoodBox_Test;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class Sort_Testcase {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
		WebDriver driver=new ChromeDriver();
		 JavascriptExecutor js = (JavascriptExecutor) driver;

		driver.get("http://localhost:9090/FoodBox");
	//	driver.get("http://13.232.246.255:8080/medicare/admin.jsp");
		driver.manage().window().maximize();
		
		driver.findElement(By.xpath("//*[@id='options']//a[1]")).click();
		driver.findElement(By.xpath("//*[@id='sort']//form[1]/input")).click();
		Thread.sleep(3000);
		driver.findElement(By.xpath("//*[@id='sort']//form[2]/input")).click();
		Thread.sleep(3000);
		driver.findElement(By.xpath("//*[@id='sort']//form[3]/input")).click();
		Thread.sleep(3000);
		driver.close();
	}

}
