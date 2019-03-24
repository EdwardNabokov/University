from internal.configurable import Configurable
from internal.collision import Collision
from internal.wave import Wave
from internal.pathfinding import Pathfinding
from pygame.sprite import OrderedUpdates


class Level:
    def __init__(self, game, name):
        self.game = game
        self.name = name
        self.load_data()
        self.start()

    def load_data(self):
        try:
            print("levels/" + self.name + ".level")
            with open("levels/" + self.name + ".level", "r") as file:
                self.data = [line.strip().split(" ") for line in file.readlines() if len(line.strip()) > 0 and line[0] != "#"]

        except IOError:
            print("Error loading level")

    def start(self):
        self.collision = Collision(self, self.game.window.resolution, 32)
        self.prefabs = OrderedUpdates()
        self.pathfinding = Pathfinding(self.game, self.collision)

        for args in self.data:
            name = args[0]
            x = int(args[1])
            y = int(args[2])

            prefab = Configurable(name, x, y)
            self.prefabs.add(prefab)

            if hasattr(prefab, "block"):
                # Block textures are 1 pixel wider to make a full border
                self.collision.block_rect(x, y, prefab.rect.width - 1, prefab.rect.height - 1)

        self.pathfinding.precompute(30)
        self.wave = Wave(self.game, 1)
        self.lives = 20
        self.money = 600
        self.time = 0

    def get_sinternal(self):
        return int((self.time / 5) ** 1.4 + (self.game.wave.number - 1) ** 3)
