<html lang="en">

<head>
<title>Lesson 2</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>

<link rel="stylesheet" href="../styles/lesson4lds.css">

<link rel="stylesheet" href="../styles/style.css">
<script src="../js/ldslessonDataStructureJSON.js"></script>
<script src="../js/script.js">
	
</script>
</head>

<body>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							sessionStorage
									.removeItem(sessionKeyIsAssessmentPassed);
							sessionStorage.removeItem(sessionKeyIsSparcPassed);

							let pageIdToShow = sessionStorage
									.getItem(sessionKeyShowPageId);
							if (pageIdToShow == null || pageIdToShow == ''
									|| pageIdToShow == undefined) {
								let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(4);
								let currentSection = document
										.getElementById(firstPageIdOfCurrentLesson);
								currentSection.hidden = false;
							} else {
								let currentSection = document
										.getElementById(pageIdToShow);
								currentSection.hidden = false;
							}
						});
	</script>
	<%@ include file="header.jsp"%>

	<section id="version-1-course-lds-lesson-4-page-1" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content text-center">
				<h1>Lesson 4: Central Tendency and Variability</h1>
				<br>
				<div class="d-flex justify-content-end">
					<a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-1', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-4-page-2" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Central Tendency (Motivation)</h1>
				<p>
					For the population of human beings, it is not interesting or
					possible for us to know the height or weight of each individual,
					but it is interesting and useful if we know the <q>typical</q>
					height and weight of some age groups. Statistics give ideas on what
					can be taken as <q>typical</q>: one is mean (average) and one is
					median.
				</p>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-2', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-2', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-4-page-3" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Central Tendency (Motivation)</h1>
				<p>
					<b>Problem</b>
				</p>
				<p>
					<i>Background</i>: John, Juan, Jasmine, Sam and Kate went to play
					the clay shooting game in which they attempted to hit 10 flying
					targets. The score of a player gets in the game is the total number
					of targets they hit. They play the game 3 times and the data set
					looks like this:
				</p>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-4">
							<p>
								<i>Questions</i>:
							</p>
							<ul>
								<li>Whom do you think is the best performer of these games?</li>
								<br>
								<li>Who is the worst?</li>
							</ul>
							<div class="text-center">
								<img src="../images/lesson4lds/q1.jpg" alt="Image" width="100"
									height="100" text-align="center">
							</div>
						</div>
						<div class="col-md-8">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Player</th>
										<th scope="col" class="text-center">Game_I Score</th>
										<th scope="col" class="text-center">Game_II Score</th>
										<th scope="col" class="text-center">Game_III Score</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">John</td>
										<td>6</td>
										<td>6</td>
										<td>6</td>
									</tr>
									<tr>
										<td scope="row">Juan</td>
										<td>6</td>
										<td>7</td>
										<td>5</td>
									</tr>
									<tr>
										<td scope="row">Jasmine</td>
										<td>6</td>
										<td>8</td>
										<td>4</td>
									</tr>
									<tr>
										<td scope="row">Sam</td>
										<td>6</td>
										<td>9</td>
										<td>4</td>
									</tr>
									<tr>
										<td scope="row">Kate</td>
										<td>6</td>
										<td>5</td>
										<td>3</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
				<a class="btn btn-primary pull-left"
					onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-3', false, -1)">
					Previous </a> <a class="btn btn-primary pull-right"
					onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-3', false, -1)">
					Next </a>
				</div> 
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-4-page-4" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Central Tendency (Motivation)</h1>
				<p>
					What if we use the average score to <q>summarize</q> the scores of
					the players?
				</p>
				<table class="table table-condensed table-bordered text-center">
					<thead>
						<tr>
							<th scope="col" class="text-center">Player</th>
							<th scope="col" class="text-center">Game_I Score</th>
							<th scope="col" class="text-center">Game_II Score</th>
							<th scope="col" class="text-center">Game_III Score</th>
							<th scope="col" class="text-center">Average Score</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row">John</td>
							<td>6</td>
							<td>6</td>
							<td>6</td>
							<td>6</td>
						</tr>
						<tr>
							<td scope="row">Juan</td>
							<td>6</td>
							<td>7</td>
							<td>5</td>
							<td>6</td>
						</tr>
						<tr>
							<td scope="row">Jasmine</td>
							<td>6</td>
							<td>8</td>
							<td>4</td>
							<td>6</td>
						</tr>
						<tr>
							<td scope="row">Sam</td>
							<td>6</td>
							<td>9</td>
							<td>4</td>
							<td>6.3</td>
						</tr>
						<tr>
							<td scope="row">Kate</td>
							<td>6</td>
							<td>5</td>
							<td>3</td>
							<td>4.6</td>
						</tr>
					</tbody>
				</table>
				<p>
					<i>Questions</i>:
				</p>
				<ul>
					<li>Whom do you think is the best performer of these games?</li>
					<form class="row g-3" name="bestPerformer" onsubmit="validateBestName(); return false">
						<div class="col-md-4">
							<input type="text" class="form-control"
								id="validationServer01">
							<div class=""></div>
						</div>
						<div class="col-md-4">
							<button class="btn btn-primary" type="submit">Check
								Answer</button>
						</div>
					</form>
					<li>Who is the worst?</li>
					<form class="row g-3" name="worstPerformer" onsubmit="validateWorstName(); return false">
						<div class="col-md-4">
							<input type="text" class="form-control"
								id="validationServer02">
							<div class=""></div>
						</div>
						<div class="col-md-4">
							<button class="btn btn-primary" type="submit">Check
								Answer</button>
						</div>
					</form>


					<!-- 					<form style="margin-top: 5px" name="bestPerformer"
						class="form-inline" onsubmit="validate(); return false">
						<div class="form-group col-auto">
							<input name="bestName" id="bestName" type="text"
								class="form-control" required> <span id="bestNameVa"
								class="glyphicon form-control-feedback" aria-hidden="true"></span>
						</div>
						<button style="margin-left: 2rem" type="submit"
							class="btn btn-primary">Check Answer</button>
						<div class="form-group" style="margin-left: 2rem">
							<p style="font-style: italic" name="bestNameText"
								id="bestNameText" type="text" class="form-control-static"></p>
						</div>
					</form> -->
					<!-- <li>Who is the worst?</li>
					<form style="margin-top: 5px" name="worstPerformer"
						class="form-inline" onsubmit="validateWorst(); return false">
						<div class="form-group">
							<input name="worstName" type="text" class="form-control" required>
							<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
						</div>
						<button style="margin-left: 2rem" type="submit"
							class="btn btn-primary">Check Answer</button>
						<div class="form-group" style="margin-left: 2rem">
							<p style="font-style: italic" id="worstNameText" type="text"
								class="form-control-static"></p>
						</div>
					</form> -->
				</ul>
				<p>
					By central tendency we mean to find a <q>central value</q> which
					represents the whole variable. We use average score as a central
					value for each player&#39;s scores.
				</p>
				<br>
				<div class="d-flex justify-content-between">
				<a class="btn btn-primary pull-left"
					onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-4', false, -1)">
					Previous </a> <a class="btn btn-primary pull-right"
					onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-4', false, -1)">
					Next </a>
				</div> 
			</div>
		</div>
	</section>


	<section id="version-1-course-lds-lesson-4-page-5" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Central Tendency (Motivation)</h1>
				<p>In addition to mean (average), there are other measures of
					central tendency including</p>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp;<i>Median</i>
				</p>

				<br>
				<div class="d-flex justify-content-between">
				<a class="btn btn-primary pull-left"
					onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-5', false, -1)">
					Previous </a> <a class="btn btn-primary pull-right"
					onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-5', false, -1)">
					Next </a>
				</div> 
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-4-page-6" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Mean (Motivation)</h1>
				<p>
					What if we use the average score to <q>summarize</q> the scores of
					the players?
				</p>
				<table class="table table-condensed table-bordered text-center">
					<thead>
						<tr>
							<th scope="col" class="text-center">Player</th>
							<th scope="col" class="text-center">Game_I Score</th>
							<th scope="col" class="text-center">Game_II Score</th>
							<th scope="col" class="text-center">Game_III Score</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row">John</td>
							<td>6</td>
							<td>6</td>
							<td>6</td>
						</tr>
						<tr>
							<td scope="row">Juan</td>
							<td>6</td>
							<td>7</td>
							<td>5</td>
						</tr>
						<tr>
							<td scope="row">Jasmine</td>
							<td>6</td>
							<td>8</td>
							<td>4</td>
						</tr>
						<tr>
							<td scope="row">Sam</td>
							<td>6</td>
							<td>9</td>
							<td>4</td>
						</tr>
						<tr>
							<td scope="row">Kate</td>
							<td>6</td>
							<td>5</td>
							<td>3</td>
						</tr>
					</tbody>
				</table>
				<p>
					<i>Questions</i>:
				</p>
				<ul>
					<li>Population?</li>
					<li>Statistics variable?</li>
					<li>Write an R expression to represent the variable johnScores?</li>
					<li>Name a few more variables?</li>
				</ul>
				<br>
				<div class="d-flex justify-content-between">
				 <a class="btn btn-primary pull-left"
					onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-6', false, -1)">
					Previous </a> <a class="btn btn-primary pull-right"
					onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-6', false, -1)">
					Next </a></div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-4-page-7" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Mean (Motivation)</h1>
				<p>
					What if we use the average score to <q>summarize</q> the scores of
					the players?
				</p>
				<table class="table table-condensed table-bordered text-center">
					<thead>
						<tr>
							<th scope="col" class="text-center">Player</th>
							<th scope="col" class="text-center">Game_I Score</th>
							<th scope="col" class="text-center">Game_II Score</th>
							<th scope="col" class="text-center">Game_III Score</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row">John</td>
							<td>6</td>
							<td>6</td>
							<td>6</td>
						</tr>
						<tr>
							<td scope="row">Juan</td>
							<td>6</td>
							<td>7</td>
							<td>5</td>
						</tr>
						<tr>
							<td scope="row">Jasmine</td>
							<td>6</td>
							<td>8</td>
							<td>4</td>
						</tr>
						<tr>
							<td scope="row">Sam</td>
							<td>6</td>
							<td>9</td>
							<td>4</td>
						</tr>
						<tr>
							<td scope="row">Kate</td>
							<td>6</td>
							<td>5</td>
							<td>3</td>
						</tr>
					</tbody>
				</table>
				<p>
					<i>Questions</i>:
				</p>
				<ul>
					<li><b>Population:</b> {g1, g2, g3}</li>
					<li><b>Statistics variable: </b><i>johnScores:</i> The score of John on each game</li>
					<li><b>Write an R expression to represent the variable johnScores: </b><code>johnScores <- c(<q>g1</q> = 6,	<q>g2</q> = 6,  <q>g3</q> = 6)</code></li>
					<li><b>Name a few more variables: </b><i>juanScores: </i>from games to Juan&#39;s scores</li>
				</ul>
				<br>
				<div class="d-flex justify-content-between">
				 <a class="btn btn-primary pull-left"
					onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-7', false, -1)">
					Previous </a> <a class="btn btn-primary pull-right"
					onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-7', false, -1)">
					Next </a></div>
			</div>
		</div>
	</section>	

	<section id="version-1-course-lds-lesson-4-page-8" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Mean (Motivation)</h1>
				<p>
					Given the variable <i>johnScores:</i>
				</p>
				<table class="table table-sm table-bordered text-center">
					<thead>
						<tr>
							<th scope="col" class="text-center">game</th>
							<th scope="col" class="text-center">johnScores (game)</th>
							<!-- <th scope="col" class="text-center">Game_II Score</th>
							<th scope="col" class="text-center">Game_III Score</th> -->
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row">g1</td>
							<td>6</td>
						</tr>
						<tr>
							<td scope="row">g2</td>
							<td>6</td>
						</tr>
						<tr>
							<td scope="row">g3</td>
							<td>6</td>
						</tr>
					</tbody>
				</table>
				<p>The mean of the values of the variable <i>johnScores</i>:
				</p>
				<ul>
					<li><b>The sum of all values of the variable: </b>6+6+6=18</li>
					<li><b>Number of values (i.e., population size): </b>3</li>
					<li><b>Mean: </b>18/3=6</li>
				</ul>
				<br>
				<div class="d-flex justify-content-between">
				 <a class="btn btn-primary pull-left"
					onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-8', false, -1)">
					Previous </a> <a class="btn btn-primary pull-right"
					onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-8', false, -1)">
					Next </a></div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-4-page-9" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Formal definition of Mean</h1>
				<p>
					Given a quantitative statistics variable <i>x:population ->
						numbers,</i> the <b><u>mean</u></b> of variable <i>x</i>, denoted by <i>x</i>&#x0305;
					, is defined as the sum of the values of <i>x</i> divided by the
					total number of individuals (or the cardinality of <i>population</i>).
				</p>
				<h3>Example:</h3>
				<div class="row">
					<div class="col-md-6">
						<p>
							Find the mean of <i>height</i>?
						</p>
						<ul>
							<li><b>Values of <i>height</i>:
							</b>(5, 6, 6, 5)</li>
							<li><b>Sum of the values: </b>5+6+6+5 = 22</li>
							<li><b>Population size: </b>4</li>
							<li><b>Mean: </b>22/4 = 5.5</li>
						</ul>
					</div>
					<div class="col-md-6">
						<table class="table table-sm table-bordered text-center">
							<thead>
								<tr>
									<th scope="col" class="text-center">x</th>
									<th scope="col" class="text-center">height (x)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td scope="row">Peter</td>
									<td>5</td>
								</tr>
								<tr>
									<td scope="row">Tom</td>
									<td>6</td>
								</tr>
								<tr>
									<td scope="row">Steve</td>
									<td>6</td>
								</tr>
								<tr>
									<td scope="row">Sara</td>
									<td>5</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary pull-left"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-9', false, -1)">
						Previous </a> <a class="btn btn-primary pull-right"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-9', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-4-page-10" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Median (Motivation)</h1>
				<p>Sometimes, the mean doesn&#39;t reflect the central tendency
					well. For example, we have 3 people with income of $1 million, $1
					and $1 respectively. The mean is close to 0.3 million which is
					clearly not a good idea to reflect the income of this group of
					people. Instead, we use the median concept: the middle value after
					we sort all the values.</p>
				<ul>
					<li><b>Order the values in non-decresing order: </b>$1, $1, $1
						million</li>
					<li><b>The value in the middle is: </b>$1</li>
				</ul>
				<p>
					If we have even population size with income <i>$1, $2, $3, $1
						million </i>
				</p>
				<p>
					we don&#39;t have a middle value. We take the two middle values 2
					and 3, and the median is their average: <i>(2+3)/2</i>
				</p>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-10', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-10', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	
	<section id="version-1-course-lds-lesson-4-page-11" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Formal definition of median</h1>
				<p>Given a quantitative variable <i>x</i> with population size of <i>n</i>, let &alpha; be a tuple of the values of <i>x</i> in a non-decreasing order. The <u>median</u> of x is</p>
				<ul>
					<li>the middle number of &alpha; if <i>n</i> is odd</li>
					<li>the average of the two middle numbers of &alpha; if <i>n</i> is even.</li>
				</ul>				
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-11', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-11', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	
	<section id="version-1-course-lds-lesson-4-page-12" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Example 1:</h1>
				<p>Consider the John&#39;s family member&#39;s age variable:</p>
				<table class="table table-sm table-borderless text-center">
							<tbody>
								<tr>
									<td>(45,</td>
									<td>44,</td>
									<td>25,</td>
									<td>22,</td>
									<td>19)</td>
								</tr>
								<tr>
									<td>John</td>
									<td>Maria</td>
									<td>Sam</td>
									<td>Dean</td>
									<td>Kim</td>
								</tr>
							</tbody>
						</table>
				<ul>
					<li><b>Sort</b> the named vector above into non-decreasing order?</li>
					<table class="table table-sm table-borderless text-center">
							<tbody>
								<tr>
									<td>(19,</td>
									<td>22,</td>
									<td>25,</td>
									<td>44,</td>
									<td>45)</td>
								</tr>
								<tr>
									<td>Kim</td>
									<td>Dean</td>
									<td>Sam</td>
									<td>Maria</td>
									<td>John</td>
								</tr>
							</tbody>
						</table>
					<li>The <b>population size: </b> 5</li>
					<li>The <b>median</b> of the age variable: 25</li>
				</ul>				
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-12', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-12', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-4-page-13" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Example 2:</h1>
				<p>Assume from the above example the family has one more member Rehana and whose age is 23:</p>
				<table class="table table-sm table-borderless text-center">
							<tbody>
								<tr>
									<td>(45,</td>
									<td>44,</td>
									<td>25,</td>
									<td>22,</td>
									<td>19</td>
									<td>23)</td>
								</tr>
								<tr>
									<td>John</td>
									<td>Maria</td>
									<td>Sam</td>
									<td>Dean</td>
									<td>Kim</td>
									<td>Rehana</td>
								</tr>
							</tbody>
						</table>
				<ul>
					<li>Sort  the above named vector?</li>
					<table class="table table-sm table-borderless text-center">
							<tbody>
								<tr>
									<td>(19,</td>
									<td>22,</td>
									<td><b>23,</b></td>
									<td><b>25,</b></td>
									<td>44,</td>
									<td>45)</td>
								</tr>
								<tr>
									<td>Kim</td>
									<td>Dean</td>
									<td>Rehana</td>
									<td>Sam</td>
									<td>Maria</td>
									<td>John</td>
								</tr>
							</tbody>
						</table>
					<li>Find the median of the above named vector?</li>
					<p>The two middle numbers: 23 (index: (6+1) %/%2) and 25 (index: (6+1)%/%2+1).</p>
					<p>The median is: <b> (23+25)/2 = 24</b></p>
				</ul>				
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-13', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-13', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	
	<section id="version-1-course-lds-lesson-4-page-14" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Summary</h1>
				<p>We discussed two measures of central tendency for a variable </p>
				<ul>
					<li>Mean</li>
					<li>Median</li>
				</ul>	
				<p>We discussed how to represent the mean/median of a variable using </p>
				<ul>
					<li>Set theory language </li>
					<li>R</li>
				</ul>				
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-14', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-14', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	
	<section id="version-1-course-lds-lesson-4-page-15" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability (Motivation)</h1>
				<p>The summary of a variable (data) using central tendency gives us a good idea about the variable.</p>	
				<p>However, it will lose some important information about the data.</p>
				
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-15', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-15', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-16" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability (Motivation)</h1>
				<p>Consider the players again.Assume you are the coach of the players in the table, and you have a match with another team. Now you need to select  one from <i>John</i>, <i>Juan</i> and <i>Jasmine</i> to play the last game</p>
				<div class="row">
					<div class="col-md-6">
						<p>
							There are two situations:
						</p>
						<ul>
							<li>As long as the player can get 6, your team will win. Whom do you select?</li>
							<li>Your team is behind, but there is a chance  your team could win if the new player can get 8. which player would you select?</li>
						</ul>
					</div>
					<div class="col-md-6">
						<table class="table table-sm table-bordered text-center">
					<thead>
						<tr>
							<th scope="col" class="text-center">Player</th>
							<th scope="col" class="text-center">Game_I Score</th>
							<th scope="col" class="text-center">Game_II Score</th>
							<th scope="col" class="text-center">Game_III Score</th>
							<th scope="col" class="text-center">Average Score</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row">John</td>
							<td>6</td>
							<td>6</td>
							<td>6</td>
							<td>6</td>
						</tr>
						<tr>
							<td scope="row">Juan</td>
							<td>6</td>
							<td>7</td>
							<td>5</td>
							<td>6</td>
						</tr>
						<tr>
							<td scope="row">Jasmine</td>
							<td>6</td>
							<td>8</td>
							<td>4</td>
							<td>6</td>
						</tr>
						<tr>
							<td scope="row">Sam</td>
							<td>6</td>
							<td>9</td>
							<td>4</td>
							<td>6.3</td>
						</tr>
						<tr>
							<td scope="row">Kate</td>
							<td>6</td>
							<td>5</td>
							<td>3</td>
							<td>4.6</td>
						</tr>
					</tbody>
				</table>
					</div>
				</div>
				<p>From the example, although three players have the same mean score, but each of them has a different <i>variability</i> of their scores. It seems that the variability of John is the smallest, and Jasmine the biggest. We will talk about two ways to precisely characterize the variability</p>
				<ul>
					<li><i>Range</i></li>
					<li><i>Standard deviation</i></li>
				</ul>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-16', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-16', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-17" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Range - Formal Definition</h1>
				<p><b>Definition (Range)</b> The <b><span class="underline">range</span></b> of a quantitative statistics variable <i>x</i> is the difference between the maximum value of <i>x</i> and the minimum value of <i>x</i>.</p>				
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-17', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-17', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-18" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Range - Example</h1>
				<p><b>Example.</b>Consider John&#39;s scores: 6, 6, 6 for three games. Statistics variable <i>johnScores</i> from games to scores :</p>
				<p>What is the range of <i>johnScores</i>?</p>
				<ul>
					<li>Find the maximum value of <i>johnScores</i>?</li>
					<ul>
						<li>Maximum value of johnScores: 6</li>
					</ul>
					<li>Find the minimum value of <i>johnScores</i>?</li>
					<ul>
						<li>Minimum value of johnScores: 6</li>
					</ul>
					<li>Find the range of <i>johnScores</i>?</li>
					<ul>
						<li>Range of johnScores: 6-6=0</li>
					</ul>
				</ul>			
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-18', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-18', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-19" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Range - Example</h1>
				<p>Consider earlier example: John&#039;s scores: 6, 6, 6 for three games. Statistics variable johnScores is from games to scores. Write an R expressions to represent the range of variable <i>johnScores</i>?</p>
				<ul>
					<li>Find the maximum value of <i>johnScores</i>?</li>
					<ul>
						<li><code>johnScores <- c(&#34;g1&#34;=6, &#34;g2&#34;=6, &#34;g3&#34;=6)</code></li>
					</ul>
					<li>Write a R expression to find the maximum of <i>johnScores</i>?</li>
					<ul>
						<li><code>maxScore <- max(johnScores)</code></li>
					</ul>
					<li>Write a R expression to find the minimum of <i>johnScores</i>?</li>
					<ul>
						<li><code>minScore <- max(johnScores)</code></li>
					</ul>
					<li>Write a R expression to find the range of <i>johnScores</i>?</li>
					<ul>
						<li><code>range<- maxScore - minScore</code></li>
					</ul>
				</ul>			
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-19', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-19', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-20" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Standard Deviation (Motivation)</h1>
				<p>Given the mean value of the variable, we would like to see how much each individual&#039;s value deviates from this mean. This deviation is called <i>naive deviation.</i></p>
				<p>For example, the naive deviation of Juan&#039;s score for the first game <i>g1</i> is  
<i>juanScores</i>(g1) - mean(<i>juanScores</i>) which is 6-6 = 0</p>
				<div class="row justify-content-center">
					<table class="table table-condensed table-bordered text-center w-auto align-self-center">
						<thead>
							<tr>
								<th scope="col" class="text-center">game</th>
								<th scope="col" class="text-center">johnScores (game)</th>
								<!-- <th scope="col" class="text-center">Game_II Score</th>
								<th scope="col" class="text-center">Game_III Score</th> -->
							</tr>
						</thead>
						<tbody>
							<tr>
								<td scope="row">g1</td>
								<td>6</td>
							</tr>
							<tr>
								<td scope="row">g2</td>
								<td>6</td>
							</tr>
							<tr>
								<td scope="row">g3</td>
								<td>6</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-20', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-20', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-21" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Standard Deviation (Motivation)</h1>
				<p><b>Practice:</b> Assume you can use mean function directly: the output of mean(<i>v</i>) where <i>v</i> is a vector, is the mean value of <i>v</i>.</p>
				<p>Use your earlier R program variable for <i>juanScores</i>, write R expressions to represent the vector of the naive deviations for each individual (game) of variable <i>juanScores</i>.</p>
				<p><code>johnScores <- c(&#34;g1&#34;=6, &#34;g2&#34;=7, &#34;g3&#34;=5)</code></p>
				<p><code>nDeviationsJ <- juanScores - mean(juanScores)</code></p>
				<table class="table w-auto table-sm table-borderless text-center">
							<tbody>
								<tr>
									<td>Observe the deviations</td>
									<td>(0,</td>
									<td>1,</td>
									<td>-1)</td>
								</tr>
								<tr>
									<td></td>
									<td>g1</td>
									<td>g2</td>
									<td>g3</td>
								</tr>
							</tbody>
				 </table>
				 <p>Can we take the naive deviation of <i>juanScore</i> as a statistics variable for the population {g1, g2, g3}?</p>
				 <p><i>Yes!</i></p>
				<p>How to summarize so many deviations of all individuals into one number?</p>
				 <p><i>Take the mean of the deviations!</i></p>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-21', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-21', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>	
	<section id="version-1-course-lds-lesson-4-page-22" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Standard Deviation (Motivation)</h1>
				<p>Using your earlier R program variable, write R expression for the mean of the naive deviation for <i>juanScores</i>.</p>
				<p>(You can use the <b>mean(...)</b> function provided by R)</p>
				
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-22', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-22', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>		
	<section id="version-1-course-lds-lesson-4-page-23" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Standard Deviation (Motivation)</h1>
				<p>Using your earlier R program variable, write R expression for the mean of the naive deviation for <i>juanScores</i>.</p>
				<p><code>nDeviationsJo <- johnScores - mean(johnScores)</code></p>
				<p><code>mean(nDeviationsJ)</code></p>
				<p>Observe the  naive deviations for</p>
				<table class="table w-auto table-sm table-borderless text-center">
							<tbody>
								<tr>
									<td><i>johnScores:</i></td>
									<td>(0,</td>
									<td>0,</td>
									<td>0)</td>
									<td>and <i>juanScores</i>:</td>
									<td>(0,</td>
									<td>1,</td>
									<td>-1)</td>
								</tr>
								<tr>
									<td></td>
									<td>g1</td>
									<td>g2</td>
									<td>g3</td>
									<td></td>
									<td>g1</td>
									<td>g2</td>
									<td>g3</td>
								</tr>
							</tbody>
				 </table>
				 <p>Their means are the same, but they are clearly different. But when getting the mean of Juan&#039;s deviations, the positive deviation 1 and the negative deviation 1 are canceled when they are added together. </p>
				 <p>To overcome this, we next introduce the concept of <i>standard deviation</i> for variability.</p>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-23', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-23', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>		
	<section id="version-1-course-lds-lesson-4-page-24" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Standard Deviation (Motivation)</h1>
				<p><i>Standard deviation</i> of a statistics variable <i>x</i> uses the following ideas:</p>
				<ul>
					<li>We get square of each naive deviation so that we can avoid the cancellation of deviations.</li>
					<li>The square of naive deviation forms a statistics variable for the population of variable <i>x</i>!</li>
					<li>To summarize the squared naive deviations into one number, we get the mean of them! This number is called <i>variance</i> of variable <i>x</i>.</li>
				</ul>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-24', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-24', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-25" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Standard Deviation (Motivation)</h1>
				<p><b>Practice</b></p>
				<p>Using your earlier R program variable for naive deviation for <i>juanScores</i>, write R expressions for the variance of <i>juanScores</i>. Associate your expression to an R program variable:</p>
				<div class = "row">
				<div class = "col-md-8">
				<ul>
					<li>Write a R expression to get squared naive deviations:</li>
					<li>Write a R expression to find the mean of the squared deviation:</li>
				</ul>
				</div>
				<div class = "col-md-2 d-flex justify-contend-end">
				<div class="text-center">
								<img src="../images/lesson4lds/q2.jpg" alt="Image" width="100"
									height="100" text-align="center">
				</div>
				<div style="margin-left:2em">
								<img src="../images/lesson4lds/q3.jpg" alt="Image" width="100"
									height="100" text-align="center">
				</div>
				</div></div>
				
							
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-25', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-25', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-26" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Standard Deviation (Motivation)</h1>
				<p><b>Practice</b></p>
				<p>Using your earlier R program variable for naive deviation for <i>juanScores</i>, write R expressions for the variance of <i>juanScores</i>. Associate your expression to an R program variable:</p>
				<div class = "row">
				<div class = "col-md-8">
				<ul>
					<li>Write a R expression to get squared naive deviations:</li>
					<ul>
						<li><code>sqD <- nDeviationsJ * nDeviationsJ</code></li>
					</ul>
					<li>Write a R expression to find the mean of the squared deviation:</li>
					<ul>
						<li><code>varianceJ <- mean(sqD)</code></li>
					</ul>
				</ul>
				</div>
				<div class = "col-md-2 d-flex justify-contend-end">
				<div class="text-center">
								<img src="../images/lesson4lds/q2.jpg" alt="Image" width="100"
									height="100" text-align="center">
				</div>
				<div style="margin-left:2em">
								<img src="../images/lesson4lds/q3.jpg" alt="Image" width="100"
									height="100" text-align="center">
				</div>
				</div></div>
				
							
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-26', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-26', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-27" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Standard Deviation (Motivation)</h1>
				<p><b>Practice</b></p>
				<p>Using your earlier R program variable for naive deviation for <i>juanScores</i>, write R expressions for the variance of <i>juanScores</i>. (Observe the difference of the variances of <i>johnScores</i> and <i>juanScores</i>.)</p>
				<div class = "row">
				<div class = "col-md-8">
				<ul>
					<li>Write a R expression to get squared naive deviations:</li>
					<!-- <ul>
						<li><code>sqD <- nDeviationsJ * nDeviationsJ</code></li>
					</ul> -->
					<li>Write a R expression to find the mean of the squared deviation:</li>
					<!-- <ul>
						<li><code>varianceJ <- mean(sqD)</code></li>
					</ul> -->
				</ul>
				</div>
				<div class = "col-md-2 d-flex justify-contend-end">
				<div class="text-center">
								<img src="../images/lesson4lds/q2.jpg" alt="Image" width="100"
									height="100" text-align="center">
				</div>
				<div style="margin-left:2em">
								<img src="../images/lesson4lds/q3.jpg" alt="Image" width="100"
									height="100" text-align="center">
				</div>
				</div></div>						
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-27', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-27', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-28" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Standard Deviation (Motivation)</h1>
				<p><b>Practice</b></p>
				<p>Using your earlier R program variable for naive deviation for <i>juanScores</i>, write R expressions for the variance of <i>juanScores</i>. (Observe the difference of the variances of <i>johnScores</i> and <i>juanScores</i>.)</p>
				<div class = "row">
					<div class = "col-md-8">
					<ul>
						<li>Write a R expression to get squared naive deviations:</li>
						<ul>
							<li><code>sqDJo <- nDeviationsJo * nDeviationsJo</code></li>
						</ul>
						<li>Write a R expression to find the mean of the squared deviation:</li>
						<ul>
							<li><code>varianceJo <- mean(sqDJo)</code></li>
						</ul>
					</ul>
					</div>
				
					<div class = "col-md-2 d-flex justify-contend-end">
					<div class="text-center">
									<img src="../images/lesson4lds/q2.jpg" alt="Image" width="100"
										height="100" text-align="center">
					</div>
					<div style="margin-left:2em">
									<img src="../images/lesson4lds/q3.jpg" alt="Image" width="100"
										height="100" text-align="center">
					</div>
					</div>
					</div>
					<p>Observe the difference of the variances of <i>johnScores</i> and <i>juanScores</i>.</p>							
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-28', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-28', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-29" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Standard Deviation (Motivation)</h1>
				<p>Since we squared the individual deviations, now we need 	&#34;scale&#34; the variance back: take the square root of the variance. This number is called standard deviation of the corresponding statistics variables. </p>
				<p><b>Practice: </b>Write R expression(s) to represent the standard deviation of <i>juanScores</i>, and the standard deviation of <i>johnScores</i>. You can use R function <b>sqrt(...)</b>: the output of sqrt(v), where <i>v</i> is a number or vector, is the square root of <i>v</i>.</p>						
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-29', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-29', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-30" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Standard Deviation (Motivation)</h1>
				<p>Since we squared the individual deviations, now we need
					&#34;scale&#34; the variance back: take the square root of the
					variance. This number is called standard deviation of the
					corresponding statistics variables.</p>
				<p>
					<b>Practice: </b>Write R expression(s) to represent the standard
					deviation of <i>juanScores</i>, and the standard deviation of <i>johnScores</i>.
					You can use R function <b>sqrt(...)</b>: the output of sqrt(v),
					where <i>v</i> is a number or vector, is the square root of <i>v</i>.
				</p>
				<p>
					<code>sdJ <- sqrt(varianceJ)</code>
				</p>
				<p>
					<code>sdJo <- sqrt(varianceJo)</code>
				</p>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-30', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-30', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-31" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Standard deviation - Formal definition</h1>
				<p><b>Definition (Standard Deviation)</b></p>
				<ul>
				<li>The <b><span class="underline">naive deviation</span></b> of a statistics variable <i>x</i> is <i>x - mean(x)</i>. We use the function <i>naiveDeviation(x)</i> to represent the naive deviation of <i>x</i>.</li>
				<li>The <b><span class="underline">variance</span></b> of variable <i>x</i> is the mean of the squared naive deviation:
<i>mean(naiveDeviation(x) * naiveDeviation(x))</i>. Let's use function <i>variance(x)</i> to represent the variance of <i>x</i>.</li>
				<li>The <b><span class="underline">standard deviation</span></b> of a statistics variable <i>x</i> is the square root of its variance:  <i>sqrt(variance(x))</i>.</li>
				</ul>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-31', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-31', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
		<section id="version-1-course-lds-lesson-4-page-32" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Defining a Function in R - Using R function</h1>
				<p><code>functionName <- function(parameter1, parameter2, ... ){</br>
				&nbsp;&nbsp;&nbsp;&nbsp;R expressions</br>
				&nbsp;&nbsp;&nbsp;&nbsp;return(an R-expression)</br>
				}
				</code></p>
				<p><b>Reading:</b> given inputs <i>parameter1</i> and <i>parameter2</i> etc., the output of <i>functionName(parameter1, parameter2,...)</i> is the value of <i>R-expression.</i></p>
				<p>Recall: the <i>naive deviation</i> of a quantitative variable <i>x</i> is <i>x - mean(x)</i>. Note naive deviation is a function from statistics variables to a number.</p>
				<p><b>Example.</b> Write an R function to define the naive deviation function.</p>
				<ul>
					<li>Decide <b>parameters</b> naive deviation function has: a statistics variable <i>x></i> (represented as named vector in R).</li>
					<li>Decide the <b>function name</b> (which can be any, but a good name is preferred): <i>naiveDeviation</i>.</li>
					<li>Decide the <b>output</b> of the function (from the question): the naive deviation of <i>x</i>.</li>
				</ul>					
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-32', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-32', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-33" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Defining a Function in R - Using R function</h1>
				<p><code>naiveDeviation <- function (x) {</br>
				&nbsp;&nbsp;&nbsp;&nbsp;# the output is x - mean(x)</br>
				&nbsp;&nbsp;&nbsp;&nbsp;return(x - mean(x))</br>
				}
				</code></p>
				<ul>
					<li><b>Parameters</b> naive deviation function has: a statistics variable <i>x</i> (a named vector) </li>
					<li><b>Function name</b>: <i>naiveDeviation</i>.</li>
					<li>The <b>output</b> of the function: the naive deviation of <i>x</i>.</li>
				</ul>
				<p>Test your function. Use your function to write an R expression for naive deviation of statistics variable <i>juanScores</i>.</p>					
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-33', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(4, 0, 'version-1-course-lds-lesson-4-page-33', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-4-page-34" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Defining a Function in R - Using R function</h1>
				<p><code>naiveDeviation <- function (x) {</br>
				&nbsp;&nbsp;&nbsp;&nbsp;# the output is x - mean(x)</br>
				&nbsp;&nbsp;&nbsp;&nbsp;return(x - mean(x))</br>
				}
				</code></p>
				<ul>
					<li><b>Parameters</b> naive deviation function has: a statistics variable <i>x</i> (a named vector) </li>
					<li><b>Function name</b>: <i>naiveDeviation</i>.</li>
					<li>The <b>output</b> of the function: the naive deviation of <i>x</i>.</li>
				</ul>
				<p>Test your function. Use your function to write an R expression for naive deviation of statistics variable <i>juanScores</i>.</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;<i>naiveDeviation(juanScores)</i></p>					
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(4, 0, 'version-1-course-lds-lesson-4-page-34', false, -1)">
						Previous </a> 
			</div>
		</div>
	</section>			
	<!-- onlineSPARC -->
	<!-- skipped 23,24,25 pages -->
	<%@ include file="footer.jsp"%>
	<%@ include file="footer.jsp"%>
	<script src="../js/lesson4lds/validations.js" type="text/javascript">
		
	</script>
</body>

</html>
