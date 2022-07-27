Shader "Custom/MatReflectionProbe_Water2"
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,1)
		_MainTex("Albedo (RGB)", 2D) = "white" {}
		_Glossiness("Smoothness", Range(0,1)) = 0.5
		_Metallic("Metallic", Range(0,1)) = 0.0
	}
		SubShader
		{
			Tags{ "RenderType" = "Opaque" }

			CGPROGRAM

		#pragma surface surf _CatDarkLight    //! Custom Light 함수 설정

					struct Input
				{
					float3 worldRefl;        //! 월드 반사 벡터 Input 선언
					INTERNAL_DATA            //! 반사벡터 노멀처리, WorldReflectionVector 함수 사용을 위한 메크로 선언
				};

				fixed4 _Color;

				void surf(Input IN, inout SurfaceOutput o)
				{
					float3 fWorldReflectionVector = WorldReflectionVector(IN, o.Normal).xyz;
					o.Emission = UNITY_SAMPLE_TEXCUBE(unity_SpecCube0, fWorldReflectionVector).rgb * unity_SpecCube0_HDR.r;        //! Reflection Probe데이터 읽어서 Emission에 출력
				}

				float4 Lighting_CatDarkLight(SurfaceOutput s, float3 lightDir, float3 viewDir, float atten)
					//! Custom Light함수는 당장 아무것도 안함
				{
					float4 fFinalColor = 0.0f;

					return fFinalColor;
				}
				ENDCG

		}
		FallBack "Diffuse"
}
