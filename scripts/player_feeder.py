from bs4 import BeautifulSoup
import re


f = open("round_by_players/2016/rd_1/game_1", "r")
soup = BeautifulSoup(f.read(), 'html.parser')


# get year
match_year = 2016  # we will just hardcode this, ceebs any other way


# get round
match_round = soup.find_all(class_="clearfix")[0].div.div.next.next.next.next.strip().strip("Round ")
print(f"match_round: {match_round}")


# get coach totals
totals = []
totals_rows_html = soup.find_all(id=re.compile("_totals"))
for team_total_row in totals_rows_html:
    totals.append(dict(
        team_name=team_total_row.find_all("td")[0].string,
        goals=team_total_row.find_all("td")[1].string.split()[0].split("-")[0],
        behinds=team_total_row.find_all("td")[1].string.split()[0].split("-")[1],
        score=team_total_row.find_all("td")[1].string.split()[1].strip("(").strip(")"),
        kicks=team_total_row.find_all("td")[2].string,
        hbs=team_total_row.find_all("td")[3].string,
        marks=team_total_row.find_all("td")[4].string,
        hitouts=team_total_row.find_all("td")[5].string,
        tackles=team_total_row.find_all("td")[6].string,
        disp_eff=team_total_row.find_all("td")[7].string,
        contesteds=team_total_row.find_all("td")[8].string,
        rebounds=team_total_row.find_all("td")[9].string,
        clearances=team_total_row.find_all("td")[10].string,
        spoils=team_total_row.find_all("td")[11].string,
        total=team_total_row.find_all("td")[12].string,
    ))
print(totals)


# class must be scoring and team1-player
# class must be scoring and team2-player


team_1_players = []
team_2_players = []

count = -1
for trs in soup.find_all("tbody")[-1].find_all("tr"):
    count += 1
    # skip 0, 1 and 13
    # 0 is headers of player table
    # 1 is starters label
    # 13 is emergencies label

    if count in [0, 1, 13]:
        continue

    # initialise dicts to hold players
    player_1 = {}
    player_2 = {}

    # determine the position of the players
    position = None
    for small_blob in trs.find_all('small'):
        if len(small_blob.string.split()) == 1:
            position = small_blob.string  # this is either B, C, F, R, UTL etc...

    # Player 1 
    player_1_data = trs.find_all(class_="team1-player")
    if "empty" not in player_1_data[0]["class"]:
        player_1["position"] = position
        player_1["name"] = player_1_data[0].find_all("a")[0].span.string
        try:
            player_1["goals"] = player_1_data[1].string.split()[0].split("-")[0]
            player_1["behinds"] = player_1_data[1].string.split()[0].split("-")[1]
            player_1["score"] = player_1_data[1].string.split()[1].strip("(").strip(")")
        except IndexError:
            player_1["goals"] = "-"
            player_1["behinds"] = "-"
            player_1["score"] = "-"
        player_1["kicks"] = player_1_data[2].string.strip()
        player_1["hbs"] = player_1_data[3].string.strip()
        player_1["marks"] = player_1_data[4].string.strip()
        player_1["hitouts"] = player_1_data[5].string.strip()
        player_1["tackles"] = player_1_data[6].string.strip()
        player_1["disp_eff"] = player_1_data[7].string.strip()
        player_1["contesteds"] = player_1_data[8].string.strip()
        player_1["rebounds"] = player_1_data[9].string.strip()
        player_1["clearances"] = player_1_data[10].string.strip()
        player_1["spoils"] = player_1_data[11].string.strip()
        if "scoring" in player_1_data[0]["class"]:
            player_1["scoring"] = True
        else:
            player_1["scoring"] = False


    # Player 2
    player_2_data = trs.find_all(class_="team2-player")
    if "empty" not in player_2_data[0]["class"]:  # ensure its not an empty row (no player nominated)
        player_2["position"] = position
        player_2["name"] = player_2_data[0].find_all("a")[0].span.string
        try:
            player_2["goals"] = player_2_data[1].string.split()[0].split("-")[0]
            player_2["behinds"] = player_2_data[1].string.split()[0].split("-")[1]
            player_2["score"] = player_2_data[1].string.split()[1].strip("(").strip(")")
        except IndexError:
            player_2["goals"] = "-"
            player_2["behinds"] = "-"
            player_2["score"] = "-"
        player_2["kicks"] = player_2_data[2].string.strip()
        player_2["hbs"] = player_2_data[3].string.strip()
        player_2["marks"] = player_2_data[4].string.strip()
        player_2["hitouts"] = player_2_data[5].string.strip()
        player_2["tackles"] = player_2_data[6].string.strip()
        player_2["disp_eff"] = player_2_data[7].string.strip()
        player_2["contesteds"] = player_2_data[8].string.strip()
        player_2["rebounds"] = player_2_data[9].string.strip()
        player_2["clearances"] = player_2_data[10].string.strip()
        player_2["spoils"] = player_2_data[11].string.strip()
        if "scoring" in player_2_data[0]["class"]:
            player_2["scoring"] = True
        else:
            player_2["scoring"] = False








    # print(player_1_data[1])

    # goals=team_total_row.find_all("td")[1].string.split()[0].split("-")[0],
    #     behinds=team_total_row.find_all("td")[1].string.split()[0].split("-")[1],
    #     score=team_total_row.find_all("td")[1].string.split()[1].strip("(").strip(")"),

    

    # for player_1_data in trs.find_all(class_="team1-player"):
    #     print(player_1_data)
    #     exit()
        # if player_1_data is not None:
        #     name = player_1_data[0]
        #     print(name)

        # print(len(player_1_data))

    # find all team2 players
    # trs.find_all(class_="team2-player")


    team_1_players.append(player_1)
    team_2_players.append(player_2)

print(team_1_players[2])







# each tr has 3 a's

# this code only good once in the table...
# need more to get team names and round number etc


# tr_count = 0
# for row in soup.find_all('tr'):
#     print(f"---   tr interation {tr_count}   ---")
#     tr_count += 1

#     # search for player name
#     for a_blob in row.find_all('a'):
#         try:
#             player_name = a_blob.span.string
#         except AttributeError:
#             continue
#         print(player_name)

#     # find corresponding position
#     for small_blob in row.find_all('small'):
#         if len(small_blob.string.split()) == 1:
#             position = small_blob.string
#             print(position)
