modile.exports = function(sequelize, dataTypes){
    const alias = "Administrador";
    
    const cols = {
        id:{
            type: dataTypes.INTEGER,
            primaryKey: true, 
            autoIncrement: true, 
        }, 
        nombre:{
            type: dataTypes.STRING(45), 
        },
        apellidoPaterno:{
            type: dataTypes.STRING(45), 
        }, 
        apellidoMaterno:{
            type: dataTypes.STRING(45), 
        }, 
        email:{
            type: dataTypes.STRING(255),
            unique: true,
        }, 
        password: {
            type: dataTypes.STRING(45),
        }, 
    };

    let config = {
        tableName: "Administradores",
        timestamp: false,
    }

    const  Administrador = sequelize.define(alias, cols, config);

    Administrador.associate = function (models){
        Administrador.hasMany(models.Anuncio, {
            as: "anuncios_hechos",
            foreignKey: "Administradores_id"
          });
    }

    return Administrador;
}
