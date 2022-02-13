const { Router } = require('express');
const router = Router();

router.get('/test', (req, res) => {
    const data = {
        "name": "Luke"
    }
    res.json(data);
});

router.get('/user', (req, res) => {
    //muestra todos los usuarios disponibles
    const data = {
        "name": "Luke"
    }
    res.json(data);
});

module.exports = router;