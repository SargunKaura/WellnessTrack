import React from 'react';
import './HomePage.css';

const HomePage = () => {
    return (
        <div className="homepage">
            <header>
                <nav className="navbar">
                    <a href="/">
                        <div className="logo"> 
                            <img src="/Logo1.png" alt="WellnessTrack Logo" />
                        </div>
                    </a>
                    <div className="auth-buttons">
                        <a href="/login">
                            <button className="login-btn">Login</button>
                        </a>
                        <a href="/register">
                            <button className="signup-btn">Register</button>
                        </a>
                    </div>
                </nav>
            </header>

            <main className="main-content">
                <h1>Welcome To WellnessTrack</h1>
                <p>Committed to Providing Excellent Health.</p>
                <div className="healthcare">
                    <img src="/Health2.jpg" alt="HealthCare" />
                </div>
            </main>
        </div>
    );
};

export default HomePage;