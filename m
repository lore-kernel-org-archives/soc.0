Return-Path: <SRS0=s+Fb=2Z=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57BBECAAA1
	for <soc@archiver.kernel.org>; Mon, 24 Oct 2022 12:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0626C433B5; Mon, 24 Oct 2022 12:25:26 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99F10C433D7
	for <soc@kernel.org>; Mon, 24 Oct 2022 12:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99F10C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f171.google.com with SMTP id s17so5892148qkj.12
        for <soc@kernel.org>; Mon, 24 Oct 2022 05:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kVYj3QCBceIQ1q0wupJzLP0eSYUUbr2KRyu/kK2/7zc=;
        b=G0DWAFKOqyqQFdFIXlj6kLBpRnL5JYzlLp0E6WVy4pls3/6j1AeLtxzxBZ+jhLV++/
         PxHwC8uWse4I21Ym1lUCctWJicItZ9iEVOYX8Zcr9KIfD34MRXA+/Po28atn5QAX6ZNy
         k0v0iZYVXFg+8BTYHuXTpqhOYFcbX2bEFUF5ZlIPXjXBnibhTJnVqr8Xf0zyHHEoUwMk
         BuPuwWFDZdb7LxzX9D/z4tHwdMqfwK8ojwOnJJ9APk1xpHu9coKLCb2z+3XGXdrbx4gD
         6cS65pGdMJEyUJ+/nb33LGpxrL9SaqhVoD30uprXtaUUNXFTopDYnugtpAsxcLkQNqcU
         qAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVYj3QCBceIQ1q0wupJzLP0eSYUUbr2KRyu/kK2/7zc=;
        b=dQ7jl+ZeYURkTpV04XEMo5e17xxtOCrzpH63F3ml9+vp3fFCaG+6KogPZqxcxTeUDz
         ly7jzPsLAwyK7KCFxG4YYmw62gBRCmDZPQ4xarw0n7Xuivmr8/vultiyvPqPLKrzkt2h
         NZaWHAH+oBfiZJgLvubHUnNny7X1nM3LeonmxB1FQCbrv0Jvr14HTMdOSI//hzsre6AB
         Mx4FYTA7k5FtREpfTY4Z+R5Jj6MVCM83PAzrlWW8ouYRBAG0rFriJDODd6/RNd/T51H7
         UoRtWWMYO8IJ57JVd/Saee6UYjYqtMglLXWkfBMkJv62UqHrxKfvCloJlD7hb0X4OHJR
         TB6A==
X-Gm-Message-State: ACrzQf2iSgd8XPsIzi0Vd89hZvd6PizrMzYuTCMiESL/19Sm9yxf0U/o
	289wh7ORIsnIA0HJzDEnmdKpQQ==
X-Google-Smtp-Source: AMsMyM6WG2RrPBdlHGOnuUF5Zn/OxURzRJxpLn8hbsfkyCG52+3lz7p0PbPJNXd2mLDYhFv1n98JaA==
X-Received: by 2002:a05:620a:22cc:b0:6ee:3e43:ac40 with SMTP id o12-20020a05620a22cc00b006ee3e43ac40mr22841775qki.454.1666614323567;
        Mon, 24 Oct 2022 05:25:23 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id f4-20020ac84984000000b00398426e706fsm12571885qtq.65.2022.10.24.05.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:25:23 -0700 (PDT)
Message-ID: <41060ee4-0103-3c09-632b-81af396c0a06@linaro.org>
Date: Mon, 24 Oct 2022 08:25:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 01/21] ARM: s3c: remove all s3c24xx support
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
 Simtec Linux Team <linux@simtec.co.uk>, Arnd Bergmann <arnd@arndb.de>,
 Arnaud Patard <arnaud.patard@rtp-net.org>,
 Christer Weinigel <christer@weinigel.se>,
 Guillaume GOURAT <guillaume.gourat@nexvision.tv>,
 Heiko Stuebner <heiko@sntech.de>, openmoko-kernel@lists.openmoko.org,
 Jonathan Corbet <corbet@lwn.net>, Alim Akhtar <alim.akhtar@samsung.com>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-doc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-1-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The platform was deprecated in commit 6a5e69c7ddea ("ARM: s3c: mark
> as deprecated and schedule removal") and can be removed. This includes
> all files that are exclusively for s3c24xx and not shared with s3c64xx,
> as well as the glue logic in Kconfig and the maintainer file entries.
> 
> Cc: Arnaud Patard <arnaud.patard@rtp-net.org>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Christer Weinigel <christer@weinigel.se>
> Cc: Guillaume GOURAT <guillaume.gourat@nexvision.tv>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Simtec Linux Team <linux@simtec.co.uk>
> Cc: openmoko-kernel@lists.openmoko.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

