import React, { useState, useEffect } from 'react';

const PatientResults = () => {
    const [results, setResults] = useState([]);

    // Fetch patient test results
    useEffect(() => {
        fetch('/api/patient/results')
            .then(response => response.json())
            .then(data => setResults(data))
            .catch(error => console.error('Error fetching results:', error));
    }, []);

    return (
        <div>
            <h2>Test Results</h2>
            <ul>
                {results.map((result, index) => (
                    <li key={index}>
                        <p>Exam: {result.exam}</p>
                        <p>Date: {result.date}</p>
                        <p>Result: {result.result}</p>
                        <p>Status: {result.isAbnormal ? 'Abnormal' : 'Normal'}</p>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default PatientResults;
