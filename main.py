import mysql.connector
from mysql.connector import Error

def connect_to_database():
    try:
        # Replace the placeholders with your MySQL container details
        connection = mysql.connector.connect(
            host="localhost",  # Use container name if in the same network
            port=3306,  # Default MySQL port
            user="user",  # e.g., 'root'
            password="password",  # Your MySQL password
            database="hris"  # The database you want to connect to
        )
        
        if connection.is_connected():
            print("Connected to MySQL database!")
            # Perform database operations here
            cursor = connection.cursor()
            cursor.execute("SELECT DATABASE();")
            record = cursor.fetchone()
            print("You're connected to database:", record[0])

    except Error as e:
        print("Error while connecting to MySQL", e)
    
    finally:
        # Close the connection when done
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

# Call the function
connect_to_database()
