% ------------------------------------------------------- -*- mode: Rd; -*- %
% race.init.Rd                                     Initialization function  %
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

\name{race.init}
\alias{race.init}

\title{Initialization function}

\description{The function \preformatted{race.init()} may be provided
  by the user for initializing the computation of the slave
  processes. It's definition has to be given in the same file in which
  the functions \code{race.wrapper} and \code{race.info} are defined.
  The name of such file has to be passed as first argument to the
  function \code{race}.}
         
\arguments{The function \code{race.init} has to be called with no
arguments.}

\value{The function \code{race.init} is expected to return an object of
  mode list.}

\details{This function should be used for initializing the computation
  on each slave, e.g. loading libraries or data needed by
  \code{race.wrapper}, \code{race.info}, and/or
  \code{race.describe}. The output of
  \code{race.init} will be passed to these functions.}


\examples{
# Please have a look at the function `race.init'
# defined in the file `example-wrapper.R':
local({
  source(file.path(system.file(package="race"),
                           "examples","example-wrapper.R"),local=TRUE);
  print(race.init)})
}

\author{Mauro Birattari}

\seealso{\code{\link{race}}, \code{\link{race.wrapper}},
    \code{\link{race.info}}, \code{\link{race.describe}}}

\keyword{misc}
