package runners;

import com.intuit.karate.junit5.Karate;

class UpdateBookingRunner {
    @Karate.Test
    Karate testBooker() {
        return Karate.run("classpath:feature/UpdateBooking.feature");
    }
}
