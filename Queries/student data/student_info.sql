-- Average, Min, Max, StdDev of GPA, Study Hours, Sleep Hours
SELECT
  AVG(previous_gpa) AS avg_gpa,
  MIN(previous_gpa) AS min_gpa,
  MAX(previous_gpa) AS max_gpa,
  STDDEV_SAMP(previous_gpa) AS stddev_gpa,

  AVG(study_hours_per_day) AS avg_study_hours,
  MIN(study_hours_per_day) AS min_study_hours,
  MAX(study_hours_per_day) AS max_study_hours,
  STDDEV_SAMP(study_hours_per_day) AS stddev_study_hours,

  AVG(sleep_hours) AS avg_sleep_hours,
  MIN(sleep_hours) AS min_sleep_hours,
  MAX(sleep_hours) AS max_sleep_hours,
  STDDEV_SAMP(sleep_hours) AS stddev_sleep_hours
FROM student_info;

-- GPA Range Buckets
SELECT
  CASE
    WHEN previous_gpa < 2.0 THEN '<2.0'
    WHEN previous_gpa BETWEEN 2.0 AND 3.0 THEN '2.0–3.0'
    ELSE '>3.0'
  END AS gpa_range,
  COUNT(*) AS num_students
FROM student_info
GROUP BY gpa_range;

-- Average GPA by Gender
SELECT gender, AVG(previous_gpa) AS avg_gpa
FROM student_info
GROUP BY gender;

-- Pearson Correlation Between Study Hours and GPA
SELECT 
    (COUNT(*) * SUM(study_hours_per_day * previous_gpa) -
     SUM(study_hours_per_day) * SUM(previous_gpa)) /
    (SQRT(COUNT(*) * SUM(POW(study_hours_per_day, 2)) - POW(SUM(study_hours_per_day), 2)) *
     SQRT(COUNT(*) * SUM(POW(previous_gpa, 2)) - POW(SUM(previous_gpa), 2))
    ) AS pearson_corr
FROM student_info;

-- Top 10% GPA Students
WITH rn AS (
  SELECT *, ROW_NUMBER() OVER (ORDER BY previous_gpa DESC) AS rnk, 
         COUNT(*) OVER () AS total
  FROM student_info
)
SELECT *
FROM rn
WHERE rnk <= total * 0.1;

-- Average Stress by Age Group
SELECT
  CASE
    WHEN age < 20 THEN 'Below 20'
    WHEN age BETWEEN 20 AND 25 THEN '20–25'
    ELSE 'Above 25'
  END AS age_group,
  AVG(stress_level) AS avg_stress
FROM student_info
GROUP BY age_group;

-- Attendance % for Students Above Avg GPA
SELECT AVG(attendance_percentage) AS avg_attendance
FROM student_info
WHERE previous_gpa > (SELECT AVG(previous_gpa) FROM student_info);

-- Students with Extracurricular > 10 Hrs
SELECT COUNT(*) AS num_active_students
FROM student_info
WHERE extracurricular_participation > 1;

-- Stress Level Distribution
SELECT
  CASE
    WHEN stress_level < 4 THEN 'Low'
    WHEN stress_level BETWEEN 4 AND 7 THEN 'Medium'
    ELSE 'High'
  END AS stress_category,
  COUNT(*) AS count
FROM student_info
GROUP BY stress_category;

-- High Study & High GPA
SELECT *
FROM student_info
WHERE study_hours_per_day > 10 AND previous_gpa > 3.5;

-- Clustering Score (Manual Composite Score)
SELECT *,
  (study_hours_per_day + sleep_hours + previous_gpa) / 3 AS clustering_score
FROM student_info
ORDER BY clustering_score DESC;

-- At-Risk Students
SELECT *
FROM student_info
WHERE previous_gpa < 2.0 AND attendance_percentage < 75 AND stress_level > 7;

-- Impact of Study Hours on GPA by Age Group
SELECT
  CASE
    WHEN age < 20 THEN 'Below 20'
    WHEN age BETWEEN 20 AND 25 THEN '20–25'
    ELSE 'Above 25'
  END AS age_group,
  AVG(study_hours_per_day) AS avg_study_hours,
  AVG(previous_gpa) AS avg_gpa
FROM student_info
GROUP BY age_group;

-- Sleep vs GPA Based on Extracurricular Participation
SELECT extracurricular_participation, AVG(sleep_hours) AS avg_sleep, AVG(previous_gpa) AS avg_gpa
FROM student_info
GROUP BY extracurricular_participation;

-- Detect Outliers
SELECT *
FROM student_info
WHERE study_hours_per_day > (
    SELECT AVG(study_hours_per_day) + 2 * STDDEV_SAMP(study_hours_per_day) FROM student_info)
   OR study_hours_per_day < (
    SELECT AVG(study_hours_per_day) - 2 * STDDEV_SAMP(study_hours_per_day) FROM student_info)
   OR previous_gpa > (
    SELECT AVG(previous_gpa) + 2 * STDDEV_SAMP(previous_gpa) FROM student_info)
   OR previous_gpa < (
    SELECT AVG(previous_gpa) - 2 * STDDEV_SAMP(previous_gpa) FROM student_info);

-- Two-Way Aggregation: GPA by Stress + Study Hours
SELECT 
    FLOOR(stress_level) AS stress_group,
    FLOOR(study_hours_per_day) AS study_group,
    AVG(previous_gpa) AS avg_gpa
FROM
    student_info
GROUP BY stress_group , study_group
ORDER BY stress_group , study_group;

-- Classify Students as Stressed or Not
SELECT *,
  CASE WHEN stress_level >= 7 THEN 'Stressed' ELSE 'Not Stressed' END AS stress_status
FROM student_info;



 


