Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37543C43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 20:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF5D9C3411F; Thu, 16 Jun 2022 20:47:49 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C0AEC385A2
	for <soc@kernel.org>; Thu, 16 Jun 2022 20:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C0AEC385A2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id s37so2452598pfg.11
        for <soc@kernel.org>; Thu, 16 Jun 2022 13:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8mkQGMBJrk6BBcb54d2vy4LTJbv5rtmJxE9+gCXOISg=;
        b=gs5hIkkevELXHjJGDcwPbIuUT5tpTUGZQfIg+372cYYZ8YgnGDcFw8lLgGLoM6pD2o
         ug5tUnRBdPx5TPghYyA/hidvSYP9dbtkLALTfjropsMRb7+M/VghTYvgtsACncbnPVCN
         K3UPHxA7E9RYTge6/38946lhr6Cgr8nj+2ppoyugHwdS63UWlM2pMhc4hxM3i0EcucKO
         nm08QIMJRHDb9hUrDq7bzVSziwcIKVIDEEpjo0FDkbPR2WMtRBJggi5nA7SWXEf0dtbT
         nFNMHAFo5LauVkWTrDM/KnBaDMhwK74WLJrnNzsHPkbW3DCbWYxD3dR5Jxdtmm/0ruRk
         x5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8mkQGMBJrk6BBcb54d2vy4LTJbv5rtmJxE9+gCXOISg=;
        b=IrU7UgSCyPGR2HzRvSRQXyLUrEYgEC8lxV1XIY2qPJ4Ica/VdLlJUDKqQ0SVthcF4k
         li36lb+W/JcHnIvqbicnMsYkiw8DKlIp/2S9uU8uRq0IDDVeEH05l46qe0Zqpz17PD1N
         FXI14axJiLm6iOFfv7TcKaefrB2vXbndr5qP+oBhtlWZz6JQ8JNlyK3a4ZbeTic60uwG
         Akj2mQrsVLkuas5z9GoaSlGOOU2TCAQT6GwNBt3nCeSpbHJXRY+b11u1AqZK0WatzdUE
         pHCRd9QNw2Ivvv7Mw00MXZ+G88gYEzqvjrX8H4VmfW+7Z2rNGT5AP5OyOTxOmv30AabF
         ZbuQ==
X-Gm-Message-State: AJIora/ZE9zYD9nyB8ESmqeyfK/+w04lcICc4iAH+kuA1pMw+UpiFhQI
	FMGxgQ7ATZE5sqDz8Km+ZypP0w==
X-Google-Smtp-Source: AGRyM1umul2cveC2V4GU+0IxkIzY8laM/4iExUGl7/26opoj35jWKuOY+a+v9t5hKuNlHM9fOttTcA==
X-Received: by 2002:a05:6a00:1907:b0:4f7:945:14cf with SMTP id y7-20020a056a00190700b004f7094514cfmr6525417pfi.47.1655412467848;
        Thu, 16 Jun 2022 13:47:47 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id 203-20020a6218d4000000b0051ba0ee30cbsm2165453pfy.128.2022.06.16.13.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:47:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	soc@kernel.org,
	arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Gregory Clement <gregory.clement@bootlin.com>
Subject: Re: [PATCH 1/2] arm64: dts: marvell: adjust whitespace around '='
Date: Thu, 16 Jun 2022 13:47:07 -0700
Message-Id: <165541242280.9040.16872355826350454829.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204525.832847-1-krzysztof.kozlowski@linaro.org>
References: <20220526204525.832847-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:45:24 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[1/2] arm64: dts: marvell: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/8c1be9336e9ae3e5e421f04143cf5967f5436364
[2/2] ARM: dts: pxa: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/4580f60b2337aa9f1da5a493adc5d609fe126185

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
