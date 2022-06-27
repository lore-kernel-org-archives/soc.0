Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F2DCCA47F
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C41F2C341C7; Mon, 27 Jun 2022 09:16:21 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44AB3C341CE
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44AB3C341CE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id u15so17734470ejc.10
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=t3b+jqU8GZl0EFABg0x/c17eyO7t957ugRR9BD9/610=;
        b=ClQbzClzPWCdY6KlKQ665ptjCuPobjuYbF5+PcFCTSWc8Y58h090V+C1srpISQOyU1
         sPJrDmbjuUDL+NYTY1Zxqus5iDpmAe0J9eYyV8H9uRO1fJfwPynKi7AUo+sT2Wkc3qA/
         +2XKnjINT1tBokbmhl8hVXAG6oXaKzq6e3qzv2yKgDrjeJolXV2bysPQiOL8S0Tc0gmK
         0TMHYj8jD0Ib/YplEsnPIQ1dtuKs3N+046uv7cKXSDYnijB0MbWhqm5wD6OGP1t7kTUp
         lbeWc7ffftR+zabFtI57XrwS1TLe7i40mh9AmpujJczAUWNRhTU6oLQt+PPtzfITWmvb
         oUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t3b+jqU8GZl0EFABg0x/c17eyO7t957ugRR9BD9/610=;
        b=Uct0feyNjKTQjt9RNX1JTmCn9vCbEYBpFJEItLhmSikWJMhosk8ce48fIqaCJBEuqi
         /VkMNnbG+qRCE6FDAVbTgUeFdmnx1akcJHsY1MQTqz8lCyYDLzWIbQDbfRcSKNwDEFTO
         ibW5pDKeezmKoHxwf1wAmMcOvraMAxPlEzhr7T7rpL1WHzZ4bt5c+fzuFm5/gkuSvVas
         YoaOjWE4RnOv2+cxOAuzW0P6RbN9VdihpnZZVgjZlrc/FQhnNN5RJxQcCrpsTQpLnOvs
         yLTu7qx+2dK0TARwq7oH8XLvjqOBpry+dlBi53hBscyLRxp8uLVmz9SeFZGNppSzpdEt
         qK/Q==
X-Gm-Message-State: AJIora+lCE5yhOreV7FBjLe+dzjOXwMj53WYecwcBfRD29hSrFtNn4Hc
	gCwfh0NC4Go6roVHlo0Iq3fNuNoPEhRyVA==
X-Google-Smtp-Source: AGRyM1seK6am1qPGVlXKvE26Oe7a/3cikFyA5HjSozFlnKf4dp0lSN28TvTzTIbIHajj45li1fV+Dg==
X-Received: by 2002:a17:907:969f:b0:726:94a0:26fd with SMTP id hd31-20020a170907969f00b0072694a026fdmr8304630ejc.234.1656321379246;
        Mon, 27 Jun 2022 02:16:19 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	agross@kernel.org,
	krzysztof.kozlowski@linaro.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	arm@kernel.org,
	robh+dt@kernel.org,
	olof@lixom.net,
	bjorn.andersson@linaro.org
Subject: Re: (subset) [PATCH v3 23/40] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
Date: Mon, 27 Jun 2022 11:15:53 +0200
Message-Id: <165632135505.81841.3584331837885550426.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-23-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-23-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:16 -0700, Krzysztof Kozlowski wrote:
> Nodes do not need explicit status=okay.
> 
> 

Applied, thanks!

[23/40] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
        https://git.kernel.org/krzk/linux/c/aa30ba37ebb4c66c9d0e6b6bddbeda7f84ac806e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
