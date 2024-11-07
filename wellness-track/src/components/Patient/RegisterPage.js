import React, { useState } from 'react'; 
import './RegisterPage.css';

function RegisterPage() {
    const [formData, setFormData] = useState({
        username: '',
        password: '',
        email: '',
        confirmPassword: '',
        phone: '',             // New field for contact phone number
        dateOfBirth: '',       // New field for date of birth
        healthID: ''          // New field for health ID
    });

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        // Check if passwords match
        if (formData.password !== formData.confirmPassword) {
            alert("Passwords do not match!");
            return;
        }
        // Submit form data to the server
        console.log('Form submitted:', formData);
    };

    return (
        <div className="register-container">
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
            <div className="register-background" style={{ backgroundImage: `url(${process.env.PUBLIC_URL + '/Register.jpg'})` }}>
                <div className="form-container">
                    <h2>Register</h2>
                    <form onSubmit={handleSubmit}>
                        <label htmlFor="username">User Name</label>
                        <input 
                            type="text" 
                            id="username" 
                            name="username" 
                            value={formData.username} 
                            onChange={handleChange} 
                            required 
                        />

                        <label htmlFor="email">Email</label>
                        <input 
                            type="email" 
                            id="email" 
                            name="email" 
                            value={formData.email} 
                            onChange={handleChange} 
                            required 
                        />

                        <label htmlFor="phone">Contact Phone Number</label>
                        <input 
                            type="tel" 
                            id="phone" 
                            name="phone" 
                            value={formData.phone} 
                            onChange={handleChange} 
                            required 
                        />

                        <label htmlFor="dateOfBirth">Date of Birth</label>
                        <input 
                            type="date" 
                            id="dateOfBirth" 
                            name="dateOfBirth" 
                            value={formData.dateOfBirth} 
                            onChange={handleChange} 
                            required 
                        />

                        <label htmlFor="healthID">Health ID</label>
                        <input 
                            type="text" 
                            id="healthID" 
                            name="healthID" 
                            value={formData.healthID} 
                            onChange={handleChange} 
                            required 
                        />

                        <label htmlFor="password">Password</label>
                        <input 
                            type="password" 
                            id="password" 
                            name="password" 
                            value={formData.password} 
                            onChange={handleChange} 
                            required 
                        />

                        <label htmlFor="confirmPassword">Confirm Password</label>
                        <input 
                            type="password" 
                            id="confirmPassword" 
                            name="confirmPassword" 
                            value={formData.confirmPassword} 
                            onChange={handleChange} 
                            required 
                        />

                        <button type="submit" className="register-button">Register</button>
                    </form>
                    <p>
                        Already have an account? <a href="/login">Login here</a>
                    </p>
                </div>
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
}

export default RegisterPage;
