return {
    'David-Kunz/jester',
    dap = {
        type = "node",
        name = "vscode-jest-tests.v2",
        request = "launch",
        args = { "run", "test", "--", "test", "--runInBand", "--watchAll=false", "--testNamePattern", "${jest.testNamePattern}", "--runTestsByPath", "${jest.testFile}" },
        cwd = "${workspaceFolder}",
        console = "externalTerminal",
        internalConsoleOptions = "neverOpen",
        disableOptimisticBPs = true,
        runtimeExecutable = "C:\\PROGRA~1\\nodejs\\npm",
        protocol = "inspector"
    }
}
