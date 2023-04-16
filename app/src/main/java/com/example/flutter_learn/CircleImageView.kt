package com.example.flutter_learn

import android.content.Context
import android.graphics.*
import android.graphics.drawable.BitmapDrawable
import android.util.AttributeSet
import androidx.appcompat.widget.AppCompatImageView

class CircleImageView constructor(
    context: Context?,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : AppCompatImageView(context!!, attrs, defStyleAttr) {
    private var mSize = 0
    private var mPaint: Paint? = null

    init {
        mPaint = Paint()
        mPaint?.isDither = true
        mPaint?.isAntiAlias = true
    }

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec)
        val width = measuredWidth
        val height = measuredHeight
        mSize = width.coerceAtLeast(height)// 取宽高最小值
        setMeasuredDimension(mSize, mSize)// 设置CircleImageview为等宽高
    }

    override fun onDraw(canvas: Canvas?) {
        super.onDraw(canvas)
        val drawable = drawable ?: return
        val sourceBitmap = (drawable as BitmapDrawable).bitmap
        sourceBitmap?.let {
            val bitmap = resizeBitmap(sourceBitmap, width, height)
            drawCircleBitmapByShader(canvas, bitmap)
        }

    }

    private fun resizeBitmap(sourceBitmap: Bitmap, dstWidth: Int, dstHeight: Int): Bitmap {
        val width = sourceBitmap.width
        var height = sourceBitmap.height
        val widthScale = dstWidth.toFloat() / width
        val heightScale = dstHeight.toFloat() / height
        //取最大缩放比
        val scale = widthScale.coerceAtLeast(heightScale)
        val matrix = Matrix()
        matrix.postScale(scale, scale)
        return Bitmap.createBitmap(sourceBitmap, 0, 0, width, height, ,matrix, true)
    }

    private fun drawCircleBitmapByShader(canvas: Canvas?, bitmap: Bitmap) {
        val shader = BitmapShader(bitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP)
        mPaint!!.shader = shader
        canvas?.drawCircle(
            (mSize / 2).toFloat(),
            (mSize / 2).toFloat(),
            (mSize / 2).toFloat(),
            mPaint!!
        )
    }
}