import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MoviesService } from './movies.service';
import { MovieInputsComponent } from './movie-inputs/movie-inputs.component';
import { FormsModule } from '@angular/forms';
import { MovieListComponent } from './movie-list/movie-list.component'
import { MatCardModule } from '@angular/material/card';
import {MatButtonModule} from '@angular/material/button';


@NgModule({
  declarations: [MovieInputsComponent, MovieListComponent],
  imports: [
    CommonModule,
    FormsModule,
    MatCardModule,
    MatButtonModule
  ],
  providers: [
    MoviesService
  ],
  exports: [
    MovieInputsComponent,
    MovieListComponent
  ]
})
export class MovieModule { }
