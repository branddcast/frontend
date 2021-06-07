import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MovieInputsComponent } from './movie-inputs.component';

describe('MovieInputsComponent', () => {
  let component: MovieInputsComponent;
  let fixture: ComponentFixture<MovieInputsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MovieInputsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MovieInputsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
