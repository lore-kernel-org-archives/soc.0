Return-Path: <SRS0=t9hO=JX=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06BAC48BC3
	for <soc@archiver.kernel.org>; Wed, 14 Feb 2024 14:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4F93C43601; Wed, 14 Feb 2024 14:36:20 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 690C5C433F1;
	Wed, 14 Feb 2024 14:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 690C5C433F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-607b2f54543so4667827b3.0;
        Wed, 14 Feb 2024 06:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707921376; x=1708526176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieRFgVX+l5qNLg5VWXa9Hrv9zNfV92pS7+FucPfjsp8=;
        b=LOXztH2INUit4jKREjd3GaC+FErTYG8bMFbIAwSvGIvGMpck/VygyVqgvHeklwBxlY
         PmbK8IcfktXpHcAA+bLB6AjwqTiowd+hGLp5oJzbOdhc6RFd6hv+9f9b8sKi5kgroK1M
         CcWB9jch2C4+qI+MsGfSSfL3K4yeXWAfLRtECjJaKc/cr09TiefHm/NbbFct70wJcg7i
         2zUGEVv7N8YZJ5q1u0/l4+e+693OXS9OPdD3MDXIk2jTXdu0URzeJZonIgyZmUXEpBev
         K+PHOXpdiKbJQ90tM6JzUGa+D0sMN8S313uxW50GNRYVuxkhyICoH7AKIsmdhmWBi1g8
         Jv9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFqUfCDZ0fIdrqmMRoXWRB4eSeZweioeqhgTe1KqdVZgSOPdiFjL5gAAQxhbiY6jKRbG7KYo0E9oFXta4br52P6psU9L/7CN/BQeD15x6NuvWOdcMorKpYrt86LkHE5MljlS7EXc9nIRzySO2ck0JHI9QfAhhNMGvMBAdjDXWcs+F149R99oLWjVyYn7dC9foKX2ykvZNqzx7PaKLDXVQmud/1QW4dY/scW1poexPRbs/slOvoijEkrN6nvZOJ
X-Gm-Message-State: AOJu0Yykykwi+eZKEk0lh2UNBM0trddtKzs13VEdFn/PaqGJ23s03tPT
	KSb6zda+eOoWLRQxTc7cifman84GOHsTHKg6VVICa1gp5LMYoVPOUzrWQ+I78tg=
X-Google-Smtp-Source: AGHT+IGcXiyozlLeK+xS7QZBqC5LLfmf+XJoHo0WqUTMUKMYUtoTouCki5576Q4MgK4c3hN/HTqSOQ==
X-Received: by 2002:a0d:e888:0:b0:5ff:90e7:4730 with SMTP id r130-20020a0de888000000b005ff90e74730mr2701883ywe.26.1707921376045;
        Wed, 14 Feb 2024 06:36:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzo5/jlpJbfWvQsqKCbPXbqYLCFPp9r2YOkrzb0u2YlCPrY5QiLE3JvXQZY2fMAFIMuWZv6dNi4t/k8PIeZwDVkrZbPhN/mO5XIWmphap5u3jK3ZTitM4+VcrCe/QQmAtjIWd0cqN5O8+P0/LdPZcaSTkdtF8qwt4byBJLjFU/S7n7Xf4mXb+rhUaJj9150iJnGIl8G+uTrbgGeMG8TaZ8t5SasqacOhH0cYhUUw9yJgtEMYRSNoi6E5kIJhta
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id m9-20020a819c09000000b006049167ccffsm2107724ywa.65.2024.02.14.06.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 06:36:15 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso1843539276.1;
        Wed, 14 Feb 2024 06:36:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKbb4dZPqOmRhus1V+ydmwflzDuduRYLuWb88t7eEmYLfH6li7Bi3JXLobYC+dG6Oq2UcwVrZaOLooafHkzECQE7Vhba4sF6pP+SZcWs4nUO6fhPOJ91xf2tj1igCS1MHR2HH6qXzLSWYVjnVaRQixYYPjWMBscJQH4HXbncBwXaiY6SXJe4WSpKqW0lMwg15czsXQ3wzBPm5BanfFTxUdaL0rf0w02aAia+8jonLfT2+v5eEagnc8lQeZgtOR
X-Received: by 2002:a25:8686:0:b0:dc7:4546:d107 with SMTP id
 z6-20020a258686000000b00dc74546d107mr2758581ybk.23.1707921374648; Wed, 14 Feb
 2024 06:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org> <20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2024 15:36:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXjJcsFiusnBQmJg1p-oy-NPmr+qyt0znOk0n+wL8TrnA@mail.gmail.com>
Message-ID: <CAMuHMdXjJcsFiusnBQmJg1p-oy-NPmr+qyt0znOk0n+wL8TrnA@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: Fix dtc interrupt_provider warnings
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, Chanho Min <chanho.min@lge.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 8:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> The dtc interrupt_provider warning is off by default. Fix all the warning=
s
> so it can be enabled.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi            | 4 ++++

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
