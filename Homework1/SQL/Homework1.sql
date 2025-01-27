-- Question 3: Trip Segmentation Count 

SELECT 
	CASE 
		WHEN trip_distance <= 1 THEN 'Up to 1 mile'
		WHEN trip_distance > 1 AND trip_distance <= 3 THEN '1 to 3 miles'
	  	WHEN trip_distance > 3 AND trip_distance <= 7 THEN '3 to 7 miles'
	  	WHEN trip_distance > 7 AND trip_distance <= 10 THEN '7 to 10 miles'
	  	ELSE 'Over 10 miles'
	END AS "Distance"
	, Count(*)

FROM public.taxi_data

WHERE 1=1
AND lpep_pickup_datetime >= '2019-10-01'
AND lpep_dropoff_datetime < '2019-11-01'


--  Question 4: Day with longest trip distance 
SELECT CAST(lpep_pickup_datetime AS DATE), trip_distance

FROM taxi_data

WHERE 1=1
AND trip_distance = (SELECT MAX(trip_distance) FROM taxi_data )

-- Question 5: Three biggest pickup zones
SELECT  
	CAST(lpep_pickup_datetime AS DATE) AS "PUDate"
	,zones."Zone"
	,SUM(total_amount)


FROM taxi_data

LEFT JOIN zones 
	ON zones."LocationID" = taxi_data."PULocationID"

WHERE 1=1
AND CAST(lpep_pickup_datetime AS DATE) = '2019-10-18'

GROUP BY 1,2

ORDER BY 3 DESC

-- Question 6: Largest tip 
SELECT  
	zpu."Zone" as "PUZone"
	,zdo."Zone" as "DOZone"
	,tip_amount


FROM taxi_data

LEFT JOIN zones zpu 
	ON zpu."LocationID" = taxi_data."PULocationID"

LEFT JOIN zones zdo
	ON zdo."LocationID" = taxi_data."DOLocationID"

WHERE 1=1
AND lpep_pickup_datetime >= '2019-10-01'
AND lpep_pickup_datetime < '2019-11-01'
AND zpu."Zone" = 'East Harlem North'

ORDER BY 3 DESC

LIMIT 1
