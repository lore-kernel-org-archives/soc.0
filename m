Return-Path: <SRS0=4tul=M4=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED62CC4338F
	for <soc@archiver.kernel.org>; Thu,  5 Aug 2021 08:57:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C24FD610A8; Thu,  5 Aug 2021 08:57:07 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FC4561029;
	Thu,  5 Aug 2021 08:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FC4561029
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id s22-20020a17090a1c16b0290177caeba067so13181655pjs.0;
        Thu, 05 Aug 2021 01:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uBGvDrKwcptU4eI40KiqTkmrFiw969jPWA+k2q+CekM=;
        b=kNboybg+6Kjx5JPc/fxOD0oELVczHRj++IDC4hjC0/OJk4oKrRyTu8M/whUk444G3z
         z+fRzPQgeChY0IafDiRl71BHTnwukeLwafgpiosx++y30fCAqhxNrfr7UiEYDTKFvXr2
         dqkQ+2Ld7LKQhj2ZzLXZejyt4Gq4hF4mWUougONkFY4DVy5NPITwb4kBmKAwwOQU6jCS
         TrXao+msXwv0tXe0VFsDyhbi2/VrcLkNZA/Zg8EGlLXevzJnbH51b45b8ax4LMNkWFOS
         5JhMONx+HcEtJwUORLuXLTA3HKm6vfMZfEJqpBIWJr0rKaIiwF5PZsUGvLMAlTf9WRFZ
         1clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uBGvDrKwcptU4eI40KiqTkmrFiw969jPWA+k2q+CekM=;
        b=qyTuPemZPXKkaa0Awi3pOZMpkIUt84ZZ5nKkIsQj+qxHv1ac6wlxrbNDPTlTzMm5st
         fxrXY3XVHuuUqwNH6Uc1IfmKyaeNziKUTO9BDxp9umXXXgHXrMnqA9qrAlAjyZRqOTJL
         amzGAYaeF+hUAwaG93tQpO3I5EmwmzVmVxYXV+BdJVvptm7ZBjvXoxueOD6a+2PeN9Ld
         tvg2NtFWl+Uw/JsctnZqahRRGCLTrqEfqiomrvJ1CjtTHhXl1/hQDN+Fl2GdObhlIqEI
         4XMNZSeJ3eUt9YymPaiKlx/Vv8Z04HLMtKt5XbemoU+hLmRJ1HGllFdH92lAxqMXnvDw
         t0zA==
X-Gm-Message-State: AOAM530zPTtfJNxvsCRT12xLK/9aeuouLH22IM/aQxTkEUf4OSOIhtEF
	t6s8HhcS3SrhsYaa8DuzIsw=
X-Google-Smtp-Source: ABdhPJwGKr4kXuL4EeyTRjdfibpMy6P+YgIwbVDl7RF3M2FKtZcBxPa+YY9mfpLYTvKBD5tas4xFWg==
X-Received: by 2002:a17:902:6bc8:b029:117:6a8a:f7af with SMTP id m8-20020a1709026bc8b02901176a8af7afmr375795plt.51.1628153827200;
        Thu, 05 Aug 2021 01:57:07 -0700 (PDT)
Received: from [192.168.1.22] (amarseille-551-1-7-65.w92-145.abo.wanadoo.fr. [92.145.152.65])
        by smtp.gmail.com with ESMTPSA id h20sm5911451pfn.173.2021.08.05.01.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 01:57:06 -0700 (PDT)
Subject: Re: [PATCH v4 0/4] ARM: dts: NSP: add Meraki MX64/MX65 series
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sam Ravnborg
 <sam@ravnborg.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20210625095000.3358973-1-mnhagan88@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <fefad5f1-a2be-0feb-6170-d1bf5a1d86a2@gmail.com>
Date: Thu, 5 Aug 2021 01:57:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210625095000.3358973-1-mnhagan88@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/25/2021 2:49 AM, Matthew Hagan wrote:
> Changes from v2:
>   - Introduce boards to Makefile in same patch as the board dts is added
>     (Vladimir Oltean)
>   - Use alphabetical ordering for labels (Vladimir Oltean)
>   - Remove address-cells and size-cells in qca8337 switch nodes (Vladimir
>     Oltean)
>   - Remove "cpu" labels from switch nodes' CPU ports (Vladimir Oltean)
>   - Various LED fixes, utilising dt-bindings/leds/common.h and correctly
>     specifying LEDs in the form "led-N" and with the color/function/
>     function-enumerator properties.
>   - Fix PWM LEDs and corresponding pinctrl bindings. (Vladimir Oltean)
> 
> The following changes were submitted as a separate series:
>   - Introduce patches to disable QSPI by default and enable where used
>     (Vladimir Oltean)
>   - Move mdio@18032000 node from board related file to SoC (Vladimir
>     Oltean)
>   - In addition to above, relocate mdio-mux to bcm-nsp.dtsi and fix
>     the resulting usb3_phy issues
> 
> Changes from v3:
>   - Sort labels on mx64 a0 dts files into alphabetical order as well
>   - move include directives for input/input.h and leds/common.h to
>     bcm958625-mx6x-common.dtsi
>   - Whitespace fixes in bcm958625-mx6x-common.dtsi
>   - rename "senao_nvram" partition to "nvram"
> 
> Matthew Hagan (4):
>    ARM: dts: NSP: Add common bindings for MX64/MX65
>    ARM: dts: NSP: Add DT files for Meraki MX64 series
>    ARM: dts: NSP: Add DT files for Meraki MX65 series
>    dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65

Matt, should I be expecting a v5 based on Arnd's comments?
-- 
Florian
