import React, { useState, useEffect } from 'react';

const PatientProfile = () => {
    const [profile, setProfile] = useState({
        name: '',
        email: '',
        phone: '',
        dob: '',
        healthId: ''
    });

    // Fetch profile data
    useEffect(() => {
        // Mock API call to fetch profile data
        fetch('/api/patient/profile')
            .then(response => response.json())
            .then(data => setProfile(data))
            .catch(error => console.error('Error fetching profile:', error));
    }, []);

    // Handle profile update
    const handleChange = (e) => {
        const { name, value } = e.target;
        setProfile((prevProfile) => ({
            ...prevProfile,
            [name]: value,
        }));
    };

    const handleSave = () => {
        // API call to update profile data
        console.log('Profile saved:', profile);
    };

    return (
        <div>
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

            <h2>Patient Profile</h2>
            <form>
                <label>Name:</label>
                <input type="text" name="name" value={profile.name} onChange={handleChange} />
                <label>Email:</label>
                <input type="email" name="email" value={profile.email} onChange={handleChange} />
                <label>Phone:</label>
                <input type="tel" name="phone" value={profile.phone} onChange={handleChange} />
                <label>Date of Birth:</label>
                <input type="date" name="dob" value={profile.dob} onChange={handleChange} />
                <label>Health ID:</label>
                <input type="text" name="healthId" value={profile.healthId} onChange={handleChange} />
                <button type="button" onClick={handleSave}>Save</button>
            </form>

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

export default PatientProfile;
