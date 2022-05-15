<!DOCTYPE html>
<html lang="en">
    
<head>
    <title>Lesson 2</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script src="scripts/script.js"></script>
    <link rel="stylesheet" href="styles/style.css">
    <%@ include file = "header.jsp" %>
</head>

<body>
       <section id="learning-outcome-0" class="container">
        <div class="row">
            <div class="col-md-6 content" style="margin-left:20rem">
        <h1 class="text-primary"> Lesson 3 Variables and Queries </h1>
        <h2> Recall the family </h2>
        <ul>
            <li> What we know </li>
                <ul>
                    <li> John is the father of Peter </li>
                    <li> John is also the father of Sara and Linda </li>
                </ul>
            <li> Questions </li>
                <ul>
                    <li> Is John the father of Peter? </li>
                    <li> Who is Peter's father? </li>
                    <li> Who is Peter's dad? </li>
                    <li> Who is the mother of Peter? </li>
                </ul>
        </ul>
        <a class="btn btn-primary pull-right"
        onclick="gotoNext(2, 'learning-outcome-0','part-2', false, -1)"> Next </a>
</div>
</div>
</section>

    <section id = "part-2" hidden>
        <h2> What-questions </h2>
        <ul>
            <li> Instead of Yes/No questions, can we ask those what-questions  to our computer model? For example, </li>
                <ul> 
                    <li> Who is the father of Peter? </li>
                    <li> Who is Peter’s mother? </li>
                </ul>
        </ul>
        <button class="btn btn-primary" onclick="gotoPrevious('part-2','learning-outcome-0');"> Previous </button>
        <button class="btn btn-primary" onclick="gotoNext('part-2','part-3');"> Next </button>
    </section>

    <section id="part-5" hidden>
        <h2> Variables and Queries </h2>
        <ul>
            <li> (English) Who is the father of Peter? </li>
                <ul> 
                    <li> We don’t know the father of Peter, and we want to know it, so we introduce variable X to represent Peter’s father. </li>
                    <li> The query to our model for that question is 
                         father(X, peter)? 
                         means what is the value of X such that X is the father of Peter? </li>
                    <li> In this case, the answer from our model will be of the form X = john. </li>
                </ul>
        </ul>
        
        <button class="btn btn-primary" onclick="gotoPrevious('part-5','part-4');"> Previous </button>
        <button class="btn btn-primary" onclick="gotoNext('part-5','part-6');"> Next </button>
    </section>

    <section id="part-6" hidden>
        <h2> Variables and Queries </h2>
        <ul>
            <li> (English) Who is the father of Peter? </li>
            <li> Query to our model </li>
                <ul>
                    <li> Alternatively, we can use a better name for the variable Who.Then our query becomes have 
                         father(Who, peter)? </li>
                    <li> The answer will be Who = john. </li>
                    <li> Note: the name for a variable must start with a capital letter! </li>
                </ul>
            <li> Go to Activity 1 and activity 2 in Workbook </li>
        </ul>
        
        <button class="btn btn-primary" onclick="gotoPrevious('part-6','part-5');"> Previous </button>
        <button class="btn btn-primary" onclick="gotoNext('part-6','part-7');"> Next </button>
    </section>

    <section id="part-7" hidden>
        <h2> More exercises of using variables in queries </h2>
        <ul>
            <li> Ask similar what-questions for a few family members of your choice. </li>
            <li> Formulate a query for each of your question. </li>
            <li> Go to Activity 3 in Workbook. </li>
        </ul>
        
        <button class="btn btn-primary" onclick="gotoPrevious('part-7','part-6');"> Previous </button>
        <button class="btn btn-primary" onclick="gotoNext('part-7','part-8');"> Next </button>
    </section>

    <section id="part-8" hidden>
        <h2> More exercises of using variables in queries </h2>
        <ul>
            <li> (English) Whom is John the father of? </li>
            <li> How to write a query for it? [Student Discussion] </li>
        </ul>
        
        <button class="btn btn-primary" onclick="gotoPrevious('part-8','part-7');"> Previous </button>
        <button class="btn btn-primary" onclick="gotoNext('part-8','part-9');"> Next </button>
    </section>

    <section id="part-9" hidden>
        <h2> More exercises of using variables in queries </h2>
        <ul>
            <li> (English) Whom is John the father of? </li>
            <li> We introduce a variable (X or Whom or AKidOfJohn ...) for “Whom”  in the question and then write query with this variable:  </li>
                <ul>
                    <li> (query) father(john, X)? or </li>
                    <li> (query) father(john, Whom)? or </li>
                    <li> (query) father(john, AKidOfJohn)? </li>
                        <ul>
                            <li> Note: no space is allowed in the name AKidOfJohn </li>
                        </ul>
                    <li> Note the order of the parameters! </li>
                </ul>
            <li> Go to activity 4 in Workbook. Verify if the computer’s answer is correct. </li>
        </ul>
        
        <button class="btn btn-primary" onclick="gotoPrevious('part-9','part-8');"> Previous </button>
        <button class="btn btn-primary" onclick="gotoNext('part-9','part-10');"> Next </button>
    </section>


    <section id="part-10" hidden>
        <h2> More exercises on a different relation </h2>
        <ul>
            <li> (English) Who is the dad of Peter? </li>
            <li> Assume we have relation  dad(P1, P2)meaning that person P1 is the dad of person P2. </li>
            <li> [Discussion: how to write a query for this question?] </li>
        </ul>
        
        <button class="btn btn-primary" onclick="gotoPrevious('part-10','part-9');"> Previous </button>
        <button class="btn btn-primary" onclick="gotoNext('part-10','part-11');"> Next </button>
    </section>

    <section id="part-11" hidden>
        <h2> More exercises on a different relation </h2>
        <ul>
            <li> (English) Who is the dad of Peter? </li>
            <li> (query) dad(Who, peter)?
                 or  (query) dad(TheDadOfPeter, peter)? </li>          
        </ul>
       
        <button class="btn btn-primary" onclick="gotoPrevious('part-11','part-10');"> Previous </button>
        <button class="btn btn-primary" onclick="gotoNext('part-11','part-12');"> Next </button>
    </section>


    <section id="part-12" hidden>
        <h2> More exercises on a different relation </h2>
        <ul>
            <li> Repeat the previous questions for the relations other than father. </li>
            <li> Ask similar questions about Joaan. </li>
            <li> Write a query for each of your questions </li>
            <li> Go to Activity 5 </li>   
        </ul>
        
        <button class="btn btn-primary" onclick="gotoPrevious('part-12','part-11');"> Previous </button>
        <button class="btn btn-primary" onclick="gotoNext('part-12','part-13');"> Next </button>
    </section>


    <section id="part-13" hidden>
        <h2> Abstraction with objects and relations</h2>
        <ul>
            <li> Computer model- we need abstraction </li>
                <ul>
                    <li> Relations are at the core of our abstraction. </li>
                        <ul> 
                            <li> A relation has a name </li>
                            <li> A relation involves some objects </li>
                                <ul>
                                    <li> The objects are called parameters of the relation
                                         The first parameter is  john
                                         The second parameter is  peter </li>
                                </ul>
                
                             <li> A relation has a meaning </li>
                                <ul>
                                    <li> (English) John is the father of Peter. </li>
                                </ul>
                        </ul>
                    <li> Represent the knowledge in the SPARC program </li>
                        <ul>
                            <li> % John is the father of Peter. </li>
                            <li> father(john, peter). </li>
                        </ul>
                
        </ul>
        
        <button class="btn btn-primary" onclick="gotoPrevious('part-13','part-12');"> Previous </button>
        <button class="btn btn-primary" onclick="gotoNext('part-13','part-14');"> Next </button>
    </section>

    <section id="part-14" hidden>
        <h2> Summary </h2>
        <ul> 
            <li> We are able to ask more interesting queries (e.g., on what-questions) using variables! </li>
            <ul> 
                <li> Syntax for variables </li>
                <li> Meaning of variables </li>
                <li> Use of variables in queries </li>
            </ul>
            <li> We also introduced vocabularies for our abstraction: objects and relations.  </li>
        </ul>
        
        <button class="btn btn-primary" onclick="gotoPrevious('part-14','part-13');"> Previous </button>
    </section>
        <%@ include file = "footer.jsp" %>
 <body>
        </html>
