Return-Path: <SRS0=D0ga=TS=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8237DC41535
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 10:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59A6AC340F7; Mon,  7 Mar 2022 10:21:11 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 966AFC340F3;
	Mon,  7 Mar 2022 10:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 966AFC340F3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id qa43so30712170ejc.12;
        Mon, 07 Mar 2022 02:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Gklbw6NojNX9LElaFUzhIaJ+ODG7CHLZKWRF0mPmNTQ=;
        b=eSshe5UGTjiHDFcnqvluRXclGlp073yvr22D17oYK7ygMNiddvkJLnEFITbcTcM1p3
         qrl2RR+aVpeEjma3JGBwb+mm+5LopUNX4yVALxaIbQ5fQUX1Uv7ISuOHPRnsUN38N0MQ
         Paoo6quY4PQ1GSC7uFm+gHqRRnZvq9kErLZPeih0IAaBjFXJczxqp53uty0h0cZvUnnv
         BAEeaLzn1KSqwMxKO6hR08GKEi3g4WimmJY7D0BXmYHk/o1ZP8Q2JjZ/cqjt5FU96KjD
         HHdgfNtOQDC4acfb/smVIMlovLXEWz6kUTWlTUtbr7BvohyjwQ3XQJ5/N7akyLmhogIl
         5E3g==
X-Gm-Message-State: AOAM531/K6gxgMdhB1e6p9w3BO+uqdIGKaIGvhakZE36gXXekNQF6O9U
	Uj/xsKhP93vtz8pFlbGxZq0=
X-Google-Smtp-Source: ABdhPJy21DbK07SCgek3zh0yMBqPZ8MlpeuXaq1JdFirxPsVEyr0x6vQ0zDAW41uHxvAu24AWYpx1g==
X-Received: by 2002:a17:906:5d11:b0:6da:68ed:270f with SMTP id g17-20020a1709065d1100b006da68ed270fmr8736100ejt.661.1646648468731;
        Mon, 07 Mar 2022 02:21:08 -0800 (PST)
Received: from [192.168.0.141] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.googlemail.com with ESMTPSA id r14-20020a1709067fce00b006db0edb8a80sm1604632ejs.225.2022.03.07.02.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 02:21:08 -0800 (PST)
Message-ID: <81e8d2cb-c935-fb83-4a29-5ec9dfce16e8@kernel.org>
Date: Mon, 7 Mar 2022 11:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: add binding for MA35D1 clock
 controller
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>, robh+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, arnd@arndb.de, olof@lixom.net
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20220307091923.9909-1-ychuang3@nuvoton.com>
 <20220307091923.9909-2-ychuang3@nuvoton.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220307091923.9909-2-ychuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/03/2022 10:19, Jacky Huang wrote:
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
> +/*
> + * Copyright (c) 2022 Nuvoton Technology Corporation.
> + */
> +
> +#ifndef __DT_BINDINGS_MA35D1_CLK_H

Please use header guard matching more parts of path, so:
__DT_BINDINGS_CLOCK_ NUVOTON_MA35D1_CLK_H


> +#define __DT_BINDINGS_MA35D1_CLK_H
> +

(...)

> ________________________________
> ________________________________
>  The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Nuvoton is strictly prohibited; and any information in this email irrelevant to the official business of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.

Since I was not intended recipient, I am going to NAK it and delete all
copies.

NAK. Cannot be included in Linux kernel.

Deleted from my computer, but I cannot delete it from network servers.
There are just too many of them...

Best regards,
Krzysztof
