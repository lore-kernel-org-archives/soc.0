Return-Path: <SRS0=eD+5=G2=gmail.com=alexander.sverdlin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F2AC4332F
	for <soc@archiver.kernel.org>; Mon, 13 Nov 2023 10:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55CA2C433D9; Mon, 13 Nov 2023 10:07:06 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 541E2C433C8;
	Mon, 13 Nov 2023 10:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 541E2C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5441305cbd1so6518041a12.2;
        Mon, 13 Nov 2023 02:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699870023; x=1700474823; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a1UVNwz3drUtlCcbwnzq+CFMoiQbpRGCy5kRE6bKE8o=;
        b=GXOw0+VEqEF9JGVtD+EKWDG1BwKjeBgsWl3ArZWu7KCbW8hV5tck97mwZIUXGTfZ+P
         wcJ8EpQ8dKqGGtLMb8Eu/G+o8lRG96HuwcOwDSPgqNF0QeFErgTL48NngMa5fDyE6dP3
         OJOPPJhEgESLWqCzhTmsu1TPP7q9ko/xlpqYUwXfc/0wzG5D39Px6gyikaItUodz1xYZ
         Y3H3bIglxamG14IBgz1dCuv+gtH3T/w1bRAx/RyEMNCWZ2s387x4Me3qUw/SbXVIHu11
         MhoCC7Jt+N34hmHG34alrZMSir01pGaPUYlUI79rCr8e8DTMRfpurwdiMiMwg644fbM4
         odIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699870023; x=1700474823;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a1UVNwz3drUtlCcbwnzq+CFMoiQbpRGCy5kRE6bKE8o=;
        b=JuCwsftXAv+qsv3ebyDyNEuyJz/UedO/AYU+4h6HRF6UVDK+r9RuH0YWASKuzNnz7e
         WcPGZiU09F3WYbenFnVeShTo1vPmIGetgw0UYDko4g1ygxU2WjNQerma5fbHLwxLSD7K
         h0QpQlKYqVuf6w3l2NJvPjzLZso6X3k0W7i+Qs5UYfCb7+MuJM2HEak3wWWn+qGGLwkP
         0Kb3v9fmJZzGU7fbDwvXVFM3+gzOkJ5Q/AnZj136bOI1wzPho7RWPZtwS3twGyLxtQd7
         GGU7bVKcs3Mz1v3+LaDLMvCIpT4JnX/Sx7lzbt6w75KJgOqXYk74kh0QbuHo3CIs18oL
         XdZw==
X-Gm-Message-State: AOJu0YxxJtzBQjyWSANBh1saQ2xnYrzVAKweN7Loa9OB+/BHJF2XqPQC
	r6/iGwsr6bdLJl2f0zR9k5CGWF7RuOSIew==
X-Google-Smtp-Source: AGHT+IGyrROtTFxyW749aHe9+Qh+zqYm6ESaHF42cs0Vlkcr6OoBfx4smMeCzi+Q7xnXlEg7ryaVeQ==
X-Received: by 2002:a17:906:7ad5:b0:9dd:64ca:dc69 with SMTP id k21-20020a1709067ad500b009dd64cadc69mr3930534ejo.1.1699870023492;
        Mon, 13 Nov 2023 02:07:03 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ga23-20020a170906b85700b009ae587ce128sm3761920ejb.216.2023.11.13.02.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 02:07:03 -0800 (PST)
Message-ID: <fcfdc6f05926db494ea0105e5523cc21ecfdf4e7.camel@gmail.com>
Subject: Re: [PATCH v3 14/42] power: reset: Add a driver for the ep93xx reset
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, nikita.shubin@maquefel.me
List-Id: <soc.lore.kernel.org>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>, Lennert Buytenhek
 <kernel@wantstofly.org>, Russell King <linux@armlinux.org.uk>, Lukasz
 Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>,  Thomas Gleixner <tglx@linutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
  Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Mark
 Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, Sergey
 Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Liam Girdwood <lgirdwood@gmail.com>,  Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michael Peters
 <mpeters@embeddedts.com>, Kris Bahnsen <kris@embeddedts.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org,  dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org,  linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org,  alsa-devel@alsa-project.org
Date: Mon, 13 Nov 2023 11:07:01 +0100
In-Reply-To: <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	 <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me>
	 <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0

Hi Andy!

On Fri, 2023-07-21 at 19:37 +0300, Andy Shevchenko wrote:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Issue the reboot */
            ^^^^^^^^^^^^^^^^^^^^^^
This is the relevant comment, one can extend it, but looks already quite
informative considering EP93XX_SYSCON_DEVCFG_SWRST register name.

But Nikita would be able to include more verbose comment if
you'd have a suggestion.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ep93xx_devcfg_set_clear(priv=
->map, EP93XX_SYSCON_DEVCFG_SWRST, 0x00);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ep93xx_devcfg_set_clear(priv=
->map, 0x00, EP93XX_SYSCON_DEVCFG_SWRST);
>=20
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mdelay(1000);
>=20
> Atomic?! Such a huge delay must be explained, esp. why it's atomic.

--=20
Alexander Sverdlin.

