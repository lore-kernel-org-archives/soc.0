Return-Path: <SRS0=9Cuv=WO=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A43C433EF
	for <soc@archiver.kernel.org>; Tue,  7 Jun 2022 11:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C55E8C385A5; Tue,  7 Jun 2022 11:57:00 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2411FC34114
	for <soc@kernel.org>; Tue,  7 Jun 2022 11:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2411FC34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id v25so22670333eda.6
        for <soc@kernel.org>; Tue, 07 Jun 2022 04:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9yUA6xZ+TgF7E05GHOHfVerF3dIUaRPmpzkb0SqFslg=;
        b=yZF938OJ/O7+VlTfOCAPvgavpyjTL2l5Dn0Tn2nIwpSe55xG1IS+57nq5ALnIDLec5
         79x4zkTiEbOgwCtHLa2fhZ6iEu7D/lMorP76inFutqBeQJldod8/6UKADExabiSlqIZq
         7rJDPGd5+1ninnZI67YT6mdGZGLaV7/tQ/7ZzIF7BwPODSUOM1S9QaAQK6gUDp23lTd9
         gKGU3+5H5GU/ValDpNcmAVHC/SiNrjA+eDInhSLCfU/8aPrUi7hryXGpr/h7BVjHK6AI
         Chjo1f2a4t4ZOsYIOaYc+aElJ5n6uhyYpsQWQsYJQ2JhdcqiYa6bvS4vcxEwwON3K/Nu
         euzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9yUA6xZ+TgF7E05GHOHfVerF3dIUaRPmpzkb0SqFslg=;
        b=ctBurEFljW3iW0aGIubeBUl4aWJhk/b/ae7aJsWSHRrdyT7hYs8w5h0QOAHQaTeJjC
         elDVTRkq0GndLj08Xri7jTIolnvy2YTshD/5FGBRO5xqBgCgYleA2j6rrymmG3Cads4R
         88AAwqviUv2uSdlvZkuX9TOc+v0wVdgdeqEI02/lmwOOhtxUDJN8GvPI7ItXB93qmnmu
         dTwek0BybIxlJDxwThjT46F++TsZzEwY0s+owBJkZstZEyPvGOEUEw+kWvyIJGr9NryW
         DHxDep/HC5GohavGoClpqPYznbOm/aXKRUi2JqH7Gl29HJrnnuRauDGHLVuPjTTOM9tu
         3GnA==
X-Gm-Message-State: AOAM530674IqQURxg7FLtncJ7fAI3ppglOpwVs8Io2g8es4T9zdjrGHf
	vGDD8y9B27q0lDKJKVTYNhXLYQ==
X-Google-Smtp-Source: ABdhPJyDyZBQOke271JtAgNt1hSBlmSVUkFbj2ZmbW/2KkYdQf3mrTIq3KxTSW9YKCe45nHpZbAZ1A==
X-Received: by 2002:a05:6402:438a:b0:42e:985:4944 with SMTP id o10-20020a056402438a00b0042e09854944mr31974058edc.283.1654603017338;
        Tue, 07 Jun 2022 04:56:57 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o22-20020a170906601600b006fe8b456672sm7680363ejj.3.2022.06.07.04.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 04:56:56 -0700 (PDT)
Message-ID: <5a604d43-92f3-2709-bf3e-098a9d2dfa54@linaro.org>
Date: Tue, 7 Jun 2022 13:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v17 01/10] dt-bindings: arm: sunplus: Add bindings for
 Sunplus SP7021 SoC boards
Content-Language: en-US
To: Qin Jian <qinjian@cqplus1.com>, sboyd@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 mturquette@baylibre.com, linux@armlinux.org.uk, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <cover.1654565776.git.qinjian@cqplus1.com>
 <2b3d1c0f7b83f9e317ecd68965b6cbf7d7f3d13b.1654565776.git.qinjian@cqplus1.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2b3d1c0f7b83f9e317ecd68965b6cbf7d7f3d13b.1654565776.git.qinjian@cqplus1.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/06/2022 03:58, Qin Jian wrote:
> This introduces bindings for boards based Sunplus SP7021 SoC.
> 
> Acked-by: Rob Herring <robh+dt@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>

This is not a correct address in the tag. I never used such. Please fix
all reviewed and acked-by tags (mine and Rob) to what you received.

Mine was:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
