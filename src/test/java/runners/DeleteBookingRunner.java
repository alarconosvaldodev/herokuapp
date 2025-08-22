package runners;

import com.intuit.karate.junit5.Karate;

class DeleteBookingRunner {
    @Karate.Test
    Karate testBooker() {
        return Karate.run("classpath:feature/DeleteBooking.feature");
    }
}
