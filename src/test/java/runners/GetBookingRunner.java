package runners;

import com.intuit.karate.junit5.Karate;

class GetBookingRunner {
    @Karate.Test
    Karate testBooker() {
        return Karate.run("classpath:feature/GetBooking.feature");
    }
}
