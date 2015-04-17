// Title: FooBar
// Description: Test description
// test
SELECT email, CONCAT('norm:', LOWER(email)) AS norm_email
   FROM [tomyedwab.donors_choose_emails_4_6]
   
   GROUP BY email, norm_email;
