from bs4 import BeautifulSoup
from argparse import ArgumentParser
import logging
import os
import re
import sqlite3


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
    "City of Kingston": "'karl'",
    "Your Honor": "'frank'",
    "Sack DA": "'milbs'",
    "PASSWORD IS KINGSTON": "'bark'",
}


def get_data(year: int, round: int, game: int):
    """Get all the match and player data for a given match. Returns a with the following structure:
        meta: dict of metadata, including `year`, `round` and `game`
        totals: dict of 
    
    """
    logging.info(f"get_data called with year={year}, round={round}, game={game}")

    filename = f"round_by_players/{year}/rd_{round}/game_{game}"
    if year == 2018:
        filename += ".txt"

    if not os.path.exists(filename):
        logging.warning(f"file not found for year={year}, round={round}, game={game}")
        return

    with open(filename, "r") as f:
        soup = BeautifulSoup(f.read(), "html.parser")

    # get coach totals
    totals = []
    totals_rows_html = soup.find_all(id=re.compile("_totals"))
    for team_total_row in totals_rows_html:
        totals.append(
            dict(
                team_name=team_total_row.find_all("td")[0].string,
                goals=team_total_row.find_all("td")[1].string.split()[0].split("-")[0],
                behinds=team_total_row.find_all("td")[1]
                .string.split()[0]
                .split("-")[1],
                score=team_total_row.find_all("td")[1]
                .string.split()[1]
                .strip("(")
                .strip(")"),
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
            )
        )
    logging.debug(totals)

    # class must be scoring and team1-player
    # class must be scoring and team2-player

    team_1_players = []
    team_2_players = []

    # running tallys will be built up to assert data is fully collected, will compare with totals above
    running_tally_team_1 = {
        "goals": 0,
        "behinds": 0,
        "score": 0,
        "kicks": 0,
        "hbs": 0,
        "marks": 0,
        "hitouts": 0,
        "tackles": 0,
        "disp_eff": 0,
        "contesteds": 0,
        "rebounds": 0,
        "clearances": 0,
        "spoils": 0,
    }
    running_tally_team_2 = {
        "goals": 0,
        "behinds": 0,
        "score": 0,
        "kicks": 0,
        "hbs": 0,
        "marks": 0,
        "hitouts": 0,
        "tackles": 0,
        "disp_eff": 0,
        "contesteds": 0,
        "rebounds": 0,
        "clearances": 0,
        "spoils": 0,
    }

    # skip 0, 1 and 13/14
    # 0 is headers of player table
    # 1 is starters label
    # 13/14 is emergencies label
    skips = [0, 1]
    skips.append(14) if year >= 2019 else skips.append(13)
    count = -1

    for trs in soup.find_all("tbody")[-1].find_all("tr"):
        count += 1

        if count in skips:
            continue

        # initialise dicts to hold players
        player_1 = {}
        player_2 = {}

        # determine the position of the players
        position = None
        for small_blob in trs.find_all("small"):
            if len(small_blob.string.split()) == 1:
                position = small_blob.string  # this is either B, C, F, R, UTL etc...

        # Player 1
        player_1_data = trs.find_all(class_="team1-player")
        # return
        if "empty" not in player_1_data[0]["class"]:
            player_1["position"] = position
            player_1["name"] = player_1_data[0].find_all("a")[0].span.string
            try:
                player_1["goals"] = player_1_data[1].string.split()[0].split("-")[0]
                player_1["behinds"] = player_1_data[1].string.split()[0].split("-")[1]
                player_1["score"] = (
                    player_1_data[1].string.split()[1].strip("(").strip(")")
                )
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
        if (
            "empty" not in player_2_data[0]["class"]
        ):  # ensure its not an empty row (no player nominated)
            player_2["position"] = position
            player_2["name"] = player_2_data[0].find_all("a")[0].span.string
            try:
                player_2["goals"] = player_2_data[1].string.split()[0].split("-")[0]
                player_2["behinds"] = player_2_data[1].string.split()[0].split("-")[1]
                player_2["score"] = (
                    player_2_data[1].string.split()[1].strip("(").strip(")")
                )
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

        if player_1:
            # append if player data was found (i.e. discard empty rows)
            team_1_players.append(player_1)

            # build up the running tally
            if player_1["scoring"]:
                for key, value in player_1.items():
                    if key not in ("position", "name", "disp_eff", "scoring"):
                        running_tally_team_1[key] += int(value)

        if player_2:
            # append if player data was found (i.e. discard empty rows)
            team_2_players.append(player_2)

            # build up the running tally
            if player_2["scoring"]:
                for key, value in player_2.items():
                    if key not in ("position", "name", "disp_eff", "scoring"):
                        running_tally_team_2[key] += int(value)

    # ensure the player data matches the game totals.  For now lets just ignore disp eff
    categories = (
        "goals",
        "behinds",
        "score",
        "kicks",
        "hbs",
        "marks",
        "hitouts",
        "tackles",
        "contesteds",
        "rebounds",
        "clearances",
        "spoils",
    )
    for category in categories:
        try:
            assert int(totals[0][category]) == running_tally_team_1[category]
        except AssertionError:
            logging.warning(
                f"year={year}, round={round}, game={game}, category={category}, anomoly: {int(totals[0][category])} vs {running_tally_team_1[category]}"
            )

        try:
            assert int(totals[1][category]) == running_tally_team_2[category]
        except AssertionError:
            logging.warning(
                f"year={year}, round={round}, game={game}, category={category}, anomoly: {int(totals[1][category])} vs {running_tally_team_2[category]}"
            )

    return {
        "meta": dict(year=year, round=round, game=game),
        "totals": totals,
        "team_1_players": team_1_players,
        "team_2_players": team_2_players,
    }


# {
#     'meta': {'year': 2017, 'round': 4, 'game': 7}, 
#     'totals': [
#         {'team_name': "Libba's Pingas", 'goals': '7', 'behinds': '6', 'score': '48', 'kicks': '114', 'hbs': '125', 'marks': '44', 'hitouts': '33', 'tackles': '32', 'disp_eff': '.695', 'contesteds': '92', 'rebounds': '18', 'clearances': '27', 'spoils': '15', 'total': '26'},
#         {'team_name': 'Tsunami Umami', 'goals': '7', 'behinds': '7', 'score': '49', 'kicks': '113', 'hbs': '85', 'marks': '41', 'hitouts': '27', 'tackles': '37', 'disp_eff': '.773', 'contesteds': '68', 'rebounds': '14', 'clearances': '26', 'spoils': '10', 'total': '13'}], 
#     ...
# }   

def add_to_db(db, data):
    # print("connecting to db")
    con = sqlite3.connect(db)
    # print("here is data:")
    # print(data)

    team_1_coach = coach_map[data["totals"][0]["team_name"]]
    team_2_coach = coach_map[data["totals"][1]["team_name"]]

    # add to round matchup
    round_matchup_sql = (
        "INSERT INTO round_matchup (rm_year, rm_round, rm_game, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (" \
        f"{data['meta']['year']}, " \
        f"{data['meta']['round']}, " \
        f"{data['meta']['game']}, " \
        f"{team_1_coach}, " \
        f"{team_2_coach}" \
        ");"
    )
    print(round_matchup_sql)

    # add to round data for each team
    round_score_sqls = []

    # add to player data for each team
    player_score_sqls = []


def process_path(path):
    path_split = path.split("/")
    year = int(path_split[1])
    round_ = int(path_split[2].lstrip("rd_"))
    game = int(path_split[3].lstrip("game_").rstrip(".txt"))
    return year, round_, game


path_help = (
    "Path of data. If given a directory will recursively process all files." \
    "This argument expects to be run from the location of this script, i.e. all " \
    "paths should start with round_by_players as the names of the year and round " \
    "directories will be used as part of result intepretation."
)


def main():
    # command line options
    parser = ArgumentParser(description="TODO: some pretty description here")
    parser.add_argument('database', type=str, help="Path to target sqlite3 database")
    parser.add_argument('path', type=str, help=path_help)
    parser.add_argument('-c', '--commit', action='store_true', help='Providing this flag will cause all data to be comitted to the database without prompting.')
    parser.add_argument('-l', '--logging', type=int, default=20, help='set log level (default INFO=20)')

    args = parser.parse_args()

    logging.basicConfig(level=args.logging)

    if not args.path.endswith("/"):
        args.path += "/"

    files = []

    def traverse_dir_recur(dir_):
        try:
            l = os.listdir(dir_)
        except NotADirectoryError:
            files.append(dir_)
            return

        for d in l:
            if os.path.isdir(dir_ + d):
                traverse_dir_recur(dir_+  d +"/")
            else:
                files.append(dir_ + d)

    traverse_dir_recur(args.path)  # populate `files` list

    for file_ in files:
        year, round_, game = process_path(file_)
        data = get_data(year, round_, game)
        add_to_db(args.database, data)



if __name__ == "__main__":
    main()
