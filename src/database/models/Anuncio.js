module.exports = function(sequelize, dataTypes){
    const alias = "Anuncio";
    
    const cols = {
        id:{
            type: dataTypes.INTEGER,
            primaryKey: true, 
            autoIncrement: true, 
        }, 
        titulo:{
            type: dataTypes.STRING(45), 
        },
        descripcion:{
            type: dataTypes.STRING(450), 
        }, 
        archivo:{
            type: dataTypes.STRING(100), 
        }, 
    };

    let config = {
        tableName: "Anuncios",
        timestamps: false,
    }

    const  Anuncio = sequelize.define(alias, cols, config);

    Anuncio.associate = function(models){
        Anuncio.belongsTo(models.Administrador, {
            as: "por_administrador",
            foreignKey: "Administradores_id"
          });
         
    }
    return Anuncio;
}
