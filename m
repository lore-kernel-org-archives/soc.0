Return-Path: <SRS0=2kil=UK=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E44C433EF
	for <soc@archiver.kernel.org>; Thu, 31 Mar 2022 06:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C84DFC340ED; Thu, 31 Mar 2022 06:29:23 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 918C0C340F0
	for <soc@kernel.org>; Thu, 31 Mar 2022 06:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 918C0C340F0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id bi12so46014288ejb.3
        for <soc@kernel.org>; Wed, 30 Mar 2022 23:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=M7HnRXS8ki9auACx5m4t264mmjUE2bAJ8U4PZKnd4Ho=;
        b=gIutq7OiCYAR4J7scRouIcS85qZpcD3wP3KFhISUJKkMRweNyECinL3s6VWksrnTPL
         McNk7ELEplAZFydI9Ihx3pXyvb2DWGk669kxevLxwlmn7Itszsub3kmsr1cFU2okLvK/
         tv6ymHuwfrgJORnpLyy1FQpXtfMDoa5qM60AvIGx/hoggt7US2Mubbc/+W31tXakeU6g
         5n7+yzG6ejb4dx1G9rEFiYJHnBvgx7fz55gw1kgyHYAkG1CY5GvKoSpig5UDSoKLVWSS
         PsPgh8kkls9K1tDvYfgZfJ1Ww2smKOB1Jiik2u3F67WCpgjy14UJrgeFBlGQJzCzHDww
         b9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=M7HnRXS8ki9auACx5m4t264mmjUE2bAJ8U4PZKnd4Ho=;
        b=lta5GBB6pjKwqcp+IDDgKXZ3nvFV+ltUpc6NdZqW+ax6jwqDslU9nnYuJ920RPe3dF
         7J2o08V2GAZwiIDnrTtZ1vfZTtOQ/iAXATVnu3g8AdSZzOkpQ3DKwh/FQzES3kxa1Neg
         URT3rGc+ABjRAvfjvYYVoaJ+lj0LccjMy49XKhU9pJfF3z6/p6cWteHTr8+sWSUKB5Ea
         Uh+Q0KWEYkxQReA+ICgCk2u11QfLSKk2WC4pRMxzn50TVyS3eWfcirMUB2LctFlTLEkg
         LWiSXYOYUZp/35Bv/vIUi9TDp4uNSfH4uIm1xNwc0sFqiC+s9q9qQ1bLXR3qezrXQE7t
         TKYg==
X-Gm-Message-State: AOAM532hE2U2YiAT9fnVZJY4ZcHJIq5OK8Looidp2Mlo4WHx1DRoH0iH
	wq32yi8/QvRLPvhId2U5Oc3gEw==
X-Google-Smtp-Source: ABdhPJwevveOArflEso+HTdUotyheR45XpywF2kU6sgy5+5pNxmXLHHbHCqLA7sF9nDwnvz7C0JDEg==
X-Received: by 2002:a17:907:7ea6:b0:6db:ca53:9b0a with SMTP id qb38-20020a1709077ea600b006dbca539b0amr3506829ejc.763.1648708160890;
        Wed, 30 Mar 2022 23:29:20 -0700 (PDT)
Received: from [192.168.0.165] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id ep16-20020a1709069b5000b006daa26de2fbsm8894521ejc.153.2022.03.30.23.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 23:29:20 -0700 (PDT)
Message-ID: <866c6b42-434d-e7db-5319-2256cd7003d7@linaro.org>
Date: Thu, 31 Mar 2022 08:29:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: add binding for MA35D1 clock
 controller
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, cfli0@nuvoton.com
References: <20220331024256.14762-1-ychuang3@nuvoton.com>
 <20220331024256.14762-2-ychuang3@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220331024256.14762-2-ychuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2022 04:42, Jacky Huang wrote:
> Add the dt-bindings header for Nuvoton MA35D1, that gets shared
> between the clock controller and clock references in the dts.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  .../dt-bindings/clock/nuvoton,ma35d1-clk.h    | 262 ++++++++++++++++++
>  1 file changed, 262 insertions(+)
>  create mode 100644 include/dt-bindings/clock/nuvoton,ma35d1-clk.h
> 
> diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
> new file mode 100644
> index 000000000000..3634e5edcac5
> --- /dev/null
> +++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
> @@ -0,0 +1,262 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR MIT */

Can you make it the same license as bindings?

> +/*
> + * Copyright (c) 2022 Nuvoton Technology Corporation.
> + */
> +
> +#ifndef __DT_BINDINGS_MA35D1_CLK_H
> +#define __DT_BINDINGS_MA35D1_CLK_H
> +
> +/* Clock Sources */
> +/* External and Internal oscillator clocks */
> +#define	HXT		0

One space after '#define'. Please do not introduce some non-Linux coding
style.


Best regards,
Krzysztof
