/**
 * @file js/controllers/CategoriesFilterHandler.js
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class CategoriesFilterHandler
 * @ingroup js_controllers
 *
 * @brief A handler for the categories filter for submissions
 */
(function($) {


	/**
	 * @constructor
	 *
	 * @extends $.pkp.classes.Handler
	 *
	 * @param {jQueryObject} $widgetWrapper An HTML element that contains the
	 *   widget.
	 * @param {Object} options Handler options.
	 */
	$.pkp.controllers.CategoriesFilterHandler = function($widgetWrapper, options) {
		this.parent($widgetWrapper, options);
		var self = this;

		$('input:checkbox', $widgetWrapper).on('click',
				self.callbackWrapper(self.assignCategory));

		$('#search', $widgetWrapper).on('keyup',
				self.callbackWrapper(self.searchCategories));
	};
	$.pkp.classes.Helper.inherits(
			$.pkp.controllers.CategoriesFilterHandler, $.pkp.classes.Handler);


	//
	// Public methods
	//

	/**
	 * Assign/Unassign the category item and move it to correct element
	 *
	 * @param {HTMLElement} sourceElement The element that
	 *  issued the event.
	 * @param {Event} event The triggering event.
	 */
	$.pkp.controllers.CategoriesFilterHandler.prototype.assignCategory =
			function(sourceElement, event) {
		if ($(sourceElement).is(':checked')) {
			$(sourceElement).parents('li').appendTo('.assigned_categories');
		} else {
			$(sourceElement).parents('li').appendTo('.unassigned_categories');
		}
	};

	/**
	 * Search categories by text
	 *
	 * @param {HTMLElement} sourceElement The element that
	 *  issued the event.
	 * @param {Event} event The triggering event.
	 */
	$.pkp.controllers.CategoriesFilterHandler.prototype.searchCategories =
			function(sourceElement, event) {
		var self = this,
				filter = self.formatText($(sourceElement).val());
		$('.categories_list li').filter(function() {
			var category = self.formatText($('label', this).text());
			$(this).toggle(category.indexOf(filter) > -1);
		});
	};

	/**
	 * Search categories by text
	 *
	 * @param {string} text The text that will be formatted
	 * for the categories search
	 * @return {string} The text formatted without accents and in uppercase.
	 */
	$.pkp.controllers.CategoriesFilterHandler.prototype.formatText =
			function(text) {
		return text.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toUpperCase();
	};

}(jQuery));
