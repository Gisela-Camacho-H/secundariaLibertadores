module.exports = function(sequelize, dataTypes){
    const alias = "Grupo";
    
    const cols = {
        id:{
            type: dataTypes.INTEGER,
            primaryKey: true, 
            autoIncrement: true, 
        }, 
        nombre:{
            type: dataTypes.STRING(100), 
        },
    };

    let config = {
        tableName: "Grupos",
        timestamps: false,
    }

    const  Grupo = sequelize.define(alias, cols, config);

    Grupo.associate = function (models){
        Grupo.hasMany(models.Estudiante, {
            as: "Estudiantes",
            foreignKey: "Grupos_id",
          });
        Grupo.belongsTo(models.Maestro, {
            as: "Maestro",
            foreignKey: "Maestro_id"
        })  
    }
    return Grupo;
}

