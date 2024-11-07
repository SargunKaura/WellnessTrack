const db = require('../config/db');

const Patient = {
    findById: (patientId, callback) => {
        db.query('SELECT * FROM patients WHERE patient_id = ?', [patientId], callback);
    }
};

module.exports = Patient;
