package com.yinhai.ta404.service.impl;

import com.yinhai.ta404.component.captcha.core.common.CaptchaTypeEnum;
import com.yinhai.ta404.component.captcha.core.common.ResponseModel;
import com.yinhai.ta404.component.captcha.core.service.CaptchaService;
import com.yinhai.ta404.component.captcha.core.vo.CaptchaVO;
import com.yinhai.ta404.component.captcha.springboot.starter.properties.CaptchaProperties;
import com.yinhai.ta404.component.org.core.constant.OrgConstant;
import com.yinhai.ta404.component.org.core.logevent.IOrgOpLogEventPublish;
import com.yinhai.ta404.component.org.core.vo.TaUserVo;
import com.yinhai.ta404.component.org.orguser.user.service.read.UserManagementReadService;
import com.yinhai.ta404.component.org.orguser.user.service.write.UserManagementWriteService;
import com.yinhai.ta404.component.security.base.autoconfigure.WebSecurityConfig;
import com.yinhai.ta404.component.security.base.service.EncryptUserService;
import com.yinhai.ta404.component.security.base.service.TaUserAutoUnlockService;
import com.yinhai.ta404.component.security.base.user.TaLockUser;
import com.yinhai.ta404.core.CommonConstants;
import com.yinhai.ta404.core.exception.AppException;
import com.yinhai.ta404.core.security.vo.UserAccountVo;
import com.yinhai.ta404.core.transaction.annotation.NoTransactional;
import com.yinhai.ta404.core.utils.ValidateUtil;
import com.yinhai.ta404.service.IndexService;
import com.yinhai.ta404.websecurity.service.CryptoService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.lang.NonNull;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.yinhai.ta404.component.org.core.constant.OrgConstant.OP_TYPE_MODIFY_PWD;

/**
 * index service
 *
 * @since 5.0
 */
@Service
@NoTransactional
public class IndexServiceImpl implements IndexService, ApplicationContextAware {

    @Autowired
    private WebSecurityConfig webSecurityConfig;

    @Autowired
    private CryptoService cryptoService;

    @Autowired
    private UserManagementReadService userManagementReadService;

    @Autowired
    private UserManagementWriteService userManagementWriteService;

    @Autowired
    private CaptchaService captchaService;

    @Autowired
    private CaptchaProperties captchaProperties;

    @Autowired
    private EncryptUserService encryptUserService;

    @Autowired
    private TaUserAutoUnlockService taUserAutoUnlockService;

    @Resource(name = "taPasswordEncoder")
    private PasswordEncoder encoder;

    @Resource
    protected IOrgOpLogEventPublish orgOpLogEventPublish;

    private ApplicationContext applicationContext;

    @Override
    public void setApplicationContext(@NonNull ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }


    @Override
    public Map<String, Object> getUserInfo(UserAccountVo userAccountVo) {
        Map<String, Object> map = new HashMap<>(16);
        map.put("orgId", userAccountVo.getOrgId());
        map.put("orgName", userAccountVo.getOrgName());
        map.put("userId", userAccountVo.getUserId());
        map.put("loginId", userAccountVo.getLoginId());
        map.put("userName", userAccountVo.getName());
        map.put("sex", userAccountVo.getSex());
        map.put("idCardType", userAccountVo.getIdCardType());
        map.put("idCardNo", userAccountVo.getIdCardNo());
        /*map.put("personRoleId",curUserAccountVo.getPersonRoleId());*/
        map.put("mainRoleId", userAccountVo.getMainRoleId());
        map.put("roles", userAccountVo.getRoles());
        userAccountVo.getRoles().forEach((vo) -> {
            if (OrgConstant.ROLE_TYPE_ADMIN.equals(vo.getRoleType())) {
                map.put("isManager", true);
            }
            if (userAccountVo.getMainRoleId().equals(vo.getRoleId())) {
                map.put("mainRoleName", vo.getRoleName());
            }
        });
        map.put("avatar", userManagementReadService.queryAvatar(userAccountVo.getUserId()));
        return map;
    }

    @Override
    public void changePassByUserId(String oldPassword, String newPassword, String userId) {
        TaUserVo vo = userManagementReadService.queryUserVoByUserId(userId);
        updatePass(null, vo, oldPassword, newPassword);
    }

    @Override
    public void changePassByLoginId(HttpServletRequest request, String loginId, String oldPassword, String newPassword) {
        TaUserVo vo = userManagementReadService.queryUserVoByLoginId(loginId);
        updatePass(request, vo, oldPassword, newPassword);
    }

    @Override
    public int getPassErrorNum(String loginId) {
        UserAccountVo userAccountVo = userManagementReadService.queryUserByLoginId(loginId);
        if (null != userAccountVo) {
            //??????????????????
            return null == userAccountVo.getPasswordDefaultNum() ? 0 : userAccountVo.getPasswordDefaultNum();
        }
        //modify by kangdw:????????????3???????????????????????????????????????????????????????????????????????????????????????
        return 0;
    }

    @Override
    public int getPasswordLevel() {
        return webSecurityConfig.getPasswordLevel();
    }

    @Override
    public boolean isEncryptLoginId() {
        return webSecurityConfig.isEncryptLoginId();
    }

    @Override
    public Map<String, Object> getConfig(HttpServletRequest request) {
        Map<String, Object> configMap = new HashMap<>(12);
        //update by wanggan,??????rsa?????????,?????????????????????????????????,???????????????????????????????????????,?????????5.2.0???????????????
//        configMap.put("passwordRSA", webSecurityConfig.isPasswordRSA());
        configMap.put("passwordLevel", webSecurityConfig.getPasswordLevel());
        configMap.put("encryptLoginId", webSecurityConfig.isEncryptLoginId());
        configMap.put("userCheckCode", captchaProperties.isUserCheckCode());
        configMap.put("checkCodeType", captchaProperties.getCaptchaType());
        configMap.put("numberCheckCodeLevel", captchaProperties.getNumberCheckCodeLevel());
        configMap.put("passwordValidationErrorNumber", captchaProperties.getPasswordValidationErrorNumber());
        configMap.put("sessionPasswordErrorNumber", 0);
        configMap.put("openSocialLogin", ifHaveBean("socialConfigApply"));
        configMap.put("openSmsLogin", ifHaveBean("smsConfigApply"));
        return configMap;
    }


    private void updatePass(HttpServletRequest request, TaUserVo vo, String oldPassword, String newPassword) {
        if (ValidateUtil.isEmpty(oldPassword)) {
            throw new AppException("???????????????");
        }
        if (null == vo || ValidateUtil.isEmpty(vo.getUserId())) {
            throw new AppException("????????????????????????");
        }
        try {
            // ???????????????????????????????????????,?????????????????????
            if (captchaProperties.isUserCheckCode() && request != null) {
                if (StringUtils.equals(captchaProperties.getCaptchaType(), CaptchaTypeEnum.SIMPLE.getCodeValue())) {
                    captchaService.verification(request);
                } else {
                    boolean flag = captchaService.verification(request).isSuccess();
                    if (!flag) {
                        throw new AppException("???????????????");
                    }
                }
            }

            //???????????????
            if (!encoder.matches(oldPassword, vo.getPassword())) {
                //????????????????????????????????????????????????????????????
                if (taUserAutoUnlockService.isUserLock(vo.getUserId())) {
                    throw new AppException("??????????????????????????????????????????");
                }

                //??????????????????????????????????????????
                Integer errorNum = Integer.valueOf(ValidateUtil.isEmpty(vo.getPasswordDefaultNum()) ? "0" : vo.getPasswordDefaultNum());
                taUserAutoUnlockService.lockUser(new TaLockUser(vo.getUserId(), errorNum));

                //??????????????????????????????????????????
                if (taUserAutoUnlockService.isUserLock(vo.getUserId())) {
                    throw new AppException("???????????????????????????????????????");
                }

                //???????????????????????????????????????
                throw new AppException("????????????????????????");
            }

            //?????????????????????,??????????????????
            //update by wanggan for 5.2.x,?????????????????????????????????????????????,?????????????????????,???????????????????????????????????????
            String plainPwd = cryptoService.decryptWithAsymmetric(newPassword);
            if (!encryptUserService.checkPasswordIsFit(plainPwd)) {
                throw new AppException("????????????????????????????????????");
            }
        } catch (AppException e) {
            //????????????????????????-????????????-????????????
            orgOpLogEventPublish.pubUserOpLogEvent(OP_TYPE_MODIFY_PWD, vo.getUserId(), "oldPassword:" + oldPassword + "\n->\nnewPassword:" + newPassword, CommonConstants.NO);
            throw e;
        }

        //????????????
        userManagementWriteService.updateUserPwdByUserId(vo.getUserId(), newPassword);
        //????????????????????????-????????????
        orgOpLogEventPublish.pubUserOpLogEvent(OP_TYPE_MODIFY_PWD, vo.getUserId(), "oldPassword:" + oldPassword + "\n->\nnewPassword:" + newPassword, CommonConstants.YES);
    }

    @Override
    public List<TaUserVo> queryUsersByMobile(String mobile) {
        return userManagementReadService.queryUsersByMobile(mobile);
    }

    @Override
    public boolean ifHaveBean(String beanName) {
        try {
            applicationContext.getBean(beanName);
        } catch (NoSuchBeanDefinitionException e) {
            return false;
        }
        return true;
    }
}
