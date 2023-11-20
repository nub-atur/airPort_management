CALL BookTicket(1, 1, 'A13', 150.00);
SELECT max(ticket_id) INTO @max FROM tickets;
SELECT tickets.*, flights.*, passengers.*
FROM tickets
JOIN flights ON tickets.flight_id = flights.flight_id
JOIN passengers ON tickets.passenger_id = passengers.passenger_id
WHERE tickets.ticket_id = @max;