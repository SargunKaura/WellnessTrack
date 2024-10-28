import React, { useState } from 'react';

const SearchResults = () => {
    const [searchCriteria, setSearchCriteria] = useState({
        date: '',
        examType: '',
        abnormalOnly: false,
    });
    const [searchResults, setSearchResults] = useState([]);

    const handleSearch = () => {
        // Mock API call with search criteria
        fetch(`/api/patient/search?date=${searchCriteria.date}&examType=${searchCriteria.examType}&abnormalOnly=${searchCriteria.abnormalOnly}`)
            .then(response => response.json())
            .then(data => setSearchResults(data))
            .catch(error => console.error('Error searching results:', error));
    };

    const handleChange = (e) => {
        const { name, value, type, checked } = e.target;
        setSearchCriteria((prevCriteria) => ({
            ...prevCriteria,
            [name]: type === 'checkbox' ? checked : value,
        }));
    };

    return (
        <div>
            <h2>Search Test Results</h2>
            <form>
                <label>Date:</label>
                <input type="date" name="date" value={searchCriteria.date} onChange={handleChange} />
                <label>Exam Type:</label>
                <input type="text" name="examType" value={searchCriteria.examType} onChange={handleChange} />
                <label>Abnormal Only:</label>
                <input type="checkbox" name="abnormalOnly" checked={searchCriteria.abnormalOnly} onChange={handleChange} />
                <button type="button" onClick={handleSearch}>Search</button>
            </form>
            <ul>
                {searchResults.map((result, index) => (
                    <li key={index}>
                        <p>Exam: {result.exam}</p>
                        <p>Date: {result.date}</p>
                        <p>Result: {result.result}</p>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default SearchResults;
