import React, { useEffect, useState } from 'react';

const AdminDashboard = () => {
    const [accounts, setAccounts] = useState([]);
    const [newAccount, setNewAccount] = useState({
        name: '',
        email: '',
        phone: '',
        image: '',
        workingId: '',
        role: 'doctor' // Default role
    });

    useEffect(() => {
        // Fetch existing accounts
        fetch('/api/accounts')
        .then((response) => response.json())
        .then((data) => setAccounts(data))
        .catch((error) => console.error('Error fetching accounts:', error));
    }, []);

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setNewAccount((prevAccount) => ({
        ...prevAccount,
        [name]: value
        }));
    };

    const handleCreateAccount = (e) => {
        e.preventDefault();
        // Submit the new account to the backend
        fetch('/api/createAccount', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(newAccount),
        })
        .then((response) => response.json())
        .then((data) => {
            console.log('Account created:', data);
            setAccounts((prevAccounts) => [...prevAccounts, data]);
            // Clear the form
            setNewAccount({
            name: '',
            email: '',
            phone: '',
            image: '',
            workingId: '',
            role: 'doctor',
            });
        })
        .catch((error) => console.error('Error creating account:', error));
    };

    const handleApproveAccount = (accountId) => {
        // Function to approve a patient account
        fetch(`/api/approveAccount/${accountId}`, {
        method: 'PATCH',
        })
        .then((response) => response.json())
        .then((data) => {
            console.log('Account approved:', data);
            setAccounts((prevAccounts) => 
            prevAccounts.map((account) => 
                account.id === accountId ? { ...account, approved: true } : account
            )
            );
        })
        .catch((error) => console.error('Error approving account:', error));
    };

    return (
        <div className="admin-dashboard">
            <header>
                <nav className="navbar">
                    <a href="/">
                        <div className="logo"> 
                            <img src="/Logo1.png" alt="WellnessTrack Logo" />
                        </div>
                    </a>
                    <div className="auth-buttons">
                        <a href="/signout">
                            <button className="login-btn">Sign Out</button>
                        </a>
                    </div>
                </nav>
            </header>

            <h2>Administrator Dashboard</h2>

            {/* Create Account Section */}
            <div className="create-account">
                <h3>Create New Account</h3>
                <form onSubmit={handleCreateAccount}>
                <input
                    type="text"
                    name="name"
                    value={newAccount.name}
                    onChange={handleInputChange}
                    placeholder="Name"
                    required
                />
                <input
                    type="email"
                    name="email"
                    value={newAccount.email}
                    onChange={handleInputChange}
                    placeholder="Email"
                    required
                />
                <input
                    type="text"
                    name="phone"
                    value={newAccount.phone}
                    onChange={handleInputChange}
                    placeholder="Phone Number"
                    required
                />
                <input
                    type="text"
                    name="image"
                    value={newAccount.image}
                    onChange={handleInputChange}
                    placeholder="Image URL"
                />
                <input
                    type="text"
                    name="workingId"
                    value={newAccount.workingId}
                    onChange={handleInputChange}
                    placeholder="Working ID"
                    required
                />
                <select name="role" value={newAccount.role} onChange={handleInputChange}>
                    <option value="doctor">Doctor</option>
                    <option value="staff">Staff</option>
                </select>
                <button type="submit">Create Account</button>
                </form>
            </div>

            {/* Accounts List Section */}
            <div className="accounts-list">
                <h3>All Accounts</h3>
                <ul>
                {accounts.map((account) => (
                    <li key={account.id}>
                    <strong>{account.name}</strong> - {account.role} - {account.email} 
                    {account.approved ? (
                        <span style={{ color: 'green' }}> (Approved)</span>
                    ) : (
                        <button onClick={() => handleApproveAccount(account.id)}>Approve</button>
                    )}
                    </li>
                ))}
                </ul>
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
};

export default AdminDashboard;
