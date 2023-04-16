package com.example.flutter_learn.page

import android.util.SparseArray
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import androidx.viewpager2.adapter.FragmentStateAdapter

class VideoPageAdapter(fragmentActivity: FragmentActivity) :
    FragmentStateAdapter(fragmentActivity) {
    companion object {
        const val PAGE_CITY = 0
        const val PAGE_FOCUS = 1
        const val PAGE_RECOMMEND = 2

    }

    private val mFragments: SparseArray<FocusFragment> = SparseArray()
    var mCurrentIndex = PAGE_FOCUS

    init {
        mFragments.put(PAGE_CITY, FocusFragment.newInstance())
        mFragments.put(PAGE_FOCUS, FocusFragment.newInstance())
        mFragments.put(PAGE_RECOMMEND, FocusFragment.newInstance())
    }

    override fun getItemCount(): Int = mFragments.size()

    override fun createFragment(position: Int): Fragment {
        return mFragments[position]
    }

    fun onHiddenChanged(hide: Boolean) {
        if (hide) {
            mFragments[mCurrentIndex]
        }
    }

    override fun getItemViewType(position: Int): Int {
        return super.getItemViewType(position)
    }

    override fun getItemId(position: Int): Long {
        return super.getItemId(position)
    }
}