import os

def create_file_structure(base_dir):
    structure = {
        "android": {},
        "ios": {},
        "lib": {
            "api": {},
            "components": {
                "buttons.dart": "",
                "text_fields.dart": "",
            },
            "constants": {
                "app_colors.dart": "",
                "app_strings.dart": "",
                "app_styles.dart": "",
            },
            "models": {
                "user_data_model.dart": "",
            },
            "pages": {
                "auth": {
                    "enroll_page.dart": "",
                    "verify_page.dart": "",
                },
                "home_page.dart": "",
                "settings_page.dart": "",
            },
            "providers": {
                "user_provider.dart": "",
            },
            "services": {
                "encryption_service.dart": "",
                "face_recognition_service.dart": "",
                "key_management_service.dart": "",
            },
            "utils": {
                "image_utils.dart": "",
                "encryption_utils.dart": "",
            },
            "widgets": {
                "face_capture_widget.dart": "",
                "progress_indicator.dart": "",
            },
            "main.dart": "",
        },
        "test": {
            "widget_test.dart": "",
        },
        "assets": {
            "images": {},
            "fonts": {},
            "translations": {},
        },
        "pubspec.yaml": "",
        "pubspec.lock": "",
        "README.md": "",
        "LICENSE": "",
    }

    def create_structure(base, struct):
        for name, content in struct.items():
            path = os.path.join(base, name)
            if isinstance(content, dict):
                os.makedirs(path, exist_ok=True)
                create_structure(path, content)
            else:
                with open(path, "w") as f:
                    f.write(content)

    create_structure(base_dir, structure)

# Replace 'project_name' with your desired project folder name
create_file_structure("./")
