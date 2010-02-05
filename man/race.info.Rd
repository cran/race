% ------------------------------------------------------- -*- mode: Rd; -*- %
% race.info.Rd                              Provide information on the race %
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

\name{race.info}
\alias{race.info}

\title{Provide information on the race}

\description{The function \preformatted{race.info(data)} is to be
  provided by the user. It's definition has to be given (together with
  the one of \code{\link{race.wrapper}}) in a file, and the name of
  such file has to be passed as first argument to the function
  \code{race}.}

\arguments{
  \item{data}{It is the object of type \code{list} (possibly empty)
    returned by \code{\link{race.init}}, if the latter is defined by the
    user.}
}

\value{The function \code{race.info} is expected
  to return a list including the following components:

  \item{race.name}{The name of the race for documentation
    purposes.}

  \item{no.candidates}{The number of candidates in the
    race.}

  \item{no.tasks}{Number of tasks available for testing.}

  \item{no.subtasks}{Each task might consists of \code{no.subtasks} 
        subtasks. If the element \code{no.subtasks} is not included in
	the list, it is assumed that each task is indeed atomic,
        that is, \code{no.subtasks=1}. \code{no.subtasks} may also be a
	vector of length \code{no.tasks}. In this case, the i-th task 
	consists of \code{no.subtasks[i]} subtasks.}
  
  \item{extra}{A character string providing extra
    information on the race for documentation purposes. It can be a long
    string and the user is not required to introduce newline characters:
    it will be automatically formatted for pretty-printing.}
}

\examples{
# Please have a look at the function `race.info'
# defined in the file `example-wrapper.R':
local({
  source(file.path(system.file(package="race"),
                           "examples","example-wrapper.R"),local=TRUE);
  print(race.info)})
}

\author{Mauro Birattari}

\seealso{\code{\link{race}}, \code{\link{race.init}}}

\keyword{misc}
