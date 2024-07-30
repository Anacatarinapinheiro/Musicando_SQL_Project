from dotenv import load_dotenv
import os
import base64
from requests import post, get
import json
from openpyxl import Workbook
import time  # Para adicionar um pequeno atraso entre as requisições

load_dotenv()

client_id = os.getenv("client_ID")
client_secret = os.getenv("client_secret")

def get_token():
    auth_string = client_id + ":" + client_secret
    auth_bytes = auth_string.encode("utf-8")
    auth_base64 = str(base64.b64encode(auth_bytes), "utf-8")

    url = "https://accounts.spotify.com/api/token"
    headers = {
        "Authorization": "Basic " + auth_base64,
        "Content-Type": "application/x-www-form-urlencoded"
    }
    data = {"grant_type": "client_credentials"}  # Fixed typo here
    result = post(url, headers=headers, data=data)
    json_result = json.loads(result.content)
    token = json_result["access_token"]  # Fixed typo here
    return token


def get_auth_header(token):
    return {"Authorization": "Bearer " + token}


def search_for_artist(token, artist_name):
    base_url = "https://api.spotify.com/v1/search"
    headers = get_auth_header(token)
    query = f"?q={artist_name}&type=artist&limit=1"
    
    query_url = base_url + query  # Corrected the URL construction
    result = get(query_url, headers=headers)
    json_result = json.loads(result.content)["artists"]["items"]
    
    if len(json_result) == 0:
        print(f"Não há artista com o nome '{artist_name}'")
        return None
    return json_result[0]

def get_albums_and_tracks_by_artist(token, artist_id):
    url = f"https://api.spotify.com/v1/artists/{artist_id}/albums?limit=50&market=US"
    headers = get_auth_header(token)
    result = get(url, headers=headers)
    
    # Verifica se a requisição foi bem-sucedida (status code 200)
    if result.status_code == 200:
        json_result = json.loads(result.content)
        
        all_albums_and_tracks = []
        for album in json_result['items']:
            album_info = {
                "album_name": album['name'],
                "release_date": album['release_date'],
                "type": album['album_type'],
                "tracks": get_tracks_from_album(token, album['id'])
            }
            all_albums_and_tracks.append(album_info)
        
        return all_albums_and_tracks
    else:
        print(f"Erro na requisição: {result.status_code}")
        # Espera 1 segundo antes de tentar novamente
        time.sleep(1)
        return None

def get_tracks_from_album(token, album_id):
    url = f"https://api.spotify.com/v1/albums/{album_id}/tracks"
    headers = get_auth_header(token)
    result = get(url, headers=headers)
    json_result = json.loads(result.content)
    return json_result.get('items', [])  # Ensure to return an empty list if 'items' key is missing

def get_artist_genre(token, artist_id):
    url = f"https://api.spotify.com/v1/artists/{artist_id}"
    headers = get_auth_header(token)
    result = get(url, headers=headers)
    json_result = json.loads(result.content)
    return json_result.get('genres', [])  # Ensure to return an empty list if 'genres' key is missing

def format_duration(ms):
    seconds = (ms / 1000) % 60
    minutes = (ms / (1000 * 60)) % 60
    return f"{int(minutes)}:{int(seconds):02d}"  # Format as MM:SS

def export_to_excel(artist_data):
    wb = Workbook()
    ws = wb.active
    ws.append(["Artist", "Genre", "Album", "Type", "Release Date", "Track", "Duration"])
    
    for artist_name, albums_and_tracks in artist_data.items():
        if albums_and_tracks is None:
            continue  # Ignora se não houver álbuns e faixas
        
        for album_info in albums_and_tracks:
            artist_genre = ", ".join(get_artist_genre(token, artist_id))
            album_name = album_info['album_name']
            album_type = album_info['type']
            release_date = album_info['release_date']
            for track_info in album_info['tracks']:
                track_name = track_info['name']
                track_duration = format_duration(track_info['duration_ms'])
                ws.append([artist_name, artist_genre, album_name, album_type, release_date, track_name, track_duration])
    
    wb.save("spotify_data10.xlsx")

token = get_token()

# List of artists
#artists = ["Taylor Swift", "Adele", "Ed Sheeran"]  
#artists = ["Beyoncé", "Shakira", "Justin Bieber"]
#artists = ["Bruno Mars", "Rihanna", "Eminem", "Celine Dion", "Luis Fonsi", "Enrique Iglesias"] 
#artists = ["Ariana Grande", "Jay-Z", "BTS", "Lady Gaga", "Maluma", "Coldplay", "Drake", "Katy Perry"] 
#artists = ["Alicia Keys", "U2", "Sia", "The Weeknd", "Mariah Carey", "Juanes"]
#artists = ["Michael Bublé", "Madonna"]
#artists = ["Ricky Martin", "John Legend", "Pharrell Williams"]
#artists = ["Blackpink", "Elton John", "Olivia Rodrigo", "Ozuna", "Whitney Houston"]
#artists = ["The Rolling Stones", "Daddy Yankee", "Bob Marley", "Queen"]
artists = [ "Red Hot Chili Peppers", "Bleachers", "Paramore"]

# Fetch data for each artist
artist_data = {}
for artist_name in artists:
    artist_info = search_for_artist(token, artist_name)
    if artist_info:
        artist_id = artist_info["id"]
        artist_data[artist_name] = get_albums_and_tracks_by_artist(token, artist_id)

# Export data to Excel
export_to_excel(artist_data)
