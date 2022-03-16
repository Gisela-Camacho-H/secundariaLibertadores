modile.exports = function(sequelize, dataTypes){
    const alias = "Archivo";
    
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
        tableName: "Archivos",
        timestamps: false,
    }

    const  Archivo = sequelize.define(alias, cols, config);

    Archivo.associate = function (models){
        Archivo.belongsToMany(models.Anuncio, {
            as: "Anuncios",
            through: "Anuncio_Archivo",
            foreignKey: "Archivo_id",
            otherKey: "Anuncios_id",
            timestamps: false
          });
    }
    return Archivo;
}
