const { Router } = require('express');
const router = Router();

const users = require('../users.json');
//console.log(users);

router.get('/', (req, res) => {
    res.json(users);
});

router.get('/:id', (req, res) => {
    let  { id } = req.params;

    res.json(users.filter((e) => e.id === parseInt(id)));
});

router.post('/', (req, res) => {
    console.log(req.body);
    const {name, age, location, rol, active} =  req.body;
    if (name && age && location && rol && active) {
        const id = users.length +1;
        const newUser = {id, ...req.body };

        users.push(newUser);
        res.json(users);
    } else {
        res.send('Wrong Request');
    }

    res.send('received');
});

router.delete('/:id', (req, res)=> {
    let  { id } = req.params;
    console.log(req.params);
    //users.filter((user) => user.id !== Number(id));
    users.forEach((element, i) => {
        if(element.id == id){
            users.splice(i, 1);
            console.log(element.id, id);
        }
    });
    res.json(users);
});

router.put('/:id', (req, res) => {
    const { id } = req.params;
    const {name, age, location, rol, active} =  req.body;
    console.log(req.body);
    if (name && age && location && rol && active !== undefined) {
        users.forEach((e, i) => {
            console.log(e);
            if (e.id == id) {
                e.name = name;
                e.age = age;
                e.location = location;
                e.rol = rol;
                e.active = active;
            }
        });
        res.json(users);
    } else {
        res.status(500).json({error: 'Se encontro un error'});
    }
});

module.exports = router;