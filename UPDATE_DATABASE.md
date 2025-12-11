# Update Database Instructions

## Important: You need to update your database!

The database schema has been updated with **all 57 Hyderabad Metro stations** from the official map:

- **Red Line**: 27 stations (Miyapur to L.B. Nagar)
- **Blue Line**: 23 stations (Raidurg to Nagole) 
- **Green Line**: 9 stations (Parade Ground to Falaknuma)

### Steps to Update:

1. **Open phpMyAdmin**: `http://localhost/phpmyadmin`

2. **Delete old database** (if exists):
   - Click on `metro_booking` database
   - Click "Operations" tab
   - Scroll down and click "Drop the database"
   - Confirm deletion

3. **Import new schema**:
   - Click "Import" tab
   - Click "Choose File"
   - Select: `database/schema.sql`
   - Click "Go"

4. **Verify**:
   - Click on `metro_booking` database
   - Click on `stations` table
   - You should see 57 stations

### After Update:

- All 57 stations will appear in the booking dropdowns
- Metro map will show all three lines
- Fare calculation will work for all routes
- Prices range from ₹10 to ₹70

### Interchange Stations:

- **Ameerpet**: Red Line ↔ Blue Line
- **Parade Ground**: Blue Line ↔ Green Line  
- **MG Bus Station**: Red Line ↔ Green Line

These stations appear once in the dropdown but connect multiple lines.

