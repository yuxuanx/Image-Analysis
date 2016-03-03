import lasagne


def setup(input_var, box_size = 29,):

    # Setup network
    net = lasagne.layers.InputLayer(
            shape=(None, 1, box_size, box_size),
            input_var=input_var)

    # stage 1 : filter bank -> squashing -> max-pooling
    net = lasagne.layers.Conv2DLayer(
            net,
            num_filters=7,
            filter_size=(5, 5),
            nonlinearity = lasagne.nonlinearities.rectify)

    net = lasagne.layers.MaxPool2DLayer(net, pool_size=(2, 2))

    net = lasagne.layers.Conv2DLayer(
            net,
            num_filters=5,
            filter_size=(3, 3),
            nonlinearity = lasagne.nonlinearities.rectify)

    net = lasagne.layers.MaxPool2DLayer(net, pool_size=(2, 2))

    net = lasagne.layers.Conv2DLayer(
            net,
            num_filters=3,
            filter_size=(3, 3),
            nonlinearity = lasagne.nonlinearities.rectify)

    # last stage: stanard 2-layer fully connected neural network with 50% dropout
    net = lasagne.layers.DenseLayer(
            lasagne.layers.dropout(net, p=.5),
            num_units=3,
            nonlinearity=lasagne.nonlinearities.rectify)

    # Softmax output
    net = lasagne.layers.DenseLayer(
            lasagne.layers.dropout(net, p=.5),
            num_units=2,
            nonlinearity=lasagne.nonlinearities.softmax)

    return net
