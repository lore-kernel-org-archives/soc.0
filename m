Return-Path: <SRS0=rc4N=V6=gmail.com=groeck7@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A989C433F5
	for <soc@archiver.kernel.org>; Sun, 22 May 2022 16:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9165C3411A; Sun, 22 May 2022 16:45:57 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B37F6C385AA;
	Sun, 22 May 2022 16:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B37F6C385AA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id r3-20020a9d5cc3000000b0060ae1789875so6401196oti.13;
        Sun, 22 May 2022 09:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A3MW2E4hPy/aQENWXOJ2JWZ+xI8KBMasjdB1XQlQXhk=;
        b=fKUUM7yY2M3lYi3DacllA37dpumIb+5hsm4dGf862dt912aTwJh8O+JEDrr8XE4/Ao
         /O+xEx8SUbw2Z+V0qTdJmLn/1+t41l7ol0S7LAxefEQMBwC1XJhqQOtfCtIB73JgXOR3
         OvjT1vbQbn93hcd2cAQdnZVGk8QLX4BxAh2XE/2kB3vu5Gun01Sq2aL6hCWl19gFDqS+
         lXWmOGGP8f4NAEyrFbYAffWuz9qh/9lkvljoE2Tk7ZAPBhSnGZIGz36rtY1x1R/nCoRr
         KMy1HxbOp1tN4zmy2vN1V9LnSn1Tz1sizrk7jMXsGuDrFlZBLzLp+P6BMJ3xlz9i09Q4
         zZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A3MW2E4hPy/aQENWXOJ2JWZ+xI8KBMasjdB1XQlQXhk=;
        b=PM+XwL4mOyID+ckT5kOur0xm72J0e1EddJyEO3RjaqgeC9uI8TPzSngFZOurMyK3ps
         cl/UdWiEDv/Afr14lDpMn0xT6zVo66uNuiY1pb/0ITWfyFGfxgwtMshZqHN8fcOYBhcX
         +sAJ9ta72dStleEcIMyx0Ig9ckzbgvlVMlrq9kW87ebZ8ho1FEQdKN0ouYRQ7lg63qhV
         tFsyLADC+k54pui0WQK+pAnohSVuYGyRFtZasNsyJ+KHLOysz32obuaLj/oFhHR0Pg0/
         EK3OTjqowtLsjbPt6vnO0LIUnb+jk3ydU5BQOz2koK6rFmXR1MSosriEXSdBpq2YUeDe
         8n7Q==
X-Gm-Message-State: AOAM532j/IAL4I64sso32PMZ4ZNS0qhRnriF9qaYl42HkaHJWFu5hIJP
	uovPhvANHBWw/277M6Uw070=
X-Google-Smtp-Source: ABdhPJwF7V+fwRvOwZOSp3lwb6vsxQ0qSZ6aw4g7kZDyU1NwNpYq17KF/k0k72MH8MxbQ3y6RscDVw==
X-Received: by 2002:a05:6830:124e:b0:60a:fff3:c05b with SMTP id s14-20020a056830124e00b0060afff3c05bmr2616441otp.264.1653237955725;
        Sun, 22 May 2022 09:45:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m12-20020a4a390c000000b0035eb4e5a6cbsm3423043ooa.33.2022.05.22.09.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 May 2022 09:45:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6d691a7d-7601-a077-fc8e-67e0c4917615@roeck-us.net>
Date: Sun, 22 May 2022 09:45:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 06/19] watchdog: npcm_wdt: Add NPCM845 watchdog support
Content-Language: en-US
To: Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
 tali.perry1@gmail.com, joel@jms.id.au, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, wim@linux-watchdog.org,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, olof@lixom.net,
 jirislaby@kernel.org, shawnguo@kernel.org, bjorn.andersson@linaro.org,
 geert+renesas@glider.be, marcel.ziswiler@toradex.com, vkoul@kernel.org,
 biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220522155046.260146-1-tmaimon77@gmail.com>
 <20220522155046.260146-7-tmaimon77@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220522155046.260146-7-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/22 08:50, Tomer Maimon wrote:
> Add Nuvoton BMC NPCM845 watchdog support.
> The NPCM845 uses the same watchdog as the NPCM750.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>   drivers/watchdog/npcm_wdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> index 28a24caa2627..0b91a3fbec09 100644
> --- a/drivers/watchdog/npcm_wdt.c
> +++ b/drivers/watchdog/npcm_wdt.c
> @@ -231,6 +231,7 @@ static int npcm_wdt_probe(struct platform_device *pdev)
>   static const struct of_device_id npcm_wdt_match[] = {
>   	{.compatible = "nuvoton,wpcm450-wdt"},
>   	{.compatible = "nuvoton,npcm750-wdt"},
> +	{.compatible = "nuvoton,npcm845-wdt"},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, npcm_wdt_match);

Acked-by: Guenter Roeck <linux@roeck-us.net>
