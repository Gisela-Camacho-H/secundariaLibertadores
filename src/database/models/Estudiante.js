module.exports = function(sequelize, dataTypes){
    const alias = "Estudiante";
    
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
        curp:{
            type: dataTypes.STRING(45), 
            unique: true,
        }, 
        fecha_nacimiento:{
            type: dataTypes.DATE,
        },
        genero:{
            type: dataTypes.STRING(10), 
        },
    };

    let config = {
        tableName: "Estudiantes",
        timestamp: false,
    }

    const  Estudiante = sequelize.define(alias, cols, config);

    Estudiante.associate = function(models){
        Estudiante.belongsTo(models.Grupo, {
            as: "Grupo",
            foreignKey: "Grupos_id"
          });
        
        Estudiante.belongsToMany(models.Curso, {
            as: "Cursos",
            through: "Curso_Estudiante",
            foreignKey: "Estudiantes_id",
            otherKey: "Cursos_id",
            timestamps: false
          });  
        
        Estudiante.belongsToMany(models.Tutor, {
            as: "Tutores",
            through: "Estudiante_Tutor",
            foreignKey: "Estudiantes_id",
            otherKey: "Tutores_id",
            timestamps: false
        });    
    }

    return Estudiante;
}
