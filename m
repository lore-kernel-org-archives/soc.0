Return-Path: <robh+dt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7E1C433ED
	for <soc@archiver.kernel.org>; Wed, 21 Apr 2021 12:55:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A480461450; Wed, 21 Apr 2021 12:55:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E3916143C
	for <soc@kernel.org>; Wed, 21 Apr 2021 12:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619009756;
	bh=fSsh86qLprsO1kcQt29TEsyA8cpEvg5cI35j3iApJRM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=n02jdIXFCGNtIjceg5OXBVvAm9Z/VSlujlk7HglU+1jZdt7lyginJAY83fmQPz3et
	 lEtK+HCKIT34xQZGH4zQRSgh70ipGybW+syM9ZK1Fg2bHetO+eIbHfQdN/KBDjQ/yG
	 I1i5cCAWZbXeXP89qvhYaq7Qfa8INXGBmRa+I+RvJg5fqJL61TlvCUBGk2WecYsZE8
	 CAeJxFS/khIJOuyhqp0mNhooyXDHlMAc2UXB6fOFkNOM1UG55PuzXYBcxAAGYJQ9H6
	 yq6KV9bUNfFcjQG4VPSmB1WGUUr0WGb8gvOmfWP9tROkArT0aUfEQvIlauMuGlDT2L
	 k03XdYg1FSWGQ==
Received: by mail-ej1-f41.google.com with SMTP id u21so63384548ejo.13
        for <soc@kernel.org>; Wed, 21 Apr 2021 05:55:56 -0700 (PDT)
X-Gm-Message-State: AOAM531ABsmyYkVAFy+lQ4lGdNmjK93+wjgN1dffytJ94n8pZLrsecp/
	u3ELcf3McqPkA3L5dGWOfKZqL3QhtzHoOTxudg==
X-Google-Smtp-Source: ABdhPJxoknV1LylRYldTfToFJatnshqs0NvjEq9ejw38eVnHcNBIFwd0QzkNmChSw2+oJuSOmuSBAf9rZpnaWPQfUZA=
X-Received: by 2002:a17:906:9ac5:: with SMTP id ah5mr31960595ejc.360.1619009755089;
 Wed, 21 Apr 2021 05:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210420230402.8807-1-khilman@baylibre.com>
In-Reply-To: <20210420230402.8807-1-khilman@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 21 Apr 2021 07:55:42 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Z2Mxy_m1QpqgFi0M7DGqMYUwZhrgk_CP7Vy1frAzUcA@mail.gmail.com>
Message-ID: <CAL_Jsq+Z2Mxy_m1QpqgFi0M7DGqMYUwZhrgk_CP7Vy1frAzUcA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: misc DT schema fixups
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>, devicetree@vger.kernel.org, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 20, 2021 at 6:04 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Take a pass at cleaning up a bunch of warnings
> from 'make dtbs_check' that have crept in.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |  5 +++++
>  .../bindings/media/amlogic,axg-ge2d.yaml           |  1 +
>  Documentation/devicetree/bindings/media/rc.yaml    |  4 ++++
>  .../devicetree/bindings/sound/amlogic,t9015.yaml   |  1 +
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 14 +++++++-------
>  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |  2 +-
>  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |  2 +-
>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  4 ++--
>  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  2 +-
>  .../dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |  2 +-
>  .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |  8 ++++----
>  .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |  2 +-
>  .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |  2 +-
>  .../boot/dts/amlogic/meson-gxm-wetek-core2.dts     |  2 +-
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  4 ++--
>  .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts |  2 +-
>  18 files changed, 38 insertions(+), 27 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 184492162e7e..db2240bad012 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -69,6 +69,11 @@ properties:
>
>        where voltage is in V, frequency is in MHz.
>
> +  dma-coherent:
> +    description: |
> +      Present if page table walks made by the SMMU are cache coherent with the
> +      CPU.

Copied from the SMMU binding whose definition is a bit special?

Just 'dma-coherent: true' is good.

Rob
