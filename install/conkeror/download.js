function update_save_path (info) {
    cwd = info.target_file.parent;
}

add_hook("download_added_hook", update_save_path);
