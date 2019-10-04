table_name = input('What is your table name?\n')

field = input('Insert your field name\n')

values = []

times = 0

while True:
    value = input('Value: \n')
    if value == "0":
        break

    values.append(str("'{}'").format(value))


for i in values:
    print(str("INSERT INTO {}({}) VALUES({});").format(
        table_name, field, i))
