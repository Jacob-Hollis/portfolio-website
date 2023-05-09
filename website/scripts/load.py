from projects.models import Project
import csv
import os


def run():
    __location__ = os.path.realpath(
    os.path.join(os.getcwd(), os.path.dirname(__file__)))
    with open(os.path.join(__location__, 'projects.csv')) as file:
        reader = csv.reader(file)
        next(reader)  # Advance past the header

        Project.objects.all().delete()

        for record in reader:
            print(record)

            project = Project(title=record[0],description=record[1],technologyone=record[2],technologytwo=record[3],technologythree=record[4],link=record[5],githublink=record[6])
            project.save()