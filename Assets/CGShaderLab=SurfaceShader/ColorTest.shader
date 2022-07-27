Shader "Custom/ColorTest"
{
    //½¦¾î´õ ÁÖ¼®µµ Ä¿¹Ô¶ß³ª? 

    Properties
    {
        _Color("Color", Color) = (1,0,0,1)
    }
    SubShader
    {
        Tags { "RenderType" = "Opaque" }

        LOD 200

        CGPROGRAM

        #pragma surface surf Standard fullforwardshadows

        #pragma target 3.0

        struct Input
        {
            float2 uv_MainTex;
        };
        float4 _Color;
        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = _Color;
        }
        ENDCG
    }
    FallBack "Diffuse"
}