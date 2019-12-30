$(document).on('turbolinks:load', () => {
    var images = [];
    var btnbox_index = [1,2,3,4,5,6,7,8,9,10];
    $(function() {
        $('form').on('change', 'input[type="file"]', '#image', function(e) {
            var file = e.target.files[0],
                reader = new FileReader(),
                $preview = $(".preview");
                img =$('<img>');
                btnbox_index_first = $(btnbox_index[0]);
                btn_wrapper =$(
                    `<div class="btnbox-${btnbox_index[0]} btnbox-margin">
                        <div class ="btn-delete">削除</div>
                    </div>`
                );
            t = this;
            reader.onload = (function(file) {
                return function(e) {
                    image = btnbox_index[0];
                    $preview.append(btn_wrapper);
                    $(`.btnbox-${btnbox_index[0]}`).prepend($(img).attr({
                        src: e.target.result,
                        width: "110px",
                        height: "110px",
                    }));
                    btnbox_index.shift();
                };
            })(file);
            reader.readAsDataURL(file);
            images.push('<img>');
            var new_image = $(`<input multiple= "multiple" name="product_images[image][]"  type="file" id="image" image =${images.length} style = display:none>`);
            $(".image_box").prepend(new_image);
        });
        $('.preview').on('click','.btn-delete',function(){
            $(this)
              .parent()
              .remove()
        });
  
    });
  });
  