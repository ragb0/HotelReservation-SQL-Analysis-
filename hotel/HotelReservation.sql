--What is the total number of reservations in the dataset?
select COUNT(*) AS total_reservation from mentorness..[HotelReservationDataset]

--Which meal plan is the most popular among guests?
SELECT TOP 1 type_of_meal_plan, COUNT(*) AS count
FROM mentorness..[HotelReservationDataset]
GROUP BY type_of_meal_plan
ORDER BY count DESC

--What is the average price per room for reservations involving children?
SELECT AVG(avg_price_per_room) AS average_price_per_room_with_children
FROM mentorness..[HotelReservationDataset]
WHERE no_of_children > 0;

--How many reservations were made for the year 20XX (replace XX with the desired year)?
SELECT COUNT(*) AS reservations_in_2022
FROM mentorness..[HotelReservationDataset]
WHERE YEAR(arrival_date) = 2018;

--What is the most commonly booked room type?
SELECT TOP 1 room_type_reserved, COUNT(*) AS num_bookings
FROM mentorness..[HotelReservationDataset]
WHERE booking_status = 'Not_Canceled' -- Filter for confirmed bookings if needed
GROUP BY room_type_reserved
ORDER BY num_bookings DESC


--How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(*) AS weekend_reservations
FROM HotelReservationDataset
WHERE no_of_weekend_nights > 0;

--What is the highest and lowest lead time for reservations?
SELECT 
    MAX(lead_time) AS highest_lead_time,
    MIN(lead_time) AS lowest_lead_time
FROM HotelReservationDataset;

--What is the most common market segment type for reservations?
SELECT TOP 1 market_segment_type, COUNT(*) AS segment_count
FROM HotelReservationDataset
GROUP BY market_segment_type
ORDER BY segment_count DESC

--How many reservations have a booking status of "Confirmed"?
SELECT COUNT(*) AS confirmed_reservations
FROM HotelReservationDataset
WHERE booking_status = 'Not_Canceled';

--What is the total number of adults and children across all reservations?
SELECT 
    SUM(no_of_adults) AS total_adults,
    SUM(no_of_children) AS total_children
FROM HotelReservationDataset;

--What is the average number of weekend nights for reservations involving children?
SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights_with_children
FROM HotelReservationDataset
WHERE no_of_children > 0;

--How many reservations were made in each month of the year?
SELECT 
    MONTH(arrival_date) AS reservation_month,
    COUNT(*) AS num_reservations
FROM HotelReservationDataset
GROUP BY MONTH(arrival_date)
ORDER BY reservation_month;

--What is the average number of nights (both weekend and weekday) spent by guests for each room
--type?
SELECT 
    room_type_reserved,
    AVG(no_of_weekend_nights + no_of_week_nights) AS avg_nights_per_room_type
FROM HotelReservationDataset
GROUP BY room_type_reserved;

--For reservations involving children, what is the most common room type, and what is the average
--price for that room type?
SELECT TOP 1
    room_type_reserved AS most_common_room_type,
    COUNT(*) AS num_reservations,
    AVG(avg_price_per_room) AS avg_price
FROM HotelReservationDataset
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY num_reservations DESC;

--Find the market segment type that generates the highest average price per room.
SELECT  TOP 1
    market_segment_type,
    AVG(avg_price_per_room) AS avg_price_per_room
FROM HotelReservationDataset
GROUP BY market_segment_type
ORDER BY avg_price_per_room DESC








