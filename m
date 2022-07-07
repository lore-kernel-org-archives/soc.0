Return-Path: <SRS0=7j7m=XM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755CAC43334
	for <soc@archiver.kernel.org>; Thu,  7 Jul 2022 06:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4801DC341CA; Thu,  7 Jul 2022 06:50:54 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7FE26C341C8
	for <soc@kernel.org>; Thu,  7 Jul 2022 06:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7FE26C341C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id z25so11959131lfr.2
        for <soc@kernel.org>; Wed, 06 Jul 2022 23:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uK70/rhYUGhSJlSjNPURMjDiBCpuf2mNsuNaQulD/Iw=;
        b=UWPAlyaKtQ/n/u96Fq3tibzMJr1bxsYkWgSS14eH9FJzkIs35O9O1XF/OfMsmBXwdW
         edt8ncYGqUFWxoDLP90CSdmtZ8lGEwkD2OSr6c5Z9VjMVW4xVTKHsE8vcxTfAFEg7MTh
         Q/7sOhvT8xtVHwS9hNQo4LiV7KfTKwiaXJAAY45yp8Ti59TPgpi5RZhz5lMPdkbAYbNj
         j9ljUL8ydPr3rzKvMLx99jGJpuXpzKzqP2xTV0/XlAzJl/vanWk/W9CGHygWILpBe221
         Ub6Ym+UTutaBgEh+8EsUDZtE2qA+ag6ikaPzwuoGqmxD/L6jPTWuav/1HquoV9JK1G37
         qf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uK70/rhYUGhSJlSjNPURMjDiBCpuf2mNsuNaQulD/Iw=;
        b=L+l+5LFVboOnyjF9448OYqQHyi2nfmrTf9A2ay1GO4fAX3OtRtqYoa6a6FL6blaLst
         Bvhk4kpaRFntf2qnJqNxjDpwqcf/FgTTOrnzx5CAn1ym7Le4EZZ5opHklDdwoSU6M1o3
         jxDgM/q0Lw5KZRmRt80mHT3BTW8Sl55cqLYSbTH9t8NGogidR0wRvux/i7p+Bvy2P96p
         oLbtvbYbrycIKRkOlNMgLtLR2o0KIufxuX31z8i8m1ZohptzD3LAUJYhuwl9AI1J67cB
         q+AgiLMfwnoki1P+tXrd6pHkNhTOYnLdvyf1doHJDfuvTdSMt9iz0JyJ3qwAF+h0KlZv
         WPEg==
X-Gm-Message-State: AJIora9bkkTFohUlQIi31GXkZRyFkctonc2L1lopw//TswHgG/5xANM8
	wsa2g06x6Y4uW0EpIdaGMCyI1w==
X-Google-Smtp-Source: AGRyM1sEsLyBbfJ3jKEqStiC0eOawgxH/iIZByD8cbK1YXAhZMMZMX9ltXPSJ+cj1909p8pwapQW8w==
X-Received: by 2002:a05:6512:39d0:b0:481:ed:666 with SMTP id k16-20020a05651239d000b0048100ed0666mr30929880lfu.379.1657176651600;
        Wed, 06 Jul 2022 23:50:51 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id k26-20020a05651c10ba00b0025a736f5a41sm6661009ljn.9.2022.07.06.23.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 23:50:51 -0700 (PDT)
Message-ID: <4108a1d1-7e30-4b02-b614-984d185681c7@linaro.org>
Date: Thu, 7 Jul 2022 08:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] ARM: dts: imx7d: add dts for UC-8210/8220 hardware
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Jimmy Chen <u7702045@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: Jimmy Chen <jimmy.chen@moxa.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707053954.22168-1-jimmy.chen@moxa.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707053954.22168-1-jimmy.chen@moxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/07/2022 07:39, Jimmy Chen wrote:
> Add 2 models hardware dts provided by MOXA company
> 
> Signed-off-by: Jimmy Chen <jimmy.chen@moxa.com>

Version your patchset. You already sent v1, didn't you? So this is v2.
Add changelog in each patch after '---' describing changes.

We have the entire process documented:
https://elixir.bootlin.com/linux/v5.19-rc5/source/Documentation/process/submitting-patches.rst#L308

https://elixir.bootlin.com/linux/v5.19-rc5/source/Documentation/process


Best regards,
Krzysztof
