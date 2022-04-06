module.exports = function(sequelize, dataTypes){
    const alias = "Maestro";
    
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
        fecha_nacimiento:{
            type: dataTypes.DATE,
        },
        curp:{
            type: dataTypes.STRING(45), 
            unique: true,
        },
        email:{
            type: dataTypes.STRING(255),
            unique: true,
        }, 
        password: {
            type: dataTypes.STRING(100),
        }, 
        telefono: {
            type: dataTypes.INTEGER,
        }, 
        fecha_contratacion: {
            type: dataTypes.DATE,
        }
    };

    let config = {
        tableName: "Maestros",
        timestamp: false,
        createdAt: false,
        updatedAt: false,
    }

    const  Maestro = sequelize.define(alias, cols, config);

    Maestro.associate = function(models){

       Maestro.hasOne(models.Curso,{
           as: "Curso", 
           foreignKey: "Maestros_id"
       });

       Maestro.hasOne(models.Grupo,{
        as: "Grupo", 
        foreignKey: "Grupos_id"
    })
    }

    return Maestro;
}
