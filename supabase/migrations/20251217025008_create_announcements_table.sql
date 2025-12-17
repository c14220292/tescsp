/*
  # Create announcements table for Employee Portal

  ## Overview
  This migration creates the announcements table to store company announcements
  that will be displayed on the employee dashboard.

  ## Tables Created
  1. `announcements`
     - `id` (uuid, primary key) - Unique identifier for each announcement
     - `title` (text, not null) - Title of the announcement
     - `content` (text, not null) - Content/body of the announcement
     - `created_at` (timestamptz) - Timestamp when announcement was created

  ## Security
  1. Enable Row Level Security on announcements table
  2. Add policy for authenticated users to read all announcements
  
  ## Sample Data
  Inserts 3 sample announcements for testing purposes
*/

-- Create announcements table
CREATE TABLE IF NOT EXISTS announcements (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  content text NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE announcements ENABLE ROW LEVEL SECURITY;

-- Create policy: Authenticated users can read all announcements
CREATE POLICY "Authenticated users can view announcements"
  ON announcements
  FOR SELECT
  TO authenticated
  USING (true);

-- Insert sample data
INSERT INTO announcements (title, content) VALUES
  ('Welcome to Employee Portal', 'We are excited to launch our new employee portal. Please explore the features and let us know if you have any feedback.'),
  ('Company Meeting - Friday 2PM', 'Reminder: All-hands company meeting this Friday at 2PM in the main conference room. Attendance is mandatory.'),
  ('New Benefits Package Available', 'Our new enhanced benefits package is now available. Please check your email for details on enrollment and new offerings.')
ON CONFLICT DO NOTHING;