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

		#pragma surface surf _CatDarkLight    //! Custom Light �Լ� ����

					struct Input
				{
					float3 worldRefl;        //! ���� �ݻ� ���� Input ����
					INTERNAL_DATA            //! �ݻ纤�� ���ó��, WorldReflectionVector �Լ� ����� ���� ��ũ�� ����
				};

				fixed4 _Color;

				void surf(Input IN, inout SurfaceOutput o)
				{
					float3 fWorldReflectionVector = WorldReflectionVector(IN, o.Normal).xyz;
					o.Emission = UNITY_SAMPLE_TEXCUBE(unity_SpecCube0, fWorldReflectionVector).rgb * unity_SpecCube0_HDR.r;        //! Reflection Probe������ �о Emission�� ���
				}

				float4 Lighting_CatDarkLight(SurfaceOutput s, float3 lightDir, float3 viewDir, float atten)
					//! Custom Light�Լ��� ���� �ƹ��͵� ����
				{
					float4 fFinalColor = 0.0f;

					return fFinalColor;
				}
				ENDCG

		}
		FallBack "Diffuse"
}
