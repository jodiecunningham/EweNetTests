import csv, robot, os, glob
from shlex import split

with open('robotfwtest.csv', 'rt') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        robot.run_cli(("-T "+row['testargs']+" "+row['testscript']).split(),exit=False)

    outxml = glob.glob('*.xml')
    robot.rebot_cli(outxml, "--name EweNetOutput")
