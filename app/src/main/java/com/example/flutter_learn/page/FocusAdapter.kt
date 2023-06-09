package com.example.flutter_learn.page

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.VideoView
import androidx.recyclerview.widget.RecyclerView
import com.example.flutter_learn.R
import com.example.flutter_learn.widget.CommentDialog

class FocusAdapter : RecyclerView.Adapter<FocusAdapter.VideoHolder>() {
    private var mAutoPlay = true

    class VideoHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        var video: VideoView = itemView.findViewById<VideoView>(R.id.video)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): VideoHolder {
        val view: View =
            LayoutInflater.from(parent.context).inflate(R.layout.fragment_video_page, parent, false)
        view.findViewById<VideoView>(R.id.video).apply {
            setOnPreparedListener {
                it.isLooping = true
            }
            view.setOnClickListener {
                if (isPlaying) {
                    pause()
                    view.findViewById<View>(R.id.play).visibility = View.VISIBLE

                } else {
                    start()
                    view.findViewById<View>(R.id.play).visibility = View.GONE
                }
            }
        }
        view.findViewById<ImageView>(R.id.comment).setOnClickListener {
            CommentDialog.show(view.context)

        }
        return VideoHolder(view)
    }

    override fun onBindViewHolder(holder: VideoHolder, position: Int) {
        holder.video.apply {
            setVideoPath("android.resource://" + context.packageName + "/" + R.raw.video2)
            if (mAutoPlay && position == 0) {
                mAutoPlay = false
            }
        }
    }

    override fun getItemCount(): Int = 10
}