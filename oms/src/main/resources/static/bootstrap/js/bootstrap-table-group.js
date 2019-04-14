/**
 *  ggc 2017-7-19
 *  bootstrap-table 按某列属性分组插件
 * 
 *  使用前提：
 *  1：必须为bootstraptable的表格
 *  2：必须事先按照指定列排序
 * */
;(function($){
    $.fn.extend({
        initBootstrapTableByGroup:function(params){
        	var groupBy = params.groupBy;
        	var showDetails = params.showDetails;
        	var rows = this.bootstrapTable("getData");	//获取表格数据
        	var detailContent = params.detailContent;
        	
			if(rows.length == 0){	//若表格数据为空则返回
				return;
			}
			var grounpNameArr = [];	//用于存组名
			var groupItemCountArr = [];	//用于存各组的成员数
			
			var nowGroupName = rows[0][groupBy];	//当前遍历组名
			var nowGrounpItemCount = 1;	//当前遍历组成员数
			
			grounpNameArr.push(nowGroupName);
			
			for(var i = 1; i < rows.length; i++){	//遍历表格数据生成组名数组和对应的成员数数组
				if(nowGroupName == rows[i][groupBy]){
					nowGrounpItemCount++;
				}else{
					groupItemCountArr.push(nowGrounpItemCount);
					grounpNameArr.push(rows[i][groupBy]);
					nowGrounpItemCount = 1;
					nowGroupName = rows[i][groupBy];
				}
			}
			groupItemCountArr.push(nowGrounpItemCount);
			//console.log(grounpNameArr);
			//console.log(groupItemCountArr);
			
			var tbody = $(this.find('tbody')[0]);
			
			var columnsCount = this.bootstrapTable('getVisibleColumns').length;	//获取表格总可见列数
			var tdsStr = '';
			for(var i = 0; i < columnsCount; i++){
				tdsStr += '<td style="height:1px!important; padding:0!important"></td>';
			}
			tbody.prepend('<tr>' + tdsStr + '</tr>');	//用于处理与bootstrap-table表头的冲突(不加则表头第一个单元格会跨整行)
			var nowIndex = 1;			//当前添加的tr再tbody中的序号，从1开始，因为上面有一个
			var details = showDetails ? (detailContent ? detailContent(groupItemCountArr[0]) : " (共" + groupItemCountArr[0] + "步流程处理)") : "";
			tbody.find('tr').eq(nowIndex).before("<tr class='group-tr'><td colspan='" + columnsCount + "'><span class='span-btn glyphicon glyphicon-minus'  group-item-count='" + groupItemCountArr[0] + "'></span>" + grounpNameArr[0] + details + "</td></tr>");
			for(var i = 0; i < groupItemCountArr.length - 1; i++){	//根据对应组成员数跨原行生成组头
				details = showDetails ? (detailContent ? detailContent(groupItemCountArr[i + 1]) : " (共" + groupItemCountArr[i + 1] + "步流程处理)") : "";
				nowIndex += groupItemCountArr[i];
				tbody.find('tr').eq(nowIndex + i + 1).before("<tr class='group-tr'><td colspan='" + columnsCount + "'><span class='span-btn glyphicon glyphicon-minus' group-item-count='" + groupItemCountArr[i + 1] + "'></span> " + grounpNameArr[i + 1] + details + "</td></tr>");
			}
			
			//重新绑定组头点击事件，防止重复注册事件
			this.off('click', '.span-btn');	
			this.on('click', '.span-btn', function(event){
				var target = $(event.target);
				target.parent().toggleClass('thin-blue');
				target.toggleClass('glyphicon-minus');
				target.toggleClass('glyphicon-plus');
				var grounpItemCount = parseInt(target.attr('group-item-count'));
				for(var i = 0; i < grounpItemCount; i++){
					target.parent().parent().nextAll().eq(i).toggle(200);
				}
				return false;
				
			})
			
        }              
    })
})(jQuery);
