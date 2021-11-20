package englishcenter.service.ministryservice;

import englishcenter.model.Ministry;

import java.util.List;

public interface IMinistryService {
    List<Ministry> selectAllMinistry();
    Ministry selectMinistryById(int id);
    void insertMinistry(Ministry ministry);
    boolean updateMinistry(Ministry ministry);
    boolean dropMinistry(Ministry ministry);
    boolean updatePassWordMinistry(Ministry ministry);
}
