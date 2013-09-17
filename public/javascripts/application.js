/**
 * Created with JetBrains RubyMine.
 * User: Khoa
 * Date: 9/15/13
 * Time: 4:49 PM
 * To change this template use File | Settings | File Templates.
 */
//= require jquery_ujs
$('.delete_transaction').bind('ajax:success', function() {
    $(this).closest('tr').fadeOut();
});