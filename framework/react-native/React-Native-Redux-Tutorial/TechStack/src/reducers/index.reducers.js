import { combineReducers } from 'redux';
import Library from './Library.reducer';
import Selection from './Selection.reducer';

export default combineReducers({
  libraries: Library,
  selectedLibraryId: Selection,
});
