export interface Movie {
    _id: string,
    plot: string,
    genres: Array<[]>,
    runtime: number,
    cast: Array<[]>,
    num_mflix_comments: number,
    title: string,
    fullplot: string,
    countries: Array<[]>,
    released: Date,
    directors: Array<[]>,
    rated: string,
    awards: Object,
    lastupdated: Date,
    year: number,
    imdb: Object,
    type: string,
    tomatoes: Object,
    poster: string
}