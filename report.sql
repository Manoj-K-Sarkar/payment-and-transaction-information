--Report 1
SELECT SUM(
        amount_paid_by_passenger + (
            amount_paid_by_passenger * (
                SELECT tax_percentage
                FROM tax AS t
                WHERE t.pk_tax_id = pt.fk_tax_id
            )
        ) / 100
    ) AS total_amount_in_range
FROM `transaction` AS pt
WHERE transaction_date BETWEEN '2021/03/01' AND '2021/03/10'
    AND payment_method = 'Credit Card';

--Report 2
SELECT SUM(
        (
            (
                (
                    amount_paid_by_passenger + (
                        amount_paid_by_passenger * (
                            SELECT tax_percentage
                            FROM tax AS t
                            WHERE t.pk_tax_id = pt.fk_tax_id
                        )
                    ) / 100
                ) * percentage_paid_to_driver
            ) / 100
        )
    ) AS earned_by_driver
FROM `transaction` AS pt
WHERE transaction_date BETWEEN '2021/03/01' AND '2021/03/10'
    AND fk_driver_id = 1;


--Report 3
SELECT WEEK(transaction_date) AS week_number,
    SUM(
        amount_paid_by_passenger * (
            100 + (
                SELECT tax_percentage
                FROM tax AS t
                WHERE t.pk_tax_id = pt.fk_tax_id
            )
        ) / 100 * (100 - percentage_paid_to_driver) / 100
    ) AS weekly_revenue
FROM `transaction` AS pt
GROUP BY WEEK(transaction_date);

--Report 4
SELECT WEEK(transaction_date) AS week_number,
    SUM(
        (
            (
                (
                    amount_paid_by_passenger + (
                        amount_paid_by_passenger * (
                            SELECT tax_percentage
                            FROM tax AS t
                            WHERE t.pk_tax_id = pt.fk_tax_id
                        )
                    ) / 100
                ) * percentage_paid_to_driver
            ) / 100
        )
    ) AS weekly_paid_to_drivers
FROM `transaction` AS pt
GROUP BY WEEK(transaction_date);