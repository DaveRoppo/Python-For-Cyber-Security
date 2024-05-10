#import libraries
import requests
from datetime import datetime

#setup API key and Base URL
api_key = 'api-key'
base_URL = 'https://www.virustotal.com/api/v3/'

def get_user_input():
    print("Please choose the type of data you want to check:")
    print("1: IP Address")
    print("2: Hash")
    choice = input("Enter 1 or 2: ")

    if choice == '1':
        identifier = input("Enter the IP address: ")
        identifier_type = 'ip_addresses'
    elif choice == '2':
        identifier = input("Enter the hash: ")
        identifier_type = 'files'
    else:
        print("Invalid choice. Exiting.")
        return None, None

    return identifier, identifier_type

#define function to get IP and hash reports
def get_report(identifier, identifier_type):
    headers = {'x-apikey': api_key}
    url = base_URL + identifier_type + '/' + identifier

    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Raises an HTTPError for bad requests (4XX or 5XX)
        return response.json()
    except requests.RequestException as e:
        return {'error': str(e)}
    
def print_threat_intelligence(data):
    identifier = data.get('data', {}).get('id', 'N/A')
    identifier_type = data.get('data', {}).get('type', 'N/A').replace('_', ' ')

    stats = data.get('data', {}).get('attributes', {}).get('last_analysis_stats', {})
    votes = data.get('data', {}).get('attributes', {}).get('total_votes', {})
    
    print(f"\n{identifier_type.title()}: {identifier}")
    print(f"Malicious: {stats.get('malicious', 0)}")
    print(f"Suspicious: {stats.get('suspicious', 0)}")
    print(f"Undetected: {stats.get('undetected', 0)}")
    print(f"Harmless: {stats.get('harmless', 0)}")
    print(f"Harmless Votes: {votes.get('harmless', 0)}")
    print(f"Malicious Votes: {votes.get('malicious', 0)}")
    
    # Additional info like whois
    if 'whois' in data.get('data', {}).get('attributes', {}):
        print("WHOIS Info:")
        print(data['data']['attributes']['whois'])

def main():
    identifier, identifier_type = get_user_input()
    if identifier and identifier_type:
        result = get_report(identifier, identifier_type)
        print(result)

def main():
    identifier, identifier_type = get_user_input()
    if identifier and identifier_type:
        result = get_report(identifier, identifier_type)
        if 'error' not in result:
            print_threat_intelligence(result)
        else:
            print("Error retrieving data:", result['error'])

if __name__ == "__main__":
    main()
