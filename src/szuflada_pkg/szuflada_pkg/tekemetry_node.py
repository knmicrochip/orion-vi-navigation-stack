import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class TelemetryNode(Node):
    def __init__(self):
        super().__init__('telemetry')
        
        # Subskrypcja tematu z mqtt_bridge
        self.subscription = self.create_subscription(
            String,
            'encoder_raw',
            self.encoder_callback,
            10)
            
        self.get_logger().info('Węzeł Telemetry został uruchomiony.')

    def encoder_callback(self, msg):
        try:
            # Format danych z ESP32: "enc1_total,enc2_total,enc1_delta,enc2_delta"
            data = msg.data.split(',')
            if len(data) == 4:
                enc_l_total = int(data[0])
                enc_r_total = int(data[1])
                dist_l_delta = int(data[2])
                dist_r_delta = int(data[3])

                self.get_logger().info(
                    f'\n--- TELEMETRIA ENKODERÓW ---\n'
                    f'Suma Lewy: {enc_l_total} | Suma Prawy: {enc_r_total}\n'
                    f'Delta Lewy: {dist_l_delta} | Delta Prawy: {dist_r_delta}\n'
                    f'---------------------------'
                )
        except Exception as e:
            self.get_logger().error(f'Błąd przetwarzania telemetrii: {e}')

def main(args=None):
    rclpy.init(args=args)
    node = TelemetryNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()