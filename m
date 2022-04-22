Return-Path: <SRS0=bz7N=VA=denx.de=marex@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E58FC433FE
	for <soc@archiver.kernel.org>; Fri, 22 Apr 2022 16:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32555C385A8; Fri, 22 Apr 2022 16:28:18 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A43C7C385A0;
	Fri, 22 Apr 2022 16:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A43C7C385A0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E06CA83C24;
	Fri, 22 Apr 2022 18:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1650644894;
	bh=INwp8oMerWYi06Suz1qgAIuvZ6S1fWPnARFOxZDAW5U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lXrPzegpTOHhGqTOXMfhlLGnd9fPJA03I8KrBtP9ipktmhdw6M9lRIFiFKJBX/2yW
	 9zANnG9L9YM3apNusdIrEvKspBYODpzSN4gvPo2oqqolmD+617vCW6MBDwaNFrSoIk
	 Rh/LqLtO4a1d0qfC81ilwrL80tPPElbU2GaTsiH4aoR3UgTAZbj8E5gb7RRqTorftj
	 JaNWd3AwCFTtFHcgMmhdNEQxgMYRhfzhOOGT5zG27SjUcxr+1Rbg8ZwhOQQ8lQK3ZU
	 5RCBolRIbUMsJs2NO1Au84vjFHVECt6RHJiZb5cXXP+34gDHOU3bbARXvVZ7Sd+FRS
	 KQM633/QrXYGw==
Message-ID: <7d365d28-66ac-93d4-72b5-87d0b36ba017@denx.de>
Date: Fri, 22 Apr 2022 18:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/8] dt-bindings: rcc: Add optional external ethernet RX
 clock properties
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, arnd@arndb.de,
 robh+dt@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 soc@kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, etienne.carriere@st.com
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-2-alexandre.torgue@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220422150952.20587-2-alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean

On 4/22/22 17:09, Alexandre Torgue wrote:
> From: Marek Vasut <marex@denx.de>
> 
> Describe optional external ethernet RX clock in the DT binding
> to fix dtbs_check warnings like:
> 
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dt.yaml: rcc@50000000: 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> To: devicetree@vger.kernel.org
> Acked-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> index a0ae4867ed27..7a251264582d 100644
> --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> @@ -59,6 +59,14 @@ properties:
>             - st,stm32mp1-rcc
>         - const: syscon
>   
> +  clocks:
> +    description:
> +      Specifies the external RX clock for ethernet MAC.
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ETH_RX_CLK/ETH_REF_CLK
> +
>     reg:
>       maxItems: 1
>   

Should this patch be part of this series, maybe this was re-sent by 
accident ?
