Return-Path: <SRS0=QyoN=YP=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B474C19F2A
	for <soc@archiver.kernel.org>; Thu, 11 Aug 2022 10:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4627FC433B5; Thu, 11 Aug 2022 10:50:16 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3273EC433D7
	for <soc@kernel.org>; Thu, 11 Aug 2022 10:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3273EC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id v10so15404312ljh.9
        for <soc@kernel.org>; Thu, 11 Aug 2022 03:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=GdgqiZBfPIDpg/0XLqydNQp/hkRsk27jfUbq0hJePtg=;
        b=X1sOG4x9fMmz51abok9SE1Ca6DqFWsew9xPmWQaF4tV67GAbU7ERN8UF25AtDT8ppm
         ENrw4iirJ98N+J03JV9ebyS/Y9029T9+xAT/ObxREloELVVYocyVk4LgLqPmIn9rHtKP
         M1iaCn74q3+sYIO+lMswRWt8UZWxTYh4Z7UG79kL4oX+T7iIjAx8gRWsUaKO0B3aU2NP
         8Vol9//rVjsCWKsC5pTejKO4JG3wGTnw5hNC30jrL4yRPPAITOjfP0aZhbjv7O05geeL
         oPzPR/EJVDB2p8BtTW7JcYHIvAsA1ISrHU+6jph+0meHNwMIZ/18xO7BlUD3Z8g1+8Ao
         ZFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=GdgqiZBfPIDpg/0XLqydNQp/hkRsk27jfUbq0hJePtg=;
        b=035SxmTgrIv2L5IuFaLw4kS7RDrZqb0UjGS4DPYdlj0DnHYfDK97r7erZ2lu4sl2id
         2/eUwAIvxeRe8IIcwN+fE2btxi6f2fQLC0Pnjl8hbVm0pS9k17dy0lxKE15+HxLiGkhJ
         TCqZrdo9r4Cn2ty/Pt8ep3qkbEWCi4/WSprEqnilUikzhjbs3JSVY4reO6vUjy8eleHs
         vKyJXeDatMWG83vbUyXaejnG6fbU0HY3rUuXAl2J9rSGSoipFjPnncnEuRsddlPm1VLe
         3Wu/iRxrpaU4gzuS61XCpQUMafQIPVTnxNcZpurzZwJ8UyA/15mHOI0AVnCpQZJ5EoXq
         ulhA==
X-Gm-Message-State: ACgBeo3c46pwX0br3JvA36yIVQ7yAol18U9Reo+smcRxw+KwO0cNcsXA
	Q0x1yeGFyneJ9MfrKHvfzzN1iw==
X-Google-Smtp-Source: AA6agR4hd28Wh6s8G5kRM4zOdEwX9i78Sjkjyx5T1pLILHB44dabc9d/NooBeZ8cqu7k0z4g5NxdBA==
X-Received: by 2002:a05:651c:b10:b0:25f:ddb7:694 with SMTP id b16-20020a05651c0b1000b0025fddb70694mr6098335ljr.75.1660215013234;
        Thu, 11 Aug 2022 03:50:13 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id t8-20020a199108000000b0048af39ff3edsm664335lfd.122.2022.08.11.03.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 03:50:12 -0700 (PDT)
Message-ID: <3a4eb13d-f764-f32d-02a5-38f62ce2a3f2@linaro.org>
Date: Thu, 11 Aug 2022 13:50:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] ARM: dts: imx6ul-kontron: Simplify devicetree
 structure
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Frieder Schrempf <frieder@fris.de>, Arnd Bergmann <arnd@arndb.de>,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 soc@kernel.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Denys Drozdov <denys.drozdov@toradex.com>, Dmitry Osipenko
 <digetx@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Luca Weiss <luca@z3ntu.xyz>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thierry Reding <treding@nvidia.com>
References: <20220810081825.19051-1-frieder@fris.de>
 <20220810081825.19051-3-frieder@fris.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220810081825.19051-3-frieder@fris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/08/2022 11:18, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> There is no need in differentiating between the different SoM versions
> that only differ in memory size, etc. It's much cleaner to simplify
> the devicetrees and let them be more generic.
> 
> If necessary the bootloader will update the devicetree dynamically
> to contain the correct size of the memory.
> 
> We also get rid of the N6xxx notation in the compatibles and file
> names, as they are not really used anymore and often result in
> confusion.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  arch/arm/boot/dts/Makefile                    |  4 +-
>  ...6310-s-43.dts => imx6ul-kontron-bl-43.dts} |  8 ++--
>  ...x-s.dtsi => imx6ul-kontron-bl-common.dtsi} |  0
>  ...tron-n6310-s.dts => imx6ul-kontron-bl.dts} |  9 ++--
>  .../boot/dts/imx6ul-kontron-n6310-som.dtsi    | 41 -------------------
>  arch/arm/boot/dts/imx6ul-kontron-n6311-s.dts  | 16 --------
>  .../boot/dts/imx6ul-kontron-n6311-som.dtsi    | 40 ------------------
>  ...mon.dtsi => imx6ul-kontron-sl-common.dtsi} | 15 +++++++
>  arch/arm/boot/dts/imx6ul-kontron-sl.dtsi      | 14 +++++++
>  arch/arm/boot/dts/imx6ull-kontron-bl.dts      | 15 +++++++
>  arch/arm/boot/dts/imx6ull-kontron-n6411-s.dts | 16 --------
>  .../boot/dts/imx6ull-kontron-n6411-som.dtsi   | 40 ------------------
>  arch/arm/boot/dts/imx6ull-kontron-sl.dtsi     | 13 ++++++

Most of these should be renames with small amount of changes. You should
experiment with -B/-M/-C format-patch arguments so the end diff is easy
to read.



Best regards,
Krzysztof
