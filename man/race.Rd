% ------------------------------------------------------- -*- mode: Rd; -*- %
% race.Rd                      Racing methods for the selection of the best %
% ------------------------------------------------------------------------- %
                                                                             
% ========================================================================= %
% Racing methods for the selection of the best                              %
% ------------------------------------------------------------------------- %
% Copyright (C) 2003 Mauro Birattari                                        %
% ========================================================================= %
% This program is free software; you can redistribute it and/or modify it   %
% under the terms of the GNU General Public License as published by the     %
% Free Software Foundation; either version 2 of the License, or (at your    %
% option) any later version.                                                %
%                                                                           %
% This program is distributed in the hope that it will be useful, but       %
% WITHOUT ANY WARRANTY; without even the implied warranty of                %
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU         %
% General Public License for more details.                                  %
%                                                                           %
% You should have received a copy of the GNU General Public License along   %
% with this program; if not, write to the Free Software Foundation, Inc.,   %
% 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.                  %
% ========================================================================= %

% ========================================================================= %
% Mauro BIRATTARI                                                           %
% IRIDIA - ULB, CP 194/6                                                    %
% Av. F. D. Roosevelt 50                                    mbiro@ulb.ac.be %
% 1050 Brussels, Belgium                     http://iridia.ulb.ac.be/~mbiro %
% ========================================================================= %

% $Id: race.Rd,v 1.22 2005/02/19 14:09:01 waki Exp $ %

\name{race}
\alias{race}

\title{Racing methods for the selection of the best}

\description{Implementation of some racing methods for the empirical
  selection of the best. If the \R package \code{rpvm} is installed
  (and PVM is available, properly configured, and initialized), the
  evaluation of the candidates are performed in parallel on different
  hosts.}

\usage{%
race(wrapper.file, maxExp=0,
        stat.test=c("friedman","t.bonferroni","t.holm","t.none"),
           conf.level=0.95, first.test=5, interactive=TRUE,
              log.file="", no.slaves=0,...)
}

          
\arguments{
  \item{wrapper.file}{The name of a file containing the definition of 
    the functions to be provided by the user: i.e.
    \code{\link{race.wrapper}} and \code{\link{race.info}}. The file
    \code{wrapper.file} might also define the functions
    \code{\link{race.init}} and \code{\link{race.describe}}.}

  \item{maxExp}{Maximum number of experiments (i.e. evaluations of the
    function \code{race.wrapper}) that are allowed before selecting the
    best candidate. If \code{maxExp=0}, no limit is imposed\ldots very
    unrealistic in practice.}

  \item{stat.test}{Statistical test to be used for discarding inferior
    candidates.}

  \item{conf.level}{The confidence level to be used for the statistical
    test.}

  \item{first.test}{The first test for discarding inferior candidates is
    performed only when all candidates have been evaluated on a minimum
    number of tasks equal to \code{first.test}.}

  \item{interactive}{If \code{TRUE}, print a progress report on the
    standard output.}

  \item{log.file}{File for saving periodically the state of the race.}

  \item{no.slaves}{When running under PVM, \code{no.slaves} specify the
    number of slaves to be spawned. If \code{no.slave=0} PVM is not used
    and all experiments are performed on the local host.}
  \item{...}{All extra parameters are passed to the function
    \code{\link{race.init}} defined by the user in the file
    \code{wrapper.file}.}
}

\details{This package implemets some racing procedures for selecting
  from a set of candidate the one that is able to yield the best
  performance on a given set of tasks. The time available for selecting
  the best candidate is limited and, therefore, a brute-force approach is
  unfeasible.  The algorithm implemented in this package sequentially
  evaluates the set of candidatas on the available tasks while discards
  bad candidates as soon as statistically sufficient evidence is gathered
  against them.  The elimination of inferior candidates, speeds up the
  procedure and allows a more reliable evaluation of the promising ones.

}

\value{The output of \code{race} is a list containing the following
  components:

  \item{precis}{A string describing the race for documentation
    purposes.}

  \item{results}{A matrix containing in position \code{[i,j]} the result
    obtained by candidate \code{j} on task \code{i}.}

  \item{no.candidates}{Number of candidates at the beginning of the race.}
  
  \item{no.tasks}{Number of tasks on which the selection was based.}

  \item{no.subtasks}{Number of subtasks composing each tasks. Default=1}

  \item{no.experiments}{Number of times that the function
    \code{race.wrapper} had to be call in order to select the best.}

  \item{no.alive}{Number of candidates that completed the race, that is,
    number of candidates that had not been discarded at the moment in
    which the race was stopped.}

  \item{alive}{List of the candidates that completed the race:
    no sufficient evidence was gathered, give that the test
    \code{stat.test} is adopted, for stating that these candidates are
    worse than the selected best.}

  \item{alive.inTime}{Number of candidates in the race after each time
    step.}
  
  \item{best}{The candidate selected in the race.}

  \item{mean.best}{The average result of the best on the tasks
    considered.}

  \item{description.best}{An object describing the selected candidate.}

  \item{timestamp.start}{Time stamp of the beginning of the race.}

  \item{timestamp.end}{Time stamp of the end of the race.}

}

\note{Please notice that \code{race} is a \bold{minimization} algorithm:
  it selects the candidate that obtains the smallest results on
  the various tasks considered.}


\references{
  O. Maron and A.W. Moore (1994) Hoeffding Races: Accelerating Model
  Selection Search for Classification and Function Approximation.
  \emph{Advances in Neural Information Processing Systems 6},
  pp. 59--66. Morgan Kaufmann.

  A.W. Moore and M.S. Lee (1994) Efficient Algorithms for Minimizing
  Cross Validation Error. \emph{International Conference on Machine Learning},
  pp. 190--198. Morgan Kaufmann.

  O. Maron and A.W. Moore (1997) The Racing Algorithm: Model Selection
  for Lazy Learners. \emph{Artificial Intelligence Review},
  \bold{11}(1--5), pp. 193--225.
  
  M. Birattari, T. Stuetzle, L. Paquete, and K. Varrentrapp
  (2002) A Racing Algorithm for Configuring Metaheuristics. 
  \emph{GECCO 2002: Genetic and Evolutionary Computation Conference},
  pp. 11--18. Morgan Kaufmann.
  
  M. Birattari (2004) \emph{The Problem of Tuning Metaheuristics 
  as Seen from a Machine Learning Perspective}. PhD Thesis, 
  Universite' Libre de Bruxelles, Brussels, Belgium. 
}

\examples{
# The wrapper and init functions for this example are defined in the
# file examples/example-wrapper.R in the installation directory of the
# package.  Please, have a look at such file before implementing your
# own wrapper.
# This example require the package `nnet'
if (require(nnet)&&require(datasets)){
  example.wrapper<-file.path(system.file(package="race"),
                           "examples","example-wrapper.R")
  # Run the race
  race(example.wrapper)

  # If the package `rpvm' is installed on your system and if PVM is
  # properly installed and configured, you can try the following:
  #race(example.wrapper,no.slaves=6)
}
}

\author{Mauro Birattari}

\seealso{\code{\link{race.wrapper}}, \code{\link{race.info}},
  \code{\link{race.init}}, \code{\link{race.describe}}}

\keyword{design}
\keyword{htest}
\keyword{optimize}
