with open("schools.csv","r") as f:
    content = f.read()


content = content.replace("%","")

with open("schools2.csv","w") as f:
    f.write(content)
