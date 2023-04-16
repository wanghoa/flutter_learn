package com.example.flutter_learn.widget

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.flutter_learn.R

class CommentAdapter : RecyclerView.Adapter<CommentAdapter.CommentHolder>() {
    private val dataList = ServerData.fetchData()

    class CommentHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        var text = itemView.findViewById<TextView>(R.id.comment_content)
        var name = itemView.findViewById<TextView>(R.id.comment_name)
        var date = itemView.findViewById<TextView>(R.id.comment_date)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CommentHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.comment_item, parent, false)
        return CommentHolder(view)
    }

    override fun onBindViewHolder(holder: CommentHolder, position: Int) {
        dataList[position].apply {
            holder.text.text = content
            holder.name.text = name
            holder.date.text = date
        }
    }

    override fun getItemCount(): Int = dataList.size

}