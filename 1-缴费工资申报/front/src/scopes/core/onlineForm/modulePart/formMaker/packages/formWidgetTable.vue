<template>
  <div>
    <h3
      style="margin: 10px"
      v-show="column.label"
    >
      {{ column.label }}
    </h3>
    <draggable
      class="form-widget-table-content"
      :list="column.children.column"
      :group="{ name: 'form' }"
      ghost-class="ghost"
      :animation="200"
      handle=".form-widget-table-item"
      @add="handleWidgetAdd($event, column)"
    >
      <template v-if="column.children.column.length > 0">
        <div
          v-for="(item, tableIndex) in column.children.column"
          :key="tableIndex"
          class="form-widget-table-item"
          :class="{ active: selectWidget === item }"
          :style="{minWidth: item.width ? `${item.width}px`: '33.3%', width: item.width ? `${item.width}px`: '33.3%'}"
          @click.stop="handleTableWidgetSelect(item)"
        >
          <ta-table :key="tableIndex" :columns="getTableColumns(item)" :data-source="getTableColumnsData(item)">
            <span :slot="item.fieldDecoratorId" slot-scope="text, index">
              <ta-form-item
                :key="tableIndex"
                :class="{'multi-input-form-item': item.type === 'multi-input'}"
                :span="24"
                :wrapper-col="{span: 24}"
                :extra="item.extra"
                :field-decorator-id="item.fieldDecoratorId + '_0'"
                :required="item.required || false"
                :field-decorator-options="{
                  valuePropName: item.type !== 'switch' ? 'value' : 'checked',
                  initialValue: item.type !== 'switch' ? item.initialValue : item.initialValue === 'true',
                  validateTrigger: item.validateTrigger && item.validateTrigger.length > 0 ? item.validateTrigger : ['change'],
                  rules: [{
                    required: item.required || false,
                    message: item.message}].concat(item.rules && item.rules !== '' ? transformRules(column) : [])
                }"
                @click.native="handleSelectWidget(index)"
              >
                <form-item :item="item" />
                <div style="width: 100%; position: relative">
                  <ta-button
                    title="??????"
                    @click.stop="handleTableWidgetDelete(column, item)"
                    class="widget-table-action-delete"
                    v-if="selectWidget === item"
                    shape="circle"
                    size="small"
                    type="danger"
                    icon="delete"
                  />
                  <ta-button
                    title="??????"
                    @click.stop="handleTableWidgetClone(column, item)"
                    class="widget-table-action-clone"
                    v-if="selectWidget === item"
                    shape="circle"
                    size="small"
                    type="primary"
                    icon="copy"
                  />
                </div>
              </ta-form-item>
            </span>
          </ta-table>
        </div>
      </template>
    </draggable>
    <div style="width: 100%; position: relative">
      <ta-button
        title="??????"
        @click.stop="handleWidgetDelete(index)"
        class="widget-action-delete"
        v-if="selectWidget === column"
        shape="circle"
        size="small"
        type="danger"
        icon="delete"
      />
      <ta-button
        title="??????"
        @click.stop="handleWidgetClear(index)"
        class="widget-action-clear"
        v-if="selectWidget === column"
        shape="circle"
        size="small"
        type="warning"
        icon="reload"
      />
      <ta-button
        title="??????"
        @click.stop="handleWidgetClone(index)"
        class="widget-action-clone"
        v-if="selectWidget === column"
        shape="circle"
        size="small"
        type="primary"
        icon="copy"
      />
    </div>
  </div>
</template>

<script>
import draggable from 'vuedraggable'
import { clone as cloneDeep, } from '@yh/ta-utils'
import formItem from './formItem'

export default {
  name: 'formWidgetTable',
  components: { draggable, formItem, },
  props: {
    // ???????????????
    formColumns: {
      type: Array,
      required: true,
    },
    // ???????????????
    column: {
      type: Object,
      required: true,
    },

    index: {
      type: Number,
      required: true,
    },
    // ????????????????????????
    select: {
      type: Object,
      required: true,
    },
  },
  data () {
    return {
      selectWidget: this.select, // ????????????
    }
  },
  methods: {
    // ????????????table???column???list
    getTableColumns (item) {
      return [{
        title: item.label,
        dataIndex: item.fieldDecoratorId,
        scopedSlots: { customRender: item.fieldDecoratorId, },
        customHeaderCell: (column) => { // ???????????????
          return {
            class: item.required ? 'column-required' : '',
          }
        },
      }]
    },
    // ??????????????????table??????
    getTableColumnsData (item) {
      const record = {}
      record[item.fieldDecoratorId] = item.initialValue || ''
      return [record]
    },
    // ???????????????
    handleSelectWidget (index) {
      this.selectWidget = this.formColumns[index]
    },
    // ??????item
    handleWidgetAdd (evt, column) {
      // ??????index
      let newIndex = evt.newIndex
      const item = evt.item
      if (newIndex === 1 && newIndex > column.children.column.length - 1) newIndex = 0
      // ????????????item?????????????????????????????????????????????????????????notAllowInTable????????????true
      if (['?????????', '??????', '??????'].includes(item.textContent) || column.children.column[newIndex].notAllowInTable) {
        column.children.column.splice(newIndex, 1)
        return
      }
      const data = cloneDeep(column.children.column[newIndex])
      // ??????id
      if (!data.fieldDecoratorId) { data.fieldDecoratorId = Date.now() + '_' + Math.ceil(Math.random() * 99999) }
      // ??????parent
      data.parent = 'dynamic'
      delete data.icon
      this.$set(column.children.column, newIndex, { ...data, })
      // ????????????
      this.selectWidget = column.children.column[newIndex]
    },
    // ??????item
    handleWidgetDelete (index) {
      // ????????????
      if (this.formColumns.length - 1 === index) {
        if (index === 0) this.selectWidget = {}
        else {
          this.handleSelectWidget(index - 1)
        }
      } else {
        this.handleSelectWidget(index + 1)
      }
      // ??????item
      this.$nextTick(() => {
        this.formColumns.splice(index, 1)
      })
    },
    // ???????????????
    handleWidgetClear (index) {
      this.formColumns[index].children.column = []
      this.selectWidget = this.formColumns[index]
    },
    // copy?????????
    handleWidgetClone (index) {
      const cloneData = cloneDeep(this.formColumns[index])
      cloneData.fieldDecoratorId = Date.now() + '_' + Math.ceil(Math.random() * 99999)
      cloneData.children.column.forEach(item => {
        item.fieldDecoratorId = Date.now() + '_' + Math.ceil(Math.random() * 99999)
      })
      this.formColumns.splice(index, 0, cloneData)
      this.$nextTick(() => {
        this.handleSelectWidget(index + 1)
      })
    },
    // ?????????????????????item
    handleTableWidgetSelect (data) {
      this.selectWidget = data
    },
    // ???????????????item??????
    handleTableWidgetClone (column, item) {
      const data = cloneDeep(item)
      data.fieldDecoratorId = Date.now() + '_' + Math.ceil(Math.random() * 99999)
      this.$set(column.children.column, column.children.column.length, { ...data, })
      this.$nextTick(() => {
        this.selectWidget = column.children.column[column.children.column.length - 1]
      })
    },
    // ???????????????item??????
    handleTableWidgetDelete (column, index) {
      if (column.children.column.length - 1 === index) {
        if (index === 0) this.selectWidget = column
        else this.selectWidget = column.children.column[index - 1]
      } else this.selectWidget = column.children.column[index + 1]
      this.$nextTick(() => {
        column.children.column.splice(index, 1)
      })
    },
    // ??????form-item???????????????????????????????????????',???'??????"
    transformRules (column) {
      let rulesObj = null
      try {
        rulesObj = JSON.parse(column.rules.replace(/&#x27;/g, '\'').replace(/'/g, '"'))
        console.log(`${column.fieldDecoratorId}?????????????????????????????????????????????${JSON.stringify(rulesObj)}`)
      } catch (e) {
        console.warn(`??????${column.fieldDecoratorId}?????????rules??????`)
        rulesObj = null
      } finally {
        return rulesObj || []
      }
    },
  },
  watch: {
    select (val) {
      this.selectWidget = val
    },
    selectWidget: {
      handler (val) {
        this.$emit('update:select', val)
      },
      deep: true,
    },
  },
}
</script>
