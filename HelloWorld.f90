program HelloAgainWorldF90
  real, dimension(:), allocatable :: x ! array that we will read into
  integer :: n 			! value that is read from file
  character(len=5) :: str 			    ! value


  write(*,*) "Hello Humans!"
  write(*,*) "Starting to read file."

  open(unit=99, file='HelloAgainInput.txt', status='old', action='read')
  read(99,*), n 		!first element in the file is the number of elements in the array
  allocate(x(n))
  read(99,*) x 			!now read in the array

  !do something to the array, like loop over it and multiply by 2
  if (x(0) > x(1)) THEN
    str = 'True '
  else
    str = 'False'
  end if

  write(*,*) "Done my calculations."
  open(unit=89, file='IAmHere.txt', status='replace', action='write')
  write(89,*)str

  write(*,*) "Results successfully written."

end program HelloAgainWorldF90
