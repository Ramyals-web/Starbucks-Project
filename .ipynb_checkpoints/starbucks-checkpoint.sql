{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "989d7419-a9b0-4583-8d14-3699e01656aa",
   "metadata": {},
   "outputs": [],
   "source": [
    "%matplotlib inline\n",
    "from matplotlib import style\n",
    "style.use('fivethirtyeight')\n",
    "import matplotlib.pyplot as plt"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "d8c15ba0-4dfe-4a84-a12f-cd6df08ad619",
   "metadata": {},
   "outputs": [],
   "source": [
    "import numpy as np\n",
    "import pandas as pd\n",
    "import datetime as dt"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b078af2d-b6ca-41b1-80ff-0fcb9b615db4",
   "metadata": {},
   "source": [
    "***Reflect Tables into SQLAlchemy ORM***"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "0feec8df-3099-42cb-a6b5-11bc5fa864f8",
   "metadata": {},
   "outputs": [],
   "source": [
    "# Python SQL toolkit and Object Relational Mapper\n",
    "import sqlalchemy\n",
    "from sqlalchemy.ext.automap import automap_base\n",
    "from sqlalchemy.orm import Session\n",
    "from sqlalchemy import create_engine, func\n",
    "# Path to sqlite\n",
    "database_path = \"starbucks_nutrition.sql\""
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "835dfa09-9f6d-4016-9cc8-6f1b5f797fac",
   "metadata": {},
   "outputs": [],
   "source": [
    "engine = create_engine(f\"sqlite:///{database_path}\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "8e564cb3-3e8a-4443-bcb1-b53968fdd8c9",
   "metadata": {},
   "outputs": [
    {
     "ename": "DatabaseError",
     "evalue": "(sqlite3.DatabaseError) file is not a database\n[SQL: SELECT name FROM sqlite_master WHERE type='table' ORDER BY name]\n(Background on this error at: https://sqlalche.me/e/14/4xp6)",
     "output_type": "error",
     "traceback": [
      "\u001b[1;31m---------------------------------------------------------------------------\u001b[0m",
      "\u001b[1;31mDatabaseError\u001b[0m                             Traceback (most recent call last)",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_execute_context\u001b[1;34m(self, dialect, constructor, statement, parameters, execution_options, *args, **kw)\u001b[0m\n\u001b[0;32m   1770\u001b[0m                 \u001b[1;32mif\u001b[0m \u001b[1;32mnot\u001b[0m \u001b[0mevt_handled\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m-> 1771\u001b[1;33m                     self.dialect.do_execute(\n\u001b[0m\u001b[0;32m   1772\u001b[0m                         \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\engine\\default.py\u001b[0m in \u001b[0;36mdo_execute\u001b[1;34m(self, cursor, statement, parameters, context)\u001b[0m\n\u001b[0;32m    716\u001b[0m     \u001b[1;32mdef\u001b[0m \u001b[0mdo_execute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mself\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m=\u001b[0m\u001b[1;32mNone\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 717\u001b[1;33m         \u001b[0mcursor\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mexecute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    718\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;31mDatabaseError\u001b[0m: file is not a database",
      "\nThe above exception was the direct cause of the following exception:\n",
      "\u001b[1;31mDatabaseError\u001b[0m                             Traceback (most recent call last)",
      "\u001b[1;32m<ipython-input-13-ffe33ddcfd65>\u001b[0m in \u001b[0;36m<module>\u001b[1;34m\u001b[0m\n\u001b[0;32m      3\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m      4\u001b[0m \u001b[1;31m# reflect the tablescd git\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m----> 5\u001b[1;33m \u001b[0mBase\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mprepare\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mengine\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mreflect\u001b[0m\u001b[1;33m=\u001b[0m\u001b[1;32mTrue\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m",
      "\u001b[1;32m<string>\u001b[0m in \u001b[0;36mprepare\u001b[1;34m(cls, autoload_with, engine, reflect, schema, classname_for_table, collection_class, name_for_scalar_relationship, name_for_collection_relationship, generate_relationship, reflection_options)\u001b[0m\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\util\\deprecations.py\u001b[0m in \u001b[0;36mwarned\u001b[1;34m(fn, *args, **kwargs)\u001b[0m\n\u001b[0;32m    296\u001b[0m                         \u001b[0mstacklevel\u001b[0m\u001b[1;33m=\u001b[0m\u001b[1;36m3\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    297\u001b[0m                     )\n\u001b[1;32m--> 298\u001b[1;33m             \u001b[1;32mreturn\u001b[0m \u001b[0mfn\u001b[0m\u001b[1;33m(\u001b[0m\u001b[1;33m*\u001b[0m\u001b[0margs\u001b[0m\u001b[1;33m,\u001b[0m \u001b[1;33m**\u001b[0m\u001b[0mkwargs\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    299\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    300\u001b[0m         \u001b[0mdoc\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mfn\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m__doc__\u001b[0m \u001b[1;32mis\u001b[0m \u001b[1;32mnot\u001b[0m \u001b[1;32mNone\u001b[0m \u001b[1;32mand\u001b[0m \u001b[0mfn\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m__doc__\u001b[0m \u001b[1;32mor\u001b[0m \u001b[1;34m\"\"\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\ext\\automap.py\u001b[0m in \u001b[0;36mprepare\u001b[1;34m(cls, autoload_with, engine, reflect, schema, classname_for_table, collection_class, name_for_scalar_relationship, name_for_collection_relationship, generate_relationship, reflection_options)\u001b[0m\n\u001b[0;32m    870\u001b[0m             \u001b[1;32mif\u001b[0m \u001b[0mreflection_options\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    871\u001b[0m                 \u001b[0mopts\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mupdate\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mreflection_options\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 872\u001b[1;33m             \u001b[0mcls\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mmetadata\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mreflect\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mautoload_with\u001b[0m\u001b[1;33m,\u001b[0m \u001b[1;33m**\u001b[0m\u001b[0mopts\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    873\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    874\u001b[0m         \u001b[1;32mwith\u001b[0m \u001b[0m_CONFIGURE_MUTEX\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\sql\\schema.py\u001b[0m in \u001b[0;36mreflect\u001b[1;34m(self, bind, schema, views, only, extend_existing, autoload_replace, resolve_fks, **dialect_kwargs)\u001b[0m\n\u001b[0;32m   4667\u001b[0m                 \u001b[0mreflect_opts\u001b[0m\u001b[1;33m[\u001b[0m\u001b[1;34m\"schema\"\u001b[0m\u001b[1;33m]\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mschema\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   4668\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m-> 4669\u001b[1;33m             \u001b[0mavailable\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mutil\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mOrderedSet\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0minsp\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mget_table_names\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mschema\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   4670\u001b[0m             \u001b[1;32mif\u001b[0m \u001b[0mviews\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   4671\u001b[0m                 \u001b[0mavailable\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mupdate\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0minsp\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mget_view_names\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mschema\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\engine\\reflection.py\u001b[0m in \u001b[0;36mget_table_names\u001b[1;34m(self, schema)\u001b[0m\n\u001b[0;32m    264\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    265\u001b[0m         \u001b[1;32mwith\u001b[0m \u001b[0mself\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m_operation_context\u001b[0m\u001b[1;33m(\u001b[0m\u001b[1;33m)\u001b[0m \u001b[1;32mas\u001b[0m \u001b[0mconn\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 266\u001b[1;33m             return self.dialect.get_table_names(\n\u001b[0m\u001b[0;32m    267\u001b[0m                 \u001b[0mconn\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mschema\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0minfo_cache\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0mself\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0minfo_cache\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    268\u001b[0m             )\n",
      "\u001b[1;32m<string>\u001b[0m in \u001b[0;36mget_table_names\u001b[1;34m(self, connection, schema, **kw)\u001b[0m\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\engine\\reflection.py\u001b[0m in \u001b[0;36mcache\u001b[1;34m(fn, self, con, *args, **kw)\u001b[0m\n\u001b[0;32m     53\u001b[0m     \u001b[0mret\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0minfo_cache\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mget\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mkey\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m     54\u001b[0m     \u001b[1;32mif\u001b[0m \u001b[0mret\u001b[0m \u001b[1;32mis\u001b[0m \u001b[1;32mNone\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m---> 55\u001b[1;33m         \u001b[0mret\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mfn\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mself\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcon\u001b[0m\u001b[1;33m,\u001b[0m \u001b[1;33m*\u001b[0m\u001b[0margs\u001b[0m\u001b[1;33m,\u001b[0m \u001b[1;33m**\u001b[0m\u001b[0mkw\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m     56\u001b[0m         \u001b[0minfo_cache\u001b[0m\u001b[1;33m[\u001b[0m\u001b[0mkey\u001b[0m\u001b[1;33m]\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mret\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m     57\u001b[0m     \u001b[1;32mreturn\u001b[0m \u001b[0mret\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\dialects\\sqlite\\base.py\u001b[0m in \u001b[0;36mget_table_names\u001b[1;34m(self, connection, schema, **kw)\u001b[0m\n\u001b[0;32m   1983\u001b[0m             \u001b[0mmaster\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1984\u001b[0m         )\n\u001b[1;32m-> 1985\u001b[1;33m         \u001b[0mrs\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mconnection\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mexec_driver_sql\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0ms\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m   1986\u001b[0m         \u001b[1;32mreturn\u001b[0m \u001b[1;33m[\u001b[0m\u001b[0mrow\u001b[0m\u001b[1;33m[\u001b[0m\u001b[1;36m0\u001b[0m\u001b[1;33m]\u001b[0m \u001b[1;32mfor\u001b[0m \u001b[0mrow\u001b[0m \u001b[1;32min\u001b[0m \u001b[0mrs\u001b[0m\u001b[1;33m]\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1987\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36mexec_driver_sql\u001b[1;34m(self, statement, parameters, execution_options)\u001b[0m\n\u001b[0;32m   1636\u001b[0m         \u001b[0margs_10style\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mkwargs_10style\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0m_distill_params_20\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mparameters\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1637\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m-> 1638\u001b[1;33m         return self._exec_driver_sql(\n\u001b[0m\u001b[0;32m   1639\u001b[0m             \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1640\u001b[0m             \u001b[0margs_10style\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_exec_driver_sql\u001b[1;34m(self, statement, multiparams, params, execution_options, future)\u001b[0m\n\u001b[0;32m   1545\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1546\u001b[0m         \u001b[0mdialect\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mself\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mdialect\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m-> 1547\u001b[1;33m         ret = self._execute_context(\n\u001b[0m\u001b[0;32m   1548\u001b[0m             \u001b[0mdialect\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1549\u001b[0m             \u001b[0mdialect\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mexecution_ctx_cls\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m_init_statement\u001b[0m\u001b[1;33m,\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_execute_context\u001b[1;34m(self, dialect, constructor, statement, parameters, execution_options, *args, **kw)\u001b[0m\n\u001b[0;32m   1812\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1813\u001b[0m         \u001b[1;32mexcept\u001b[0m \u001b[0mBaseException\u001b[0m \u001b[1;32mas\u001b[0m \u001b[0me\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m-> 1814\u001b[1;33m             self._handle_dbapi_exception(\n\u001b[0m\u001b[0;32m   1815\u001b[0m                 \u001b[0me\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1816\u001b[0m             )\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_handle_dbapi_exception\u001b[1;34m(self, e, statement, parameters, cursor, context)\u001b[0m\n\u001b[0;32m   1993\u001b[0m                 \u001b[0mutil\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mraise_\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mnewraise\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mwith_traceback\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0mexc_info\u001b[0m\u001b[1;33m[\u001b[0m\u001b[1;36m2\u001b[0m\u001b[1;33m]\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mfrom_\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0me\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1994\u001b[0m             \u001b[1;32melif\u001b[0m \u001b[0mshould_wrap\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m-> 1995\u001b[1;33m                 util.raise_(\n\u001b[0m\u001b[0;32m   1996\u001b[0m                     \u001b[0msqlalchemy_exception\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mwith_traceback\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0mexc_info\u001b[0m\u001b[1;33m[\u001b[0m\u001b[1;36m2\u001b[0m\u001b[1;33m]\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mfrom_\u001b[0m\u001b[1;33m=\u001b[0m\u001b[0me\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1997\u001b[0m                 )\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\util\\compat.py\u001b[0m in \u001b[0;36mraise_\u001b[1;34m(***failed resolving arguments***)\u001b[0m\n\u001b[0;32m    205\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    206\u001b[0m         \u001b[1;32mtry\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 207\u001b[1;33m             \u001b[1;32mraise\u001b[0m \u001b[0mexception\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    208\u001b[0m         \u001b[1;32mfinally\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    209\u001b[0m             \u001b[1;31m# credit to\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\engine\\base.py\u001b[0m in \u001b[0;36m_execute_context\u001b[1;34m(self, dialect, constructor, statement, parameters, execution_options, *args, **kw)\u001b[0m\n\u001b[0;32m   1769\u001b[0m                             \u001b[1;32mbreak\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1770\u001b[0m                 \u001b[1;32mif\u001b[0m \u001b[1;32mnot\u001b[0m \u001b[0mevt_handled\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m-> 1771\u001b[1;33m                     self.dialect.do_execute(\n\u001b[0m\u001b[0;32m   1772\u001b[0m                         \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m   1773\u001b[0m                     )\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\engine\\default.py\u001b[0m in \u001b[0;36mdo_execute\u001b[1;34m(self, cursor, statement, parameters, context)\u001b[0m\n\u001b[0;32m    715\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    716\u001b[0m     \u001b[1;32mdef\u001b[0m \u001b[0mdo_execute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mself\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m=\u001b[0m\u001b[1;32mNone\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 717\u001b[1;33m         \u001b[0mcursor\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mexecute\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mparameters\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    718\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    719\u001b[0m     \u001b[1;32mdef\u001b[0m \u001b[0mdo_execute_no_params\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mself\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcursor\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mstatement\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mcontext\u001b[0m\u001b[1;33m=\u001b[0m\u001b[1;32mNone\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;31mDatabaseError\u001b[0m: (sqlite3.DatabaseError) file is not a database\n[SQL: SELECT name FROM sqlite_master WHERE type='table' ORDER BY name]\n(Background on this error at: https://sqlalche.me/e/14/4xp6)"
     ]
    }
   ],
   "source": [
    "# reflect an existing database into a new model\n",
    "Base = automap_base()\n",
    "\n",
    "# reflect the tablescd git \n",
    "Base.prepare(engine, reflect=True)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "c8fd6f0b-3f52-452e-b3a0-774ee286b404",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "[]"
      ]
     },
     "execution_count": 9,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "# We can view all of the classes that automap found\n",
    "Base.classes.keys()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "e1bf3b88-5b1d-4024-a921-1daf6542dd7e",
   "metadata": {},
   "outputs": [
    {
     "ename": "AttributeError",
     "evalue": "measurement",
     "output_type": "error",
     "traceback": [
      "\u001b[1;31m---------------------------------------------------------------------------\u001b[0m",
      "\u001b[1;31mKeyError\u001b[0m                                  Traceback (most recent call last)",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\util\\_collections.py\u001b[0m in \u001b[0;36m__getattr__\u001b[1;34m(self, key)\u001b[0m\n\u001b[0;32m    185\u001b[0m         \u001b[1;32mtry\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 186\u001b[1;33m             \u001b[1;32mreturn\u001b[0m \u001b[0mself\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m_data\u001b[0m\u001b[1;33m[\u001b[0m\u001b[0mkey\u001b[0m\u001b[1;33m]\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    187\u001b[0m         \u001b[1;32mexcept\u001b[0m \u001b[0mKeyError\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;31mKeyError\u001b[0m: 'measurement'",
      "\nDuring handling of the above exception, another exception occurred:\n",
      "\u001b[1;31mAttributeError\u001b[0m                            Traceback (most recent call last)",
      "\u001b[1;32m<ipython-input-10-a85ad09ce628>\u001b[0m in \u001b[0;36m<module>\u001b[1;34m\u001b[0m\n\u001b[0;32m      1\u001b[0m \u001b[1;31m# Save references to each table\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m----> 2\u001b[1;33m \u001b[0mMeasurement\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mBase\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mclasses\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mmeasurement\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m      3\u001b[0m \u001b[0mStation\u001b[0m \u001b[1;33m=\u001b[0m \u001b[0mBase\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mclasses\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0mstation\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;32mc:\\users\\aconnolly\\appdata\\local\\programs\\python\\python39\\lib\\site-packages\\sqlalchemy\\util\\_collections.py\u001b[0m in \u001b[0;36m__getattr__\u001b[1;34m(self, key)\u001b[0m\n\u001b[0;32m    186\u001b[0m             \u001b[1;32mreturn\u001b[0m \u001b[0mself\u001b[0m\u001b[1;33m.\u001b[0m\u001b[0m_data\u001b[0m\u001b[1;33m[\u001b[0m\u001b[0mkey\u001b[0m\u001b[1;33m]\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    187\u001b[0m         \u001b[1;32mexcept\u001b[0m \u001b[0mKeyError\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[1;32m--> 188\u001b[1;33m             \u001b[1;32mraise\u001b[0m \u001b[0mAttributeError\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mkey\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0m\u001b[0;32m    189\u001b[0m \u001b[1;33m\u001b[0m\u001b[0m\n\u001b[0;32m    190\u001b[0m     \u001b[1;32mdef\u001b[0m \u001b[0m__contains__\u001b[0m\u001b[1;33m(\u001b[0m\u001b[0mself\u001b[0m\u001b[1;33m,\u001b[0m \u001b[0mkey\u001b[0m\u001b[1;33m)\u001b[0m\u001b[1;33m:\u001b[0m\u001b[1;33m\u001b[0m\u001b[1;33m\u001b[0m\u001b[0m\n",
      "\u001b[1;31mAttributeError\u001b[0m: measurement"
     ]
    }
   ],
   "source": [
    "# Save references to each table\n",
    "Measurement = Base.classes.measurement\n",
    "Station = Base.classes.station"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "ee4492d8-b185-4c43-b06b-8ca1c943aa30",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.9.5"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
