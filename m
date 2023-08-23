Return-Path: <SRS0=3oF/=EI=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F76EE4993
	for <soc@archiver.kernel.org>; Wed, 23 Aug 2023 09:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44516C433CD; Wed, 23 Aug 2023 09:01:24 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87EAFC433C7;
	Wed, 23 Aug 2023 09:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87EAFC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-565f2567422so3299508eaf.2;
        Wed, 23 Aug 2023 02:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692781281; x=1693386081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtV842noA4k0ZIyALimzf7oD/qGOzDsyzAeC5Bbahhw=;
        b=EUAzFBO/58a1EIv2SPWONjgP/QEV5JSnLaJ+ZWitr0gxuCInDM7j1yyB0LU76SPV4/
         aTSKsx2j/uR1WQDO9NIHz+II2qH/yqfodMhpNGHxLlLQTyES+dOi0LjJCtU4nuIG0XUS
         hOGw/FufITGq0onSbGNrCwF/Rh3BVB1/q3BIjsxrBUr4XxVN26ZJ9+LDrF0RdN72tx58
         DIU8bg8RcRerno4H7vE4VYwJI9EAM9CoFbzKIZQors//9VEfwPkpTvXOzoBGm3hoz4jT
         JJYw/4YDQAtOClPSge+FjN+1TArJuD9eYdWh0mP/M/n4fAueNb10dY0llqIYaVvSRRCK
         3dPg==
X-Gm-Message-State: AOJu0YzIbKnidEs0Se8zNNvVBFlMKqHGxSX+hbCHKL8y7DEQSojkomHd
	ht3IAPffasqhojwHLhuU6PneZOOmvzG6JQ==
X-Google-Smtp-Source: AGHT+IFFkWxLiMp/RoDUSBVJp9JVSU1r5lqi0CYD1kZ3+tpbPi7tyrWdaG3t5Ztflf2mUFTOfwqaRQ==
X-Received: by 2002:a05:6358:1413:b0:139:9d20:9f60 with SMTP id m19-20020a056358141300b001399d209f60mr10441449rwi.11.1692781281014;
        Wed, 23 Aug 2023 02:01:21 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id l68-20020a0dc947000000b005772fc5912dsm3227072ywd.91.2023.08.23.02.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 02:01:20 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d665467e134so5355292276.2;
        Wed, 23 Aug 2023 02:01:20 -0700 (PDT)
X-Received: by 2002:a25:cad7:0:b0:d12:46b1:4459 with SMTP id
 a206-20020a25cad7000000b00d1246b14459mr12184522ybg.6.1692781280284; Wed, 23
 Aug 2023 02:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230823085146.113562-1-krzysztof.kozlowski@linaro.org> <20230823085146.113562-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230823085146.113562-2-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Aug 2023 11:01:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7Gk5jTkD_hc_BAK0caQjzTBWrXedV+5rYrMRiZF1EAw@mail.gmail.com>
Message-ID: <CAMuHMdU7Gk5jTkD_hc_BAK0caQjzTBWrXedV+5rYrMRiZF1EAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: use capital "OR" for multiple licenses in SPDX
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 10:52=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>  arch/arm64/boot/dts/renesas/r8a77980a.dtsi                     | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi           | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779f0-spider.dts                | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m0.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts           | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts               | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts                  | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m1.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m2.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dts           | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts               | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts                  | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m3.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m4.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dts           | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m5.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m6.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m7.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779m8.dtsi                      | 2 +-
>  arch/arm64/boot/dts/renesas/r8a779mb.dtsi                      | 2 +-

Mea culpa

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
