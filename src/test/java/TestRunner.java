import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit4.Karate;
import org.junit.runner.Result;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
public class TestRunner {
    Results results = Runner.path("classpath:test/java")
            .outputJunitXml(true)
            .parallel(1);
}

/* runner for jUnit 5
import com.intuit.karate.junit5.Karate;

 class runnerTest {
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
 */