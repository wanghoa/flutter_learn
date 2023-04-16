package com.example.flutter_learn.page

import android.graphics.Color
import android.os.Build
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.annotation.RequiresApi
import androidx.fragment.app.Fragment
import androidx.viewpager2.widget.ViewPager2
import com.example.flutter_learn.R
import kotlinx.android.synthetic.main.fragment_home_page.*

class VideoPageFragment : Fragment() {
    companion object {
        val TAG = VideoPageFragment::class.simpleName
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
//        return super.onCreateView(inflater, container, savedInstanceState)
        return inflater.inflate(R.layout.fragment_home_page, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        view_pager2.apply {
            adapter = VideoPageAdapter(requireActivity())
            setCurrentItem(1, false)
            registerOnPageChangeCallback(object : ViewPager2.OnPageChangeCallback() {
                override fun onPageSelected(position: Int) {
                    super.onPageSelected(position)
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                        val shadowColor = resources.getColor(R.color.dim_shadow, null)
                        val normalColor = resources.getColor(R.color.dim, null)
                        home_focus.setTextColor(normalColor)
                        home_focus.setShadowLayer(5f, 0f, 5f, shadowColor)
                        home_city.setTextColor(normalColor)
                        home_city.setShadowLayer(5f, 0f, 5f, shadowColor)
                        home_recommend.setTextColor(normalColor)
                        home_recommend.setShadowLayer(5f, 0f, 5f, shadowColor)
                        when (position) {
                            0 -> home_city.setTextColor(Color.WHITE)
                            1 -> home_focus.setTextColor(Color.WHITE)
                            2 -> home_recommend.setTextColor(Color.WHITE)
                        }
                    } else {
                        TODO("VERSION.SDK_INT < M")
                    }
                }
            })
        }
    }

    override fun onHiddenChanged(hidden: Boolean) {
        super.onHiddenChanged(hidden)
        (view_pager2.adapter as VideoPageAdapter).onHiddenChanged(hidden)
    }
}