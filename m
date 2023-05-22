Return-Path: <SRS0=6WQx=BL=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F929C7EE26
	for <soc@archiver.kernel.org>; Mon, 22 May 2023 09:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 745A7C433D2; Mon, 22 May 2023 09:40:35 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3DD1CC433EF;
	Mon, 22 May 2023 09:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3DD1CC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684748433; x=1716284433;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yOM8xaXS8i9Ow+0s41tEfJYpws5ETQzrlHpi9sg1dFU=;
  b=ffJxbiKIs6/TwSqmAAzN+CeU2UUu37ElXCtng2hLEx0+ddYipEqszmNE
   orV4uVy5bnh+OHlBlMwm0Qut8fMWPMkVk3KO/5iMwy4Lh2+r+xkArBsSr
   LBDZVMXy3i1XDwD36MnwH5t1O6NFszL4FBR2R67gdbHxztkt6SXzAetHb
   cR9HndhWxTLGD0Q129H01dyfGOwGm6xer4OGCIomxvyBqfWFckGRrJoXg
   gMp//bk2xSvMXzSX/APVwQL4UJFY3jl1nIlqqR0fdn2c/1CGNs6yOQqQl
   X0qym2uE1oZT8gTk5/GIIdXqA9fwXRFS9enRyUgYgfCl6kqBwsCJglyTW
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="214298114"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 May 2023 02:40:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 22 May 2023 02:40:32 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 22 May 2023 02:40:29 -0700
Message-ID: <635fe2a9-b171-8c1d-3cb2-c4f16e5747b3@microchip.com>
Date: Mon, 22 May 2023 11:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] MAINTAINERS: update arm64 Microchip entries
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>, <soc@kernel.org>
CC: <conor@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon
	<daniel.machon@microchip.com>
References: <20230522-wagon-stencil-a164ec39322a@wendy>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230522-wagon-stencil-a164ec39322a@wendy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2023 at 11:37, Conor Dooley wrote:
> Krzysztof noticed that patches for arch/arm64/boot/dts/microchip were
> getting lost & the listed tree was inactive.
> 
> Nicolas and I are willing to shepherd patches to Arnd, using the
> existing at91 tree, so add a new entry covering
> arch/arm64/boot/dts/microchip, listing us as maintainers.
> 
> Drop the tree from the existing sparx5 entry & narrow the devicetree
> pattern to just sparx devices, leaving Lars, Steen and Daniel looking
> after support for their SoCs.
> 
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Conor Dooley <conor@kernel.org>
> CC: Nicolas Ferre <nicolas.ferre@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Conor, best regards,
   Nicolas

> CC: Claudiu Beznea <claudiu.beznea@microchip.com>
> CC: soc@kernel.org
> CC: Lars Povlsen <lars.povlsen@microchip.com>
> CC: Steen Hegelund <Steen.Hegelund@microchip.com>
> CC: Daniel Machon <daniel.machon@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v2:
> - add Claudiu
> ---
>   MAINTAINERS | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3182992769aa..9ae07caa4e6b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2433,6 +2433,15 @@ X:	drivers/net/wireless/atmel/
>   N:	at91
>   N:	atmel
>   
> +ARM/MICROCHIP (ARM64) SoC support
> +M:	Conor Dooley <conor@kernel.org>
> +M:	Nicolas Ferre <nicolas.ferre@microchip.com>
> +M:	Claudiu Beznea <claudiu.beznea@microchip.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Supported
> +T:	git https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git
> +F:	arch/arm64/boot/dts/microchip/
> +
>   ARM/Microchip Sparx5 SoC support
>   M:	Lars Povlsen <lars.povlsen@microchip.com>
>   M:	Steen Hegelund <Steen.Hegelund@microchip.com>
> @@ -2440,8 +2449,7 @@ M:	Daniel Machon <daniel.machon@microchip.com>
>   M:	UNGLinuxDriver@microchip.com
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Supported
> -T:	git git://github.com/microchip-ung/linux-upstream.git
> -F:	arch/arm64/boot/dts/microchip/
> +F:	arch/arm64/boot/dts/microchip/sparx*
>   F:	drivers/net/ethernet/microchip/vcap/
>   F:	drivers/pinctrl/pinctrl-microchip-sgpio.c
>   N:	sparx5

-- 
Nicolas Ferre

