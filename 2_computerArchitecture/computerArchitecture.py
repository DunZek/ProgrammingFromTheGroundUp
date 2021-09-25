# Simulating the von Neumann architecture (x86)
# 4-byte word-size, 4-byte numbers

# Memory
size = 1 * 8 * 128 * 128  # 1 b, 1 byte, 1 Kb, 1 Mb
memory = {}
## Generate memory
for n in range(size):
	memory[f'{n}'] = 0



# CPU

## Addressing modes
def immediateMode():
	return

def registerAddressingMode():
	return
# Fetch-execute cycle
