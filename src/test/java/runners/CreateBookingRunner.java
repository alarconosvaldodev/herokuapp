package runners;

import com.intuit.karate.junit5.Karate;

class CreateBookingRunner {
    @Karate.Test
    Karate testBooker() {
        return Karate.run("classpath:feature/CreateBooking.feature");
    }
}
