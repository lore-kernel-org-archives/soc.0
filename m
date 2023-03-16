Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92693C7618E
	for <soc@archiver.kernel.org>; Thu, 16 Mar 2023 19:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C324C433A0; Thu, 16 Mar 2023 19:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464BBC433D2;
	Thu, 16 Mar 2023 19:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678996310;
	bh=zJnu6WZbbOrEPFIzFpFrY/DR/GnxDmEoNXhsslkKARU=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:Cc:From;
	b=EhHAplpsZ1gp7OvBJL8TsEw7cyaajYiyJxRiNpOXdcvG79kAtceo6I57qdcCZwqRr
	 10TcaS3f9daZdCZCkn5zqSHRFs8l7UeutzHb9LkxczSxt3ws29N2OxKGxIvJS9DUZE
	 717k0pAmkcIryooeAw+HVQuuXOldtD+r2LCKauBRLAy6jkW8KUuuILgs7GL0+66deF
	 ld48BAkwyzkZ2e6bacGxwYTCgAjCTrR6ZJn5LDjSARm8D/ubctZTxr80NDzcHALBZ3
	 8Kgc/DwQxnMTJxBO6f+ODVDQImTskVzTzPLUEralo3uF5MSgO0HB/3Jpm5Rlvm/lsn
	 e7zdxGjYY1ekQ==
Received: by mail-vs1-f48.google.com with SMTP id o2so2543146vss.8;
        Thu, 16 Mar 2023 12:51:50 -0700 (PDT)
X-Gm-Message-State: AO0yUKVWeCpmCSGei1HHcKbOjPUT8M1bgARfMH1ujHK0vKDUzAUm+bgF
	QHZL2uD1Ye5W1qqrDPrzkE/eKOeOR7rG9fFCGA==
X-Google-Smtp-Source: AK7set8/uY+rnVD9Tg3305Y6q91Hm6ecvF29SGXPPeBhHrNC6cfRN8YTeXkx74+l+JV1XRJK2qi3EQpZz0LFS+I3IKU=
X-Received: by 2002:a67:fb46:0:b0:425:a28f:2e09 with SMTP id
 e6-20020a67fb46000000b00425a28f2e09mr7185807vsr.7.1678996309167; Thu, 16 Mar
 2023 12:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230208185506.2305349-1-robh@kernel.org>
In-Reply-To: <20230208185506.2305349-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Mar 2023 14:51:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLz9mtsOr1sTB+eAxGOsZFthrLV-LbFBW7o7RdwgLCBZQ@mail.gmail.com>
Message-ID: <CAL_JsqLz9mtsOr1sTB+eAxGOsZFthrLV-LbFBW7o7RdwgLCBZQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: cavium: Fix GICv3 ITS nodes
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robert Richter <rric@kernel.org>, 
	SoC Team <soc@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 8, 2023 at 12:55=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> The GICv3 ITS is an MSI controller, therefore its node name should be
> 'msi-controller'. The ITS node is also expected to have '#msi-cells'.
> Add it on Thunder as there are no users. Thunder2 uses 'msi-parent', but
> Robin says that should be 'msi-map' instead and I'm not sure what's
> correct for it.
>
> The unit-addresses of both the ITS and main GIC node on thunder2 are also
> wrong, so fix them while we're here.
>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/cavium/thunder-88xx.dtsi  | 3 ++-
>  arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

Ping!

Should we remove these platforms instead if they aren't maintained?

>
> diff --git a/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi b/arch/arm64/bo=
ot/dts/cavium/thunder-88xx.dtsi
> index e0a71795261b..8ad31dee11a3 100644
> --- a/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
> +++ b/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
> @@ -389,9 +389,10 @@ gic0: interrupt-controller@8010,00000000 {
>                               <0x8010 0x80000000 0x0 0x600000>; /* GICR *=
/
>                         interrupts =3D <1 9 0xf04>;
>
> -                       its: gic-its@8010,00020000 {
> +                       its: msi-controller@801000020000 {
>                                 compatible =3D "arm,gic-v3-its";
>                                 msi-controller;
> +                               #msi-cells =3D <1>;
>                                 reg =3D <0x8010 0x20000 0x0 0x200000>;
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi b/arch/arm64/b=
oot/dts/cavium/thunder2-99xx.dtsi
> index dfb41705a9a9..3419bd252696 100644
> --- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> +++ b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
> @@ -55,7 +55,7 @@ psci {
>                 method =3D "smc";
>         };
>
> -       gic: interrupt-controller@400080000 {
> +       gic: interrupt-controller@4000080000 {
>                 compatible =3D "arm,gic-v3";
>                 #interrupt-cells =3D <3>;
>                 #address-cells =3D <2>;
> @@ -67,7 +67,7 @@ gic: interrupt-controller@400080000 {
>                       <0x04 0x01000000 0x0 0x1000000>;  /* GICR */
>                 interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>
> -               gicits: gic-its@40010000 {
> +               gicits: msi-controller@4000100000 {
>                         compatible =3D "arm,gic-v3-its";
>                         msi-controller;
>                         reg =3D <0x04 0x00100000 0x0 0x20000>;    /* GIC =
ITS */
> --
> 2.39.1
>
