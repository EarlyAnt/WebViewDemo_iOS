using UnityEngine;

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
        Application.Unload();
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
