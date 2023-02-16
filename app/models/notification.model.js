module.exports = (sequelize, Sequelize) => {
    const Notification = sequelize.define("notifications", {
        date: {
            type: Sequelize.DATEONLY
        },
        description: {
            type: Sequelize.STRING
        },
        type:{
            type: Sequelize.STRING
        }
    });

    return Notification;
};