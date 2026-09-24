# Spotify Dataset

## 📊 Dataset Overview

This dataset contains **20,594 records and 24 columns** covering Spotify tracks and their performance across Spotify and YouTube.

It combines **music characteristics, artist and album information, streaming data, and YouTube engagement metrics**, making it suitable for SQL-based music performance analysis.

## 📌 Data Includes

### 🎵 Track & Artist Information
- Artist
- Track
- Album
- Album Type

### 🎧 Audio Features
- Danceability
- Energy
- Loudness
- Speechiness
- Acousticness
- Instrumentalness
- Liveness
- Valence
- Tempo
- Duration

### 📺 YouTube Performance
- Video Title
- Channel
- Views
- Likes
- Comments
- Official Video status
- Licensed status

### 🎧 Spotify Performance
- Stream count
- Most-played platform

### 🔢 Derived Data
- Energy-to-Liveness ratio
- Most-played platform classification

## 🧹 Data Cleaning & Preparation

Before importing the dataset into PostgreSQL, the following changes were made:

- **2 rows were removed** because their track duration was `0`.
- `Likes`, `Views`, and `Comments` were converted to **numeric values** to prevent data-type and import issues.
- **Single quotes (`'`) were removed from the data** where necessary because they were causing issues during PostgreSQL data import.

These changes were made to improve data consistency and ensure successful database import and SQL analysis.

## 🎯 Purpose

The dataset is used in this project to practice SQL analysis by answering questions related to:

- Track and artist performance
- Album analysis
- Spotify vs. YouTube performance
- Engagement metrics
- Audio characteristics
- Track rankings and comparisons

The dataset provides a practical foundation for progressing from **basic SQL queries to advanced analytical techniques such as CTEs and window functions**.