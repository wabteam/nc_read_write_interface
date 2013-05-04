program test_nc
! purpose:
! this code is devised for ...
!
!
! record of revisions:
!    date             programmer                description of change  
!==============    ===================   =============================
! 2011/12/22         wenyu huang                original code
! ...
!
!any comments please send to huangwenyu@mail.tsinghua.edu.cn                      
    use nc_read_write_interface

    character (len = 500) :: file_nc = "MMEAN0596-01.nc"

    integer, parameter :: num_lon = 360
    integer, parameter :: num_lat = 196 
    integer, parameter :: num_lev = 30 
    integer, parameter :: num_time = 1

    integer :: time (num_time)
    real (8) :: z0 (num_lon, num_lat, num_time) 
    real (8) :: us (num_lon, num_lat, num_lev, num_time) 

    call nc_read_write_interface_read_var (time, file_nc, "time", [1], [num_time], [num_time], 1)
    call nc_read_write_interface_read_var (z0, file_nc, "z0", [1, 1, 1], [num_lon, num_lat, num_time], [num_lon, num_lat, num_time], 3)
    call nc_read_write_interface_read_var (us, file_nc, "us", [1, 1, 1, 1], [num_lon, num_lat, num_lev, num_time], [num_lon, num_lat, num_lev, num_time],4)

    print *, time
    print *, minval (z0), maxval (z0, mask = z0 < 100.0d0)
    print *, minval (us), maxval (us, mask = us < 100.0d0)
    call nc_read_write_interface_delete_file ("hwy.nc")
    call nc_read_write_interface_create_file ("hwy.nc")




end program test_nc
