<template>
  <div id="adminUserManagement" class="fit">
    <ta-border-layout :layout="{header:'70px',footer:'70px'}" :center-cfg="{showBar: true, toolBarStyle: {height: '50px', lineHeight: '48px'}}" :header-cfg="{showBorder: false}" :show-border="false" :footer-cfg="{showBorder: false}">
      <div slot="header" class="center-box">
        <ta-input-search
          v-model="searchInfo"
          placeholder="请输入人员姓名、帐号、证件号"
          class="search-box"
          @search="onSearchUser"
        >
          <ta-button slot="enterButton" type="primary">
            搜索
          </ta-button>
        </ta-input-search>
      </div>
      <div slot="centerExtraContent">
        <!--        <ta-cascader :options.sync="orgOptions"
                     :changeOnSelect="true"
                     placeholder="请选择组织机构123"
                     expandTrigger="hover"
                     class="vertical-space cascader-box"
                     :fieldNames="{label:'orgName',value:'orgId',children:'children'}"
                     :url="orgCascaderUrl"
                     @change="fnQueryUserListByOrgId"
                     treeId="orgVos"
                     style="width: 250px;min-width: 150px;margin-right: 10px;"
                     v-model="casValue"
                     :loadedDataCallBack="fnLoadedOrgCallBack"/>-->
        <ta-tree-select
          v-model="casValue"
          style="width: 250px;min-width: 150px;margin-right: 10px;"
          :dropdown-style="{ maxHeight: '300px', overflow: 'auto' }"
          placeholder="请选择组织机构"
          :url="orgCascaderUrl"
          :tree-data.sync="orgOptions"
          tree-id="orgVos"
          tree-node-id="orgId"
          tree-data-label="orgName"
          tree-node-label-prop="namePath"
          tree-data-value="orgId"
          allow-clear
          search-placeholder="请输入组织机构名称"
          show-search
          :filter-tree-node="filter"
          :loaded-data-call-back="fnLoadedOrgCallBack"
          @change="fnQueryUserListByOrgId"
        />
        <ta-checkbox :checked="isSub" @change="onChangeIsSub">
          包含子组织
        </ta-checkbox>
        <ta-tag-select
          v-model="selectFilter"
          title="锁定"
          :data="CollectionData('YESORNO')"
          @change="filterClick"
        />
      </div>
      <ta-table
        :columns="userColumns"
        :data-source="userList"
        row-key="userId"
        :pagination="false"
      >
        <template slot="name" slot-scope="text,record">
          <span :class="{'invalidStyle': record.effective == '0' }">{{ text }}</span>
          <!--<a @click="showRecordDetail(record)">{{text}}</a>-->
        </template>
        <span slot="sex" slot-scope="text">{{ CollectionLabel('SEX',text) }}</span>
        <span slot="namePath" slot-scope="text">{{ getLastName(text) }}</span>
        <span slot="isLock" slot-scope="text">
          <ta-tag :color="text == '0'?'green':'red'" class="no-cursor">
            {{ CollectionLabel('YESORNO',text) }}
          </ta-tag>
        </span>
        <span slot="operation" slot-scope="text, record">
          <ta-table-operate :operate-menu="operateMenu" />
        </span>
      </ta-table>
      <div slot="footer">
        <ta-pagination
          ref="userGridPager"
          style="float: right;margin-top: 10px"
          show-size-changer
          show-quick-jumper
          :data-source.sync="userList"
          :default-page-size="10"
          :params="userPageParams"
          :url="adminUserUrl"
        />
      </div>
    </ta-border-layout>
  </div>
</template>
<script>
import { filterTree, } from '@yh/ta-utils'

const userColumns = [
  {
    title: '姓名',
    dataIndex: 'name',
    width: '15%',
    scopedSlots: { customRender: 'name', },
  },
  {
    title: '账号',
    dataIndex: 'loginId',
    width: '15%',
  },
  {
    title: '性别',
    dataIndex: 'sex',
    width: 80,
    scopedSlots: { customRender: 'sex', },
  },
  {
    title: '所属组织',
    dataIndex: 'namePath',
    width: '15%',
    overflowTooltip: true,
    scopedSlots: { customRender: 'namePath', },
  },
  { title: '手机号', dataIndex: 'mobile', width: '15%', overflowTooltip: true, },
  { title: '锁定', dataIndex: 'isLock', width: 80, scopedSlots: { customRender: 'isLock', }, },
  {
    title: '操作',
    dataIndex: 'operation',
    width: 240,
    scopedSlots: { customRender: 'operation', },
    align: 'center',
  }
]

export default {
  name: 'adminUserManagement',
  data () {
    return {
      orgCascaderUrl: 'org/authority/adminAuthorityManagementRestService/queryCurrentAdminRoleWrapOrgTree', // 管理员权限人员维度url
      adminUserUrl: 'org/authority/adminAuthorityManagementRestService/queryUserByCondition', // 表格分页查询管理员人员维度列表
      casValue: undefined, // 级联默认数据
      orgOptions: [], // 级联数据
      isSub: true, // 是否包含子组织
      searchInfo: '', // 搜索人员信息
      userColumns, // 用户列名属性
      operateMenu: [{
        name: '角色管理',
        title: '该角色已关联普通角色，无法再关联管理员角色',
        isShow: record => record.pubRole === '1',
        style: {
          color: 'rgb(204, 204, 204)',
          cursor: 'not-allowed',
        },
      }, {
        name: '角色管理',
        isShow: record => record.pubRole !== '1',
        onClick: record => this.fnRouteToRoleMg(record),
      }],
      userList: [], // 用户信息
      arrayData: {}, // 行数据
      isDetailShow: false, // 是否展示详细信息
      selectFilter: [], // 过滤的元素信息
    }
  },
  methods: {
    filter (inputValue, treeNode) {
      const inputV = inputValue.toLowerCase()
      let result = null
      result = filterTree([treeNode], item => {
        return item.label.toLowerCase().indexOf(inputV) > -1
      })
      return result && result.length > 0
    },

    filterClick () {
      this.fnQueryUserByOrgId()
    },
    // 显示记录详情
    showRecordDetail (record) {
      this.isDetailShow = true
      this.arrayData = [
        {
          label: '姓名',
          value: record.name,
        },
        {
          label: '账号',
          value: record.loginId,
        },
        {
          label: '性别',
          type: 'codeTable',
          dictType: 'SEX',
          value: record.sex,
        },
        {
          label: '组织路径',
          type: 'desc',
          value: record.namePath,
        }
      ]
    },
    // 获取路径的最后一个
    getLastName (name) {
      return name && name.indexOf('/') !== -1 ? name.slice(name.lastIndexOf('/') + 1) : ((name == null || name === '' || name === undefined) ? '--' : name)
    },
    fnRouteToRoleMg (record) {
      this.$router.push({ path: 'adminUserRoleMg', query: { name: record.name, userId: record.userId, }, })
    },
    // 用户参数
    userPageParams () {
      const params = {}
      const orgId = this.orgOptions[0] && this.orgOptions[0].orgId ? this.orgOptions[0].orgId : ''
      params.orgId = this.casValue ?? orgId
      params.showChildUser = this.isSub ? '1' : '0'
      if (this.searchInfo) {
        params.name = this.searchInfo
        params.loginId = this.searchInfo
        params.idCardNo = this.searchInfo
        params.searchType = 'normal'
      }
      if (this.selectFilter) {
        params.islock = this.selectFilter.join(',')
      }
      return params
    },
    // //点击级联选择框触发
    // onChange(value, selectedOptions) {
    //   this.casValue = value;
    //   this.$nextTick(() => {
    //     this.fnQueryUserByOrgId();
    //   });
    // },
    // 通过组织id查询用户信息
    fnQueryUserListByOrgId (val) {
      this.casValue = val
      this.fnQueryUserByOrgId()
    },
    // 点击是否包含子组织
    onChangeIsSub (e) {
      this.isSub = e.target.checked
      this.$nextTick(() => {
        this.fnQueryUserByOrgId()
      })
    },
    // 组织数据加载完成后触发
    fnLoadedOrgCallBack (data) {
      this.orgOptions = data
      this.fnQueryUserByOrgId()
    },
    // 加载数据
    fnQueryUserByOrgId () {
      this.$refs.userGridPager.loadData()
    },
    // 点击搜索人员信息
    onSearchUser () {
      this.fnQueryUserByOrgId()
    },
  },
}
</script>
<style scoped type="text/less" lang="less">
  .invalidStyle {
    color: @normal-color;
    &:hover {
      color: @normal-color;
    }
    cursor: not-allowed;
  }
  .search-box {
    width: 340px;
    line-height: 42px;
  }
  .center-box { text-align:center; overflow: hidden; }
  .no-cursor {
    cursor: default;
  }
</style>
