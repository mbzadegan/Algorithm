! This Fortran program uses all CPU Multi-threads and calculates an NP-Complete problem with a parallel algorithm
! gfortran -fopenmp -O2 subset_sum_show_subset.f90 -o subset_sum
! ./subset_sum 9 3 34 4 12 5
!
! Subset Sum With Subset Output (OpenMP)
! Target: 9
! Set A: 3 34 4 12 5
! Result: YES — subset found:
! Subset: { 4 5 }
! Time elapsed: 0.00012 seconds
! Threads used: 8


program subset_sum_show_subset
  use omp_lib
  implicit none

  integer, allocatable :: A(:), path(:)
  integer :: n, target, i, stat
  logical :: found
  real(8) :: t1, t2

  ! Get input
  n = command_argument_count() - 1
  if (n < 1) then
     print *, "Usage: ./subset_sum <target> <a1> <a2> ... <an>"
     stop
  end if

  allocate(A(n), path(n))
  call get_command_argument(1, target, status=stat)
  if (stat /= 0) stop "Error reading target."

  do i = 1, n
     call get_command_argument(i+1, A(i), status=stat)
     if (stat /= 0) stop "Error reading A"
  end do

  path = 0
  print *, "Subset Sum With Subset Output (OpenMP)"
  print *, "Target:", target
  print *, "Set A:", A

  call omp_set_num_threads(omp_get_max_threads())
  t1 = omp_get_wtime()

  !$omp parallel
  !$omp single
  found = subset_sum(A, path, n, target)
  !$omp end parallel

  t2 = omp_get_wtime()

  if (.not. found) then
     print *, "Result: NO — no subset found."
  end if

  print *, "Time elapsed:", t2 - t1, "seconds"
  print *, "Threads used:", omp_get_max_threads()

contains

  recursive function subset_sum(A, path, n, target) result(ok)
    integer, intent(in) :: A(:)
    integer, intent(inout) :: path(:)
    integer, intent(in) :: n, target
    logical :: ok
    logical :: left, right
    integer :: i
    integer, allocatable :: pathL(:), pathR(:)

    if (target == 0) then
       print *, "Result: YES — subset found:"
       write(*,'(A)', advance='no') "Subset: { "
       do i = 1, size(path)
          if (path(i) == 1) write(*,'(I0,A)', advance='no') A(i), " "
       end do
       print *, "}"
       ok = .true.
       return
    else if (n == 0) then
       ok = .false.
       return
    end if

    ! Clone path for both branches
    allocate(pathL(size(path)))
    allocate(pathR(size(path)))
    pathL = path
    pathR = path
    pathL(n) = 0
    pathR(n) = 1

    left = .false.
    right = .false.

    !$omp task shared(left)
    left = subset_sum(A, pathL, n - 1, target)
    !$omp end task

    if (A(n) <= target) then
       !$omp task shared(right)
       right = subset_sum(A, pathR, n - 1, target - A(n))
       !$omp end task
    end if

    !$omp taskwait
    ok = left .or. right
  end function subset_sum

end program subset_sum_show_subset
