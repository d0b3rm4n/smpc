#include "artistmodel.h"

ArtistModel::ArtistModel(QObject *parent) :
    QAbstractListModel(parent)
{
}

ArtistModel::ArtistModel(QList<MpdArtist *> *list, QObject *parent) :QAbstractListModel(parent)
{
    m_entries = list;
}

int ArtistModel::rowCount(const QModelIndex &parent) const
{
    return m_entries->length();
}

QVariant ArtistModel::data(const QModelIndex &index, int role) const
{
    if(role==NameRole)
        return m_entries->at(index.row())->getName();
    if(role==SectionRole)
        return m_entries->at(index.row())->getSection();
}

QHash<int, QByteArray> ArtistModel::roleNames() const
{
    QHash<int,QByteArray> roles;
    roles[NameRole] = "artist";
    roles[SectionRole] = "sectionprop";
    return roles;
}
