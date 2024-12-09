$(function(){
    // jstree 초기화
    $('#jstree').jstree({
        'plugins': ['checkbox', 'search'],
        'checkbox': {
            'three_state': true // 부모-자식 관계를 자동으로 처리
        }
    }).jstree('open_all');

    // 부모 노드 체크 시 자식 노드 동작
    $('#jstree').on('check_node.jstree', function (e, data) {
        if (data.node.children_d) {
            data.node.children_d.forEach(function (childId) {
                $('#jstree').jstree('check_node', childId);
            });
        }
    });

    // 부모 노드 체크 해제 시 자식 노드 동작
    $('#jstree').on('uncheck_node.jstree', function (e, data) {
        if (data.node.children_d) {
            data.node.children_d.forEach(function (childId) {
                $('#jstree').jstree('uncheck_node', childId);
            });
        }
    });

    
});
