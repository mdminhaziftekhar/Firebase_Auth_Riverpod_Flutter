migrate((db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("zudr8mfyo0o48vj");

  return dao.deleteCollection(collection);
}, (db) => {
  const collection = new Collection({
    "id": "zudr8mfyo0o48vj",
    "created": "2022-12-14 04:24:03.509Z",
    "updated": "2022-12-14 04:26:30.041Z",
    "name": "category",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "3fbazhpc",
        "name": "title",
        "type": "text",
        "required": true,
        "unique": true,
        "options": {
          "min": 2,
          "max": 30,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "ctwzf1j5",
        "name": "image",
        "type": "file",
        "required": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "maxSize": 5242880,
          "mimeTypes": [],
          "thumbs": []
        }
      }
    ],
    "listRule": "",
    "viewRule": "",
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {}
  });

  return Dao(db).saveCollection(collection);
})
