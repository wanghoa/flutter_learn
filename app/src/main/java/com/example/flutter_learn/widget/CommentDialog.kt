package com.example.flutter_learn.widget

import android.app.Dialog
import android.content.Context
import android.view.Gravity
import android.view.View.GONE
import android.view.View.VISIBLE
import android.view.WindowManager
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.flutter_learn.R
import kotlinx.android.synthetic.main.comment_dialog.*
import kotlinx.android.synthetic.main.fragment_video_page.*

object CommentDialog {
    fun show(context: Context) {
        Dialog(context).apply {
            setContentView(R.layout.comment_dialog)
            comment_list.apply {
                layoutManager = LinearLayoutManager(context)
                adapter = CommentAdapter()
            }
            like_list.apply {
                layoutManager = LinearLayoutManager(context)
                adapter = LikeAdapter()
            }
            comment_count.setOnClickListener {
                comment_list.visibility = VISIBLE
                like_list.visibility = GONE
            }
            like_count.setOnClickListener {
                like_list.visibility = VISIBLE
                comment_list.visibility = GONE
            }
            window?.attributes = window?.attributes?.apply {
                gravity = Gravity.BOTTOM
                height = 1278
                width = WindowManager.LayoutParams.MATCH_PARENT

            }
            window?.setBackgroundDrawable(null)
            show()
        }

    }
}