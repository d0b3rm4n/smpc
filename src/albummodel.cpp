#include "albummodel.h"

AlbumModel::AlbumModel(QObject *parent) :
    QAbstractListModel(parent)
{
}

AlbumModel::AlbumModel(QList<MpdAlbum *> *list,QObject *parent) : QAbstractListModel(parent)
{
       m_entries = list;
}

QVariant AlbumModel::data(const QModelIndex &index, int role) const
{
    if(role==AlbumRole)
    {
        return m_entries->at(index.row())->getTitle();
    }
    if(role==SectionRole)
        return m_entries->at(index.row())->getSection();
}

int AlbumModel::rowCount(const QModelIndex &parent) const{
    return m_entries->length();
}

QHash<int, QByteArray> AlbumModel::roleNames() const {
    QHash<int,QByteArray> roles;

    roles[AlbumRole] = "title";
    roles[SectionRole] = "sectionprop";
    return roles;
}
