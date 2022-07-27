using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ColorTest : MonoBehaviour
{

    public Text txtColor;

    // Start is called before the first frame update
    void Start()
    {
        txtColor = GameObject.Find("TextColorTest").GetComponent<Text>();
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown(KeyCode.Alpha1))
        {
            //GetComponent<Renderer>().material.SetFloat("Color",)
            //GetComponent<Renderer>().material.SetColor("_Color", new Color(255, 255, 255, 255));
            GetComponent<Renderer>().material.SetColor("_Color", Color.white);
        }

        if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            //GetComponent<Renderer>().material.SetFloat("Color",)
            //GetComponent<Renderer>().material.SetColor("_Color", new Color(0, 0, 0, 0));
            GetComponent<Renderer>().material.SetColor("_Color", Color.black);
        }

        if (Input.GetKeyDown(KeyCode.Alpha3))
        {
            Renderer rend = GetComponent<Renderer>();
            rend.material.shader = Shader.Find("Custom/ColorTest");
            rend.material.SetColor("_Color", Color.red);
        }

        if (GetComponent<Renderer>() == null) return;

        var clr = GetComponent<Renderer>().material.GetColor("_Color");
        
        if (txtColor == null) return;

        txtColor.text = string.Format("r : {0:f2}, g : {1:f2}, b : {2:f2}, a : {3:f2}"
            , clr.r,clr.g,clr.b,clr.a
            );
    }
}
