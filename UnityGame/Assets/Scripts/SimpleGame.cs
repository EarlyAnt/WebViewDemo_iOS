using UnityEngine;
using System.Runtime.InteropServices;

public class SimpleGame : MonoBehaviour
{
    [SerializeField]
    private Transform cubeObject;
    [SerializeField]
    private Vector3 angle;

    private void Start()
    {
    }

    private void Update()
    {
        this.cubeObject.Rotate(this.angle);
    }

    public void ExitGame()
    {
        //Application.Unload();
        NativeAPI.CalliOSNativeMethod(InteractionMethod.GO_BACK);
        Debug.Log("<><SimpleGame.ExitGame>unload scene");
    }

    public void SetBallColor(string color)
    {
        if (string.IsNullOrEmpty(color))
        {
            Debug.LogError("<><SimpleGame.SetBallColor>color is invalid");
            return;
        }

        Color customColor;
        switch (color)
        {
            case "red":
                customColor = Color.red;
                break;
            case "green":
                customColor = Color.green;
                break;
            case "blue":
                customColor = Color.blue;
                break;
            default:
                customColor = Color.white;
                break;
        }
        this.cubeObject.GetComponent<Renderer>().material.color = customColor;
    }
}

public class NativeAPI
{
    [DllImport("__Internal")]
    public static extern void SendMessageToMobileApp(string message);

    [DllImport("__Internal")]
    public static extern void CalliOSNativeMethod(int parameter);
}

public static class InteractionMethod
{
    public const int GO_BACK = 0;
}
