Return-Path: <SRS0=Ruqu=A2=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B54C77B75
	for <soc@archiver.kernel.org>; Fri,  5 May 2023 16:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CDBD6C433AE; Fri,  5 May 2023 16:42:04 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7CC2C433EF;
	Fri,  5 May 2023 16:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7CC2C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-3f0b299d739so9260321cf.3;
        Fri, 05 May 2023 09:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683304922; x=1685896922;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JjU8cYkMR/D2AH+UUT1RqaNNUKIe0G8elGCtMhJnuH4=;
        b=dQMFTWxVHoCavdfbZX3UgZJ0Ihfx3/rCt8H/bqO9rw11mqpajR8QFEeg+n6QZVMGg/
         s29pan4NW+ytzB/YOXNpuczxnVbeh1Sjb292d4RYJoHtL0GHtrKhZr3iXRUyhv0p0Yge
         YbMiAajWHcnU/43IrmRecC2ImOjjYpprMsWzdwykYVdzFybpiXIot6JUNA085eKHeX8y
         BeONHzO28SllK1s56ioAZNR8C5fQrfejIHHJiZXRuipTvVOXI7rLyMephBRcKkzFsnY6
         GEO9MGMX35x4qoGDHmO/9pjul8WtaFEDlbLdwQZPPBYuHk2sKLW7wtkV8fETM5C8q3qr
         CDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683304922; x=1685896922;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JjU8cYkMR/D2AH+UUT1RqaNNUKIe0G8elGCtMhJnuH4=;
        b=FQh9WFzTq6kESPgUkd/LgBOQJZUrhAwUDCWZ/tbV/w3zLAytpLuJxWZ6kDMIL2d2gR
         7B+Zpp7OImWYDG6HfvRIV5jINn5FnViasTcZErNv9B6r5BAoKw1/GKfSrc8RZG3jUiP7
         oi8GhG0cQpoWU+VmYxNSrErzn2bUseZWo6bHuyMzcVhkFtJ+5H+lPS2CeiiPixzNlD5n
         DHQmaMh/lODgag1mPcb9N4rjVWs7kzMh+BafAnHqKataieUWv+3L3lCjkm9bL9uXItVF
         Ka5K3WPmy2YMAI6S3M6a6sVAMwA5S/HebZnCwr1Da35leWFtvLldY6bAxb2Ir5fAH23F
         B+ZA==
X-Gm-Message-State: AC+VfDwmhSyt6y5XxjYY/bWm90n4iuUb/GS4lbXiGawscOl/8r3CVql2
	wUEscwiqjNR1StA+w4nT0NnqxpGEeKDQMQ==
X-Google-Smtp-Source: ACHHUZ4rq9RQOWNlJXcSFS/sC2a2G8ddqQ8jofrxPQhdo6mwHjlu5iAOMhwhC/v+ZzBUSf1OEu6gMg==
X-Received: by 2002:a05:622a:287:b0:3e6:59c2:cbae with SMTP id z7-20020a05622a028700b003e659c2cbaemr3330439qtw.34.1683304921985;
        Fri, 05 May 2023 09:42:01 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id g22-20020a37e216000000b0074de7b1fe1csm715174qki.17.2023.05.05.09.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 09:42:01 -0700 (PDT)
Message-ID: <d178b551-50f9-fb26-5844-1f1d3632fd20@gmail.com>
Date: Fri, 5 May 2023 09:41:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/4] ARM: dts: Move .dts files to vendor sub-directories
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh@kernel.org>, soc@kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Masahiro Yamada
 <masahiroy@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sudeep Holla
 <sudeep.holla@arm.com>, Joel Stanley <joel@jms.id.au>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Lars Persson <lars.persson@axis.com>, Scott Branden <sbranden@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>, Baruch Siach <baruch@tkos.co.il>,
 Wei Xu <xuwei5@hisilicon.com>, Jean-Marie Verdun <verdun@hpe.com>,
 Nick Hawkins <nick.hawkins@hpe.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Rosin <peda@axentia.se>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Daniel Palmer <daniel@thingy.jp>,
 Romain Perier <romain.perier@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Marek Vasut <marex@denx.de>,
 Qin Jian <qinjian@cqplus1.com>, Jisheng Zhang <jszhang@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Paul Barker <paul.barker@sancloud.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Nishanth Menon <nm@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Enric Balletbo i Serra <eballetbo@gmail.com>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com
References: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
 <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/4/23 20:29, Rob Herring wrote:
> The arm dts directory has grown to 1553 boards which makes it a bit
> unwieldy to maintain and use. Past attempts stalled out due to plans to
> move .dts files out of the kernel tree. Doing that is no longer planned
> (any time soon at least), so let's go ahead and group .dts files by
> vendors. This move aligns arm with arm64 .dts file structure.
> 
> Doing this enables building subsets of dts files by vendor easily
> without changing kernel configs:
> 
> make allyesconfig
> make arch/arm/boot/dts/ti/
> 
> There's no change to dtbs_install as the flat structure is maintained on
> install.
> 
> The naming of vendor directories is roughly in this order of preference:
> - Matching original and current SoC vendor prefix/name (e.g. ti, qcom)
> - Current vendor prefix/name if still actively sold (SoCs which have
>    been aquired) (e.g. nxp/imx)
> - Existing platform name for older platforms not sold/maintained by any
>    company (e.g. gemini, nspire)
> 
> The whole move was scripted with the exception of MAINTAINERS.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com> #broadcom
-- 
Florian

