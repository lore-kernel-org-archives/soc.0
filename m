Return-Path: <SRS0=9mgv=YI=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C5BC00144
	for <soc@archiver.kernel.org>; Thu,  4 Aug 2022 07:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9FA51C43470; Thu,  4 Aug 2022 07:05:27 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7B8BC433D6
	for <soc@kernel.org>; Thu,  4 Aug 2022 07:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7B8BC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id y11so29492514lfs.6
        for <soc@kernel.org>; Thu, 04 Aug 2022 00:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8nMuzVeetPyhe+M16iIwrFxgbYWe0kXYut8sK7EQU0Y=;
        b=lD5CSRtXzBY36OaOtiXdl27m3c6V+TNn43Zwl1Qv7zaK2KULIMLwbv9FPsoBFXB4aE
         lqMoIcQqEdiaokJTtdDxsOgsrBGqKhdhoVK/ry0euHC47RtoWG8/KBwiBm21OYPBC1Z2
         4PkLG0prwBsvAWEz5xjzPmMV95G7Gs+lzBKGQOd6l2j1mfYG1Ux+vbykdn0gVyIlosAW
         OYsBRENhh0zzL35Q7xQMQyapfUnAAHddd3qhB75JQTVEwpZg9yQdrD9+lmfzZg5mOomk
         uiTE0X+bT6VXPoynAUprQ2I28PZEvw6jE+MYtoo397KAxc/bgmh3FASAQ4HpPTK91y41
         evHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8nMuzVeetPyhe+M16iIwrFxgbYWe0kXYut8sK7EQU0Y=;
        b=OjOsZ44/JnRTS35+b1Cm7DsiofqJnmytlalwveEmLXr5ZizBDOGNpAXBXax5BU/6uh
         IftzZkpY6K9WtQAThmx0VY4/p5flPzXn9SsmSr0QiKTEXVkc8xmO6An8JmRdhZV9i76j
         /3re/RkY3gXGZ8Eoj3lh2ArbKl/xguZRJRs/scY9afgkFfcpYImq01hHU0fXUF4H2FOY
         ckNp2jlwMFeO+TNIjDEFmheBVAGFsQx8wD8bSV6YVfrNDkijdLgAiAIX6Or0FfrGY/o6
         deC8JzrMTgpKoftWnSYaOedql6TD5XCLeqRDKonGJrQM2RsczyqG10Q9BzGfli3u8z/X
         8jxQ==
X-Gm-Message-State: ACgBeo3qv3SBZ8XIs1S38yQ20oCR7mDNbVOxGRqGDj29M3gPVY1XJeDX
	5qyuigTaZpK4k3GixL542IU3JA==
X-Google-Smtp-Source: AA6agR4nu7I3vhsmogjlzU0lvqxd4qGusLqm2g20Ed9y4Ai1CgW6tIioiBSmBvwIuInJs6NkltBZeQ==
X-Received: by 2002:a05:6512:33ca:b0:48a:779b:fbe2 with SMTP id d10-20020a05651233ca00b0048a779bfbe2mr239568lfg.557.1659596724770;
        Thu, 04 Aug 2022 00:05:24 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id v14-20020a2e2f0e000000b0025e436214c8sm15160ljv.78.2022.08.04.00.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 00:05:24 -0700 (PDT)
Message-ID: <535f97e5-5a79-5d62-fba4-419a451eb14a@linaro.org>
Date: Thu, 4 Aug 2022 09:05:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 1/2] ARM: dts: imx7d: add dts for UC-8210/8220 hardware
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?B?SmltbXkgQ2hlbiAo6Zmz5rC46YGUKQ==?= <jimmy.chen@moxa.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220719030718.28826-1-jimmy.chen@moxa.com>
 <SEYPR01MB4272BC601A478A322F964AFEFA9F9@SEYPR01MB4272.apcprd01.prod.exchangelabs.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEYPR01MB4272BC601A478A322F964AFEFA9F9@SEYPR01MB4272.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/08/2022 08:53, Jimmy Chen (陳永達) wrote:
> Any advice is appreciated for this patch?

You already received comments and did not implement them.
https://lore.kernel.org/all/df14931e-847e-4776-74ae-8c35a1cd863d@linaro.org/

Implement first all the feedback.


Best regards,
Krzysztof
