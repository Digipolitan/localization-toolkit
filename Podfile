workspace 'LocalizationToolkit.xcworkspace'

## Frameworks targets
abstract_target 'Frameworks' do
	use_frameworks!
	target 'LocalizationToolkit-iOS' do
		platform :ios, '8.0'
	end

	target 'LocalizationToolkit-watchOS' do
		platform :watchos, '2.0'
	end

	target 'LocalizationToolkit-tvOS' do
		platform :tvos, '9.0'
	end

	target 'LocalizationToolkit-OSX' do
		platform :osx, '10.9'
	end
end

## Tests targets
abstract_target 'Tests' do
	use_frameworks!
	target 'LocalizationToolkitTests-iOS' do
		platform :ios, '8.0'
	end

	target 'LocalizationToolkitTests-tvOS' do
		platform :tvos, '9.0'
	end

	target 'LocalizationToolkitTests-OSX' do
		platform :osx, '10.9'
	end
end

## Samples targets
abstract_target 'Samples' do
	use_frameworks!
	target 'LocalizationToolkitSample-iOS' do
		project 'Samples/LocalizationToolkitSample-iOS/LocalizationToolkitSample-iOS'
		platform :ios, '8.0'
	end

	abstract_target 'watchOS' do
		project 'Samples/LocalizationToolkitSample-watchOS/LocalizationToolkitSample-watchOS'
		target 'LocalizationToolkitSample-watchOS' do
			platform :ios, '8.0'
		end

		target 'LocalizationToolkitSample-watchOS WatchKit Extension' do
			platform :watchos, '2.0'
		end
	end

	target 'LocalizationToolkitSample-tvOS' do
		project 'Samples/LocalizationToolkitSample-tvOS/LocalizationToolkitSample-tvOS'
		platform :tvos, '9.0'
	end

	target 'LocalizationToolkitSample-OSX' do
		project 'Samples/LocalizationToolkitSample-OSX/LocalizationToolkitSample-OSX'
		platform :osx, '10.9'
	end
end
