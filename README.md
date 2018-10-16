# Oystercard challenge

This program simulates the Oystercard system in London.

### Objects available (classes)

The universe of this programme contains four objects:

1. *Stations*

   have names and zones.

2. *Oystercards*

   can be topped up, or touched in or out of specific stations. They also stored balance.

3. *Journey Log*

   stores all historic journeys for an oystercard as well as keeping track of the current journey. It can detect incomplete journeys (where a customer has failed to tap out).

4. *Journey*

   calculates fares once each journey is complete. A journey will incur a penalty charge if the customer has failed to touch in or out, otherwise it will calculate a zone-based charge.

### Example usage

Initialize an `Oystercard`
