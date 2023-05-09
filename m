Return-Path: <SRS0=P40S=A6=gmail.com=romain.perier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC25C77B75
	for <soc@archiver.kernel.org>; Tue,  9 May 2023 07:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07D57C433A4; Tue,  9 May 2023 07:32:07 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC776C433EF;
	Tue,  9 May 2023 07:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC776C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-43551f23c49so1520276137.0;
        Tue, 09 May 2023 00:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683617524; x=1686209524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCOMQ19TMXMHcOfN8Or4bhno8o+fs1yMN7n+sXqyO0U=;
        b=IuOEoJxGcxXU9UHpLirNo998CMYkKh++xivlXk4kUqD8blRpFUYfpN6IX87czwoI0r
         j7FiSy5X6nd2++mNTcSlcrYVRLA+vdw7bRUT+BzWGRlrHGuob89kTgZfpBkbaEZlurbi
         qVxTUN5rn5IxzZEQyBlyv/Kxa+5yVtjzKFxAFRf7zlLWJjqkwGohMS0LtNP5aXkmN1hx
         M6lWekOu4l7w4CEpxxXFVITEyodxbMhUZw4XDWIRTmI0xxIe2PdudumwQo2qai6Pfq0f
         e9Xx2usW87VIBcEZQjO77OjwQNvR7IsajYZEtOVdLTJfRvFvZSzlRzlHXmHoxLAxV8Ch
         XJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683617524; x=1686209524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCOMQ19TMXMHcOfN8Or4bhno8o+fs1yMN7n+sXqyO0U=;
        b=h9RgUpFIo3OewGq/U2JHaxP7tabpsoFRf2uT+v5Vg0mIavIq+UTLzwngYEQqKw2o/A
         rMKxtpUCa2gx1DJf5wjR9NEKQ9li6KpcDY8cZqE0lyek458Snf+abF5qXQi3XPruW6Ge
         AIMu3aCGmXTvg9gpapw7E0+docuGhfq1iejWq8mgLzJZhV2r/6oDNxOaq+JULPd5YN32
         6RHK9pgeaJ46vByh9B5c/t5bV1txUCiX3rTHyHAjxOiKMxh9EXZsfOPlx/P4ksUOQI6V
         DatV+PM3SD2qHFP/TxdlqtS7UERnhzvAwjH5Uq5MNujt/O1yFZPQLwksj4g0D4CgHoJ2
         NPSw==
X-Gm-Message-State: AC+VfDwp0qdWEhYrYvkh6BsRjccdCU4gNRRD7NLelfhUB2beVu0kU8HW
	hSRx6sU2/OMLAY66/A57MK9N/BG2+cfWi/hMcw4qE5KdAi1NXA==
X-Google-Smtp-Source: ACHHUZ7FOfM/aqKzfFN/vxzqu2eTmz+pB0LqmBzXpPSmdaaZqp5PZylEZveVXmpywngDLLXhkTJXDBs/vW3OtxJBMG4=
X-Received: by 2002:a67:b608:0:b0:42e:77ac:676d with SMTP id
 d8-20020a67b608000000b0042e77ac676dmr4571701vsm.25.1683617524508; Tue, 09 May
 2023 00:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org> <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
In-Reply-To: <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
From: Romain Perier <romain.perier@gmail.com>
Date: Tue, 9 May 2023 09:31:52 +0200
Message-ID: <CABgxDoJ6KLu1CJjH_zR+FWhGbQkDptf21Hm694KxSTjerDJBBQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: Move .dts files to vendor sub-directories
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Christian Marangi <ansuelsmth@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Masahiro Yamada <masahiroy@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Antoine Tenart <atenart@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Joel Stanley <joel@jms.id.au>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Lars Persson <lars.persson@axis.com>, 
	Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Baruch Siach <baruch@tkos.co.il>, 
	Wei Xu <xuwei5@hisilicon.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Lubomir Rintel <lkundrak@v3.sk>, Matthias Brugger <matthias.bgg@gmail.com>, Peter Rosin <peda@axentia.se>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Daniel Palmer <daniel@thingy.jp>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Marek Vasut <marex@denx.de>, 
	Qin Jian <qinjian@cqplus1.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Paul Barker <paul.barker@sancloud.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Enric Balletbo i Serra <eballetbo@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, 
	Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@axis.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 5 mai 2023 =C3=A0 05:29, Rob Herring <robh@kernel.org> a =C3=A9crit=
 :
>
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
>   been aquired) (e.g. nxp/imx)
> - Existing platform name for older platforms not sold/maintained by any
>   company (e.g. gemini, nspire)
>
> The whole move was scripted with the exception of MAINTAINERS.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

For sigmastar,

Acked-by: Romain Perier <romain.perier@gmail.com>
