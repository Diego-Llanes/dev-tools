Vim�UnDo� �0ӸNJ��+=Q[�>쿑��M��6Y�l��j   L                                   c���    _�          	          .        ����                                                                                                                                                                                                                                                                                                                            )           ,           v        c���     �   -   .          !>>>>>>> refs/remotes/origin/Diego5�_�                    -        ����                                                                                                                                                                                                                                                                                                                            -           5           v        c���     �   ,   .   \   	       model = DNN(           in_size=input_dim,           out_size=output_dim,   (        hidden_layers=cfg.hidden_layers,   %        hidden_size=cfg.hidden_units,   H        hidden_activation_fn=Activation[cfg.hidden_activation_fn].value,   S        output_activation_function=Activation[cfg.output_activation_function].value       )       5�_�                    ,        ����                                                                                                                                                                                                                                                                                                                            -           -           v        c���     �   +   ,           5�_�                    ,       ����                                                                                                                                                                                                                                                                                                                            ,           ,           v        c���     �   +   ,             5�_�                    (       ����                                                                                                                                                                                                                                                                                                                            ,           ,           v        c���     �   '   (              model = LinearLayer(5�_�                    (        ����                                                                                                                                                                                                                                                                                                                            +           +           v        c���     �   '   (          =======5�_�                            ����                                                                                                                                                                                                                                                                                                                            *           *           v        c���     �                <<<<<<< HEAD5�_�                    (        ����                                                                                                                                                                                                                                                                                                                            )           )           v        c���    �   '   (              # Initialize Model5�_�                    2        ����                                                                                                                                                                                                                                                                                                                            2           8                   c���    �   2   9   N      &        train_loader=train_dataloader,           model=model,   1        optimizer=Optimizer[cfg.optimizer].value,   (        loss_fn=Loss[cfg.loss_fn].value,           learnrate= cfg.lr       )�   1   3   N          runner = RunnerClass(5�_�                   '        ����                                                                                                                                                                                                                                                                                                                            2           8                   c���    �   &   '              5�_�                     /       ����                                                                                                                                                                                                                                                                                                                            1           7                   c���    �   .   /              # Initialize Runner5�_�                    (        ����                                                                                                                                                                                                                                                                                                                            1           7                   c���     �   '   )        5�_�       
         	   (        ����                                                                                                                                                                                                                                                                                                                            (           +           v        c��P     �   '   )        5�_�   	               
   (        ����                                                                                                                                                                                                                                                                                                                            4           ,           v        c��Q     �   '   )        5�_�             	              ����                                                                                                                                                                                                                                                                                                                            (           5           v        c��+     �              5�_�                    (        ����                                                                                                                                                                                                                                                                                                                            (           (           v        c��2    �   '   6   \         5�_�                     (        ����                                                                                                                                                                                                                                                                                                                            (           (           v        c��4    �   '   )        5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c��     �              5�_�                    (        ����                                                                                                                                                                                                                                                                                                                            (           (           v        c��     �   '   -   \          model = DNN(5�_�                    )        ����                                                                                                                                                                                                                                                                                                                            (           (           v        c��     �   (   *        5�_�                    0       ����                                                                                                                                                                                                                                                                                                                            (           (           v        c��     �   /   1        5�_�                     0       ����                                                                                                                                                                                                                                                                                                                            (           (           v        c��      �   /   1   V          model = LinearLayer(5��