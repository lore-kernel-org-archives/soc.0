Return-Path: <SRS0=cO1G=KD=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3A7C48BF6
	for <soc@archiver.kernel.org>; Mon, 26 Feb 2024 18:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9602DC43394; Mon, 26 Feb 2024 18:38:44 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD7EAC433F1
	for <soc@kernel.org>; Mon, 26 Feb 2024 18:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD7EAC433F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-512b3b04995so3489274e87.3
        for <soc@kernel.org>; Mon, 26 Feb 2024 10:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708972722; x=1709577522; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/67035HTguHpk2kTgWaa0PI2/RIq2lqx2iXS+coogI0=;
        b=Winia30HBY3IRXGPM6gKzXg+vwM1Mq1AY/u2T8qEotwPQXbwtN6O/Mhrsr3+jzX6nP
         5uBQgEeiXvTnFZTzQ4TAEppDm3v7hnC80NnJFbu9xDGVoEJF65r7R1Q81L0QMzg7/UdY
         1PCBx8PGQo9+DdhIFx2QIFYb7XMOLrgrOz3FPJKo/MMY+Kq5YMHdK65odTNT5Cc0xUzU
         xd1BbF3TY7Cy1Z64R04GPccgn80wjXdhWBlMHN1xG/c8nBhqbAWGmJAOiAVIMdh6dEg0
         Pk1LriQ6dDIGy7bdd2w57Ikp0o9WNs7jXfdNkRwJOKvSxc44fJJIO4Vz7vV+ivB0krcE
         UEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708972722; x=1709577522;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/67035HTguHpk2kTgWaa0PI2/RIq2lqx2iXS+coogI0=;
        b=VYfVZhidXePjLWBq6WRxYNrZu5nUJGhZM8mKdXNjEwdXLbX50U9YCErVG7EO8QpaR7
         HqAWXuunEqVtlhLFHvbSJzLPRgipcRYnBnYU5WzprUilrQZ+Hc1Bhjh6hokAI3ZejHkI
         8wlCtzQckobnQ+W7CLnz0b7KCXhbMeusRUttcgNy/cBgQix/nL0UX0YYIDqKXBZMUeb0
         dFxqEwa7XpquDi/QxSffZoLjiMwUTbLgCM/dd8jBiqw6uJpIKpi7HGN0zdodAukeVYKz
         +z4wIkOwv0IRvPUuTZYkudPQjW4DakE8iCuFe6iekqqK9/rwc02kCOiN0KozP796Q777
         P7bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOmC/1J16g4/tscEdDLRhov4+iTWeRfGBuzX5huopQxbiiBN1oow+UkiYNya/tEvanb7DpHpROdUSzSq1LWQ==
X-Gm-Message-State: AOJu0YwXUH4mJ4adRQwhTnbFHR+ebutx6itGOuV4mBdt/ILu1ltGM9sX
	ArXoCPjaJyWIs9pFlGYh4brUs1tRtThY0hXDvt4ifIh4Va1W+YcVPg7sQNJnxzc=
X-Google-Smtp-Source: AGHT+IGuVpWfmE3gXRAT+EIZqPaTPREYSWt5jUiPWppI5u/G5IUG4hi0+903Z3y2gbbjMVaLgOEkJA==
X-Received: by 2002:a05:6512:2241:b0:513:34b:67ec with SMTP id i1-20020a056512224100b00513034b67ecmr205208lfu.58.1708972721579;
        Mon, 26 Feb 2024 10:38:41 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.16])
        by smtp.gmail.com with ESMTPSA id cf3-20020a056512280300b00512dac0622fsm916532lfb.141.2024.02.26.10.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 10:38:41 -0800 (PST)
Message-ID: <71fa16ef-ee69-4a71-b373-2e1b4b2c7ec0@tuxon.dev>
Date: Mon, 26 Feb 2024 20:38:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [GIT PULL] Microchip AT91 DT updates for v6.9
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, olof@lixom.net, arm@kernel.org, soc@kernel.org
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 linux-arm-kernel@lists.infradead.org
References: <20240226183635.1964704-1-claudiu.beznea@tuxon.dev>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240226183635.1964704-1-claudiu.beznea@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Added [GIT PULL] in the title.

Sorry for the wrong initial title.

On 26.02.2024 20:36, Claudiu Beznea wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.9
> 
> for you to fetch changes up to 62afd6247a288233447beb0161315569a953e222:
> 
>   ARM: dts: microchip: sama7g5: add sama7g5 compatible (2024-02-23 22:03:38 +0200)
> 
> ----------------------------------------------------------------
> Microchip AT91 device tree updates for v6.9
> 
> It contains:
> - use DMA for DBGU of at91sam9x5ek.dtsi and USART3 of
>   at91sam9g25-gardena-smart-gateway.dts
> - the new SAMA7G54 Curiosity board
> - cleanups
> 
> ----------------------------------------------------------------
> Balakrishnan Sambath (1):
>       ARM: dts: microchip: sama7g5: add sama7g5 compatible
> 
> Claudiu Beznea (2):
>       ARM: dts: microchip: sama7g5: align dmas to the opening '<'
>       ARM: dts: microchip: sam9x60: align dmas to the opening '<'
> 
> Ezra Buehler (2):
>       ARM: dts: microchip: at91sam9x5ek: Use DMA for DBGU serial port
>       ARM: dts: microchip: gardena-smart-gateway: Use DMA for USART3
> 
> Mihai Sain (3):
>       dt-bindings: ARM: at91: Document Microchip SAMA7G54 Curiosity
>       ARM: dts: microchip: sama7g5: Add flexcom 10 node
>       ARM: dts: microchip: sama7g54_curiosity: Add initial device tree of the board
> 
>  .../devicetree/bindings/arm/atmel-at91.yaml        |   6 +
>  arch/arm/boot/dts/microchip/Makefile               |   2 +
>  .../boot/dts/microchip/at91-sama7g54_curiosity.dts | 482 +++++++++++++++++++++
>  .../at91sam9g25-gardena-smart-gateway.dts          |   2 +
>  arch/arm/boot/dts/microchip/at91sam9x5ek.dtsi      |   2 +
>  arch/arm/boot/dts/microchip/sam9x60.dtsi           |  64 +--
>  arch/arm/boot/dts/microchip/sama7g5.dtsi           |  56 ++-
>  7 files changed, 566 insertions(+), 48 deletions(-)
>  create mode 100644 arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dts
