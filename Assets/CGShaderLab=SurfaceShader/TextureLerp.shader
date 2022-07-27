Shader "Custom/TextureLerp"
{
	Properties
	{
	   _MainTex("Albedo (RGB)", 2D) = "white" {}
	   _MainTex2("Albedo2 (RGB)", 2D) = "white" {}
	   _LerpPower("LerpPower", Range(0, 1)) = 0
	}
		SubShader
	   {
		   Tags { "RenderType" = "Opaque" }

		   CGPROGRAM

		   #pragma surface surf Standard 

		   sampler2D _MainTex;
		   sampler2D _MainTex2;

		   float _LerpPower;

		   struct Input
		   {
			   float2 uv_MainTex;
			   float2 uv_MainTex2;
		   };

		   void surf(Input IN, inout SurfaceOutputStandard o)
		   {
			   float4 c = tex2D(_MainTex, IN.uv_MainTex);
			   float4 c2 = tex2D(_MainTex2, IN.uv_MainTex2);
			   o.Albedo = lerp(c, c2, _LerpPower);


		   }
		   ENDCG
	   }
		   FallBack "Diffuse"
}