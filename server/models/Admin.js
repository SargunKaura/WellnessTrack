const db = require('../config/db');

const Admin = {
    // Find admin by ID
    findById: (adminId, callback) => {
        const query = 'SELECT * FROM admin WHERE admin_id = ?';
        db.query(query, [adminId], callback);
    },

    // Create a new admin
    create: (adminData, callback) => {
        const query = `
            INSERT INTO admin (admin_id, name, email, date_of_birth, phone_number, hire_date, role, status, image) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        `;
        const { adminID, name, email, dateOfBirth, phoneNumber, hireDate, role, status, image } = adminData;
        db.query(query, [adminID, name, email, dateOfBirth, phoneNumber, hireDate, role, status, image], callback);
    },

    // Update admin profile
    update: (adminId, updatedData, callback) => {
        const query = `
            UPDATE admin 
            SET name = ?, email = ?, date_of_birth = ?, phone_number = ?, hire_date = ?, role = ?, status = ?, image = ? 
            WHERE admin_id = ? `;
        const { name, email, dateOfBirth, phoneNumber, hireDate, role, status, image } = updatedData;
        db.query(query, [name, email, dateOfBirth, phoneNumber, hireDate, role, status, image, adminId], callback);
    },

    // Delete an admin by ID
    delete: (adminId, callback) => {
        const query = 'DELETE FROM admin WHERE admin_id = ?';
        db.query(query, [adminId], callback);
    },

    // Retrieve all admins
    findAll: (callback) => {
        const query = 'SELECT * FROM admin';
        db.query(query, callback);
    }
};

module.exports = Admin;
