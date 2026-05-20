#!/usr/bin/bash

####################################
# @Author  : weilinfox
# @email   : caiweilin@iscas.ac.cn
# @Date    : 2024-03-26 13:18:31
# @License : Apache-2.0
# @Version : 1.0
# @Desc    : Generate test report
#####################################

SELF_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
RUN_PATH=$(pwd)

name_alias_js="$SELF_PATH"/names_alias.json
report_name_js="$SELF_PATH"/report_names.json
report_config_sh="$SELF_PATH"/report_configs.sh
report_config_my_sh="$SELF_PATH"/report_my_configs.sh
report_tmpl_dir="$SELF_PATH"/report_tmpl

temp_dir=/tmp/ruyi_report
log_name=`jq -r .\"${1:?}\" $name_alias_js`
report_name=`jq -r .\"${log_name:?}\" $report_name_js`

. "$report_config_my_sh"
. "$report_config_sh"

[ -z "${log_name}" ] && {
	echo Cannot get log name
	exit -1
}

[ -z "$report_name" ] && {
	echo Unsupported distro
	exit -1
}

[ ! -f $report_tmpl_dir/26test_log.md ] && {
	echo 26test_log.md not appears
	exit -1
}

[ ! -d $report_tmpl_dir/$log_name ] && {
	echo report tmpl dir not appears $log_name
	exit -1
}

[[ -d $temp_dir ]] && rm -rf $temp_dir
mkdir $temp_dir

cp ${report_tmpl_dir}/*.md ${report_tmpl_dir}/${log_name}/*.md $temp_dir/

for f in `ls ${temp_dir} | sort`; do
	echo Find template ${temp_dir}/$f
	cat ${temp_dir}/$f >> $TEST_LITESTER_PATH/my.md
done

sed -i "s/{{ruyi_arch}}/${TEST_ARCH:?}/g" $TEST_LITESTER_PATH/my.md
sed -i "s/{{ruyi_version}}/${TEST_VERSION:?}/g" $TEST_LITESTER_PATH/my.md
sed -i "s|{{ruyi_link}}|${TEST_PKG_LINK:?}|g" $TEST_LITESTER_PATH/my.md
sed -i "s|{{ruyitest_repo}}|${TEST_REPO:?}|g" $TEST_LITESTER_PATH/my.md
sed -i "s|{{ruyitest_repo_raw}}|${TEST_REPO_RAW:?}|g" $TEST_LITESTER_PATH/my.md
sed -i "s|{{ruyi_pytest_hash}}|${TEST_PYTEST_HASH:?}|g" $TEST_LITESTER_PATH/my.md
sed -i "s|{{ruyi_pytest_ci_hash}}|${TEST_PYTEST_CI_HASH:?}|g" $TEST_LITESTER_PATH/my.md
sed -i "s|{{ruyi_pytest_reports_hash}}|${TEST_PYTEST_REPORTS_HASH:?}|g" $TEST_LITESTER_PATH/my.md
sed -i "s/{{log_name}}/$log_name/g" $TEST_LITESTER_PATH/my.md

ruyi_conclusion="没有发现问题"
for tl in "23test_log.md" "25test_log.md"; do
if ! grep "exit code: 0" ${temp_dir}/${tl}; then
	ruyi_conclusion="此处添加评论"
fi
done
sed -i "s/{{ruyi_conclusion}}/$ruyi_conclusion/g" $TEST_LITESTER_PATH/my.md

rm -rf $temp_dir

# rename md report
[ -d "$TEST_LITESTER_PATH"/ruyi_report ] || mkdir "$TEST_LITESTER_PATH"/ruyi_report
mv -v $TEST_LITESTER_PATH/my.md $TEST_LITESTER_PATH/ruyi_report/$report_name.md

