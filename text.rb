quiz '' do 
 select_multiple do
    text %q{Around 2007, the claim "Rails doesn't scale"  was attributed to
Twitter engineers, and the fact that Twitter later moved
away from Rails was cited by some as evidence that the claim was true.
Which of the following statements (there may be more than one) describe Raffi
Krikorian's (Twitter Director of Engineering) views on this subject?}
    answer "Rails itself isn't the problem, but the original Ruby VM does have some performance problems that impede scaling for heavy server workloads."
    answer "Rails itself isn't the problem, but the development processes typically used around Rails don't scale well to large teams."
    distractor "If you're building a startup and expect high volume, Raffi Krikorian would advise you to stay away from Ruby and Rails from the start."
    answer "If Twitter had been architected as a service-oriented architecture from the start, they might have stayed on Ruby/Rails somewhat longer than they did."

  end 
 end