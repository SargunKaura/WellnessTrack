import React from "react";
import "./DashboardPage.css"; // Import CSS for styling

const DashboardPage = () => {
    return (
        <div className="dashboard-container">
            <div className="header">
                <header>
                    <nav className="navbar">
                        <a href="/">
                            <div className="logo"> 
                                <img src="/Logo1.png" alt="WellnessTrack Logo" />
                            </div>
                        </a>
                        <div className="auth-buttons">
                            <a href="/">
                                <button className="signup-btn">Sign Out</button>
                            </a>
                        </div>
                    </nav>
                </header>
            </div>
        </div>
    );
};

export default DashboardPage;
