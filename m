Return-Path: <SRS0=VHtD=7X=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603ECC76196
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 10:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44B0DC433D2; Fri, 31 Mar 2023 10:05:35 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE2D2C4339B
	for <soc@kernel.org>; Fri, 31 Mar 2023 10:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE2D2C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 20so22498313lju.0
        for <soc@kernel.org>; Fri, 31 Mar 2023 03:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680257131;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BsStaUG11h8bzqxHS1KQeYi+Sv9fMLA3dnuaKtFNY4s=;
        b=NV65GEzRTuVuxImzm9SJGKlzvNrIqUbiS3U2NyZcfWJW6CcwPIwezESopiVAOMpBfN
         ev3KQZdlgC0sbhisKeS953JFn9Xg0ZXeOqRRMQjC86GVR57s/Is1Bn+azEln008ZdU1E
         ErjmAetYC0fcjibgL3Uz7/g57KyzciYa7u2Tx0PqQKUwligJ2lHP16fGScLb5FgYC067
         xXGJ17Hmw/7eZ/AjByjPImZTysw+ediOPjdeSfYLWR2xZJYWIFVJqfG4Buw/v7lZF5LB
         /Qxdi7YUTHE09iI5daFAOeddowUX3IuAuIsi8K6mA+mkRBjWxPn3QgXj0UquHWHq4ScL
         m4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680257131;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsStaUG11h8bzqxHS1KQeYi+Sv9fMLA3dnuaKtFNY4s=;
        b=NEpQB06I9qX2fIhDO+5iSzCkyFRSL5lDtpkawhgFhfjyF8XEjQV5MG8jI6ePl02CEt
         krXPKA4pz3x5AoX5o0I8Sy7rZOhF/RAQb/cv4p2Pt7CBOOHWcBXHGVbSXSA305kAFv4D
         DPh9xySdXTxMpdqAxVPdiIbiNTFa09Js9FxU7Zdq0Whko+p4L2S+J6G88XgS4soVvXWl
         DifVPh1sABDKNC+biWAMhsCD42TlGipJts6xVCU4YyCH2epQDG3bGBQ/ubyVoFpllZzE
         lVVunNPAhz0mLTqSncUvLgPx+vF3F2dJTo1Ff/oQTOrZA88bkQv9WPPlJfqlJXhWCGU7
         Zjyw==
X-Gm-Message-State: AAQBX9cC/+Hll2dIKtQQhlYU3HBuk0huNpDehhO9kt+8PgwjqgFfqQdX
	ZcnXYKkovbI0+TBv0x9XxjIhgA==
X-Google-Smtp-Source: AKy350bd2vaWzcabHYWG4YJLk/Jaf0al1Fogywhvk1qTn0tzYido2/xgrWFafBtyYlmrGMmZMT9lLQ==
X-Received: by 2002:a2e:8795:0:b0:290:6e01:8d0b with SMTP id n21-20020a2e8795000000b002906e018d0bmr7828253lji.26.1680257130718;
        Fri, 31 Mar 2023 03:05:30 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f4-20020a2e9184000000b00298dc945e9bsm295792ljg.125.2023.03.31.03.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 03:05:30 -0700 (PDT)
Message-ID: <b0f0d567-29e9-8d92-4d1d-9aade4a91359@linaro.org>
Date: Fri, 31 Mar 2023 12:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V3 4/6] dt-bindings: ARM: fsl: Add chargebyte Tarragon
Content-Language: en-US
To: Stefan Wahren <stefan.wahren@chargebyte.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Evgeniy Polyakov <zbr@ioremap.net>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stefan.wahren@i2se.com
References: <20230331095715.5988-1-stefan.wahren@chargebyte.com>
 <20230331095715.5988-5-stefan.wahren@chargebyte.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331095715.5988-5-stefan.wahren@chargebyte.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2023 11:57, Stefan Wahren wrote:
> This adds the compatibles for the chargebyte Tarragon boards.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
> ---


This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

