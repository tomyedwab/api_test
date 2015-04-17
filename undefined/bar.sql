// Title: FooBar
// Description: Test description
SELECT dce.email AS email, DATE(ud.joined) AS join_date, ud.joined >= TIMESTAMP('2015-03-16') AS joined_since_3_16,
  COUNT(sud.kaid) AS students, IFNULL(SUM(sud.joined >= TIMESTAMP('2015-03-16')), 0) AS new_students_since_3_16
FROM
  (SELECT email, CONCAT('norm:', LOWER(email)) AS norm_email
   FROM [tomyedwab.donors_choose_emails_4_6]) dce
LEFT JOIN EACH FLATTEN([2015_04_04.UserData], auth_emails) ud
ON dce.norm_email = ud.auth_emails
LEFT JOIN EACH FLATTEN([2015_04_04.UserData], coaches) sud
ON sud.coaches = ud.user.email
GROUP BY email, join_date, joined_since_3_16
ORDER BY joined_since_3_16 DESC, new_students_since_3_16 DESC;
