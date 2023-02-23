Return-Path: <SRS0=N8Gl=6T=ti.com=afd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3F0C636D6
	for <soc@archiver.kernel.org>; Thu, 23 Feb 2023 16:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11417C433D2; Thu, 23 Feb 2023 16:01:08 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B1DBC433EF;
	Thu, 23 Feb 2023 16:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5B1DBC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31NG0qMc055806;
	Thu, 23 Feb 2023 10:00:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677168052;
	bh=vTURQD9WPvmBl1atQgQJRPHjqPyGm4gzWobOEQ9n+Ao=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VIxvGT9mW6dn1gTDS69GDblSRm/3bg6BI/2QQGI/CzBnMkyb3siBz84IM/mpnEWpD
	 tM+2dL0d62cOHmRPIB3tynyIuUTsOwugJro+N/ERZki1YFCXyJXUttHg1zpgz4yjoj
	 /YipLAg5zBgWYmL6uxq/bG/rAf/LGclJw63r+5ms=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31NG0q47024758
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Feb 2023 10:00:52 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 23
 Feb 2023 10:00:52 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 23 Feb 2023 10:00:51 -0600
Received: from [10.250.32.101] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31NG0o2V016398;
	Thu, 23 Feb 2023 10:00:51 -0600
Message-ID: <dd67f7c9-0867-47d0-a201-9316908d9d62@ti.com>
Date: Thu, 23 Feb 2023 10:00:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: omap: add phytec pcm-049 som and
 pcm-959 dev board
Content-Language: en-US
To: Colin Foster <colin.foster@in-advantage.com>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?=
	<bcousson@baylibre.com>,
        <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20230222203847.2664903-1-colin.foster@in-advantage.com>
 <20230222203847.2664903-2-colin.foster@in-advantage.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230222203847.2664903-2-colin.foster@in-advantage.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 2/22/23 2:38 PM, Colin Foster wrote:
> Add yaml documentation for TI OMAP devices for the Phytec PCM-049 SoM and
> the Phytec PCM-959 development kit.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
> 
> v4
>      * New patch, based on a WIP from Andrew Davis <afd@ti.com>
> 
> ---
>   .../devicetree/bindings/arm/ti,omap.yaml      | 29 +++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/ti,omap.yaml

How will this work if I add the same file? Why not take my WIP patch, make
the suggested changes from Rob, then have it as your first patch in this
series?

Andrew

> 
> diff --git a/Documentation/devicetree/bindings/arm/ti,omap.yaml b/Documentation/devicetree/bindings/arm/ti,omap.yaml
> new file mode 100644
> index 000000000000..9c0e08f74fee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/ti,omap.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/ti,omap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments OMAP SoC architecture
> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +
> +description:
> +  Platforms based on Texas Instruments OMAP SoC architecture.
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatibnle:
> +    oneOf:
> +
> +      - description: TI OMAP 4460 SoC based platforms
> +        items:
> +          - enum:
> +              - phytec,pcm049   # Phytec OMAP 4460 SoM
> +              - phytec,pcm959   # Phytec development board for the pcm049
> +          - const: ti,omap4460
> +          - const: ti,omap4
> +
> +additionalProperties: true
