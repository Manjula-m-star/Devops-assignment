const jwt = require("jsonwebtoken");

const SECRET_KEY = process.env.JWT_SECRET || "your-secret-key";

exports.handler = async (event) => {
    try {
        // Extract JWT token from headers
        const token = event.headers?.Authorization?.split(" ")[1];

        if (!token) {
            return {
                statusCode: 401,
                body: JSON.stringify({ error: "Unauthorized: No token provided" }),
            };
        }

        // Verify JWT token
        const decoded = jwt.verify(token, SECRET_KEY);

        return {
            statusCode: 200,
            body: JSON.stringify({ message: "Hello, World!", user: decoded }),
        };
    } catch (error) {
        return {
            statusCode: 401,
            body: JSON.stringify({ error: "Invalid or expired token" }),
        };
    }
};
