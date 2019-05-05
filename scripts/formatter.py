import re

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
    "formatter_feeder_rd_1.txt",
    "formatter_feeder_rd_2.txt",
    "formatter_feeder_rd_3.txt",
    "formatter_feeder_rd_4.txt",
    "formatter_feeder_rd_5.txt",
    "formatter_feeder_rd_6.txt",
    # "formatter_feeder_rd_7.txt",
]

# mapping for going from team name to a coach id as per my coach database
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
}

print(f'--inserts for round_score table')
for file in formatter_feeder_files:
    f = open(file, "r")

    round = f.readline().strip()
    year = f.readline().strip()
    
    print(f'--round {round} {year}')

    line = f.readline()

    while line:

        line_as_list = line.split('\t')  # each element in the row is separated by tabs
        del line_as_list[-1]  # last element 'score' is not used 

        # remove leading and trialing whitespace
        for i in range(len(line_as_list)):
            line_as_list[i] = line_as_list[i].strip()

        line_as_list[0] = coach_map[line_as_list[0]]
        line_as_list[1] = re.search('\((.+?)\)', line_as_list[1]).group(1)  # rip out score from 'goal-behind (score)'
        line_as_list[7] = "0" + line_as_list[7]  # prepend a 0 to the disposal efficiency

        # format for the sql
        sql_start = "INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES ("
        sql_end = ");"

        sql_middle = round + ', ' + year + ', '
        for i in range(len(line_as_list)):
            sql_middle = sql_middle + line_as_list[i]
            if i != 11:
                sql_middle = sql_middle + ', '

        sql = sql_start + sql_middle + sql_end
        print(sql)
        
        line = f.readline()

    print()
    f.close()

print(f'\n--inserts for round_matchups table')
for file in formatter_feeder_files:
    f = open(file, "r")

    round = f.readline().strip()
    year = f.readline().strip()
    
    print(f'--round {round} {year}')

    for i in range(9):
        coach_1 = coach_map[f.readline().split('\t')[0].strip()]
        coach_2 = coach_map[f.readline().split('\t')[0].strip()]
        sql = "INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES ("
        sql += f"{round}, {year}, {coach_1}, {coach_2});"
        print(sql)
    f.close()
    print()
