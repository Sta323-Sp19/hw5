[![wercker status](https://app.wercker.com/status/ebb43f0500cf3ca49638defccf99e57c/s/master "wercker status")](https://app.wercker.com/project/byKey/ebb43f0500cf3ca49638defccf99e57c)

Homework 5 - La Quinta is Spanish for next to Denny's
---
due Thursday 03/21 by 11:59 pm.

* Rundel, Colin - cr173@duke.edu

<br/>
<br/>

![dennys next to la quinta](hedberg.jpg?raw=1)

<br/>

## Background

This observation is a joke made famous by the late comedian Mitch Hedberg. Several years ago, John Reiser on his [blog](http://njgeo.org/2014/01/30/mitch-hedberg-and-gis/) detailed an approach to assess how true this joke actually is by scraping location data for all US locations of La Quinta and Denny's. Your goal for this homework will be to recreate this analysis within R and expand on both the data collection and analysis.

<br/>

## Task 1 - Scraping Denny's

Scraping the Denny's site involves the traversal of a heirachical series of location and restaraunt pages starting with the state level page at [locations.dennys.com](http://locations.dennys.com). Your initial task will be to scrape this page identifying the links for each state page, Following those links will provide additional pages containing links to regional pages and individual restaraunt pages. By continue to traverse these pages your eventual is to locate and downlaod all of these restaraunt pages into your `data/dennys/` folder. All of the code to accomplish this should be included in your `get_dennys.R` script.

Once the restaraunt pages are downloaded you will write a second script, `parse_dennys.R`, which should read in each of these files and parse / scrape the relevant details for each of these restaraunts and construct a tidy data frame containing the results for all of the restaraunts. The data frame should be saved as `dennys.rds` in `data/`.

This data collection must be constructed in a reproducible fashion - all web pages being scraped should be cached locally and each analysis step should be self contained in a separate R script. You will also create a `Makefile` that will link your R scripts together. 

Finally, note that you should not abuse this or any other web page or API, make sure to space out your requests to avoid getting your or gort's IP banned. I have created a local cache of the La Quinta hotel listing page [here](http://www2.stat.duke.edu/~cr173/lq/www.lq.com/en/findandbook/hotel-listings.html) which you can use as a basis of your scraping attempts.

Your write up should include a discussion of your scraping approach.

<br/>

##  Task 2 - Scraping La Quinta

The original blog post states that the location of all the La Quinta's was obtained via [`hotelMarkers.js`](http://www.lq.com/lq/data/hotelMarkers.js) from La Quinta's website which contained JSON data with the latitude and longitude of each location. Since the time of the blog post La Quinta's website has had a complete overhaul and redesign and as such this file is no longer available.

To make our lives even more difficult, La Quinta's website now makes heavy use of Javascript which makes using tools like rvest problematic. In class we will discusss several possible approaches for obtaining the information we are interested in.

Similar to your solution to Scraping Denny's website your code should be separated into two distinct files, `get_lq.R` which downloads the raw data from the website and `parse_lq.R` which tidies and flattens the downloaded data.

<br/>

## Task 3 - Distance Analysis

Using the results of your scraping you should analyze the veracity of Hedberg's claim. This is left as an open ended exercise - there is not one correct approach. This can include anything from visualizations to tabulations, but will need to be more than just a list of the La Quinta and Denny's pairs that happen to be within an arbitrary radius. Answers should at a minimum describe / visualize the distribution of the minimum distance for each Denny's / LQ pair.

Note that this analysis depends on calculating the distance between two spatial locations on a sphere, as such using euclidean distances is *not ok*. Make sure you use an appropriate approach for calculating any distances you use and make sure the units of distance are clearly indicated in your analysis. Also not that the set of distances from all La Quintas to the nearest Denny's is not the same as the set of distances from all Denny's to the nearest Denny's.

<br/>

## Allowed Files

For this assignment you will need to create the following files:

* `get_lq.R` - this script should go to the La Quinta download either a summary resource or each individual hotel page. All of file(s) should be saved into the `data/lq/` directory. If these folders do not exist they should be created.

* `parse_lq.R` - this script should read the saved file(s) in `data/lq/` and construct an appropriate data frame where each row is a hotel and the columns reflect hotel characteristics (e.g. lat, long, state, amenitities). The resulting data frame should be saved as `lq.rds` (using the `saveRDS` function) in the `data/` directory.

* `get_dennys.R` - this script should download the individual restaraunt pages from locations page and save the results to `data/dennys/`. If these folders do not exist they should be created.

* `parse_dennys.R` - this script should read all of the saved files in `data/dennys/` and construct an appropriate data frame where each row is a restaurant with columns for the relevant restaurant characteristics. This data frame should be saved as `dennys.rds` in the `data/` directory.

* `hw5.Rmd` - this document should detail how your group has chosen to implement your various download and parsing scripts. Additionally, it should wholly contain your distance analysis which loads the necessary data directly (and exclusively) from `data/lq.Rdata` and `data/dennys.Rdata`.

The following files will be provided for you:

* `Makefile` - this file will specify the interdependence between your script files and their various products. We will cover Makefile in general and the details of this specific file in class.

* `wercker.yml` - file specifying how your code will be tested - in this case running make and being able to produce a final compiled version of `hw5.Rmd`.

* `hw5.Rproj` - RStudio project file

