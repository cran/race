% ------------------------------------------------------- -*- mode: Rd; -*- %
% race.wrapper.Rd                                Test a candidate on a task %
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

% $Id: race.wrapper.Rd,v 1.16 2003/10/15 13:13:41 mbiro Exp $ %

\name{race.wrapper}
\alias{race.wrapper}

\title{Test a candidate on a task}

\description{This function is to be provided by the user. It's
  definition has to be given (together with the one of \code{race.info})
  in a file, and the name of such file has to
  be passed as first argument to the function \code{race}.
}

\synopsis{}
\usage{race.wrapper(candidate,task,data)}
          
\arguments{
  \item{candidate}{The candidate to be evaluated: a number between 1 and
    \code{no.candidates}, where \code{no.candidates} is the number of
    candidates and is to be defined within the function
    \code{race.wrapper} itself.}

  \item{task}{The task on which to the candidate should be evaluated: a
    number between 1 and \code{no.tasks}, where \code{no.tasks} is the
    number of tasks available for testing, and is to be defined within
    the function \code{race.wrapper} itself.}

  \item{data}{It is the object of type \code{list} (possibly empty)
    returned by \code{\link{race.init}}, if the latter is defined by the
    user.}
}

\value{A number: the result obtained by the given candidate at the given
  task. If \code{no.subtasks>1} (see \code{\link{race.info}}), the
  function is expected to return a vector of length equal to
  \code{no.subtasks} where the component \code{k} of such vector is the
  result obtained by the given candidate on the \code{k}-th subtask
  composing the given task.}

\note{Please notice that \code{race} is a \bold{minimization} algorithm:
  it selects the candidate that obtains the smallest results on
  the various tasks considered.}

\examples{
# Please have a look at the function `race.wrapper'
# defined in the file `example-wrapper.R':
local({
  source(file.path(system.file(package="race"),
                           "examples","example-wrapper.R"),local=TRUE);
  print(race.wrapper)})
}

\author{Mauro Birattari}

\seealso{\code{\link{race}}, \code{\link{race.init}},
  \code{\link{race.info}}}

\keyword{misc}
