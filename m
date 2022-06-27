Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915B6C433EF
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7FB75C3411D; Mon, 27 Jun 2022 09:16:25 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00EE4C341CB
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00EE4C341CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id q6so17686146eji.13
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Rnil2oBzzmAFKWBgW3OsY0Ty5YXVLJtmCPclQHX6IXQ=;
        b=TE7r9joV5RkyWpMmMS6xGUUY+/AIhhVDmlSDRCS0E7mjodoWoHqic05qpqyEeyLM+X
         jh1m+XLvm3A72UIuK/NEwjibtjlqE7BBYkowIgJVXFpazvQpP54F/mEwVR2etxDHGlTx
         PjSTKR12Ts6ix5CcDIJQ0juOK0r8O/lWN1QZKVP/woBipS+A4ki2W4Gjeh1D0VdiSfon
         hGOZUaJfFuIRiCqHeEOVdoeCMmygemV3E2QOdkCe81VP3Sd+NrdMPcU1ooNfNda6pYGQ
         nlWVXHHOkvbNipBgfpF2Ayxm2/PlYpKf1heVLRaDLEKoCSMkDos9yDNelj1WhgEo1QC9
         f1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rnil2oBzzmAFKWBgW3OsY0Ty5YXVLJtmCPclQHX6IXQ=;
        b=fw6La/EU93ggC6JQhXVt5qL8vuIhooehg5g0UEK4Ju6EgQ032YeSOFCBT2CiLVTYo1
         nquingsRNYiKEddoQtlG18qrLkvVh0JIYABr59I8PYFNHtFVWxjZQn48Oem+w+geUVBF
         WyShizW9JOnIj/W2Ke+bBN15x5CwVKSL/T+w2cOh1HAKVSfnDq9WL5WQtSUa+F5Dea53
         Xz5zegwThJN0DyMrA9Tac5OLfQpTFR6OfqslLf+W5yYIAq4BJ6XPTvpU6+HWIB08wyhz
         rsG/UChL8ucNxiOSALkTW3oHCVTDBswkuXSz+fIyLz7IN/qUXpGR5JWAja6Hyxr/eMCI
         VYTQ==
X-Gm-Message-State: AJIora9LWbkyK1PZiH9zeBarMP55nCUeKcIPSCK9sMhK5n7vE+0dOOVR
	Y/vpTzmRH+d3/WCsjxA478qIk44E0SJ2sw==
X-Google-Smtp-Source: AGRyM1tfOeBrWnaw9bfY3+V0kTOjbpcSVPI4ND5W7FXSp+uKpA6xkrM3pRHzTpoLX2bem0NYQx+XXg==
X-Received: by 2002:a17:907:7678:b0:726:9fca:8106 with SMTP id kk24-20020a170907767800b007269fca8106mr5074882ejc.640.1656321384139;
        Mon, 27 Jun 2022 02:16:24 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	tony@atomide.com,
	linux-omap@vger.kernel.org,
	bcousson@baylibre.com,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	arm@kernel.org,
	robh+dt@kernel.org,
	olof@lixom.net
Subject: Re: (subset) [PATCH v3 33/40] ARM: dts: omap: correct gpio-keys properties
Date: Mon, 27 Jun 2022 11:15:57 +0200
Message-Id: <165632135505.81841.17668467275601346778.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-33-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-33-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:26 -0700, Krzysztof Kozlowski wrote:
> gpio-keys children do not use unit addresses.
> 
> 

Applied, thanks!

[33/40] ARM: dts: omap: correct gpio-keys properties
        https://git.kernel.org/krzk/linux/c/54ab5f367142577b8280f5b03eeb36616980cd68

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
