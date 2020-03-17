#pragma once
#include <QObject>
#include <memory>


class Utils : public QObject
{
    Q_OBJECT
public:
    explicit Utils();

    static void DestructorMsg(const QString& val);
    static void DestructorMsg(const QObject * const obj);

    template<typename T, typename... Args>
    static std::unique_ptr<T> make_unique(Args&&... args)
    {
        return std::unique_ptr<T> (new T(std::forward<Args>(args)...));
    }

private:
    explicit Utils(const Utils& rhs) = delete;
    Utils& operator= (const Utils& rhs) = delete;
};


