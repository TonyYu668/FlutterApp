package com.tony.flutter.flutter_app

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.ViewGroup
import android.widget.FrameLayout
import io.flutter.facade.Flutter
import kotlinx.android.synthetic.main.activity_main.*



/**
 * @author tony
 */
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.activity_main)

        activity_add_view_btn.setOnClickListener {
            val createView = Flutter.createView(this@MainActivity, lifecycle, "route_create_main_view")
            var params: FrameLayout.LayoutParams = FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
            activity_fragment.removeAllViews()
            activity_fragment.addView(createView, params)
        }

        activity_add_fragment_btn.setOnClickListener{
            activity_fragment.removeAllViews()
            val beginTransaction = supportFragmentManager.beginTransaction()
            beginTransaction.replace(R.id.activity_fragment, Flutter.createFragment("route_create_main_fragment"))
            beginTransaction.commit()
        }
    }
}