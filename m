Return-Path: <SRS0=6WQx=BL=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BD9C77B73
	for <soc@archiver.kernel.org>; Mon, 22 May 2023 07:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70ED0C4339B; Mon, 22 May 2023 07:52:43 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41C27C433EF;
	Mon, 22 May 2023 07:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41C27C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684741961; x=1716277961;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WbS260rijrjdGsBDFfLxi3G0STFcJso3jr4x9Y1Llzw=;
  b=NNpMQ3FB8KO5Zb7TP2EAQv9nbpx/0ZQebTV6vsf36IGVNpMxSE3JFhSw
   IzS+bB/ui8psJUgLLj/2xymQjkSLVKom8B4XfXgK5LocXRXwWsYOX7hGA
   i+Yd3o9qtZ8PNqfyp4M8KmzhPPTM8xwtB1kVOIA+Yc37BmK+JJkiJxqr0
   Mq/ZGikpvrUi1z9rpcmlKS/O6TBOQmG06kxolUKt6KSzbsTAuxfo/G2VF
   mMLyKQKlUU1ws+ic284fbMRSqmTYJX6BHVv6AfGyYkc8YMTmmgUSXhZEK
   i4nW9E6cd92L8Gmvkv6RpHpgiLcMeclMQU4yUoNyYcEovZU0j/jtMdfI8
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; 
   d="scan'208";a="212416679"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 May 2023 00:52:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 22 May 2023 00:52:36 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 22 May 2023 00:52:34 -0700
Message-ID: <5e0a2144-81fc-8e83-f8e5-f88abfbf5809@microchip.com>
Date: Mon, 22 May 2023 09:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] MAINTAINERS: update arm64 Microchip entries
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Conor Dooley <conor@kernel.org>, <soc@kernel.org>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>
CC: Conor Dooley <conor.dooley@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>
References: <20230517-shimmer-retry-34596c637882@spud>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230517-shimmer-retry-34596c637882@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 17/05/2023 at 17:55, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Krzysztof noticed that patches for arch/arm64/boot/dts/microchip were
> getting lost & the listed tree was inactive.
> 
> Nicolas and I are willing to shepherd patches to Arnd, using the
> existing at91 tree, so add a new entry covering
> arch/arm64/boot/dts/microchip, listing us as maintainers.

Yes, and I would like that Claudiu is part of this as well as he very 
active in reviews and is building most of the pull-requests for at91.

Thanks for helping clarifying this.
Best regards,
   Nicolas

> Drop the tree from the existing sparx5 entry & narrow the devicetree
> pattern to just sparx devices, leaving Lars, Steen and Daniel looking
> after support for their SoCs.
> 
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Conor Dooley <conor@kernel.org>
> CC: Nicolas Ferre <nicolas.ferre@microchip.com>
> CC: soc@kernel.org
> CC: Lars Povlsen <lars.povlsen@microchip.com>
> CC: Steen Hegelund <Steen.Hegelund@microchip.com>
> CC: Daniel Machon <daniel.machon@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   MAINTAINERS | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e0b87d5aa2e..b5c10fb8ae49 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2434,6 +2434,14 @@ X:       drivers/net/wireless/atmel/
>   N:     at91
>   N:     atmel
> 
> +ARM/MICROCHIP (ARM64) SoC support
> +M:     Conor Dooley <conor@kernel.org>
> +M:     Nicolas Ferre <nicolas.ferre@microchip.com>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:     Supported
> +T:     git https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git
> +F:     arch/arm64/boot/dts/microchip/
> +
>   ARM/Microchip Sparx5 SoC support
>   M:     Lars Povlsen <lars.povlsen@microchip.com>
>   M:     Steen Hegelund <Steen.Hegelund@microchip.com>
> @@ -2441,8 +2449,7 @@ M:        Daniel Machon <daniel.machon@microchip.com>
>   M:     UNGLinuxDriver@microchip.com
>   L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:     Supported
> -T:     git git://github.com/microchip-ung/linux-upstream.git
> -F:     arch/arm64/boot/dts/microchip/
> +F:     arch/arm64/boot/dts/microchip/sparx*
>   F:     drivers/net/ethernet/microchip/vcap/
>   F:     drivers/pinctrl/pinctrl-microchip-sgpio.c
>   N:     sparx5
> --
> 2.39.2
> 

-- 
Nicolas Ferre

