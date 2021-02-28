from ebaysdk.finding import Connection as finding
from bs4 import BeautifulSoup

ID_APP = 'RishiVil-HackUTD-PRD-4dc6cc3e0-45224de2'

def getUrl(word):
    global url
    api2 = finding(appid=ID_APP, config_file=None)
    api_request = {'keywords': word}
    response = api2.execute('findItemsByKeywords', api_request)
    soup = BeautifulSoup(response.content, 'lxml')
    items = soup.find_all('item')
    for item in items:
        url = item.viewitemurl.string.lower()
    return url


