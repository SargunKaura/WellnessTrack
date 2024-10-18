import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import LoginPage from "./components/LoginPage"; // Import the LoginPage component

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" exact component={LoginPage} />
        {/* Other routes */}
      </Routes>
    </Router>
  );
}

export default App;