package com.example.flutter_learn.page

import android.content.Context
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.PagerSnapHelper
import androidx.recyclerview.widget.RecyclerView

/**
 * 管理视频列表滑动
 * 视频布局管理器
 */
class VideoLayoutManager(context: Context?): LinearLayoutManager(context) {
    companion object{
        const val TAG = "Manager"

    }
    private var mPagerSnapHelper = PagerSnapHelper()
    private var mRecyclerView: RecyclerView?= null

    override fun onAttachedToWindow(view: RecyclerView?) {
        super.onAttachedToWindow(view)
        mPagerSnapHelper.attachToRecyclerView(view)
        mRecyclerView = view
    }

    override fun onDetachedFromWindow(view: RecyclerView?, recycler: RecyclerView.Recycler?) {
        super.onDetachedFromWindow(view, recycler)
    }
}