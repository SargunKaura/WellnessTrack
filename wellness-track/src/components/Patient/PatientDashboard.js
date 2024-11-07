import React, { useEffect, useState } from 'react';

const PatientDashboard = () => {
  const [prescribedExams, setPrescribedExams] = useState([]);

  useEffect(() => {
    // Fetch prescribed exams
  }, []);

  return (
    <div className="patient-dashboard">
        <header>
            <nav className="navbar">
                <a href="/">
                    <div className="logo"> 
                        <img src="/Logo1.png" alt="WellnessTrack Logo" />
                    </div>
                </a>
                <div className="auth-buttons">
                    <a href="/signout">
                        <button className="login-btn">Sign Out</button>
                    </a>
                </div>
            </nav>
        </header>

        <h2>Welcome to Your Dashboard</h2>

        {/* Prescribed Exams Section */}
        <div className="prescribed-exams">
            <h3>Current Prescribed Exams</h3>
            {prescribedExams.length > 0 ? (
            <p>You have exams currently prescribed.</p>
            ) : (
            <p>No exams are currently prescribed.</p>
            )}
        </div>

        {/* Previous Exam Results Section */}
        <div className="exam-results">
            <h3>Previous Exam Results</h3>
            <p>Details of your previous exams will appear here.</p>
        </div>

        <footer className="footer">
            <div className="footer-content">
                <p>Contact Us</p>
                <p>Email: contact@wellnesstrack.com</p>
                <p>Phone: +1 800 123 4567</p>
                <p>Address: 123 Wellness St., Health City, Country</p>
            </div>
        </footer>
    </div>
  );
};

export default PatientDashboard;
