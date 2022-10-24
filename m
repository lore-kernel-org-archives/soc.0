Return-Path: <SRS0=Qv0O=2Z=arm.com=andre.przywara@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10825FA3743
	for <soc@archiver.kernel.org>; Mon, 24 Oct 2022 14:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D41C5C43143; Mon, 24 Oct 2022 14:17:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 80078C433D6;
	Mon, 24 Oct 2022 14:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80078C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FCA61515;
	Mon, 24 Oct 2022 07:17:24 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D63D3F792;
	Mon, 24 Oct 2022 07:17:16 -0700 (PDT)
Date: Mon, 24 Oct 2022 15:17:14 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Icenowy Zheng <uwu@icenowy.me>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, soc@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 09/10] dt-binding: arm: sunxi: add compatible strings
 for PopStick v1.1
Message-ID: <20221024151714.59968916@donnerap.cambridge.arm.com>
In-Reply-To: <20221012055602.1544944-10-uwu@icenowy.me>
References: <20221012055602.1544944-1-uwu@icenowy.me>
	<20221012055602.1544944-10-uwu@icenowy.me>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Oct 2022 13:56:01 +0800
Icenowy Zheng <uwu@icenowy.me> wrote:

Hi Icenowy,

> SourceParts PopStick is a F1C200s-based stick-shaped SBC.
> 
> Add a compatible string list for its v1.1 version (the first public
> one).

If v1.0 (or anything prior) never made it to the outside world, I don't
think we need to mention that in the public bindings.
In general Linux seems to discourage support for unreleased hardware, so I
think you can just drop the "sourceparts,popstick-v1.1" name.

Cheers,
Andre

> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> New patch introduced in v2.
> 
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 3ad1cd50e3fe..c6e0ad7f461d 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -807,6 +807,13 @@ properties:
>            - const: sinlinx,sina33
>            - const: allwinner,sun8i-a33
>  
> +      - description: SourceParts PopStick v1.1
> +        items:
> +          - const: sourceparts,popstick-v1.1
> +          - const: sourceparts,popstick
> +          - const: allwinner,suniv-f1c200s
> +          - const: allwinner,suniv-f1c100s
> +
>        - description: SL631 Action Camera with IMX179
>          items:
>            - const: allwinner,sl631-imx179

