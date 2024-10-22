import React from 'react';
import './HomePage.css';

const HomePage = () => {
    return (
        <div className="homepage">
            <header>
                <nav className="navbar">
                    <div className="logo"> 
                        <img src="/default.jpg" alt="WellnessTrack Logo" />
                    </div>
                    <div className="nav-links">
                        <a href="/">Home</a>
                        <a href="/">About Us</a>
                    </div>
                    <div className="contact-info">
                        <span>Contact: +1 (604) 123 4567</span>
                    </div>
                    <div className="auth-buttons">
                        <button className="login-btn">Login</button>
                        <button className="signup-btn">Sign Up</button>
                    </div>
                </nav>
            </header>

            <main className="main-content">
                <h1>Welcome To WellnessTrack</h1>
                <p>Committed to Providing Excellent Health.</p>

                <div className="doctor-images">
                    <img src="/path_to_doctor1.png" alt="Doctor 1" />
                    <img src="/path_to_doctor2.png" alt="Doctor 2" />
                    <img src="/path_to_doctor3.png" alt="Doctor 3" />
                </div>
            </main>
        </div>
    );
};

export default HomePage;
