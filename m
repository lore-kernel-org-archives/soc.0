Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BABC43334
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F22C9C341C7; Mon, 27 Jun 2022 09:16:22 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53537C3411D
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53537C3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id pk21so17812739ejb.2
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0MCWeM5fSAUN7KzvyvAXYoghiEdCZV4+8RpEEX0d71E=;
        b=z3N30FGmS7oL/0ACcSCAro2Pv18Kv+Up91/2Np/lvE6F7X4satw5OZOMRW+C6DLHqq
         eADjlRfKkj9pSr1PPNFt/nPV/hdq4v93If0blPDnunTyagAXZBiY/R/Zlp8YIpjx0Gbz
         Ei6K+VtZwgMqf7LsZaEVBGBZzUk2/a5WYrLbDhSWenxzb2iwJUfa+wqp7FqWmW8nCHS2
         Di+gln8dw3/CUDTLvywEhelQQG5Gj+/fRXMDCnWJzQQZgnjBhap2cAVxm+HzLVSmR0/E
         yb1b1EVQqMstPWdKg/qmUqwThB0bTJ4VzhhY11rG4/ekRo27tXhDOFGROgJhNis0wY+a
         b40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0MCWeM5fSAUN7KzvyvAXYoghiEdCZV4+8RpEEX0d71E=;
        b=OzSljS56ELHXTkAHyycgEPvbm+eu43GuXKhluB0DEQNcL5ae6THAvz4r+7r90V/mN/
         Sq73i9KaR5H31CIMMeUqx82HtvWgdIhg6YwlAtjHj8cm+7fyxmG1w9QIMA7yBNH79Zhq
         N0OCjTRL/kJ1N3uFWPNy8ReVJvBzHZv0vsFPMik89GJXB3FIf17+nkGGh/1iRKR7wtJN
         1VJkfO8rMIyks0xHxgbRdf9vyBItkM/ZCCY/A/pl/d7pSi21FChXNG0F2PZg2Q21XzaD
         3v2DKHacJlyNSMlx7139d4V0OrACaZe+5SvhGzLM8BAGBFej9Mgj8+lthYoPr/SP/7HQ
         MRxQ==
X-Gm-Message-State: AJIora+8Tki6QEDb8PAKmwriYHTfWcy8u4ioxKQ20mXcJ57luSF19RJG
	k7snXc2ielmBBHYD/Fc663lh400qzggTXg==
X-Google-Smtp-Source: AGRyM1ts4Tg9UABy9P4W6KiJiUjWxMpM1KC7YAbt8WjmTehU/m5TJ7uzBLdW/oqZoMzbfMIpyC4pQg==
X-Received: by 2002:a17:907:3e94:b0:726:3b46:ba20 with SMTP id hs20-20020a1709073e9400b007263b46ba20mr11854749ejc.314.1656321381591;
        Mon, 27 Jun 2022 02:16:21 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:21 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v3 25/40] ARM: dts: qcom: align gpio-key node names with dtschema
Date: Mon, 27 Jun 2022 11:15:55 +0200
Message-Id: <165632135505.81841.15098382258100030823.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-25-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-25-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:18 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[25/40] ARM: dts: qcom: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/7ccf54f23a1453d07c67dc000d1ab1fb8b3581c6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
