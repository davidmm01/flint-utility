import re
from sqlalchemy import create_engine
import sys

# also requires PyMySQL to be installed

# TODO: refactor this to take the files as a a command-line argument
# TODO: refactor this to use the argparse library or something good like that  

"""
Script for generating SQL to populate round_score and  round_matchup tables

Requires a file formatted as:
    first line just the round number
    second line just the year number
    lines 3 to 20: copy+paste the lines from the matchup page, from team name to Score, e.g.
        Trunk 	5-7 (37) 	145 	95 	61 	11 	40 	.746 	84 	24 	26 	13 	16
        CostaWhyte 	10-3 (63) 	139 	103 	45 	33 	44 	.698 	92 	24 	29 	11 	24
    Order is important, since line 3+4, 5+6, ..., 19+20 must represent opponents for that round
Add the correctly formatted file to the formatter_feeder_files array below
"""

formatter_feeder_files = [
    "round_scores/2020/formatter_feeder_rd_1.txt",
    
    "round_scores/2019/formatter_feeder_rd_1.txt",
    "round_scores/2019/formatter_feeder_rd_2.txt",
    "round_scores/2019/formatter_feeder_rd_3.txt",
    "round_scores/2019/formatter_feeder_rd_4.txt",
    "round_scores/2019/formatter_feeder_rd_5.txt",
    "round_scores/2019/formatter_feeder_rd_6.txt",
    "round_scores/2019/formatter_feeder_rd_7.txt",
    "round_scores/2019/formatter_feeder_rd_8.txt",
    "round_scores/2019/formatter_feeder_rd_9.txt",
    "round_scores/2019/formatter_feeder_rd_10.txt",
    "round_scores/2019/formatter_feeder_rd_11.txt",
    "round_scores/2019/formatter_feeder_rd_12.txt",
    "round_scores/2019/formatter_feeder_rd_13.txt",
    "round_scores/2019/formatter_feeder_rd_14.txt",
    "round_scores/2019/formatter_feeder_rd_15.txt",
    "round_scores/2019/formatter_feeder_rd_16.txt",
    "round_scores/2019/formatter_feeder_rd_17.txt",
    "round_scores/2019/formatter_feeder_rd_18.txt",
    "round_scores/2019/formatter_feeder_rd_19.txt",
    "round_scores/2019/formatter_feeder_rd_20.txt",
    "round_scores/2019/formatter_feeder_rd_21.txt",
    "round_scores/2019/formatter_feeder_rd_22.txt",
    "round_scores/2019/formatter_feeder_rd_23.txt",

    "round_scores/2018/formatter_feeder_rd_1.txt",
    "round_scores/2018/formatter_feeder_rd_2.txt",
    "round_scores/2018/formatter_feeder_rd_3.txt",
    "round_scores/2018/formatter_feeder_rd_4.txt",
    "round_scores/2018/formatter_feeder_rd_5.txt",
    "round_scores/2018/formatter_feeder_rd_6.txt",
    "round_scores/2018/formatter_feeder_rd_7.txt",
    "round_scores/2018/formatter_feeder_rd_8.txt",
    "round_scores/2018/formatter_feeder_rd_9.txt",
    "round_scores/2018/formatter_feeder_rd_10.txt",
    "round_scores/2018/formatter_feeder_rd_11.txt",
    "round_scores/2018/formatter_feeder_rd_12.txt",
    "round_scores/2018/formatter_feeder_rd_13.txt",
    "round_scores/2018/formatter_feeder_rd_14.txt",
    "round_scores/2018/formatter_feeder_rd_15.txt",
    "round_scores/2018/formatter_feeder_rd_16.txt",
    "round_scores/2018/formatter_feeder_rd_17.txt",
    "round_scores/2018/formatter_feeder_rd_18.txt",
    "round_scores/2018/formatter_feeder_rd_19.txt",
    "round_scores/2018/formatter_feeder_rd_20.txt",
    "round_scores/2018/formatter_feeder_rd_21.txt",
    "round_scores/2018/formatter_feeder_rd_22.txt",
    "round_scores/2018/formatter_feeder_rd_23.txt",

    "round_scores/2017/formatter_feeder_rd_1.txt",
    "round_scores/2017/formatter_feeder_rd_2.txt",
    "round_scores/2017/formatter_feeder_rd_3.txt",
    "round_scores/2017/formatter_feeder_rd_4.txt",
    "round_scores/2017/formatter_feeder_rd_5.txt",
    "round_scores/2017/formatter_feeder_rd_6.txt",
    "round_scores/2017/formatter_feeder_rd_7.txt",
    "round_scores/2017/formatter_feeder_rd_8.txt",
    "round_scores/2017/formatter_feeder_rd_9.txt",
    "round_scores/2017/formatter_feeder_rd_10.txt",
    "round_scores/2017/formatter_feeder_rd_11.txt",
    "round_scores/2017/formatter_feeder_rd_12.txt",
    "round_scores/2017/formatter_feeder_rd_13.txt",
    "round_scores/2017/formatter_feeder_rd_14.txt",
    "round_scores/2017/formatter_feeder_rd_15.txt",
    "round_scores/2017/formatter_feeder_rd_16.txt",
    "round_scores/2017/formatter_feeder_rd_17.txt",
    "round_scores/2017/formatter_feeder_rd_18.txt",
    "round_scores/2017/formatter_feeder_rd_19.txt",
    "round_scores/2017/formatter_feeder_rd_20.txt",
    "round_scores/2017/formatter_feeder_rd_21.txt",
    "round_scores/2017/formatter_feeder_rd_22.txt",
    "round_scores/2017/formatter_feeder_rd_23.txt",

    "round_scores/2016/formatter_feeder_rd_1.txt",
    "round_scores/2016/formatter_feeder_rd_2.txt",
    "round_scores/2016/formatter_feeder_rd_3.txt",
    "round_scores/2016/formatter_feeder_rd_4.txt",
    "round_scores/2016/formatter_feeder_rd_5.txt",
    "round_scores/2016/formatter_feeder_rd_6.txt",
    "round_scores/2016/formatter_feeder_rd_7.txt",
    "round_scores/2016/formatter_feeder_rd_8.txt",
    "round_scores/2016/formatter_feeder_rd_9.txt",
    "round_scores/2016/formatter_feeder_rd_10.txt",
    "round_scores/2016/formatter_feeder_rd_11.txt",
    "round_scores/2016/formatter_feeder_rd_12.txt",
    "round_scores/2016/formatter_feeder_rd_13.txt",
    "round_scores/2016/formatter_feeder_rd_14.txt",
    "round_scores/2016/formatter_feeder_rd_15.txt",
    "round_scores/2016/formatter_feeder_rd_16.txt",
    "round_scores/2016/formatter_feeder_rd_17.txt",
    "round_scores/2016/formatter_feeder_rd_18.txt",
    "round_scores/2016/formatter_feeder_rd_19.txt",
    "round_scores/2016/formatter_feeder_rd_20.txt",
    "round_scores/2016/formatter_feeder_rd_21.txt",
    "round_scores/2016/formatter_feeder_rd_22.txt",
    "round_scores/2016/formatter_feeder_rd_23.txt",
]

# mapping for going from team name to a coach id as per coach database
# TODO: grab this out of a file or db or something, so we don't gotta touch source code all the time...
coach_map = {
    'Stand By Crouch': "'jim'",
    'Green Heinekens': "'schlong'",
    'TOOMUCHDOG': "'milbs'",
    'Bayside City Council':  "'karl'",
    '_thebiggerboi_': "'salc'",
    'The Bev Temples': "'frank'",
    'The Dow Jones': "'fewy'",
    'Mushroom Alfredo': "'doe'",
    'The Faceless Men': "'shust'",
    'CostaWhyte':  "'cost'",
    "Costa's Shroom Caps": "'staff'",
    'Trunk': "'sam'",
    'Derry Boys': "'kev'",
    'The Spreadsheet': "'calv'",
    'Shrooms are great': "'gab'",
    "Ardern's Army": "'steve'",
    'flamingos': "'davo'",
    'PASSWORD IS BAYSIDE': "'bark'",
    'Yablett': "'staff'",
    'Swimming... And Tits': "'milbs'",
    'BunkoutWithBurnout!': "'frank'",
    'Disown Team': "'milbs'",
    'Andrew cant cook': "'frank'",
    "Tanky Longy's Team": "'staff'",
    'Two time': "'frank'",
    'General Soreness': "'jim'",
    "Fantasia's Package": "'salc'",
    "5M0K3 DZA 420 w33d": "'steve'",
    "The Big Boi": "'calv'",
    "Wakanda Forever": "'kev'",
    "Mutley Mob": "'frank'",
    "Septal Perforation": "'schlong'",
    "BaysideSlayer_92": "'doe'",
    "Tim Kelly": "'staff'",
    "Yarra City Council": "'milbs'",
    "Sam 'Bags' Murray FC": "'sam'",
    "Jerk Werts (REVIVAL)": "'jim'",
    "Libba's Pingas": "'sam'",
    "Top Up FC": "'salc'",
    "Gold Logie Winner": "'staff'",
    "CapaCostaCo": "'cost'",
    "El Maestro de Chaque": "'frank'",
    "Yeah LeBois": "'calv'",
    "Krooooooz": "'fewy'",
    "Mid Week Rub!!!!": "'milbs'",
    "woolworths_slayer92": "'doe'",
    "Tsunami Umami": "'kev'",
    "Jack Fucking Watts": "'jim'",
    "Farmer Steve's": "'sam'",
    "Sponge Leecher": "'doe'",
    "Josh Kennedy": "'fewy'",
    "Brown Richardsons": "'davo'",
    "Elite salesmen": "'gab'",
    "PASSWORD IS RE-CALC": "'bark'",
    "Chum Frenzied Sharks": "'karl'",
    "It's A Friendly Game": "'calv'",
    "Milby/Staffa 2016": "'staff'",
    "The Board": "'milbs'",
    "Relaunch Complete": "'frank'",
    "Allahu Akbar": "'schlong'",
    "Cara Delevingne": "'kev'",
    "Lone Wolf": "'jim'",
    "Toxic Masculinity": "'calv'",
    "Auto-Draft, Auto-Win": "'fewy'",
    "Lick My Butt Hole": "'milbs'",
    "Piggy’s Army": "'frank'",
    "Team Deadly": "'doe'",
    "Whyte": "'cost'",
    "shrooms are great": "'gab'",

}

script_args = {
    "commit": False,
}

for argument in sys.argv:
    if argument in list(script_args.keys()):
        script_args[argument] = True

if(script_args["commit"]):
    print("'commit' arg recieved, outputted SQL will be run in database")
else:
    print("'commit' arg not recieved, will not update database")


round_score_queries = []

print(f'--inserts for round_score table')
for file in formatter_feeder_files:
    f = open(file, "r")

    round = f.readline().strip()
    year = f.readline().strip()
    
    print(f'--round {round} {year}')

    line = f.readline()

    while line:

        line_as_list = line.split('\t')  # each element in the row is separated by tabs
                
        # remove leading and trialing whitespace
        for i in range(len(line_as_list)):
            line_as_list[i] = line_as_list[i].strip()

        line_as_list[0] = coach_map[line_as_list[0]]
        line_as_list[1] = re.search('\((.+?)\)', line_as_list[1]).group(1)  # rip out score from 'goal-behind (score)'
        line_as_list[7] = "0" + line_as_list[7]  # prepend a 0 to the disposal efficiency

        # format for the sql
        sql_start = "INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils, rs_real_value) VALUES ("
        sql_end = ");"

        sql_middle = round + ', ' + year + ', '
        for i in range(len(line_as_list)):
            sql_middle = sql_middle + line_as_list[i]
            if i != len(line_as_list) - 1:
                sql_middle = sql_middle + ', '

        sql = sql_start + sql_middle + sql_end
        print(sql)
        round_score_queries.append(sql)

        line = f.readline()

    print()
    f.close()

round_matchup_queries = []

print(f'\n--inserts for round_matchups table')
for file in formatter_feeder_files:
    matches = int((len(open(file).readlines()) - 2) / 2)
    f = open(file, "r")

    round = f.readline().strip()
    year = f.readline().strip()
    
    print(f'--round {round} {year}')

    for i in range(matches):
        coach_1 = coach_map[f.readline().split('\t')[0].strip()]
        coach_2 = coach_map[f.readline().split('\t')[0].strip()]
        sql = "INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES ("
        sql += f"{round}, {year}, {coach_1}, {coach_2});"
        print(sql)
        round_matchup_queries.append(sql)
    f.close()
    print()

engine = create_engine("mysql+pymysql://root:123@localhost/FLINT?host=localhost?port=3306")  # PyMySQL driver required

with engine.connect() as con:

    for query in round_score_queries:
        if script_args["commit"]:
            con.execute(query)

    for query in round_matchup_queries:
        if script_args["commit"]:
            con.execute(query)
