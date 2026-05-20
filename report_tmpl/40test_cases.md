### 测试用例列表

| 测试文件名 | 测试用例名 | 测试内容 |
| :-: | :-: | :-: |
| tests/basic/test_ruyi_admin.py | test_ruyi_admin | ruyi admin 命令测试 |
|  | test_ruyi_admin_default_strip_components | ``strip_components`` 默认值测试 |
|  | test_ruyi_admin_issue430 | ruyi issue#430 回归测试 |
| tests/basic/test_ruyi_completion.py | test_ruyi_output_completion_script | ruyi --output-completion-script bash 补全脚本输出测试 |
|  | test_ruyi_completion_issue452 | ruyi issue#452 回归测试 |
| tests/basic/test_ruyi_extract.py | test_ruyi_extract | ruyi extract 命令测试 |
| tests/basic/test_ruyi_install.py | test_ruyi_install | ruyi install 命令测试 |
|  | test_ruyi_install_host | ruyi install --host 参数测试 |
| tests/basic/test_ruyi_list.py | test_ruyi_list | ruyi list 命令测试 |
|  | test_ruyi_list_unavailable_pkg | ruyi list 无适用软件包测试 |
| tests/basic/test_ruyi_news.py | test_ruyi_news | ruyi news 命令测试 |
| tests/basic/test_ruyi_venv.py | test_ruyi_venv | ruyi venv 命令测试 |
|  | test_ruyi_venv_emulator | ruyi venv -e 参数测试 |
| tests/basic/test_ruyi_version.py | test_ruyi_version | ruyi version 命令测试 |
| tests/packages/test_ruyi_emulator.py | test_box64 | box64 模拟器支持测试 |
|  | test_qemu_user_riscv | qemu-user-riscv 模拟器支持测试 |
| tests/packages/test_ruyi_toolchain.py | test_ruyi_toolchain_gnu_milkv | gnu-milkv 工具链支持测试 |
|  | test_ruyi_toolchain_gnu_plct_rv64ilp32_elf | gnu-plct-rv64ilp32-elf 工具链支持测试 |
|  | test_ruyi_toolchain_gnu_plct_xiangshan_nanhu | gnu-plct 工具链 xiangshan nanhu 支持测试 |
|  | test_ruyi_toolchain_gnu_plct_xthead | gnu-plct-xthead 工具链支持测试 |

