import { Component, OnInit } from '@angular/core';
import { MoviesService } from '../movies.service';
import { Movie } from '../movie.model';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-movie-inputs',
  templateUrl: './movie-inputs.component.html',
  styleUrls: ['./movie-inputs.component.css']
})
export class MovieInputsComponent implements OnInit {

  movie: Movie;
  paramID: string;

  constructor(private moviesService: MoviesService, private route: ActivatedRoute,) { 
    this.paramID = this.route.snapshot.paramMap.get('id');
  }

  ngOnInit(): void {
    this.moviesService.getById(this.paramID).subscribe(data => this.movie = data);
  }

  dateFormat(date: any) {
    return new Date(date).toLocaleDateString();
  }

}
