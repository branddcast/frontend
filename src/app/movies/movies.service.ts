import { Injectable } from '@angular/core';
import { Movie } from './movie.model';

import { environment } from '../../environments/environment';
import { HttpClient } from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})

export class MoviesService {

  host = environment.host;

  constructor(private http:HttpClient) { 
  }

  getMovies () {
    const movies = this.http.get<Movie[]>(`${this.host}/api/movies`);
    console.log(movies);
    return movies;
  }

  getById (id: string) {
    const movie = this.http.get<Movie>(`${this.host}/api/movies/${id}`);
    console.log(movie);
    return movie;
  }
}
