import static org.junit.Assert.*;

import com.hp.lft.report.Reporter;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import com.hp.lft.sdk.*;
import com.hp.lft.sdk.web.*;
import com.hp.lft.verifications.*;

import unittesting.*;

import java.net.URI;
import java.net.URL;

public class LeanFtTest extends UnitTestClassBase {

    public LeanFtTest() {
        //Change this constructor to private if you supply your own public constructor
    }

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        instance = new LeanFtTest();
        globalSetup(LeanFtTest.class);
    }

    @AfterClass
    public static void tearDownAfterClass() throws Exception {
        globalTearDown();
    }

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void test() throws GeneralLeanFtException {


        // Launch the browser
        Browser browser = BrowserFactory.launch(BrowserType.CHROME);

        // Navigate to the starting URL
        browser.navigate("http://aos_main:8080/#/");

        // Soeakers or Audio
/*        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("SPAN").innerText("AUDIO").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW Bose Soundlink Bluetooth Speaker III $269.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("SPEAKERS ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW Bose SoundLink Wireless Speaker $129.00 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("SPEAKERS ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP Roar Mini Wireless Speaker $44.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("SPEAKERS ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP Roar Plus Wireless Speaker $169.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("SPEAKERS ").build()).click();

        // Go Home
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("dvantage DEMO ").build()).click();
*/
        // Tablets
        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("SPAN").innerText("TABLETS").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP ElitePad 1000 G2 Tablet $1,009.00 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("TABLETS ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP Elite x2 1011 G1 Tablet $1,279.00 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("TABLETS ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP Pro Tablet 608 G1 $479.00 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("TABLETS ").build()).click();

        // Go Home
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("dvantage DEMO ").build()).click();

        // Laptops
        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("SPAN").innerText("LAPTOPS").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP Chromebook 14 G1(ENERGY STAR) $299.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("LAPTOPS ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP Chromebook 14 G1(ES) $1,261.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("LAPTOPS ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP ENVY - 17t Touch Laptop $849.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("LAPTOPS ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP ENVY x360 - 15t Laptop $699.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("LAPTOPS ").build()).click();

        // Go Home
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("dvantage DEMO ").build()).click();

        // Mice
        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("SPAN").innerText("MICE").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP USB 3 Button Optical Mouse $9.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("MICE ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP Z3200 Wireless Mouse $29.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("MICE ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP Z3600 Wireless Mouse $15.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("MICE ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP Z3600 Wireless Mouse $15.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("MICE ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP Z4000 Wireless Mouse $9.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("MICE ").build()).click();

        // Go Home
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("dvantage DEMO ").build()).click();

        // Headphones
        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("SPAN").innerText("HEADPHONES").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW Beats Studio 2 Over-Ear Matte Black Headphones $179.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("HEADPHONES ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW Bose SoundLink Around-ear Wireless Headphones II $279.95 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("HEADPHONES ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW HP H2310 In-ear Headset $13.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("HEADPHONES ").build()).click();

        browser.describe(WebElement.class, new WebElementDescription.Builder()
                .tagName("LI").innerText("SOLD OUT SHOP NOW Logitech USB Headset H390 $39.99 ").build()).click();
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("HEADPHONES ").build()).click();

        // Go Home
        browser.describe(Link.class, new LinkDescription.Builder()
                .tagName("A").innerText("dvantage DEMO ").build()).click();

        // Close Browser
        browser.close();


    }

}