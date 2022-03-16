modile.exports = function(sequelize, dataTypes){
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
        
        Anuncio.belongsToMany(models.Archivo, {
            as: "Anuncios",
            through: "Anuncio_Archivo",
            foreignKey: "Anuncios_id",
            otherKey: "Archivos_id",
            timestamps: false
          });  
    }
    return Anuncio;
}
