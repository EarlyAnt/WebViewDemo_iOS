using UnityEngine;
using UnityEngine.UI;
using System.Runtime.InteropServices;

public class SimpleGame : MonoBehaviour
{
    [SerializeField]
    private Text timer;
    [SerializeField]
    private Transform cubeObject;
    [SerializeField]
    private Vector3 angle;
    [SerializeField]
    private int startSeconds = 0;

    private void Start()
    {
        this.InvokeRepeating("RefreshTimer", 0f, 1f);
    }

    private void Update()
    {
        this.cubeObject.Rotate(this.angle);
    }

    public void ExitGame()
    {
        //Application.Unload();
        NativeAPI.sendMessageToMobileApp("exit_game");
        Debug.Log("<><SimpleGame.ExitGame>unload scene");
    }

    public void OpenWebPage()
    {
        //Application.Unload();
        NativeAPI.sendMessageToMobileApp("open_webpage");
        Debug.Log("<><SimpleGame.OpenWebPage>open web page");
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

    private void RefreshTimer()
    {
        this.timer.text = string.Format("已运行{0}秒", this.startSeconds++);
    }
}

public class NativeAPI
{
    [DllImport("__Internal")]
    public static extern void sendMessageToMobileApp(string message);
}
