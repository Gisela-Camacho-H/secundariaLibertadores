module.exports = function(sequelize, dataTypes){
    const alias = "Tutor";
    
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
        direccion:{
            type: dataTypes.STRING(100), 
        },
        email:{
            type: dataTypes.STRING(255),
            unique: true,
        }, 
        password: {
            type: dataTypes.STRING(45),
        }, 
        telefono: {
            type: dataTypes.INTEGER,
        }, 
        Tipo: {
            type: dataTypes.STRING(45),
        }
    };

    let config = {
        tableName: "Tutores",
        timestamp: false,
    }

    const  Tutor = sequelize.define(alias, cols, config);

    Tutor.associate = function (models){
        Tutor.belongsToMany(models.Estudiante, {
            as: "Estudiantes",
            through: "Estudiante_Tutor",
            foreignKey: "Tutores_id",
            otherKey: "Estudiantes_id",
            timestamps: false
          });
    }

    return Tutor;
}
