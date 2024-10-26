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
                            <a href="/login">
                                <button className="login-btn">Login</button>
                            </a>
                            <a href="/register">
                                <button className="signup-btn">Register</button>
                            </a>
                        </div>
                    </nav>
                </header>
            </div>

            <div className="dashboard-content">
                {/* Profile Section */}
                <div className="profile-section">
                    <div className="profile-card">
                        <img src="profile-image-url" alt="Profile" className="profile-image" />
                        <h2>Moumy Kabir</h2>
                        <p>18/09/2022</p>
                        <p>Farmgate</p>
                    </div>
                    <div className="menu-list">
                        <p>Dashboard</p>
                        <p>Search Doctor</p>
                        <p>Medical Shop</p>
                        <p>Multiple Hospitals</p>
                    </div>
                </div>

                {/* Main Section */}
                <div className="main-section">
                    <div className="tabs">
                        <button className="tab active">Appointments</button>
                        <button className="tab">Prescriptions</button>
                        <button className="tab">Medical Records</button>
                        <button className="tab">Billing</button>
                    </div>

                <div className="appointments">
                    <table className="appointments-table">
                        <thead>
                            <tr>
                            <th>Doctor</th>
                            <th>Appt Date</th>
                            <th>Type</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Payment Status</th>
                            <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <img src="doctor-image-url" alt="Doctor" className="doctor-image" />
                                    <p>Jawwadul Islam</p>
                                    <p>Cardiology - Square Hospital</p>
                                </td>
                                <td>Sept. 19, 2022 9:32 pm</td>
                                <td>Checkup</td>
                                <td>1500 BDT</td>
                                <td><span className="status confirm">Confirm</span></td>
                                <td><span className="status paid">Paid</span></td>
                                <td><button className="pay-now-btn">Pay Now</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
);
};

export default DashboardPage;
