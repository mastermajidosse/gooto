part of 'add_cubit.dart';

abstract class AddState extends Equatable {
  const AddState();

  @override
  List<Object> get props => [];
}

class AddInitial extends AddState {}

class AddarticleInit extends AddState {
  final PostModel post;
  const AddarticleInit(this.post);
  @override
  List<Object> get props => [post];
}

class AddarticleLoading extends AddState {
  const AddarticleLoading();
  @override
  List<Object> get props => [];
}

class AddarticleCancel extends AddState {
  const AddarticleCancel();
  @override
  List<Object> get props => [];
}

class Addarticleinseted extends AddState {
  const Addarticleinseted();
  @override
  List<Object> get props => [];
}

class Addarticledone extends AddState {
  const Addarticledone();
  @override
  List<Object> get props => [];
}

class AddarticleError extends AddState {
  final String message;
  const AddarticleError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddarticleError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  List<Object> get props => [];
}
