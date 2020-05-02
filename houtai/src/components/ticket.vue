<template>
  <div class="ticket">
    <el-table :data="ticketData">
      <el-table-column prop="Id" label="Id" width="60"></el-table-column>
      <el-table-column prop="Title" label="Title"></el-table-column>
      <el-table-column prop="Price" label="价格"></el-table-column>
      <el-table-column prop="Stock" label="库存"></el-table-column>
      <el-table-column prop="ShopName" label="ShopName"></el-table-column>
      <el-table-column prop="ShopAddress" label="ShopAddress"></el-table-column>
      <el-table-column prop="ShopPhone" label="ShopPhone"></el-table-column>
      <el-table-column prop="Lat" label="经度"></el-table-column>
      <el-table-column prop="Long" label="纬度"></el-table-column>
      <el-table-column label="内容">
        <template slot-scope="scope">
          <div v-html="scope.row.Content"></div>
        </template>
      </el-table-column>
      <el-table-column label="图片">
        <template slot-scope="scope">
          <el-image
            :src="scope.row.Src"
            style="width:80px;height:80px"
          ></el-image>
        </template>
      </el-table-column>
      <el-table-column prop="CategoryId" label="CategoryId"></el-table-column>
      <el-table-column prop="Enable" label="Enable"></el-table-column>
      <el-table-column prop="SortNum" label="SortNum"></el-table-column>
      <el-table-column label="操作" width="200">
        <template slot-scope="scope">
          <el-button
            type="info"
            size="small"
            @click="
              ticketDialog = true;
              editState = true;
              edit(scope.row);
            "
            >编辑</el-button
          >
          <el-button type="danger" size="small" @click="delticket(scope.row.Id)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <el-footer>
      <el-button
        type="primary"
        size="small"
        @click="
          ticketDialog = true;
          editState = false;
        "
        >添加</el-button
      >
    </el-footer>
    <el-dialog
      :title="editState ? '编辑分类' : '添加分类'"
      :visible.sync="ticketDialog"
      width="30%"
      top="20vh"
    >
      <el-form label-width="80px">
        <el-form-item label="Id" v-if="editState">
          <el-input v-model="ticket.id" disabled></el-input>
        </el-form-item>
        <el-form-item label="标题">
          <el-input v-model="ticket.title" clearable></el-input>
        </el-form-item>
        <el-form-item label="价格">
          <el-input v-model="ticket.price" clearable></el-input>
        </el-form-item>
        <el-form-item label="库存">
          <el-input v-model="ticket.stock" clearable></el-input>
        </el-form-item>
        <el-form-item label="商铺名">
          <el-input v-model="ticket.shopname" clearable></el-input>
        </el-form-item>
        <el-form-item label="商铺地址">
          <el-input v-model="ticket.shopaddress" clearable></el-input>
        </el-form-item>
        <el-form-item label="商铺电话">
          <el-input v-model="ticket.shopphone" clearable></el-input>
        </el-form-item>
        <el-form-item label="经度">
          <el-input v-model="ticket.lat" clearable></el-input>
        </el-form-item>
        <el-form-item label="纬度">
          <el-input v-model="ticket.long" clearable></el-input>
        </el-form-item>
        <el-form-item label="介绍">
          <el-input v-model="ticket.content" clearable></el-input>
        </el-form-item>
        <el-form-item label="分类id">
          <el-input v-model="ticket.categoryid" clearable></el-input>
        </el-form-item>
        <el-form-item label="启用">
          <el-checkbox v-model="ticket.enable"></el-checkbox>
        </el-form-item>
        <el-form-item label="排序号">
          <el-input v-model="ticket.sortnum" clearable></el-input>
        </el-form-item>
        <el-form-item label="图片">
          <el-upload
            action=""
            :auto-upload="false"
            :limit="1"
            ref="upload"
            :http-request="operateticket"
            multiple
          >
            <el-button type="primary" size="small">选择文件</el-button>
          </el-upload>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="operateticket()">确 定</el-button>
        <el-button @click="ticketDialog = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      ticketData: null,
      ticketDialog: false,
      editState: false,
      ticket: {
        id: 0,
        title: "",
        price: null,
        stock: null,
        shopname: "",
        shopaddress: "",
        shopphone: "",
        lat: 0,
        long: 0,
        content: "",
        categoryid: "",
        enable: true,
        sortnum: 100
      }
    };
  },
  methods: {
    getticket() {
      this.axios.get("/api/ticket/get").then(res => {
        console.log(res);
        this.ticketData = res.data.rows[0].children;
        this.ticket = {
          id: 0,
          title: "",
          price: null,
          stock: null,
          shopname: "",
          shopaddress: "",
          shopphone: "",
          lat: 0,
          long: 0,
          content: "",
          categoryid: "",
          enable: true,
          sortnum: 100
        };
      });
    },
    edit(row) {
      this.ticket.id = row.Id;
      this.ticket.title = row.Title;
      this.ticket.price = row.Price;
      this.ticket.stock = row.Stock;
      this.ticket.shopname = row.ShopName;
      this.ticket.shopaddress = row.ShopAddress;
      this.ticket.shopphone = row.ShopPhone;
      this.ticket.lat = row.Lat;
      this.ticket.long = row.Long;
      this.ticket.content = row.Content;
      console.log(row.Categoryid);
      this.ticket.categoryid = row.CategoryId;
      this.ticket.sortnum = row.SortNum;
      this.ticket.enable = row.Enable === 1;
    },
    operateticket() {
      const formData = new FormData();
      const file = this.$refs.upload.uploadFiles[0];
      const headerConfig = {
        headers: { "Content-Type": "multipart/form-data" }
      };
      formData.append("title", this.ticket.title);
      formData.append("price", this.ticket.price);
      formData.append("stock", this.ticket.stock);
      formData.append("shopname", this.ticket.shopname);
      formData.append("shopaddress", this.ticket.shopaddress);
      formData.append("shopphone", this.ticket.shopphone);
      formData.append("lat", this.ticket.lat);
      formData.append("long", this.ticket.long);
      formData.append("content", this.ticket.content);
      formData.append("categoryid", this.ticket.categoryid);
      formData.append("sortnum", this.ticket.sortnum);
      formData.append("enable", this.ticket.enable ? 1 : 0);
      if (file) {
        formData.append("file", file.raw);
      }
      if (this.editState) {
        formData.append("id", this.ticket.id);
        this.axios
          .post("/api/ticket/edit", formData, headerConfig)
          .then(res => {
            console.log(res);
            if (res.data.success) this.getticket();
          });
      } else {
        this.axios.post("/api/ticket/add", formData, headerConfig).then(res => {
          console.log(res);
          if (res.data.success) this.getticket();
        });
      }
      this.editState = false;
      this.ticketDialog = false;
    },
    delticket(id) {
      this.axios.post("/api/ticket/delete", { id: id }).then(res => {
        if (res.data.success) this.getticket();
      });
    }
  },
  created() {
    this.getticket();
  }
};
</script>

<style scoped lang="stylus">
.el-footer{
  text-align right
  line-height 60px
}
</style>
