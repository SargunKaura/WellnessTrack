const db = require('../config/db');

const Report = {
    create: (reportData, callback) => {
        const query = 'INSERT INTO reports SET ?';
        db.query(query, reportData, callback);
    },
    findByYearAndMonth: (year, month, callback) => {
        const query = 'SELECT * FROM reports WHERE report_year = ? AND report_month = ?';
        db.query(query, [year, month], callback);
    }
};

module.exports = Report;
