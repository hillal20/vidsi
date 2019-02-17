SELECT email, title, COUNT(*) as views_count FROM subscribers, videos,views
                INNER JOIN views ON views.subscriber_id = subscribers.id 
                INNER JOIN videos ON videos.id = views.video_id
            GROUP BY email, title
            ORDER BY views_count DESC
            LIMIT 20;