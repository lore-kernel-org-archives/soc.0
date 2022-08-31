Return-Path: <SRS0=fCwI=ZD=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028ADECAAD4
	for <soc@archiver.kernel.org>; Wed, 31 Aug 2022 14:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0009C43141; Wed, 31 Aug 2022 14:12:25 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7184C433D6
	for <soc@kernel.org>; Wed, 31 Aug 2022 14:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7184C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id x10so14752347ljq.4
        for <soc@kernel.org>; Wed, 31 Aug 2022 07:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=gzK10rJm3kDakU95ZOzVvw37oOA+zuu1InnZT0+0zc8=;
        b=anQU10e8+GPGyhXsYmOKXNVsuNiBAq3vGn1CRMFCzYLiizIl40pIiNmHHoYfrI5ilg
         DOaYNSzwJFoK5Gx3jOl6YVRafg3lVDuOH7Rbf5kZE9KegehB7Kvr3ldUZy3pGSA/kIRq
         qCQIyxz7PVY/FIobzmokwfaK/HUO/IhDpZr+x1yacobSB73dOcFFSoZo9FRzmEw37b0B
         zimmgXZ4urYhkmRMBxPtoJNjt9zebub8jFiCGy3SyDqd5q2L4HRfmR8iDU9YuedLiak4
         +V7qo2bRf/hdYpawdUUSKDttDRBOIZUZp1LxJ6nqKJGY3w6f/rYeRQ0TM5y47/yNaoP2
         eWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=gzK10rJm3kDakU95ZOzVvw37oOA+zuu1InnZT0+0zc8=;
        b=zU+xDx6TR1JB5Tk3uge0y9v3w6H5FBRyjF7QduXQIJ+SoP2BIHY/HY6npG1/Gdz8EM
         Sk3TRn2PxAocSqYDGk9sEAcrcuO7/a3EGVvvebTg1KQSFPQk0jZKylkCQGGjnnC+Pb7o
         pXiJHdhXGDZzlaDrDbjpdv6Ao6hee3NiyvJhgiqfXDGbxOnsvc/KHGSzk0ri8j6/DGSh
         4zjH0NTz7gop0UY7eK9TmHQBdoNuTiwTkf83ojzcb/36irQr9oZWcc4AKx5Xdn43Vsv3
         kUI6wnyoSi1sjrrUMYdMC4RL5SpuM9eIG0KCvnB7rRn/L+rfTxMEFZVKi7rIDgP9h3/Q
         rPJQ==
X-Gm-Message-State: ACgBeo0y+B1SoEZ9iF0/wSqCdj1Rz/MB3j015YZHTT4QVgfefUX/x75f
	5UUlvlFcQjKD2JF/2RnG1WOx/w==
X-Google-Smtp-Source: AA6agR6Kxd376mZM7+9hyHIlzFnsCVzTl9sipNPdfLu+aWFjls/ZvCjq2m3yABlLucRA6u5J71yppg==
X-Received: by 2002:a05:651c:901:b0:261:ca36:951a with SMTP id e1-20020a05651c090100b00261ca36951amr9030862ljq.36.1661955142051;
        Wed, 31 Aug 2022 07:12:22 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id h5-20020ac24d25000000b00494603953b6sm1523745lfk.6.2022.08.31.07.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:12:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] arm64: defconfig: enable newer Qualcomm SoC sound drivers
Date: Wed, 31 Aug 2022 17:12:18 +0300
Message-Id: <20220831141218.516100-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable sound support (machine drivers) for Qualcomm SC7180 and SC7280
SoCs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Resending because I missed ARM SoC maintainers and Bjorn.

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 265454620682..644d084c6888 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -792,6 +792,8 @@ CONFIG_SND_SOC_APQ8016_SBC=m
 CONFIG_SND_SOC_MSM8996=m
 CONFIG_SND_SOC_SDM845=m
 CONFIG_SND_SOC_SM8250=m
+CONFIG_SND_SOC_SC7180=m
+CONFIG_SND_SOC_SC7280=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
-- 
2.34.1

