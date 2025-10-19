-- Ejercicio 1. Escribe una consulta que recupere los Vuelos (flights) y su identificador que figuren con status On Time.

    SELECT flight_id, flight_no
    FROM flights
    WHERE status = 'On Time';

-- Ejercicio 2. Escribe una consulta que extraiga todas las columnas de la tabla bookings y refleje todas las reservas que han supuesto una cantidad total mayor a 1.000.000 (Unidades monetarias).

    SELECT *
    FROM bookings
    WHERE total_amount > 1000000;

-- Ejercicio 3. Escribe una consulta que extraiga todas las columnas de los datos de los modelos de aviones disponibles (aircraft_data). Puede que os aparezca en alguna actualización como "aircrafts_data", revisad las tablas y elegid la que corresponda.

    SELECT *
    FROM aircrafts_data;

-- 4. Con el resultado anterior visualizado previamente, escribe una consulta que extraiga los identificadores de vuelo que han volado con un Boeing 737. (Código Modelo Avión = 733)

    SELECT flight_no
    FROM flights
    WHERE aircraft_code = '733';

-- 5. Escribe una consulta que te muestre la información detallada de los tickets que han comprado las personas que se llaman Irina.
    -- Para este ejercicio me he ayudado de ChatGPT con el ILIKE '%text%'
        SELECT *
        FROM tickets
        WHERE passenger_name ILIKE '%Irina%';

-----------------------------------------------------------------------------
-- A partir de aquí son queries opcionales para continuar practicando:  -----
-----------------------------------------------------------------------------

-- 6. Mostrar las ciudades con más de un aeropuerto.
    -- Para este ejercicio, me he ayudado de ChatGPT.
        SELECT city, COUNT(*) AS total_aeropuertos
        FROM airports_data
        GROUP BY city
        ORDER BY total_aeropuertos DESC;

-- 7. Mostrar el número de vuelos por modelo de avión.
    -- Gracias al ejercicio anterior, este ha sido complicado, pero no he necesitado pedir ayudar a GPT.
        SELECT aircraft_code, COUNT(*) AS numVuelos
        FROM flights
        GROUP BY aircraft_code 
        ORDER BY aircraft_code DESC;

    -- 8. Reservas con más de un billete (varios pasajeros).   
    -- Me he ayudado nuevamente de GPT, ya que no sabia del HAVING ni de que no puedo llamar a billetesReserva, primero habia probado con un WHERE billetesReserva > 1, pero ya ves... hay que "having count" de como se hace bien...
        SELECT book_ref, COUNT(*) AS billetesReserva
        FROM tickets
        GROUP BY book_ref
        HAVING COUNT(*) > 1
        ORDER BY billetesReserva DESC;

-- 9. Vuelos con retraso de salida superior a una hora.
    -- Yo habia encontrado aquellos que el departure era mayor que el scheduled...
    -- Ayudado por GPT en cuanto a buscar la diferencia de 1 hora

        SELECT *
        FROM flights
        WHERE actual_departure - scheduled_departure > INTERVAL '1 hour'; 