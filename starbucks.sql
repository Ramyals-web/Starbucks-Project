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
   "execution_count": 14,
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
   "execution_count": 15,
   "id": "835dfa09-9f6d-4016-9cc8-6f1b5f797fac",
   "metadata": {},
   "outputs": [],
   "source": [
    "engine = create_engine(f\"sqlite:///{database_path}\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "8e564cb3-3e8a-4443-bcb1-b53968fdd8c9",
   "metadata": {},
   "outputs": [],
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
   "execution_count": 17,
   "id": "c8fd6f0b-3f52-452e-b3a0-774ee286b404",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "[]"
      ]
     },
     "execution_count": 17,
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
