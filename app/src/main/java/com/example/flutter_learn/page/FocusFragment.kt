package com.example.flutter_learn.page

import android.os.Bundle
import androidx.fragment.app.Fragment

class FocusFragment: Fragment() {
    companion object{
        private const val TAG = "FocusFragment"
        /**
         * 创建首页Fragment
         *
         */
        fun newInstance (): FocusFragment{
            val fragment = FocusFragment()
            val args = Bundle()
            fragment .arguments = args
            return fragment
        }
    }
    private val mLayoutManager = VideoLayoutManager(context)
    private val mAdapter = FocusAdapter()

}