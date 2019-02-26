//package com.spring.common.utils;
//
//import com.alibaba.fastjson.JSON;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import org.apache.commons.codec.binary.Base64;
//import org.json.JSONArray;
//import org.json.JSONObject;
//import org.yaml.snakeyaml.Yaml;
//
//import java.io.UnsupportedEncodingException;
//import java.util.Map;
//
///**
// * @Author: Jeremy
// * @Date: 2018/7/27
// * @Time: 15:06
// * @Describe:
// */
//public class yamlConvertJson {
//    final static String base64Str = "a2luZDogRGVwbG95bWVudAphcGlWZXJzaW9uOiBhcHBzL3YxCm1ldGFkYXRhOgogIG5hbWU6IGFjY291bnQKICBuYW1lc3BhY2U6IGRldi10ZXN0LWhrYXBwCiAgbGFiZWxzOgogICAgcnVuOiBhY2NvdW50CnNwZWM6CiAgcmVwbGljYXM6IDEKICBzZWxlY3RvcjoKICAgIG1hdGNoTGFiZWxzOgogICAgICBydW46IGFjY291bnQKICBzdHJhdGVneToge30KICB0ZW1wbGF0ZToKICAgIG1ldGFkYXRhOgogICAgICBjcmVhdGlvblRpbWVzdGFtcDogCiAgICAgIGxhYmVsczoKICAgICAgICBydW46IGFjY291bnQKICAgIHNwZWM6CiAgICAgIGNvbnRhaW5lcnM6CiAgICAgIC0gaW1hZ2U6IGhhcmJvci5ub2FoZ3JvdXB0ZXN0LmNvbS9oa2FwcC9hY2NvdW50LW1pY3Jvc2VydmljZXM6Ni4wCiAgICAgICAgbmFtZTogYWNjb3VudAogICAgICAgIHBvcnRzOgogICAgICAgIC0gY29udGFpbmVyUG9ydDogOTk5OQogICAgICAgICAgcHJvdG9jb2w6IFRDUAogICAgICAgIGltYWdlUHVsbFBvbGljeTogSWZOb3RQcmVzZW50CiAgICAgICAgdm9sdW1lTW91bnRzOgogICAgICAgIC0gbW91bnRQYXRoOiAvcm9vdC8uc3NoLwogICAgICAgICAgbmFtZTogc3NoCiAgICAgICAgZW52OgogICAgICAgIC0gbmFtZTogRVVSRUtBX0NMSUVOVF9TRVJWSUNFX1VSTF9ERUZBVUxUWk9ORQogICAgICAgICAgdmFsdWU6IGh0dHA6Ly9hZG1pbjphZG1pbkByZWdpc3RyeTo4NzYxL2V1cmVrYQogICAgICAgIC0gbmFtZTogU1BSSU5HX0NMT1VEX0NPTkZJR19VUkkKICAgICAgICAgIHZhbHVlOiBodHRwOi8vYWRtaW46YWRtaW5AY29uZmlnLXNlcnZlcjo4ODg4CiAgICAgIHZvbHVtZXM6CiAgICAgIC0gbmFtZTogc3NoCiAgICAgICAgaG9zdFBhdGg6CiAgICAgICAgICBwYXRoOiAvcm9vdC8uc3NoLw==";
//
//    public static void main(String[] args) {
//        final Base64 base64 = new Base64();
//        final String text = "字串文字";
//        byte[] textByte = null;
//        try {
//            textByte = text.getBytes("UTF-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
//        //编码
//        final String encodedText = base64.encodeToString(textByte);
//        System.out.println(encodedText);
//        //解码
//
//
//        // try {
//        //     System.out.println(new String(base64.decode(encodedText), "UTF-8"));
//        // } catch (UnsupportedEncodingException e) {
//        //     e.printStackTrace();
//        // }
//
//        try {
//            //System.out.println(new String(base64.decode(base64Str), "UTF-8"));
//            String express = new String(base64.decode(base64Str));
//            System.out.println(express);
//            Yaml yaml=new Yaml();
//            Map<String,Object> map= (Map<String, Object>) yaml.load(express);
//            ObjectMapper json = new ObjectMapper();
//            String param = json.writeValueAsString(map);
//            JSONObject jsonObject = new JSONObject(param);
//
//            JSONArray spec=  jsonObject.getJSONObject("spec").getJSONObject("template").getJSONObject("spec").getJSONArray("containers");
//            JSONObject image=spec.getJSONObject(0);
//            image.put("image","111111");
//            System.out.println(jsonObject);
////            String jsonStr= JSON.toJSONString(jsonObject);
////            Map<String,Object> map1 = (Map<String, Object>) yaml.load(jsonStr);
////            String currentYaml = yaml.dump(map1);
////            System.out.println(currentYaml);
//
////			JsonNode jsonNodeTree = new ObjectMapper().readTree(jsonStr);
////			String jsonAsYaml = new YAMLMapper().writeValueAsString(jsonNodeTree);
//            //image.set(0,"image: 111111");
////			for (int i=0,length = spec.size();i<length;i++){
////				String record = spec.getJSONObject(i).getString("image");
////				System.out.println(record);
////			}
//            //			Set<String> set=map.keySet();
////			for (String s:set){
////				Object object=map.get("image");
////				System.out.println(object);
////			}
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//    }
//}
