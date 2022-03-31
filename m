Return-Path: <SRS0=2kil=UK=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2E3C433F5
	for <soc@archiver.kernel.org>; Thu, 31 Mar 2022 06:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 00C97C340F0; Thu, 31 Mar 2022 06:32:09 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CBEA4C34111
	for <soc@kernel.org>; Thu, 31 Mar 2022 06:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CBEA4C34111
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id c10so27545534ejs.13
        for <soc@kernel.org>; Wed, 30 Mar 2022 23:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RXP6C9OjNqzyPqbYU1xP9pjwWinLE7hTwHfvR0zXIkQ=;
        b=T6qdbMuQU3l32RCmqHp4NAQzGPrmTyQNZsN0rPvwto372q5AZ75d+qYcw7hXPjWSo7
         ns22IKxlnpCZtMERQs0X0tv7ae7p2b5DNKUa7UmjK9NCFmFkFUFQ+HxUvi3tU8MUxN1c
         LVPO8NhkuXGRxIHaQ1sLEB8wWlSd/CJ4geZJO0MeYEM2x1XUxYW+62c6aUg3//40qs5w
         o/67mfi3ZSdlN/0SUEZBRdZOas47YC0Udr9ZiRJkjUl9C20T1aPPkNQg+JZF/Bon5zZg
         kwUTETb+jN9Lfn/JM3XNXbdZt41xtwnhb4a+GJV56WQQCEWXl7F8NfTQiK4kGm2L5J5A
         uONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RXP6C9OjNqzyPqbYU1xP9pjwWinLE7hTwHfvR0zXIkQ=;
        b=OoMCEvIZqkqzEe46HX7iCz6VDxKvlEuQgAoJa7ncTk53jAKJOlX6fHitA421W9wEI6
         nl44WOxNZSTFTeRtfVyf8nLg1YwUDE6U/XIWhquFq4Ypxsi11tZChHW9tpzKHYqZ6+b3
         DPIMVrGT6K24lRp5Q2i+PSHx2TxvxsmlHRLFoIvgdDFwfv1+GHY+ANCK5ZdeXQZPWxSr
         SU/pOfHVzKboSEMKHJ8SXuZ13/bclKQzE349I4aghvo2WXIiH9NFR3uOca2VO6igMQIF
         ih/I/xq8+AMGJwfSAn3mpRzWuGwbHmcXK4c0L+rIEzAW8W/XvfNJfGdwelTCEj6R8Kkv
         csVg==
X-Gm-Message-State: AOAM531SEd6JXrJUZAQG1M68vn0dAQTLzgIPwKpg8/LgAEpiSA6jlMRJ
	F6BatbHs2YmNRhoGOybzOYskNA==
X-Google-Smtp-Source: ABdhPJwkt86fLqRFsg6wyRYaKacC714Ln/Xn8Mq0A2ItdpUzPfl37aPI29sHwJdHUIwnJNQ5OlYIbg==
X-Received: by 2002:a17:906:3144:b0:6ce:de5d:5e3b with SMTP id e4-20020a170906314400b006cede5d5e3bmr3514954eje.689.1648708326092;
        Wed, 30 Mar 2022 23:32:06 -0700 (PDT)
Received: from [192.168.0.165] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id sa32-20020a1709076d2000b006df935924c1sm9064346ejc.59.2022.03.30.23.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 23:32:05 -0700 (PDT)
Message-ID: <0c182962-0da0-c3b3-097a-090bf8d871e7@linaro.org>
Date: Thu, 31 Mar 2022 08:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] arm64: dts: nuvoton: Add initial support for MA35D1
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, cfli0@nuvoton.com
References: <20220331024256.14762-1-ychuang3@nuvoton.com>
 <20220331024256.14762-4-ychuang3@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220331024256.14762-4-ychuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2022 04:42, Jacky Huang wrote:
> Add the initial device tree files for Nuvoton MA35D1 Soc.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  arch/arm64/boot/dts/Makefile               |   1 +
>  arch/arm64/boot/dts/nuvoton/Makefile       |   2 +
>  arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts |  23 +++++
>  arch/arm64/boot/dts/nuvoton/ma35d1.dtsi    | 106 +++++++++++++++++++++
>  4 files changed, 132 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nuvoton/Makefile
>  create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1-evb.dts
>  create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> 
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 1ba04e31a438..87e9bda91276 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -31,3 +31,4 @@ subdir-y += tesla
>  subdir-y += ti
>  subdir-y += toshiba
>  subdir-y += xilinx
> +subdir-y += nuvoton
> diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
> new file mode 100644
> index 000000000000..e1e0c466bf5e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nuvoton/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_NUVOTON) += ma35d1-evb.dtb

NAK

This is actually some resend, but you did not version it, did not
provide changelog.

What is more - you ignored previously received comments.

We do not work like this. If you do not agree with a comment, please
keep discussion, not resend ignoring it.

Best regards,
Krzysztof
