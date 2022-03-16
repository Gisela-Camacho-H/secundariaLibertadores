module.exports = function(sequelize, dataTypes){
    const alias = "Curso";
    
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
        tableName: "Cursos",
        timestamps: false,
    }

    const  Curso = sequelize.define(alias, cols, config);

    Curso.associate = function (models){
        Curso.belongsToMany(models.Estudiante, {
            as: "Estudiantes",
            through: "Curso_Estudiante",
            foreignKey: "Curso_id",
            otherKey: "Estudiantes_id",
            timestamps: false
          });  
        
        Curso.belongsTo(models.Maestro,{
            as: "Maestro",
            foreignKey: "Maestros_id",
        })  
    }
    return Curso;
}
