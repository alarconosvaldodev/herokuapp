package runners;

import com.intuit.karate.junit5.Karate;

class CreateTokenRunner {
    @Karate.Test
    Karate testBooker() {
        return Karate.run("classpath:feature/CreateToken.feature");
    }
}
