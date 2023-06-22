///aiplan(target_x, target_y)
targetX = argument0
targetY = argument1
diag = argument2

pathFound = mp_grid_path(grid, path, x, y, targetX, targetY, 1)

if pathFound = true
    path_start(path, moveSpeed, path_action_stop, true)
