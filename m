Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD2CC433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 19:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B54E9C34116; Thu, 26 May 2022 19:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECAAC385A9;
	Thu, 26 May 2022 19:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653593052;
	bh=/lByU2XT//2hgm1wryTBQF92iMF6iHi5yygjAKhmCgM=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=hxiGMM8dBcCYcqqtYgqZKK6bbmGgMrK1FF05cXVJAFAu2415wRbsiM+ixRpIzxt/c
	 an7l1ZCdy9ljiZBdfF9z8vqPrFsIyHVVl5A0u0zsCehorPxqYftZwpb1Jdvmps6uzC
	 AJB7uS2OyIj5aSNJ3ZzsBhUPnARsPTw8rHZyJVqZVaCoef3pppsw54L8bov69n1tjB
	 qG9srSMTs+uTTZUj5CgKF3zeq3WkjGWuIfDACQ6Cpi/Gy/Di+EGSeoDalkYCLp2XOS
	 2ELXT+bCECHsu//E/7Cu2MLsgTDO4OQ45jKLNNtfbHXtekDC1y0tibP6G8PzSSJdaG
	 p9lIAUwAqz+ag==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220522155046.260146-8-tmaimon77@gmail.com>
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-8-tmaimon77@gmail.com>
Subject: Re: [PATCH v1 07/19] dt-binding: clk: npcm845: Add binding for Nuvoton NPCM8XX Clock
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tomer Maimon <tmaimon77@gmail.com>
To: Tomer Maimon <tmaimon77@gmail.com>, arnd@arndb.de, avifishman70@gmail.com, benjaminfair@google.com, biju.das.jz@bp.renesas.com, bjorn.andersson@linaro.org, catalin.marinas@arm.com, daniel.lezcano@linaro.org, geert+renesas@glider.be, gregkh@linuxfoundation.org, j.neuschaefer@gmx.net, jirislaby@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux@roeck-us.net, lkundrak@v3.sk, marcel.ziswiler@toradex.com, mturquette@baylibre.com, nobuhiro1.iwamatsu@toshiba.co.jp, olof@lixom.net, p.zabel@pengutronix.de, robert.hancock@calian.com, robh+dt@kernel.org, shawnguo@kernel.org, tali.perry1@gmail.com, tglx@linutronix.de, venture@google.com, vkoul@kernel.org, will@kernel.org, wim@linux-watchdog.org, yuenn@google.com
Date: Thu, 26 May 2022 12:24:10 -0700
User-Agent: alot/0.10
Message-Id: <20220526192412.8ECAAC385A9@smtp.kernel.org>

Quoting Tomer Maimon (2022-05-22 08:50:34)
> diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.=
yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> new file mode 100644
> index 000000000000..f305c7c7eaf0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> @@ -0,0 +1,68 @@
[...]
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"

Are clocks not required because sometimes the reference clk isn't
connected?

> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock Control Module node:
> +  - |
> +
> +    ahb {

drop ahb node please.

> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        clk: clock-controller@f0801000 {

Drop label 'clk' as well please.

> +            compatible =3D "nuvoton,npcm845-clk";
> +            reg =3D <0x0 0xf0801000 0x0 0x1000>;
> +            #clock-cells =3D <1>;
> +        };
> +    };
> +
> +...
