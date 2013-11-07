Template.body.helpers({
    greeting: function () {
        return "ahya";
    }
});
;Template.footer.helpers({
    copyright: function () {
        return "funnythingz";
    }
});
;Template.header.helpers({
    title: function () {
        return "title";
    },
    description: function () {
        return "description";
    }
});

Template.header.events({
    'click input': function () {
        if (typeof console !== 'undefined') {
            console.log("You pressed the button");
        }
    }
});
