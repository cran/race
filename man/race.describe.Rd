% ------------------------------------------------------- -*- mode: Rd; -*- %
% race.describe.Rd                                     Describe a candidate %
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

\name{race.describe}
\alias{race.describe}

\title{Describe a candidate}

\description{The function \preformatted{race.describe(candidate,data)}
  may be provided by the user for giving a description of a
  candidate. It's definition has to be given in the same file in which
  the functions \code{race.wrapper} and \code{race.info} are defined.
  The name of such file has to be passed as first argument to the
  function \code{race}.  }
         
\arguments{
  \item{candidate}{The candidate for which a description is to be
    returned.}
  
  \item{data}{It is the object of type \code{list} (possibly empty)
    returned by \code{\link{race.init}}, if the latter is defined by the
    user.}
}

\value{The function \code{race.describe} should return an object
  describing the selected candidate. Such object will be printed by
  \code{race} through the function \code{print}.}

\examples{
# Please have a look at the function `race.describe'
# defined in the file `example-wrapper.R':
local({
  source(file.path(system.file(package="race"),
                           "examples","example-wrapper.R"),local=TRUE);
  print(race.describe)})
}

\author{Mauro Birattari}

\seealso{\code{\link{race}}, \code{\link{race.init}}}

\keyword{misc}

