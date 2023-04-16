package com.example.flutter_learn

import android.content.Context
import android.text.TextUtils
import android.util.AttributeSet
import androidx.appcompat.widget.AppCompatTextView

class MarqueTextView @JvmOverloads constructor(context: Context, attrs: AttributeSet? = null) :
    AppCompatTextView(context, attrs) {
    init {
        marqueeRepeatLimit = -1
        ellipsize = TextUtils.TruncateAt.MARQUEE
        setSingleLine()
    }

    override fun isFocused(): Boolean {
//        return super.isFocused()
        return true
    }
}