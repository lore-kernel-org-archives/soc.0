Return-Path: <SRS0=XcYy=VV=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7828C433EF
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 06:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3893C34114; Fri, 13 May 2022 06:55:58 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2649C34100
	for <soc@kernel.org>; Fri, 13 May 2022 06:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E2649C34100
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id n6-20020a05600c3b8600b0039492b44ce7so4206585wms.5
        for <soc@kernel.org>; Thu, 12 May 2022 23:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rMyWOXlx04K/zowhHekykpBIHTTdSbgPuSq98Q0e2qI=;
        b=eoOJyapNT+ndXvlawo63JdbVBFmEdqRdH4Zqo7XfhXfh7jiokbYlD3fvSFxH8iNUb9
         Hs0oo1xQltjLHrOVsAcBX+D3UU9DPAoL4C9x0aIEFrVFqK0NYFAMLaBp0uZ+ei5SPn+R
         g4r7Jkq6CApI5SJDmN3o2lINVFkSWbqpltFfTu4wDL0J5b/CC1v8c3U6TlwmiX27HhT0
         pGRpGeBq2ntBAhzbrU4BW3wg8dklujFaZJBrQzAm73AbSJUxz1G4Y1E5XCGRnSDybhzK
         tPs7bgTSIC52wguL5ujiEq/FD6JN6x9MY0ZXdGxHGGWdyRAQXi4yVV3ltDME2+WUAkNq
         PffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rMyWOXlx04K/zowhHekykpBIHTTdSbgPuSq98Q0e2qI=;
        b=4D19XZLJ2HSg12owk0eJ3IyJSM6I/TcyRlWE1jgPcWPXXAnh3ggLVUMes87fINEMVe
         +KueaIejX+baY/XcxzIgItNcYcFsy8C3hhJN7Pg8faB6mjU1Y531lF/BQErHHTaWit8t
         z4DbQo2hOoIPixslkVI/XHCLHMFOhNXmxhcFZSo4YVRx4FmManKmsBV52KGN1D0c0IMk
         nk6y9yuM9yPQVUtGTHtkJra2V3KtQHx6nXQZz7LeP5H6AobTQ1mfh/mYMTNqbBLqgv+e
         LlE14WI8f+Ui7K77o7V3Uvfni4B5BJwHKF9tVhj0N5x6pWaXCj66+HMXRbibQd4vEben
         Pocg==
X-Gm-Message-State: AOAM532274XEIKEYHr/WLQj7LOCug2Sl8GukGxjkDq2CLQENsFZuIrLL
	vu8e/fmL0tLNGarvFL04rIbPjw==
X-Google-Smtp-Source: ABdhPJxu8EE8mgrVxwIbOZhYZD044+qoLpoYp9uv95jr1zn2Ow26I6yTvslJlxbVK3cVtkTnoedKxQ==
X-Received: by 2002:a05:600c:3ca7:b0:38e:50d2:27fe with SMTP id bg39-20020a05600c3ca700b0038e50d227femr13413746wmb.159.1652424956122;
        Thu, 12 May 2022 23:55:56 -0700 (PDT)
Received: from [192.168.0.167] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bd19-20020a05600c1f1300b003942a244ee4sm1788560wmb.41.2022.05.12.23.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 23:55:55 -0700 (PDT)
Message-ID: <9b2ecc28-df1e-903a-c652-2d65fc7d41ec@linaro.org>
Date: Fri, 13 May 2022 08:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH V4 0/5] Add initial support for MA35D1 SoC
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, ychuang570808@gmail.com,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 SoC Team <soc@kernel.org>, cfli0@nuvoton.com
References: <20220510032558.10304-1-ychuang3@nuvoton.com>
 <CAK8P3a1k8y8U99bBmqBYE1vYAc0q-UeaM0oLP4tTHZCpyYNOgA@mail.gmail.com>
 <8be62b40-077a-7634-7d34-7776909a2abe@linaro.org>
 <CAK8P3a3=YD7WV+Www8pf+JTv14DwcnSjD+f=YFCNMxXYT9FAZA@mail.gmail.com>
 <51ce4fca-f7b8-92ab-c9c6-1e57a2a5b5f3@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <51ce4fca-f7b8-92ab-c9c6-1e57a2a5b5f3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/05/2022 08:53, Jacky Huang wrote:
> 
> Thanks for your review and help.
> I will run the dtbs_check, add binding document, and include serial 
> driver in the next version.

Except dtbs_check you have to run dt_binding_check because this is the
one which was failing at the first place.

Best regards,
Krzysztof
