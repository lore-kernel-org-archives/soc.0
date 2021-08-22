Return-Path: <SRS0=40XK=NN=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123B6C4338F
	for <soc@archiver.kernel.org>; Sun, 22 Aug 2021 19:12:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DECF061206; Sun, 22 Aug 2021 19:12:12 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2CFE6126A;
	Sun, 22 Aug 2021 19:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2CFE6126A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id c4so8876531plh.7;
        Sun, 22 Aug 2021 12:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HqLZmepQrKc9lx/z79M6Ifhxm7Ymq86aEQN8GvgSv6g=;
        b=X3yQc6GnrI6r7AnR/mfCNcjXqy+BU5BYcuUxpvM58lspw5iipOWSTgIh5brI8lsusH
         /xauYGJn9piNjwYgmoa7SL/ztltx+XKI3bi8GIvl0+3ASaVjkB0Tm06Wjox0Dm/fBpC9
         0uqRHJJwZ2ShJNrR4ERs1kwVdN1jzj/4zie3gpZl6IaIgIne/JYBD/fC7jgnsAb95Fn6
         kUjs+c7clZUCXYMtsQeZTDGR7y7Ypr7PemHP3hmp1d8VKVOQ5y8HutalhtbuYUOL1x+W
         sZC+p15f4CloQ4U7R3j2NKKv/5j5PZI7XiWNrckDp86waAlBCYclCxOzIuXfcFPG5jOG
         HpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HqLZmepQrKc9lx/z79M6Ifhxm7Ymq86aEQN8GvgSv6g=;
        b=FOzVxlssjx1Ih5qWUqn/DiuakCH285F6Cp7pdflYQQqlw47s6Gzl5GXeST7Jzrza+B
         ChIBF0D+f2+SK/n4TyQUeO6CqXWNa817hkv8/EYXoKSKyYfv+zA1CsWPDW6ZhABRnEZy
         g9ieMHO2vi886FLf3/LgVrFv/msCnMsfZi7c2MNE8P4vvVns7NqWVRHSyvY6LDJmTe6A
         btgoKnpg1FsRa01Pjj3aZa30B3OuGIUJLQhyLe5p+BMie74y+CoTnyQghOP0pmyIsqu0
         DZiWIfZpKApK12hKmrlRHoU0vzR3/qkxHow0paKZ6QWIN8JvONviThhxiaQ2xrpjB94i
         xS2g==
X-Gm-Message-State: AOAM530GIjm0/oYrkGnEUzUx7JNOyoB0VSy5o0Y17DXJc3M9OGiliq89
	dOKUX6RWEOwCcKZVxJEbtAE=
X-Google-Smtp-Source: ABdhPJwD6IqDxQ/V4tvshJc+8M1kmIbPfg9RNGWammXPYoviFSDArmXwwDAOrgxg30KkyhWwRgWZag==
X-Received: by 2002:a17:902:aa06:b0:12f:66dc:be7f with SMTP id be6-20020a170902aa0600b0012f66dcbe7fmr6831383plb.9.1629659532350;
        Sun, 22 Aug 2021 12:12:12 -0700 (PDT)
Received: from [10.230.31.46] ([192.19.223.252])
        by smtp.gmail.com with UTF8SMTPSA id u25sm13115374pfn.209.2021.08.22.12.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 12:12:11 -0700 (PDT)
Message-ID: <f8510e24-3f1d-47e2-3981-7415f0926a1d@gmail.com>
Date: Sun, 22 Aug 2021 21:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH v5 0/5] ARM: dts: NSP: add Meraki MX64/MX65 series
Content-Language: en-US
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20210806204446.2981299-1-mnhagan88@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/6/2021 10:44 PM, Matthew Hagan wrote:
> Changes from v2:
>    - Introduce boards to Makefile in same patch as the board dts is added
>      (Vladimir Oltean)
>    - Use alphabetical ordering for labels (Vladimir Oltean)
>    - Remove address-cells and size-cells in qca8337 switch nodes (Vladimir
>      Oltean)
>    - Remove "cpu" labels from switch nodes' CPU ports (Vladimir Oltean)
>    - Various LED fixes, utilising dt-bindings/leds/common.h and correctly
>      specifying LEDs in the form "led-N" and with the color/function/
>      function-enumerator properties.
>    - Fix PWM LEDs and corresponding pinctrl bindings. (Vladimir Oltean)
> 
> The following changes were submitted as a separate series:
>    - Introduce patches to disable QSPI by default and enable where used
>      (Vladimir Oltean)
>    - Move mdio@18032000 node from board related file to SoC (Vladimir
>      Oltean)
>    - In addition to above, relocate mdio-mux to bcm-nsp.dtsi and fix
>      the resulting usb3_phy issues
> 
> Changes from v3:
>    - Sort labels on mx64 a0 dts files into alphabetical order as well
>    - move include directives for input/input.h and leds/common.h to
>      bcm958625-mx6x-common.dtsi
>    - Whitespace fixes in bcm958625-mx6x-common.dtsi
>    - rename "senao_nvram" partition to "nvram"
> 
> Changes from v4:
>    - Move chosen and memory nodes from bcm958625-mx6x-common.dtsi to
>      each .dts file (Arnd Bergmann).
>    - Append [@<unit-address>] to memory nodes.
>    - Create Ax stepping-specific dtsi for Ax devices (Arnd Bergmann).
>    - Append read-only property to at24 eeprom node.
>    - Remove L2 properties which should be defined at platform-level.
>    - Correct NAND node names.

I applied patch 1 first such that we don't get warnings when we apply 
patches from there on during bisection builds.
-- 
Florian
