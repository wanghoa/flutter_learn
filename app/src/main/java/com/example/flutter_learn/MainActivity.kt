package com.example.flutter_learn

import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.view.View
import android.view.View.GONE
import android.view.View.VISIBLE
import android.widget.Button
import androidx.activity.result.contract.ActivityResultContract
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import com.example.flutter_learn.page.VideoPageFragment
import kotlinx.android.synthetic.main.activity_main.*


class MainActivity : FragmentActivity() {
    companion object {
        const val ENGINE_ID = "engineID"
    }

    // 导入 implementation project(path:':flutter') 就不能使用registerForActivityResult() 找不到
//    private val activityResultLauncher =
//        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
//        }

    private val homeFragment by lazy {
        VideoPageFragment()
    }

    private val friendFragment by lazy {
        VideoPageFragment()
    }
    private val messageFragment by lazy {
        FlutterFragmentUtil.createFlutterFragment(this, "message", "/message")
    }
    private val mineFragment by lazy {
        FlutterFragmentUtil.createFlutterFragment(this, "mine", "/mine")
    }

    private val cameraFragment by lazy {
        FlutterFragmentUtil.createFlutterFragment(this, "camera", "/camera")
    }

    private var currentFragment: Fragment = homeFragment


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        supportFragmentManager.beginTransaction().add(R.id.fragment_container, homeFragment)
            .commit()

        btn_home.setOnClickListener { showPage(it) }
        bt_friend.setOnClickListener { showPage(it) }
        bt_message.setOnClickListener { showPage(it) }
        bt_mine.setOnClickListener { showPage(it) }
        btn_add.setOnClickListener {
            supportFragmentManager.beginTransaction().add(R.id.camera_container, cameraFragment)
                .commit()
        }

    }

    private fun showPage(view: View?) {
        when (view?.id) {
            R.id.btn_home -> {
                homeFragment
            }
            R.id.bt_friend -> {
                friendFragment
            }
            R.id.bt_message -> {
                messageFragment
            }
            R.id.bt_mine -> {
                mineFragment
            }
            else -> {
                homeFragment
            }


        }.let {
            if (currentFragment == it) {
                return
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {//Call requires API level 23 (current min is 21): android.content.Context#getColor
                btn_home.setTextColor(getColor(R.color.bottom_button_color))
                bt_friend.setTextColor(getColor(R.color.bottom_button_color))
                bt_message.setTextColor(getColor(R.color.bottom_button_color))
                bt_mine.setTextColor(getColor(R.color.bottom_button_color))
                (view as Button).setTextColor(getColor(R.color.white))
            }
            if (it.isAdded) {
                supportFragmentManager.beginTransaction().hide(currentFragment).show(it).commit()
            } else {
                supportFragmentManager.beginTransaction().hide(currentFragment)
                    .add(R.id.fragment_container, it).commit()
            }
            currentFragment = it

        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        currentFragment.onActivityResult(requestCode, resultCode, data)
    }

    fun hideBottomButton(hide: Boolean) {
        val visible = if (hide) GONE else VISIBLE
        btn_home.visibility = visible
        bt_friend.visibility = visible
        bt_message.visibility = visible
        btn_add.visibility = visible
        bt_mine.visibility = visible
    }


}