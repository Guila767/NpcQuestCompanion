import json

from scrapers import er_scrape as scraper


def main():
  ER_BASE_URL = 'https://eldenring.wiki.fextralife.com'
  
  npc_info = scraper(ER_BASE_URL, 'NPCs')
  jsData = json.dumps(npc_info)
  file = open('output/npcs.json', 'w', encoding='utf8')
  file.write(jsData)

# Run
main()
