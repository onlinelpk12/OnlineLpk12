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

<link rel="stylesheet" href="../styles/lesson5lds.css">

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
								let firstPageIdOfCurrentLesson = GetFirstPageIdOfCurrentLessonFromJSON(5);
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

	<section id="version-1-course-lds-lesson-5-page-1" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content text-center">
				<h1>Lesson 5: Two Categorical Variables</h1>
				<br>
				<div class="d-flex justify-content-end">
					<a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-1', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-5-page-2" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Two Variables</h1>
				<ol>
					<h4>
						<li>Two Categorical Variables (Motivation)</li>
					</h4>
					<h4>
						<li>Joint Frequency (Motivation)</li>
					</h4>
					<h4>
						<li>Joint Frequency - Formal Definition</li>
					</h4>
					<h4>
						<li>Computing Methodology</li>
					</h4>
					<h4>
						<li>Joint Relative Frequency and Computing</li>
					</h4>
					<h4>
						<li>Conditional Relative Frequency and Computing</li>
					</h4>
					<h4>
						<li>Distribution of Two Variables</li>
					</h4>
				</ol>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-2', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-2', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-5-page-3" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Two Categorical Variables - Motivation</h1>
				<p>As seen in several examples (roller coasters, players of
					games), given a population, we usually have more than one
					variables.</p>
				<p>In this unit, we will consider a population with two
					variables and see how the two variables are related.</p>
				<!-- <div class="container-fluid">
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
				</div> -->
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary pull-left"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-3', false, -1)">
						Previous </a> <a class="btn btn-primary pull-right"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-3', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-5-page-4" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Two Categorical Variables - Motivation</h1>
				<p>
					<b>Example:</b> Yellowstone National Park staff surveyed 100
					visitors. They have two variables: their pets (dog or cat) and
					gender. The staff was interested to see how gender is correlated to
					the type of pet. Here we will sample 8 visitors as shown in the
					table.
				</p>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>
								<i>Questions</i>:
							</p>
							<p>Proportion of female visitors that have cats?</p>
							<ul>
								<li>Number of female visitors?</br>&nbsp;&nbsp;&nbsp;&nbsp;[size=4]
								</li>
								<br>
								<li>Number of female visitors with cats?</br>&nbsp;&nbsp;&nbsp;&nbsp;[
									frequency = 3]
								</li>
								<br>
								<li>Proportion of female visitors that have cats?</br>&nbsp;&nbsp;&nbsp;&nbsp;[frequency
									/ size = 3/4 = 0.75]
								</li>
							</ul>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary pull-left"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-4', false, -1)">
						Previous </a> <a class="btn btn-primary pull-right"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-4', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>


	<section id="version-1-course-lds-lesson-5-page-5" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Two Categorical Variables - Motivation</h1>
				<p>
					<b>Example:</b> Yellowstone National Park staff surveyed 100
					visitors. They have two variables: their pets (dog or cat) and
					gender. The staff was interested to see how gender is correlated to
					the type of pet. Here we will sample 8 visitors as shown in the
					table.
				</p>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>
								<i>Questions</i>:
							</p>
							<p>Proportion of male visitors that have cats?</p>
							<ul>
								<li>Number of male visitors?</li>
								<br>
								<li>Number of male visitors with cats?</li>
								<br>
								<li>Proportion of male visitors that have cats?</li>
							</ul>
							<div class="text-center">
								<img src="../images/lesson4lds/q1.jpg" alt="Image" width="100"
									height="100" text-align="center">
							</div>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary pull-left"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-5', false, -1)">
						Previous </a> <a class="btn btn-primary pull-right"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-5', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-5-page-6" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Two Categorical Variables - Motivation</h1>
				<p>
					<b>Example:</b> Yellowstone National Park staff surveyed 100
					visitors. They have two variables: their pets (dog or cat) and
					gender. The staff was interested to see how gender is correlated to
					the type of pet. Here we will sample 8 visitors as shown in the
					table.
				</p>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>
								<i>Questions</i>:
							</p>
							<p>Proportion of male visitors that have cats?</p>
							<ul>
								<li>Number of male visitors?</br>&nbsp;&nbsp;&nbsp;&nbsp;[size=4]
								</li>
								<br>
								<li>Number of male visitors with cats?</br>&nbsp;&nbsp;&nbsp;&nbsp;[frequency
									= 3]
								</li>
								<br>
								<li>Proportion of male visitors that have cats?</br>&nbsp;&nbsp;&nbsp;&nbsp;[frequency
									/ size = 3/4 = 0.75]
								</li>
							</ul>
							<div class="text-center">
								<img src="../images/lesson4lds/q4.jpg" alt="Image" width="200"
									height="100" text-align="center">
							</div>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary pull-left"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-6', false, -1)">
						Previous </a> <a class="btn btn-primary pull-right"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-6', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-5-page-7" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Two Categorical Variables - Motivation</h1>
				<p>
					<b>Example:</b> Yellowstone National Park staff surveyed 100
					visitors. They have two variables: their pets (dog or cat) and
					gender. The staff was interested to see how gender is correlated to
					the type of pet. Here we will sample 8 visitors as shown in the
					table.
				</p>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>Finally, we have</p>
							<ul>
								<li>Proportion of female visitors who have cats? <i>0.75</i></li>
								<li>Proportion of female visitors who have dogs? <i>0.25</i></li>
								<li>Proportion of male visitors who have cats? <i>0.25</i></li>
								<li>Proportion of male visitors who have dogs? <i>0.75</i></li>
							</ul>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<p>
					If we know the gender of a visitor is male, can we predict the pet
					of the visitor?</br>but if we say dog, we have a good chance to be right
					because 75% of male visitors have dogs.
				</p>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary pull-left"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-7', false, -1)">
						Previous </a> <a class="btn btn-primary pull-right"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-7', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-5-page-8" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Joint Frequency (motivation)</h1>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>When we study the relationship between</p>
							<p>
								variable <i>gender</i> and <i>pet</i>, we need:
							</p>
							<ul>
								<li>Number of female visitors with dogs?</li>
								<br>
								<li>Number of females who have a cat?</li>
							</ul>
							<div class="text-center">
								<img src="../images/lesson4lds/q1.jpg" alt="Image" width="100"
									height="100" text-align="center">
							</div>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary pull-left"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-8', false, -1)">
						Previous </a> <a class="btn btn-primary pull-right"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-8', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-5-page-9" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Joint Frequency (motivation)</h1>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>
								When we study the relationship between variable <i>gender</i>
								and <i>pet</i>, we need:
							</p>
							<ul>
								<li>Number of female visitors with dogs?&nbsp;&nbsp;1</li>
								<br>
								<li>Number of females who have a cat?&nbsp;&nbsp;3</li>
							</ul>
							<div class="text-center">
								<img src="../images/lesson4lds/q4.jpg" alt="Image" width="200"
									height="100" text-align="center">
							</div>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary pull-left"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-9', false, -1)">
						Previous </a> <a class="btn btn-primary pull-right"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-9', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-5-page-10" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Joint Frequency (motivation)</h1>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>
								When we study the relationship between variable <i>gender</i>
								and <i>pet</i>, we need:
							</p>
							<ul>
								<li>Number of female visitors with dogs?&nbsp;&nbsp;1</li>
								<li>Number of females who have a cat?&nbsp;&nbsp;3</li>
							</ul>
							<p>
								These numbers are called <i>frequency</i>. But now it is a
								frequency of not a single value, but a pair of values: one from
								the variable <i>gender</i> and one from the variable <i>pet</i>.</br>Hence,
								this frequency is called the <i>joint frequency</i> of
								individuals, taking &quot;joint values&quot; - one from variable
								<i>gender</i> and one from variable <i>pet</i>.
							</p>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-10', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-10', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-5-page-11" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Joint Frequency (motivation)</h1>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>
								When we study the relationship between variable <i>gender</i>
								and <i>pet</i>, we need:
							</p>
							<ul>
								<li>Number of female visitors with dogs?&nbsp;&nbsp;1</li>
								<li>Number of females who have a cat?&nbsp;&nbsp;3</li>
							</ul>
							<p>
								Translate the plain English above using <i>joint frequency:</i>
							</p>
							<ul>
								<li>The joint frequency of visitors with their <i>gender</i>
									being female and <i>pet</i> being dog is 1.
								</li>
								<li>The joint frequency of vistorts with their <i>gender</i>
									being female and <i>pet</i> being cat is 3.
								</li>
							</ul>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-11', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-11', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-5-page-12" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Joint Frequency - Check for Understanding</h1>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>
								When we study the relationship between variable <i>gender</i>
								and <i>pet</i>, we need:
							</p>
							<p>What is the joint frequency of visitors with their gender
								being male and pet being dog? (In plain English: the number of
								males with dogs?)</p>
							<p>What is the joint frequency of visitors with their gender
								being male and pet being cat? (In plain English: the number of
								males with cats?)</p>
							<div class="text-center">
								<img src="../images/lesson4lds/q1.jpg" alt="Image" width="100"
									height="100" text-align="center">
							</div>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-12', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-12', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-5-page-13" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Joint Frequency - Check for Understanding</h1>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>
								When we study the relationship between variable <i>gender</i>
								and <i>pet</i>, we need:
							</p>
							<p>What is the joint frequency of visitors with their gender
								being male and pet being dog? (In plain English: the number of
								males with dogs?)&nbsp;&nbsp;3</p>
							<p>What is the joint frequency of visitors with their gender
								being male and pet being cat? (In plain English: the number of
								males with cats?)&nbsp;&nbsp;1</p>
							<div class="text-center">
								<img src="../images/lesson4lds/q4.jpg" alt="Image" width="200"
									height="100" text-align="center">
							</div>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-13', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-13', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-5-page-14" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<div class="text-center">
					<img src="../images/lesson4lds/q5.jpg" alt="Image" width=auto
						height=auto text-align="center">
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-14', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-14', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>

	<section id="version-1-course-lds-lesson-5-page-15" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Joint Frequency - Formal Definition</h1>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>Consider the yellowstone example again.</p>
							<ul>
								<li><b>Population</b>: set of the visitors. <i>population</i>
									= {v1, v2,..., v8}</li>
								<li><b>Statistics variables:</b>
									<ul>
										<li><i>gender</i>:the genders of a visitor <i>gender:
												population &rarr; {male, female}</i></li>
										<li><i>pet</i>: the pet type a person has: dog or cat <i>pet:
												population</i> &rarr; {dog, cat}</li>
									</ul></li>
							</ul>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-15', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-15', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-16" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Joint Frequency - Formal Definition</h1>
				<p>
					Given variables <i>x, y,</i> value <i>a</i> of <i>x</i> and <i>b</i>
					of <i>y</i>, <span class="underline">the joint frequency</span> of
					individuals with <i>x</i> being <i>a</i> and <i>y</i> being <i>b</i>
					is <i>|{individual: x(individual) = a <b>and</b> y(individual)
						= b}|
					</i>
				</p>
				<p>Or</p>
				<p>
					Given variables <i>x, y,</i> value <i>a</i> of <i>x</i> and <i>b</i>
					of <i>y</i>, <span class="underline">the joint frequency</span> of
					individuals with <i>x</i> being <i>a</i> and <i>y</i> being <i>b</i>
					is the number of individuals who takes <i>a</i> for <i>x</i> and <i>b</i>
					for <i>y</i>.
				</p>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-16', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-16', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-17" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Computing: Joint Frequency</h1>
				<p>
					<b>Computing Problem.</b> Given two statistics variables x and y,
					and values a from x and b from y, write an R function whose output
					is the joint frequency of individuals taking a for x and b for y.
				</p>
				<p>To solve a computing problem, we will talk about the
					following methodology</p>
				<ul>
					<li><b>Intentional form of a function </b></li>
					<li><b>Problem decomposition </b></li>
				</ul>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-17', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-17', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-18" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Computing: Intentional Form of a Function</h1>
				<p>
					<b>Intentional form of a function</b> has three components
				</p>
				<ul>
					<li><b>function name</b></li>
					<li><b>input</b> (data given to this function or parameters of
						this function)</li>
					<li><b>output</b> (unknown data this function need to figure
						out from input data)</li>
				</ul>
				<p>
					<b>Computing Problem.</b><span class="yellow"> Given two
						statistics variables x and y, and values a from x and b from y</span>,
					write an R function whose <span class="green">output is the
						joint frequency of individuals taking a for x and b for y.</span>
				</p>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-18', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-18', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-19" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Computing: Intentional Form of a Function</h1>
				<p>
					<b>Intentional form of a function</b> has three components
				</p>
				<ul>
					<li><b>function name</b>: jFre</li>
					<li><b>input</b>
						<ul>
							<li><i>x</i>: first variable for a population</li>
							<li><i>a</i>: a value for <i>x</i></li>
							<li><i>y</i>: second variable for the population</li>
							<li><i>b</i>: a value for <i>y</i></li>
						</ul></li>
					<li><b>output</b>
						<ul>
							<li>the joint frequency of individuals with <i>x</i> being <i>a</i>
								and <i>y</i> being <i>b</i>.
							</li>
						</ul></li>
				</ul>
				<p>
					<b>Computing Problem.</b> Given two statistics variables x and y,
					and values a from x and b from y, write an R function whose output
					is the joint frequency of individuals taking a for x and b for y.
				</p>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-19', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-19', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-20" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Computing: From Intentional Form to R Function Skeleton</h1>
				<div class="text-center">
					<img src="../images/lesson4lds/q6.jpg" class="img-fluid"
						alt="Image" width=auto height=auto text-align="center">
				</div>

				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-20', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-20', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-21" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Computing: Problem Decomposition</h1>
				<p>
					<b>Problem decomposition</b> has two steps
				</p>
				<ul>
					<li><b>Write the main steps to get the output of the
							function from its input as comments</b></li>
					<li><b>Write R expressions for each main step</b></li>
				</ul>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-21', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-21', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-22" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Computing: Problem Decomposition</h1>
				<p>
					<b>Problem decomposition</b> has two steps
				</p>
				<ul>
					<li><b>Write the main steps to get the output of the
							function from its input as comments</b></li>
				</ul>
				<table class="table w-auto table-bordered table-sm">
					<tbody>
						<tr>
							<td><code>
									jFre <- function(x, a, y, b){</br> &nbsp;&nbsp;&nbsp;&nbsp;# x:
									first variable for a population</br> &nbsp;&nbsp;&nbsp;&nbsp;# a: a
									value for x</br> &nbsp;&nbsp;&nbsp;&nbsp;# y: second variable for
									the population</br> &nbsp;&nbsp;&nbsp;&nbsp;# b: a value for y</br>
									</br> &nbsp;&nbsp;&nbsp;&nbsp;# output </br> &nbsp;&nbsp;&nbsp;&nbsp;#
									the joint frequency of individuals</br> &nbsp;&nbsp;&nbsp;&nbsp;#
									with x being a and y being b.</br>
									</br> &nbsp;&nbsp;&nbsp;&nbsp;# What are the major steps to get the
									output from input?</br> }
								</code></td>
						</tr>
					</tbody>
				</table>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-22', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-22', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-23" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Computing: Problem Decomposition</h1>
				<p>
					<b>Problem decomposition</b> has two steps
				</p>
				<ul>
					<li><b>Write the main steps to get the output of the
							function from its input as comments</b></li>
				</ul>
				<table class="table w-auto table-bordered table-sm">
					<tbody>
						<tr>
							<td><code>
									jFre <- function(x, a, y, b){</br> &nbsp;&nbsp;&nbsp;&nbsp;# x:
									first variable for a population</br> &nbsp;&nbsp;&nbsp;&nbsp;# a: a
									value for x</br> &nbsp;&nbsp;&nbsp;&nbsp;# y: second variable for
									the population</br> &nbsp;&nbsp;&nbsp;&nbsp;# b: a value for y</br>
									</br> &nbsp;&nbsp;&nbsp;&nbsp;# output </br> &nbsp;&nbsp;&nbsp;&nbsp;#
									the joint frequency of individuals</br> &nbsp;&nbsp;&nbsp;&nbsp;#
									with x being a and y being b.</br>
									</br> &nbsp;&nbsp;&nbsp;&nbsp;# 1 get a logical vector indicating
									individuals with x being a and y being b</br>
									</br> &nbsp;&nbsp;&nbsp;&nbsp;# 2 get those individuals with x being
									a and y being b</br>
									</br> &nbsp;&nbsp;&nbsp;&nbsp;# 3 get the number jFrequency of those
									individuals</br>
									</br> &nbsp;&nbsp;&nbsp;&nbsp;# 4 set jFrequency as the output of
									function jFre</br> }
								</code></td>
						</tr>
					</tbody>
				</table>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-23', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-23', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-24" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Computing: Problem Decomposition</h1>
				<p>
					<b>Write R expressions for each main step</b>
				</p>
				<table class="table w-auto table-bordered table-sm">
					<tbody>
						<tr>
							<td><code>
									jFre <- function(x, a, y, b){</br> &nbsp;&nbsp;&nbsp;&nbsp;# x:
									first variable for a population</br> &nbsp;&nbsp;&nbsp;&nbsp;# a: a
									value for x</br> &nbsp;&nbsp;&nbsp;&nbsp;# y: second variable for
									the population</br> &nbsp;&nbsp;&nbsp;&nbsp;# b: a value for y</br>
									</br> &nbsp;&nbsp;&nbsp;&nbsp;# output </br> &nbsp;&nbsp;&nbsp;&nbsp;#
									the joint frequency of individuals</br> &nbsp;&nbsp;&nbsp;&nbsp;#
									with x being a and y being b.</br>
									</br> &nbsp;&nbsp;&nbsp;&nbsp;# 1 get a logical vector indicating
									individuals with x being a and y being b</br>
									</br> &nbsp;&nbsp;&nbsp;&nbsp;# 2 get those individuals with x being
									a and y being b</br>
									</br> &nbsp;&nbsp;&nbsp;&nbsp;# 3 get the number jFrequency of those
									individuals</br>
									</br> &nbsp;&nbsp;&nbsp;&nbsp;# 4 set jFrequency as the output of
									function jFre</br> }
								</code></td>
						</tr>
					</tbody>
				</table>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-24', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-24', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-25" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Computing: Problem Decomposition</h1>
				<p>
					<b>Write R expressions for each main step</b>
				</p>
				<table class="table w-auto table-bordered table-sm">
					<tbody>
						<tr>
							<td><code>
									jFre <- function(x, a, y, b){</br> &nbsp;&nbsp;&nbsp;&nbsp;# x:
									first variable for a population</br> &nbsp;&nbsp;&nbsp;&nbsp;# a: a
									value for x</br> &nbsp;&nbsp;&nbsp;&nbsp;# y: second variable for
									the population</br> &nbsp;&nbsp;&nbsp;&nbsp;# b: a value for y</br>
									</br> &nbsp;&nbsp;&nbsp;&nbsp;# output </br> &nbsp;&nbsp;&nbsp;&nbsp;#
									the joint frequency of individuals</br> &nbsp;&nbsp;&nbsp;&nbsp;#
									with x being a and y being b.</br>
									</br> &nbsp;&nbsp;&nbsp;&nbsp;# 1 get a logical vector indicating
									individuals with x being a and y being b</br>
									&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: black;">ind
										<- x == a & y == b</span></br> &nbsp;&nbsp;&nbsp;&nbsp;# 2 get those
									individuals with x being a and y being b</br>
									&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: black;">indAB
										<- names(which(ind))</span></br> &nbsp;&nbsp;&nbsp;&nbsp;# 3 get the
									number jFrequency of those individuals</br> &nbsp;&nbsp;&nbsp;&nbsp;<span
										style="color: black;">jFrequency <- length(indAB)</span></br>
									&nbsp;&nbsp;&nbsp;&nbsp;# 4 set jFrequency as the output of
									function jFre</br> &nbsp;&nbsp;&nbsp;&nbsp;<span
										style="color: black;">return (jFrequency)</span></br> }
								</code></td>
						</tr>
					</tbody>
				</table>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-25', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-25', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-26" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Computing: Summary</h1>
				<p>
					<b>Computing Problem.</b> Given two statistics variables x and y,
					and values a from x and b from y, write an R function whose output
					is the joint frequency of individuals taking a for x and b for y.
				</p>
				<p>To solve a computing problem, we will talk about the
					following methodology</p>
				<ul>
					<li><b>Intentional form of a function</b>
						<ul>
							<li><b>function name</b></li>
							<li><b>input</b></li>
							<li><b>output</b></li>
						</ul></li>
					<li><b>Translate intentional form into R function skeleton</b></li>
					<li><b>Problem decomposition</b>
						<ul>
							<li><b>Write the main steps to get the output of the
									function from its input as comments</b></li>
							<li><b>Write R expressions for each main step</b></li>
						</ul></li>
				</ul>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-26', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-26', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-27" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Variability - Standard Deviation (Motivation)</h1>
				<div class="text-center">
					<img src="../images/lesson4lds/q7.jpg" class="img-fluid"
						alt="Image" width=auto height=auto text-align="center">
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-27', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-27', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-28" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Joint Relative Frequency (Motivation)</h1>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>Joint frequency gives us &quot;absolute&quot; number.
								Sometimes, we need the concept of &quot;relative&quot; (a
								proportion of the whole population) frequency.</p>
							<p>Here are some questions to answer using the data:</p>
							<ul>
								<li>What&apos;s the proportion (among the whole population)
									of individuals being female and having a dog?
									<ul>
										<li>number of individuals being female and having a dog?
											f = 1</li>
										<li>population size? size = 8</li>
										<li>proportion? f/size = 1/8</li>
									</ul>
								</li>
							</ul>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-28', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-28', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-29" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Joint Relative Frequency (Motivation)</h1>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>Joint frequency gives us &quot;absolute&quot; number.
								Sometimes, we need the concept of &quot;relative&quot; (a
								proportion of the whole population) frequency.</p>
							<p>Here are some questions to answer using the data:</p>
							<ul>
								<li>What&apos;s the proportion (among the whole population)
									of individuals being female and having a dog?</li>
							</ul>
							<p>
								This proportion is called the <i>joint relative frequency</i> of
								individuals with <i>gender</i> being female and <i>pet</i> being
								dog.
							</p>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-29', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-29', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-30" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Joint Relative Frequency - Formal Definition</h1>
				<p>
					Given variables <i>x, y,</i> over a population P, value <i>a</i> of
					<i>x</i> and <i>b</i> of <i>y</i>, <span class="underline">the
						joint relative frequency</span> of individuals with <i>x</i> being <i>a</i>
					and <i>y</i> being <i>b</i> is <i>|{individual: x(individual) =
						a <b>and</b> y(individual) = b}/|P|
					</i>
				</p>
				<p>Or</p>
				<p>
					Given variables <i>x, y,</i> value <i>a</i> of <i>x</i> and <i>b</i>
					of <i>y</i>, <span class="underline">the joint relative
						frequency</span> of individuals with <i>x</i> being <i>a</i> and <i>y</i>
					being <i>b</i> is <i>joint frequency</i> of individuals who takes <i>a</i>
					for <i>x</i> and <i>b</i> for <i>y</i> by the population size.
				</p>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-30', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-30', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-31" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Joint Relative Frequency - Formal Definition</h1>
				<div class="text-center">
					<img src="../images/lesson4lds/q8.jpg" class="img-fluid"
						alt="Image" width=auto height=auto text-align="center">
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-31', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-31', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-32" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Conditional Relative Frequency (Motivation)</h1>
				<p>Recall that we are interested in the proportion of female
					visitors who have cats? If majority of females have cats, then we
					can predict a visitor&quot;s pet using their gender.</p>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>This proportion is called <i>conditional relative frequency</i> of individuals:</p>
							<ul>
								<li><b>Condition:</b> their <i>gender</i> is female</li>
								<li>Among individuals satisfying this <b>condition</b>, we want to know the proportion of them that have a cat. 
								<ul>
									<li>Individuals meeting condition:</br>S={v2, v4, v6, v8}</li>
									<li>Individuals from S have cat: {v2, v6, v8}</li>
									<li>proportion of them having cat: 3/4</li>
								</ul>
								</li>
							</ul>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-32', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-32', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-33" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Conditional Relative Frequency (Motivation)</h1>
				<p>Recall that we are interested in the proportion of female
					visitors who have cats? If majority of females have cats, then we
					can predict a visitor&quot;s pet using their gender.</p>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>How about this understanding:</p>
							<ul>
								<li><b>Condition:</b> their <i>pet</i> is cat</li>
								<li>Among individuals satisfying this <b>condition</b>, we want to know the proportion of them being female. 
								<ul>
									<li>Individuals meeting condition:</br>S={v2, v5, v6, v8}</li>
									<li>Individuals from S have cat: {v2, v6, v8}</li>
									<li>proportion of them having cat: 3/4</li>
								</ul>
								</li>
							</ul>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Visitors</th>
										<th scope="col" class="text-center">Gender</th>
										<th scope="col" class="text-center">Pet</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">v1</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v2</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v3</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v4</td>
										<td>Female</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v5</td>
										<td>Male</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v6</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
									<tr>
										<td scope="row">v7</td>
										<td>Male</td>
										<td>Dog</td>
									</tr>
									<tr>
										<td scope="row">v8</td>
										<td>Female</td>
										<td>Cat</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-33', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-33', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-34" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Conditional Relative Frequency - Formal Definition</h1>
				<p>
					Given variables <i>x, y,</i> over a population P, value <i>a</i> of
					<i>x</i> and <i>b</i> of <i>y</i>, <span class="underline">the
						conditional relative frequency</span> of individuals, whose value of <i>y</i> being <i>b</i>, with <i>x</i> being <i>a</i> and is</p>
				<div class="text-center">
					<img src="../images/lesson4lds/q9.jpg" class="img-fluid"
						alt="Image" width=auto height=auto text-align="center">
				</div>
				<p>Or</p>
				<p>
					Given variables <i>x, y,</i> value <i>a</i> of <i>x</i> and <i>b</i>
					of <i>y</i>, <span class="underline">the conditional relative
						frequency</span> of individuals, whose value of <i>y</i> is <i>b</i>, with <i>x</i> being <i>a</i> is the number of individuals with <i>x</i> being <i>a</i> and <i>y</i> being <i>b</i> divided the number of individuals with <i>y</i> being <i>b</i>. 
				</p>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-34', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-34', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-35" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Conditional Relative Frequency - Formal Definition</h1>
				<div class="text-center">
					<img src="../images/lesson4lds/q10.jpg" class="img-fluid"
						alt="Image" width=auto height=auto text-align="center">
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-35', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-35', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-36" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Two Categorical Variables - Distribution</h1>
				<p>Recall the two variables <i>gender</i> and <i>pet</i> of the population of Yellowstone visitors. As we mentioned before, in statistics, people directly use the joint frequency of the individuals (instead of the content of the variables).</p>
				<p>The joint frequency of individuals for a pair of values (with respect to <i>gender</i> and <i>pet</i>) is referred to as the <i>distribution</i> of the individuals to this pair of values. The <i>distribution</i> of two variables usually refers to the joint frequency of each pair of values. The distribution of <i>gender</i> and <i>pet</i> is:</p>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<ul>
								<li>frequency(female, cat) = 3</li>
								<li>frequency(female, dog) = 1</li>
								<li>frequency(male, cat) = 1 </li>
								<li>frequency(female, cat) = 3</li>
							</ul>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Gender/Pet</th>
										<th scope="col" class="text-center">cat</th>
										<th scope="col" class="text-center">dog</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">Female</td>
										<td>3</td>
										<td>1</td>
									</tr>
									<tr>
										<td scope="row">Male</td>
										<td>1</td>
										<td>3</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-36', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-36', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-37" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Representation of Distribution in R</h1>
				<p><b>Definition (Named Matrix)</b></p>
				<p>Now we introduce the concept <b>named matrix</b>, a generalization of <i>named vectors</i>. 
A <i>named matrix</i> is a matrix with rows having names and columns having names. </p>
				<div class="container-fluid">
					<div class="row row-no-gutters">
						<div class="col-md-6">
							<p>For example,  the left table is a named matrix. The first column of the matrix is named by 	&quot;cat&quot; and the second by 	&quot;dog.&quot;  The first row is named by &quot;female&quot; and the second by &quot;male&quot;. The entry (red one in the table) at the row &quot;female&quot; and column &quot;cat&quot; is the joint frequency of individuals with gender being female and pet being cat. (Note, named matrix is a generalization of named vector).</p>
						</div>
						<div class="col-md-6">
							<table class="table table-condensed table-bordered text-center">
								<thead>
									<tr>
										<th scope="col" class="text-center">Gender/Pet</th>
										<th scope="col" class="text-center">cat</th>
										<th scope="col" class="text-center">dog</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">Female</td>
										<td style="color:red"><b>3</b></td>
										<td>1</td>
									</tr>
									<tr>
										<td scope="row">Male</td>
										<td>1</td>
										<td>3</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-37', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-37', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-38" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Representation of Distribution in R</h1>
				<p><code>disGP <- matrix(	c(3, 1, 1, 3),</br> 
&nbsp;&nbsp;&nbsp;&nbsp;nrow = 2,</br> 
&nbsp;&nbsp;&nbsp;&nbsp;byrow = TRUE,</br> 
&nbsp;&nbsp;&nbsp;&nbsp;dimnames = list(	c("female", "male"),</br> 
&nbsp;&nbsp;&nbsp;&nbsp;c("cat", "dog")))
				</code>
				</p>
				<p>The output of <code>matrix</code> function is the <i>named matrix</i> shown earlier.  
Input/parameters of function <code>matrix:</code></p>
				<ul>
					<li>The first parameter: a vector (result of concatenating all rows of the named matrix)</li>
					<li><i>nrow</i> = 2: set the parameter name <i>nrow</i> to be 2, i.e., the number of rows of the matrix is 2.</li>
					<li><i>byrow</i> = TRUE: set the parameter name <i>byrow</i> to be TRUE. It means that the vector should be the concatenation of the rows of the intended named matrix. </li>
					<li><i>dimname</i>: the row names and column names of the <i>named matrix</i>, using a list (which is a tuple).</li>
				</ul>
				
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-38', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-38', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-39" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Summary</h1>
				<p>We have learned statistics concepts for two categorical variables</p>
				<ul>
					<li>Joint frequency of individuals with specific value for each of the two variables</li>
					<li>Joint relative frequency of individual with specific value for each of the two variables</li>
					<li>Joint frequency of individuals with specific value for each of the two variables</li>
					<li>Conditional relative frequency of individuals: relative frequency of individuals with a specific value for one variable while conditioning the individuals to those with a specific value for the other variable.</li>
					<li>The distribution of two variables refers to the joint frequency of each pair of the values of these two variables.</li>
				</ul>
				
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-39', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-39', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>
	<section id="version-1-course-lds-lesson-5-page-40" class="container"
		hidden>
		<div class="row">
			<div class="col-md-8 offset-md-2 content">
				<h1>Summary</h1>
				<p>We have learned computing methods to write R functions for statistics concepts</p>
				<ul>
					<li>Intentional form of a function (function name, input and output)</li>
					<li>Translate an intentional form of a function to a R function skeleton</li>
					<li>Problem decomposition
					<ul>
					<li>Write major steps to achieve output/side effect from input</li>
					<li>Write R expressions for each step</li>
					<li>(This process is recursive: i.e., for each stem, we apply the problem decomposition method again.)</li>
					</ul>
					</li>
				</ul>
				<p>We have also learned to write and test R programs.</p>
				<br>
				<div class="d-flex justify-content-between">
					<a class="btn btn-primary"
						onclick="gotoPrevious(5, 0, 'version-1-course-lds-lesson-5-page-40', false, -1)">
						Previous </a> <a class="btn btn-primary"
						onclick="gotoNext(5, 0, 'version-1-course-lds-lesson-5-page-40', false, -1)">
						Next </a>
				</div>
			</div>
		</div>
	</section>	
	<!-- onlineSPARC -->
	<!-- skipped 23,24,25 pages -->
	<%@ include file="footer.jsp"%>
	<%@ include file="footer.jsp"%>
	<script src="../js/lesson5lds/validations.js" type="text/javascript">
		
	</script>
</body>

</html>