<template>
  <ta-user-select
    id="relationUser"
    title="新增组织人员"
    :is-show="isShow"
    :load="loadOrgTreeNode"
    :user-list-data="relationUserListData"
    :user-select-data="userSelectData"
    :default-user-list="userListResult"
    :props="userDefaultProps"
    :pagination="true"
    @close="fnCloseUserModal"
    @queryUserList="fnQueryUserList"
    @getUserListResult="fnGetUserListResult"
    @checkAllMembers="fnCheckAllMembers"
  />
</template>

<script>
import $api from '../api/index'

export default {
  name: 'customOrgUserSelect',
  props: {
    visible: {
      type: Boolean,
    },
  },
  data () {
    return {
      // userSelectId: 'relationUser',//默认人员选择框id
      isShow: false, // 是否显示
      userListResult: [], // 选择到的用户信息
      relationUserListData: [], // 点击左侧组织查询到的用户信息
      userSelectData: [], // 组件搜索的人员数据
      includeChild: false,
      userDefaultProps: {
        treeNodeKey: 'orgId',
        treeLabel: 'label',
        treeChildren: 'children',
        treeIsLeaf: 'isLeaf',
        listKey: 'userId', // 每条用户信息的唯一标识（默认：userId）
        listTitle: 'name', // 用户信息第一行显示内容
        listSubTitle: 'mobile', // 用户信息第二行显示内容
        listDescription: 'namePath', // 用户信息鼠标移上去显示描述信息
      },
      orgId: '', // 组织id
      total: undefined,
    }
  },
  watch: {
    visible (isShow) {
      if (isShow) {
        this.isShow = isShow
      }
    },
  },
  methods: {
    // 加载左侧组织树
    loadOrgTreeNode (node, resolve) {
      if (node.level === 0) {
        $api.queryAllTaOrg(null, data => {
          // 数据成功后默认返回的数据
          const orgVos = data.data.orgTreeData
          if (orgVos[0] && orgVos[0].children && (orgVos[0].children instanceof Array) && orgVos[0].children.length > 0) {
            const dd = orgVos[0].children.map(v => {
              const obj = v
              if (v.childNum > 0) {
                obj.children = []
              }
            })
            orgVos[0].children = dd
          }
          return resolve(orgVos)
        })
      }
      if (node.level >= 1) {
        const orgId = node.data.orgId
        const isLeaf = node.data.isLeaf
        const data = {
          orgId: orgId,
        }
        $api.queryAllTaOrg(data, data => {
          // 数据成功后默认返回的数据
          let dd = data.data.orgTreeData
          if (isLeaf) {
            dd = dd.map(v => {
              const obj = v
              obj.children = []
            })
          }
          return resolve(dd)
        })
      }
    },
    // 关闭人员选择模态框
    fnCloseUserModal () {
      this.isShow = false
      const userIds = this.userListResult.map(v => {
        return v.userId
      })
      // 将选中的数据进行清空
      this.userListResult = []
      this.relationUserListData = []
      this.userSelectData = []
      this.$emit('close', userIds.join(','))
    },
    fnQueryUserList (orgId, includeChildren, pageNum, searchType, searchParam) {
      // 查询用户信息
      const data = {
        orgId: orgId,
        showChildUser: includeChildren ? '1' : '0',
        pageNumber: pageNum,
        pageSize: 10,
      }
      if (searchType) {
        data[searchType] = searchParam
      }
      $api.queryBatchUserByOrgId(data, (data) => {
        this.relationUserListData = data.data.userList.list
        if (this.total === undefined) {
          this.total = data.data.userList.total
        }
      })
    },
    // 确认选择的人员信息
    fnGetUserListResult (data) {
      this.userListResult = data
    },
    fnCheckAllMembers (orgId, includeChild, cb) {
      $api.queryBatchUserByOrgId({
        orgId: orgId,
        includeChildren: includeChild ? '1' : '0',
        pageSize: this.total,
        pageNumber: 1,
      }, (data) => {
        cb(data.data.userList.list)
      })
    },
  },
}
</script>
