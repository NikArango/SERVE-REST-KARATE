package karate.runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import karate.util.Cucumber;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class TestRunner {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:resources/features")
                .outputCucumberJson(true)
                .parallel(1);
        Cucumber cucumber = new Cucumber();
        String cucumberJson = cucumber.output(results.getReportDir());

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}