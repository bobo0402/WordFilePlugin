package com.berheley.main.plugins;

import java.io.File;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

public class WordFilePlugin extends CordovaPlugin {

	@SuppressLint("DefaultLocale")
	@Override
	public boolean execute(String action, JSONArray args,
			CallbackContext callbackContext) throws JSONException {
		try {
			Context context = cordova.getActivity().getApplicationContext();
			// 文件路径
			String path = args.getString(0).toLowerCase();
			int num = path.lastIndexOf(".");
			String suffix;
			if (num<0) {
				suffix ="jpg";
			}else{
				suffix = path.substring(num+1);
			}
			// 判断文件类型
			// doc
			if (suffix.equals("doc") || suffix.equals("docx")) {// doc
				@SuppressWarnings("static-access")
				Intent i = this.getWordFileIntent(path);
				context.startActivity(i);
			} else if(suffix.equals("xls") || suffix.equals("xlsx")){//excel
				@SuppressWarnings("static-access")
				Intent i = this.getExcelFileIntent(path);
				context.startActivity(i);
			} else if(suffix.equals("ppt") || suffix.equals("pptx")){//ppt
				@SuppressWarnings("static-access")
				Intent i = this.getPPTFileIntent(path);
				context.startActivity(i);
			} else if(suffix.equals("jpg") || suffix.equals("gif") || suffix.equals("jpeg") || suffix.equals("png") || suffix.equals("bmp")){//jpg、gif、jpeg、png、bmp
				@SuppressWarnings("static-access")
				Intent i = this.getImageFileIntent(path);
				context.startActivity(i);
			} else if(suffix.equals("pdf")){//pdf
				@SuppressWarnings("static-access")
				Intent i = this.getPDFFileIntent(path);
				context.startActivity(i);
			} else if(suffix.equals("txt")){//txt
				@SuppressWarnings("static-access")
				Intent i = this.getTxtFileIntent(path);
				context.startActivity(i);
			} else if(suffix.equals("chm")){//chm
				@SuppressWarnings("static-access")
				Intent i = this.getChmFileIntent(path);
				context.startActivity(i);
			} else {
				callbackContext.success("无法打开该文件！");
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return true;
	}

	// android获取一个用于打开Word文件的intent
	public static Intent getWordFileIntent(String param) {
		Intent intent = new Intent("android.intent.action.VIEW");
		intent.addCategory("android.intent.category.DEFAULT");
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		Uri uri = Uri.fromFile(new File(param));
		intent.setDataAndType(uri, "application/msword");
		return intent;
	}
	// android获取一个用于打开【Excel】文件的intent
	public static Intent getExcelFileIntent(String param) {
		Intent intent = new Intent("android.intent.action.VIEW");
		intent.addCategory("android.intent.category.DEFAULT");
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		Uri uri = Uri.fromFile(new File(param));
		intent.setDataAndType(uri, "application/vnd.ms-excel");
		return intent;
	}
	// android获取一个用于打开【PPT】文件的intent
	public static Intent getPPTFileIntent(String param) {
		Intent intent = new Intent("android.intent.action.VIEW");
		intent.addCategory("android.intent.category.DEFAULT");
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		Uri uri = Uri.fromFile(new File(param));
		intent.setDataAndType(uri, "application/vnd.ms-powerpoint");
		return intent;
	}
	// android获取一个用于打开【Image】文件的intent
	public static Intent getImageFileIntent(String param) {
		Intent intent = new Intent("android.intent.action.VIEW");
		intent.addCategory("android.intent.category.DEFAULT");
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		Uri uri = Uri.fromFile(new File(param));
		intent.setDataAndType(uri, "image/*");
		return intent;
	}
	// android获取一个用于打开【PDF】文件的intent
	public static Intent getPDFFileIntent(String param) {
		Intent intent = new Intent("android.intent.action.VIEW");
		intent.addCategory("android.intent.category.DEFAULT");
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		Uri uri = Uri.fromFile(new File(param));
		intent.setDataAndType(uri, "application/pdf");
		return intent;
	}
	// android获取一个用于打开【TXT】文件的intent
	public static Intent getTxtFileIntent(String param) {
		Intent intent = new Intent("android.intent.action.VIEW");
		intent.addCategory("android.intent.category.DEFAULT");
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		Uri uri = Uri.fromFile(new File(param));
		intent.setDataAndType(uri, "text/plain");
		return intent;
	}
	// android获取一个用于打开【CHM】文件的intent
	public static Intent getChmFileIntent(String param) {
		Intent intent = new Intent("android.intent.action.VIEW");
		intent.addCategory("android.intent.category.DEFAULT");
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		Uri uri = Uri.fromFile(new File(param));
		intent.setDataAndType(uri, "application / x-chm");
		return intent;
	}
}
