Return-Path: <SRS0=t9hO=JX=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EC5C48BC1
	for <soc@archiver.kernel.org>; Wed, 14 Feb 2024 15:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 665ADC43330; Wed, 14 Feb 2024 15:01:03 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00FFDC433F1;
	Wed, 14 Feb 2024 15:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00FFDC433F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60495209415so54069927b3.3;
        Wed, 14 Feb 2024 07:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707922858; x=1708527658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6upARWbXs1k8V4Vnc/YI44n6rxziwjW/OPtXVVY76s=;
        b=jBuC4fjfxxVeKp8S84DyYn0bEOsuh8tfX7QYbDWNniqdpxcCrOWGDBbWTXKyPZiNrP
         LNM6JARDWE58K0Tt/FRowplt6M9PGL1fWdYUpQP4FCVqjMErrLhLcBce8m2I8LGjTZ2p
         Skad0Muk/V9ISvJjUJfT2APWsBWBVOArjVpgS72mCmzCAH/PNvl17ij1OwXrkA8UDPIO
         OCXdYZgxkHfjOpaYVLBLmC3/K6yA0CwbLME/qMoeFEe5mqBgRPE0/ttAaqdEWS09wKYN
         iLql7+vejHZ/rTiXGRsAdKGSH6qWfUBZgge+8zsLH/cb58yrgHI5ojssswG9PljeAtnj
         VNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4gAW8tMFMocZTAyJWZqr+lwDipSZ3NhNHBmlnb1dBtH/ilTwuLllckKntHTBXn0Jcbt1N+aH/cVK5eKeNh4rFK1eQ8GgJThcSXObhgqyPU1n3hfCj81BJ1L1W86ffjrnrg+wOMt0ANEjTxTo3Z0ruEYFbyi8atsik4nd2w1HIOvBW2rXAJJQ7LLJA7ejapHg7fa3Ik9PPkhVc+5BWlQy5XfDnWSXm6r4bziOnSOXnROoBapT93p4DHkVW6O1a
X-Gm-Message-State: AOJu0YxQ3xBH3fZqS53LBWutfnvsh7rKmkIznqbVmqT2o8DS2QGECNnL
	wx40mx4yk6iQOPXshe31j/wP07ouLDTJ785bM7YXfnM4MRNO4Zi4LT6Hs0g4PI4=
X-Google-Smtp-Source: AGHT+IG5GhYa+sTIQZYwK7FPf66sKOF4o9gYEZnuxa/oc5wnQYLjwJL20Dv8COyhKSAVumJSulv3GQ==
X-Received: by 2002:a0d:d647:0:b0:607:84f1:172c with SMTP id y68-20020a0dd647000000b0060784f1172cmr2864665ywd.4.1707922858498;
        Wed, 14 Feb 2024 07:00:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXaUCCs+XrwfZJhJCTsZG21qM2e3XAQ6ia0LxA9U6SnLrkeoVtPNof61oy+x2iuYG6vZJxPkScfqOXwo8TiGiH4AkHXekb5Rs/qUW1noJ28y9hA101RghxQdb/Wv6DwQtwxybCOugGL2Gc97y5rNDrwhykEO6qE2pT+a3lyJU1Y+YRtPJShVKEyUnVtvmFTE8sIWmC10S4ecYSDoblTx/GE7YCy5spCIXVI5wG8t+khDGT39w+TU+cqLIIBKw4X
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id v126-20020a0dd384000000b00604aef6896dsm2236499ywd.37.2024.02.14.07.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 07:00:57 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso5470271276.0;
        Wed, 14 Feb 2024 07:00:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVm9REctq3oCt8+kQBHMFzx+2YQyngs9nMhS39zQAJ9iT+kKgEc7m+hYcqrxo/bpfip1zkcV48IVuIFjNahHB0LRgYdjJ+8vyJtMCkrXvisAOhloTifNMZPteqAhaXi4fkEC9owjLqdSZ3AC1pbWi49FQ+oTsaRpZ7RHYEnoZFDsmqWTBxtLHj5rO0l5qLC46T8hnxBQ62p2f808EhiV03s6e0UlSUYUD/HhYZYTiQk7mOKe2n/qJ5sA+fbWF83
X-Received: by 2002:a25:84c9:0:b0:dc2:3fbd:82fe with SMTP id
 x9-20020a2584c9000000b00dc23fbd82femr2322270ybm.46.1707922857034; Wed, 14 Feb
 2024 07:00:57 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2024 16:00:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
Message-ID: <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
Subject: Re: [PATCH 0/6] dts: Fix dtc interrupt warnings
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
	Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Imre Kaloz <kaloz@openwrt.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, Feb 13, 2024 at 8:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> I had a branch with most of these changes sitting in my tree for some
> time. Geert's asking about some errors not getting found prompted me to
> clean it up and send it out. This series fixes all* interrupt related
> warnings and enables the check by default.

> *There's a few Renesas warnings still Geert said he would fix.

Thanks, fix sent
https://lore.kernel.org/r/a351e503ea97fb1af68395843f513925ff1bdf26.17079224=
60.git.geert+renesas@glider.be

>       dtc: Enable dtc interrupt_provider check

>  scripts/Makefile.lib                                  |  3 +--

Just wondering, can the remaining disabler be removed, too?

Documentation/devicetree/bindings/Makefile:     -Wno-interrupt_provider \

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
