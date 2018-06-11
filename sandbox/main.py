import numpy as np

import biorbd

# Load
m = biorbd.s2mMusculoSkeletalModel("pyomecaman.s2mMod")

# Dynamically get the number of markers
nb_markers = m.nTags()
print("Number of markers is " + str(nb_markers))

# Dynamically get the number of generalized coordinates
nb_q = m.nbQ()
print("Number of Q is " + str(nb_q))

# Generate some fake data for nb_frames
nb_frames = 100
q_simulated = np.ndarray((nb_q, nb_frames))
q_simulated[:, :] = 0  # Put everything to zero
q_simulated[0, :] = np.linspace(0, -1, nb_frames)  # Give it some motion
q_simulated[6, :] = np.linspace(0, 3.1416, nb_frames)  # And again

# Get the markers from these fake generalized coordinates

for i in range(nb_frames):
    print(m.Tags(m, q_simulated[:,i]))



## Reconstruct the kinematics from simulated marker
#q_init = q_simulated[:, :, 0]  # Use first position as the initial guess
#q_recons, qdot_recons, qddot_recons = biorbd.kalman_kinematics_reconstruction(m, T_simulated)








