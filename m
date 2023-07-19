Return-Path: <SRS0=Ao5Q=DF=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81107C001B0
	for <soc@archiver.kernel.org>; Wed, 19 Jul 2023 19:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69FAFC433C7; Wed, 19 Jul 2023 19:22:42 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9185BC433CB
	for <soc@kernel.org>; Wed, 19 Jul 2023 19:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9185BC433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b6f943383eso110411751fa.2
        for <soc@kernel.org>; Wed, 19 Jul 2023 12:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689794558; x=1692386558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ysNwjk8UXaejFC9LhYRBkCbtGa60gstdQxEPQxcWfg=;
        b=j+q/QsMtwtvtTkWHLIVFejo9gdEkiuiWj4pgcdAp0MOIrorwC65O0O1jDj9LOwn42y
         Ti2G3kXuXQao8oWPAjvuiQ28C89qlDFscBQ/WqSKDecM/R91WX4L8rw3WgjLtggyiFfn
         8+j0H0Z0x+jFE9BjbNh/Bjio2wyUnMnXZPEV+A8EKKKmyIsBvAsEUU8PNBo58Y5yy/Pn
         mcZkFz48mzBJRjwmSjrLPvPKt1IlTXGU3I4exHNPzGr8uaVBZE4I8IH/WhUC82kDmHbR
         tyvdYTYL+OIc+k0zwWF3z+RzT1O/OgzWe7RFSNTIfy8kg/k1s/OYb4o3M15VvuXwDelm
         ciog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689794558; x=1692386558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ysNwjk8UXaejFC9LhYRBkCbtGa60gstdQxEPQxcWfg=;
        b=HfmpWY7leNycXZMVqAEEvjSWjT7Evs1Ki1iqnrGkZNtSnDdh69X6KQgpRAii8H+uy9
         ErnFeLd8cyhx/317rq2/T6wji6KhwxDE6GjxYEeN9/uGPrKn7XPQ4tztPnNC6t/SDIpc
         X+p0ilYe3n7V/PCNX2mJM6BUN4KzPZu28jfjSlqKgrVcijH4GT7BkLRtYa8ntZkwL8ec
         /L9x7I1t8mxQBCQteqafT5oeZG3rUDr6EAMYZYDLsvRlO36pdcTyvfw6Jjsl57hg8Yg6
         C7x4WkaFj1jmtdiqQxSboVCWNjHgk+rnYxNtLW9xUwRYbRY7soVx88Ihxxz7ZriHdHHr
         MttA==
X-Gm-Message-State: ABy/qLbsDzGdGj2P7djA3FY0zgYug0G1rlKMd5lOG/AwFO4S7e2nhQpx
	T4N84/CICR7/dspscBoBdbF48w==
X-Google-Smtp-Source: APBJJlE7TgekOShNU0sKY5OWC07ia1vTU2eUCl8ISkIQp3Qxe0zscLREml6szv3jGRvJ2YGFw4mopg==
X-Received: by 2002:a2e:9c82:0:b0:2b6:d2c5:4d54 with SMTP id x2-20020a2e9c82000000b002b6d2c54d54mr595213lji.18.1689794558386;
        Wed, 19 Jul 2023 12:22:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fbb346279dsm2317242wmc.38.2023.07.19.12.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 12:22:37 -0700 (PDT)
Message-ID: <efda16fa-20f8-a3a5-203f-d1325dd00afd@linaro.org>
Date: Wed, 19 Jul 2023 21:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] ARM: dts: imx6q: Add Variscite MX6 Custom board
 support
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230719160048.2737423-1-james.hilliard1@gmail.com>
 <20230719160048.2737423-2-james.hilliard1@gmail.com>
 <15268646-a38f-f530-4c04-1164617d2b25@linaro.org>
 <CADvTj4oPjGZzjJzjRNXprF1Nz9Hmn=Qs+s=0cke5e3Lb27YLFA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CADvTj4oPjGZzjJzjRNXprF1Nz9Hmn=Qs+s=0cke5e3Lb27YLFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/07/2023 21:11, James Hilliard wrote:
> On Wed, Jul 19, 2023 at 11:18 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>>> +
>>> +&ldb {
>>> +     status = "okay";
>>> +
>>> +     lvds-channel@0 {
>>> +             fsl,data-mapping = "spwg";
>>> +             fsl,data-width = <24>;
>>> +             status = "okay";
>>
>> Again, why do you need it? Is it disabled?
> 
> I think so?
> https://github.com/torvalds/linux/blob/v6.5-rc2/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi#L87


Then it is okay. Usually nodes are extended via phandle/label.

Best regards,
Krzysztof

