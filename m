Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF5AC433EF
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5816C341CB; Mon, 27 Jun 2022 09:16:20 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17FD5C341CF
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17FD5C341CF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id ge10so17756945ejb.7
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SvR+0eEQRI3z4aAgIy2QfnH6/ZdPcRL8T76st98sLHI=;
        b=khykCVrVTXWyG3kq4eEFbdV0s7UR3BTerYpdpYVmLlz6H2t5Axcw4uzWDK6ytT8/nP
         TnbSDJvGlfKyKLvC5p0JT9Ziw+SzJ10NomsyTUHfU2ZVr0oqrQcAsiM/yQbe7fqe+j52
         423hQyOSIBMTUAcnuNHDetstFLXZ4foXKwHWPijiVUPydt/YmcgrBd9lOuiAyHhb8eG/
         IOvOmvg7ZXK/aKeM2yecE9TpXS00MuEa4R7/ohUMxyXJNZe2hNBPhqoHOFNrIr7VL8Hn
         inC3JuuIvpfQ1ZDrQm1k55/2vDCeimjNLUMbDdra+37CXUdLl/Wa9k3t9JqY+Eeax8Gt
         p8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SvR+0eEQRI3z4aAgIy2QfnH6/ZdPcRL8T76st98sLHI=;
        b=eFS4EV6MWkZaU7gHy0PVdstCwgBc655Q7zItNYBbzJX6ivT2/2glknUlabPpmpFiJX
         4pnuP3VtHHaWiPGMEagZGpp+R4Vlgff8+NJBxfzLk4a/xQox8po4Y0v8Ts/gLBo+yYr6
         B/Pvgswb6cN4PbNDOptz9F92jL1gihU4H622Cm74RYBgILLV3yTr7RUU2TsMaq96ZA4E
         6wYZRCYXRgq/S4LPNvZjbjmOGVz1VflZUchA4IY63ikAmCnJq1gG3ILw3IhaJUjQdYx8
         k3DoZFv+BkOvzjguZWbXB8LqxsAC9EWx5kAvp4We3MVzSxEHc1AT0mabCKS6/agTjRa6
         jeRw==
X-Gm-Message-State: AJIora8TyeAmillrJECvxUu8EB5tr7bBH4xGqvxorDhy/JaWT/FFQAYE
	4xEVHRIWXwHyrQ2QOLUZZHvbdtyWFmUQTA==
X-Google-Smtp-Source: AGRyM1u/vCa6Cl3Uxumnhta1mwK5omkwE/QjVmlvJnzpQSYVC5E8vkD8gaYz26M4XzhdjrrM6hCyQQ==
X-Received: by 2002:a17:907:7f22:b0:726:8962:d5a6 with SMTP id qf34-20020a1709077f2200b007268962d5a6mr9514573ejc.717.1656321378180;
        Mon, 27 Jun 2022 02:16:18 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	robh+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	agross@kernel.org,
	krzysztof.kozlowski@linaro.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	arm@kernel.org,
	bjorn.andersson@linaro.org,
	olof@lixom.net
Subject: Re: (subset) [PATCH v3 22/40] arm64: dts: qcom: correct gpio-keys properties
Date: Mon, 27 Jun 2022 11:15:52 +0200
Message-Id: <165632135505.81841.1106202309829076726.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-22-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-22-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:15 -0700, Krzysztof Kozlowski wrote:
> gpio-keys children do not use unit addresses.
> 
> 

Applied, thanks!

[22/40] arm64: dts: qcom: correct gpio-keys properties
        https://git.kernel.org/krzk/linux/c/b5ddac0090d9a36a8279a8a998fb5366df1db487

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
