package com.scccy.web.login;

import com.scccy.biz.model.dto.LoginDTO;
import com.scccy.biz.service.login.LoginService;
import com.scccy.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/Auth")
public class LoginController {
    @Autowired
    private LoginService loginService;
    @PostMapping("/login")
    public Result<String> commonLogin(@RequestBody LoginDTO loginDTO){
        String login = loginService.login(loginDTO);
        return Result.success(login);
    }
}
