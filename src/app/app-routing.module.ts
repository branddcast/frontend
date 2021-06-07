import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MovieInputsComponent } from './movies/movie-inputs/movie-inputs.component';
import { MovieListComponent } from './movies/movie-list/movie-list.component';

const routes: Routes = [
  { path: 'movies', component: MovieListComponent },
  { path: 'movies/:id', component:  MovieInputsComponent }
];

@NgModule({
  declarations: [],
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
