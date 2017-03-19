//# include <mpi.h>
# include <iostream>
# include <ctime>
# include <cstdlib>
# include <ctime>

const int N = 100;

using std::cout;
using std::endl;

void timestamp();

int main(int argc, char *argv[]) {
    int arr[N];

    int master = 0;
    int curr_task_id;
    int numprocs;
    int sum;
    int sum_all;

    timestamp();

//  MPI_Status status;
//  MPI_Init(&argc,
//             &argv);
    // Initialize MPI
//  MPI_Comm_size(MPI_COMM_WORLD,
//                  &numprocs);
    // Count processes in communicator
//  MPI_Comm_rank(MPI_COMM_WORLD,
  //                &curr_task_id);
    // Determine the rank of this process

    if (curr_task_id == master) {
        cout << "AVAILABLE PROCESSES: " << numprocs << endl;
    }

    if (curr_task_id == master) {
        for (int i = 0; i < N; ++i)
            arr[i] = i + 1;
    }

   // MPI_Bcast(arr, N, MPI_DOUBLE, master,
    //          MPI_COMM_WORLD);
    // Send tasks

    sum = 0;
    for (int i = 0; i < N; i++) {
        sum += arr[i];
    }

    cout << " - TASK " << curr_task_id << " counted sum: " << sum << endl;

    if (curr_task_id != master) {
       // MPI_Send(&sum, 1, MPI_DOUBLE, master, 1, MPI_COMM_WORLD);
    } else {
        sum_all = sum;
        for (int i = 1; i < numprocs; i++) {
          //  MPI_Recv(&sum, 1, MPI_DOUBLE, MPI_ANY_SOURCE, 1, MPI_COMM_WORLD,
            //         &status);
            sum_all = sum_all + sum;
        }
    }

    if (curr_task_id == master) {
        cout << "MASTER TASK " << curr_task_id << " counted sum: " << sum_all;
        cout << endl;

	timestamp();

    }

    //MPI_Finalize();
    // Terminate MPI
    return 0;
}

void timestamp() {
    static char time_buffer[40];
    const struct tm *tm;
    time_t now;

    now = time (NULL);
    tm = localtime(&now);

    strftime(time_buffer, 40, "%d %B %Y %I:%M:%S %p", tm);

    cout << time_buffer << endl;

    return;
}