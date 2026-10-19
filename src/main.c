#include <stdio.h>
#include "pico/stdlib.h"

// Define your LED pin (adjust if you wired it to a specific breakout GPIO)
#ifndef LED_PIN
#define LED_PIN PICO_DEFAULT_LED_PIN
#endif

int main() {
    // Initialize standard USB stdio for serial debugging
    stdio_init_all();

    // Initialize the LED pin as an output
    gpio_init(LED_PIN);
    gpio_set_dir(LED_PIN, GPIO_OUT);

    int counter = 0;

    while (true) {
        // Toggle LED on/off
        gpio_put(LED_PIN, 1);
        printf("D-BOARD 2026: Heartbeat %d - LED ON\n", counter);
        sleep_ms(500);

        gpio_put(LED_PIN, 0);
        printf("D-BOARD 2026: Heartbeat %d - LED OFF\n", counter);
        sleep_ms(500);

        counter++;
    }
    return 0;
}