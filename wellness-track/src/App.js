import './App.css';
import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import HomePage from "./components/Home/HomePage.js";
import LoginPage from "./components/Login/LoginPage.js";
import RegisterPage from "./components/Patient/RegisterPage.js";
import PatientDashboard from './components/Patient/PatientDashboard.js';
import AdminDashboard from './components/Admin/AdminDashboard.js';
// import PatientProfile from './components/Patient/PatientProfile.js';
// import PatientResults from './components/Patient/PatientResults.js';
// import SearchResults from './components/Patient/SearchResults.js';

function App() {
    return (
        <Router>
            <Routes>
                <Route path="/" element={<HomePage />} />
                <Route path="/login" element={<LoginPage />} />
                <Route path="/register" element={<RegisterPage />} />
                <Route path="/patientdashboard" element={<PatientDashboard />} />
                <Route path="/admindashboard" element={<AdminDashboard />} />
                {/* <Route path="/patientprofile" element={<PatientProfile/>} />
                <Route path="/patientresults" element={<PatientResults />} />
                <Route path="/searchresults" element={<SearchResults/>} /> */}
                <Route path="*" element={<h1>Not Found</h1>} />
            </Routes>
        </Router>
    );
}

export default App;