Return-Path: <robh+dt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E05C433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 00:00:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9499861165; Fri,  9 Apr 2021 00:00:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F45861057;
	Fri,  9 Apr 2021 00:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617926402;
	bh=zODgvWJOdGPuPLobxCE2HlZWj+0GBcKdnv6srrPlhWM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=eAmm1Oeiu6SbZlJvxb0PMDKKnn/TG2YLbOac6rmu+fKFoMD1OHT0CBOcEmOv2v1t3
	 ztBwUNELsP9OIlkV+dzy/asVXbWxSY3Gusr8FuK0Lwp4boTRgyGOk5XdAEKA8/85OB
	 0T6OJHHhpqsrJDgBMX3wkvp5jcMiMqnwfcSq7hNiuZFd+4YssqKBm/t7OAPl6VYEPR
	 OqSbb9I72wbay6rZs2DGliwoDvO9qxKWh6ivmUjROay74hGC8/8sOO1bKiKsrf1Wv8
	 cwM+BtyvJTcfLrvINnofr83IrmMZ8CKRD3ZUY9hvlY0utVPyeEwiR0SyDbb/tTVZL6
	 M2h97raWxxNFA==
Received: by mail-ed1-f50.google.com with SMTP id m3so4445527edv.5;
        Thu, 08 Apr 2021 17:00:02 -0700 (PDT)
X-Gm-Message-State: AOAM5337trXo3Tr97Um50ZNMn2Y7Bxxn+dBT2iEwsgrbzalwTk009rlN
	X+DVTUenfltQYZq9D5jbuqZtA8o57+afsa251Q==
X-Google-Smtp-Source: ABdhPJyq1vEW/srr7/XjdqQZ+IQDTHq27/v77Kb6sn7jMQI4z0+Cf9Iy9t5TL6iMv0qg8r3L+WFfSt/xZR6erabb6rw=
X-Received: by 2002:aa7:d3c8:: with SMTP id o8mr14894711edr.289.1617926400690;
 Thu, 08 Apr 2021 17:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
 <YG8gaHqlJ+oCfkTt@piout.net>
In-Reply-To: <YG8gaHqlJ+oCfkTt@piout.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 8 Apr 2021 18:59:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJD7Tx4o2J3vFCGMNPcJmi7LtbZN00oSUdT7bDXo3UF1Q@mail.gmail.com>
Message-ID: <CAL_JsqJD7Tx4o2J3vFCGMNPcJmi7LtbZN00oSUdT7bDXo3UF1Q@mail.gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Tony Lindgren <tony@atomide.com>, 
	Shawn Guo <shawnguo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, SoC Team <soc@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, 
	Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 8, 2021 at 10:25 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> On 08/04/2021 17:08:26+0200, Arnd Bergmann wrote:
> > arch/arm/boot/dts/at91-sama5d2_ptc_ek.dt.yaml: /: 'etm@73C000' does
> > not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$',
> > 'pinctrl-[0-9]+'
> > arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml: /: 'etm@73C000' does not
> > match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$',
> > 'pinctrl-[0-9]+'
> >
>
> This was introduced by 4d930c421e3b ("ARM: dts: at91: sama5d2: add ETB
> and ETM unit name"), trying to fix another warning.
>
> I guess this is because
> Documentation/devicetree/bindings/arm/coresight.txt is not yaml yet.

No, I believe it's from the uppercase hex.

Rob
