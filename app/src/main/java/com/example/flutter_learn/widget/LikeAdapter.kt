package com.example.flutter_learn.widget

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.flutter_learn.R

class LikeAdapter : RecyclerView.Adapter<LikeAdapter.CommentHolder>() {
    class CommentHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {


    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CommentHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.like_item, parent, false)
        return CommentHolder(view)
    }

    override fun onBindViewHolder(holder: CommentHolder, position: Int) {

    }

    override fun getItemCount(): Int {
        return 20
    }
}