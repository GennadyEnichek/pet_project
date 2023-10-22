from flask import Flask, render_template, request
from flaskext.mysql import MySQL

app = Flask(__name__)

db_name = 'cook_book'
mysql = MySQL()

# MySQL configurations 
app.config['MYSQL_DATABASE_USER'] = 'user1'
app.config['MYSQL_DATABASE_PASSWORD'] = 'password1'
app.config['MYSQL_DATABASE_DB'] = db_name
app.config['MYSQL_DATABASE_HOST'] = '172.31.200.109'
app.config['MYSQL_DATABASE_PORT'] = 3306
mysql.init_app(app)

# Creating a connection cursor
conn = mysql.connect()
cursor = conn.cursor()


# Create a cuisine list
def cuisine_list():
    cuisine_list = []
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute(f'SELECT cuisine_name FROM { db_name }.cuisine;', )
    record = cursor.fetchall()
    for row in record:
        cuisine_list.append(row[0])
    cursor.close()
    conn.close()
    return cuisine_list
    
# Create a food list
def get_food_list(cuisine: str):
    foods_list: list[str] = ['None']
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute(f'SELECT cuisine_table_name FROM { db_name }.cuisine WHERE { db_name }.cuisine.cuisine_name="{cuisine}";')
    cuisine_table_name_tuple = cursor.fetchall()
    cuisine_table_name = cuisine_table_name_tuple[0][0]
    cursor.execute(f'SHOW COLUMNS FROM { db_name }.{cuisine_table_name};')
    food_column = cursor.fetchall()
    for row in range(2, len(food_column)):
        foods_list.append(food_column[row][0])
    cursor.close()
    conn.close()
    return foods_list, cuisine_table_name

def get_instructions(cuisine_table: str, food0: str, food1: str, food2: str):
    print('foods from request = ', cuisine_table, food0, food1, food2)
    if food0 == 'None':
        food0 = ''
    else:
        food0 = food0 + '="1"'
    if food1 == 'None':
        food1 = ''
    else:
       food1 = 'AND ' +  food1 + '="1"'
    if food2 == 'None':
        food2 = ''
    else:
       food2 = 'AND ' +  food2 + '="1"'
    
    request = f'SELECT id_course, course_name FROM { db_name }.{ cuisine_table } WHERE { food0 } { food1 } { food2 };'
    print(request)

    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute(request)
    courses = cursor.fetchall()
    id_course = courses[0][0]
    course_name = courses[0][1]
    print("id_course = ", id_course)
    print("course_name = ", course_name)

    ingredient_request = f'SELECT ingredient FROM { db_name }.instructions WHERE id_course="{  id_course }";'
    print(ingredient_request)
    cursor.execute(ingredient_request)
    ingredients_tuple = cursor.fetchall()
    ingredients = ingredients_tuple[0][0]
    print(ingredients)
    #ingredients = ingredients_tuple[0][0]
    ingredients = []
    line = ''
    for char in ingredients_tuple[0][0]:
        if char != ';':
            line = line + char
        else:
            ingredients.append(line)
            line = ''
             

    instructions_request = f'SELECT instructions FROM { db_name }.instructions WHERE id_course="{  id_course }";'
    print(instructions_request)
    cursor.execute(instructions_request)
    instructions_tuple = cursor.fetchall()
    #instructions = instructions_tuple[0]
    print('space')
    

    instructions = []
    line = ''
    for char in instructions_tuple[0][0]:
        if char != ';':
            line = line + char
        else:
            instructions.append(line)
            line = ''
    print(instructions)
    cursor.close()
    conn.close()

    course_dict = {'course_name': course_name,
                   'ingredients': ingredients,
                   'instructions': instructions}
    return course_dict
    




# recipe = 'My Recipe'
# food_list = [1, 2, 3]

# food_ok = []
# food_not_ok = []
global cuisines_list
cuisines_list = cuisine_list()


@app.route("/", methods=['POST', 'GET'])
def main_page():

  
    if request.method == 'GET':
        cuisine = request.args.get('cuisine')
        if cuisine:
            param_list = get_food_list(cuisine)
            global foods_list
            foods_list = param_list[0]
            global cuisine_table_name
            cuisine_table_name = param_list[1]
            print('cuisine table name', cuisine_table_name)
            return render_template('food.html', cuisines_list=cuisines_list, foods=foods_list)


    if request.method == 'POST':
       # cuisine_table_name = request.args.get('cuisine')
        food0 = request.form['food0']
        food1 = request.form['food1']
        food2 = request.form['food2']
        print('cuisine table name', cuisine_table_name)
        course_dict = get_instructions(cuisine_table_name, food0, food1, food2)

        return render_template('instructions.html', cuisines_list=cuisines_list, foods=foods_list,
                               course_name=course_dict['course_name'],
                               ingredients=course_dict['ingredients'],
                               instructions=course_dict['instructions'])
    return render_template('base.html', cuisines_list=cuisines_list)


# if __name__ == '__main__':
#     app.run(debug=True)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

