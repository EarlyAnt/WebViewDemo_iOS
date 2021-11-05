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
}
