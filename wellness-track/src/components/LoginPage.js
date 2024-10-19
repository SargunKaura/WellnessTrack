import React, { useState } from "react";
import { Link } from "react-router-dom";
import '../App.css'; // Assuming you have a CSS file for styling

const LoginPage = () => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);

  const handleLogin = (e) => {
    e.preventDefault();
    // Add your login logic here
    console.log("Username:", username);
    console.log("Password:", password);
  };

  return (
    <div className="login-container">
      <div className="login-form">
        <div className="logo-section">
          <img src="default.jpg" alt="HealthStack Logo" className="logo" />
          <h2>HealthStack</h2>
        </div>
        <form onSubmit={handleLogin}>
          <h3>Login Patient</h3>
          <div className="form-group">
            <label>User Name</label>
            <input
              type="text"
              className="form-control"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              placeholder="Enter user name"
              required
            />
          </div>
          <div className="form-group">
            <label>Password</label>
            <input
              type={showPassword ? "text" : "password"}
              className="form-control"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Enter password"
              required
            />
          </div>
          <div className="form-check">
            <input
              type="checkbox"
              className="form-check-input"
              id="showPassword"
              checked={showPassword}
              onChange={() => setShowPassword(!showPassword)}
            />
            <label className="form-check-label" htmlFor="showPassword">
              Show Password
            </label>
          </div>
          <button type="submit" className="btn btn-primary btn-block">
            Login
          </button>
          <div className="extra-links">
            <Link to="/forgot-password">Forgot Password?</Link>
            <br />
            <Link to="/register">Don't have an account? Register</Link>
            <br />
            <Link to="/admin-login">Want to login as Admin?</Link>
          </div>
        </form>
        <div className="contact-info">
          <p>Contact: +880 1234 567890</p>
        </div>
      </div>
      <div className="illustration-section">
        <img src="default.jpg" alt="Health Illustration" />
      </div>
    </div>
  );
};

export default LoginPage;
