var gulp = require('gulp');
var coffee = require('gulp-coffee');
var sourcemaps = require('gulp-sourcemaps');
var print = require('gulp-print');
var gutil = require('gulp-util');
var less = require('gulp-less');
var express = require('express');

var browserify = require('browserify');
var source = require('vinyl-source-stream');
var watchify = require('watchify');

var SOURCE_FILE = './build/scripts/app.js';
var DEST_FILE = 'bundle.js';
var DEST_FOLDER = './build/html';


gulp.task('scripts', function(){
  return gulp.src('./src/**/*.coffee')
    .pipe(sourcemaps.init())
    .pipe(coffee())
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('./build'));
});

gulp.task('styles', function(){
  return gulp.src('./src/**/*.less')
    .pipe(less())
    .pipe(gulp.dest('./build'));
});

gulp.task('html', function(){
  return gulp.src('./src/**/*.html')
    .pipe(gulp.dest('./build'));

});

gulp.task('browserify', ['scripts'], function(){
  return browserify(SOURCE_FILE)
    .bundle()
    .pipe(source(DEST_FILE))
    .pipe(gulp.dest(DEST_FOLDER));
});

gulp.task('watch', ['scripts', 'browserify', 'styles', 'html'], function(){
  gulp.watch('./src/**/*.coffee', ['scripts', 'browserify']);
  gulp.watch('./src/**/*.html', ['html']);
  
});

gulp.task('serve', ['scripts', 'browserify', 'styles', 'html'], function(){
  var app = express();
  app.use(express.static('./build/html'));
  app.listen(3000);
})


gulp.task('default', ['html', 'scripts', 'styles', 'browserify', 'watch', 'serve']);
