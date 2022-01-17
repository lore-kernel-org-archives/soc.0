Return-Path: <SRS0=n2ge=SB=huawei.com=jonathan.cameron@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21C0C433F5
	for <soc@archiver.kernel.org>; Mon, 17 Jan 2022 09:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99197C36AE7; Mon, 17 Jan 2022 09:47:37 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 820A1C36AE3;
	Mon, 17 Jan 2022 09:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 820A1C36AE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JcnBC5TTSz67jnf;
	Mon, 17 Jan 2022 17:47:15 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 17 Jan 2022 10:47:26 +0100
Received: from localhost (10.47.77.46) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.21; Mon, 17 Jan
 2022 09:47:25 +0000
Date: Mon, 17 Jan 2022 09:47:28 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
CC: Alim Akhtar <alim.akhtar@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<soc@kernel.org>, <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<olof@lixom.net>, <linus.walleij@linaro.org>, <catalin.marinas@arm.com>,
	<robh+dt@kernel.org>, <s.nawrocki@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <pankaj.dubey@samsung.com>,
	<linux-fsd@tesla.com>, Tamseel Shams <m.shams@samsung.com>
Subject: Re: [PATCH 20/23] dt-bindings: iio: adc: exynos-adc: Add ADC-V3
 variant
Message-ID: <20220117094728.000051b8@Huawei.com>
In-Reply-To: <75ae8b8c-e416-5007-b995-f1317ef207d4@canonical.com>
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
	<CGME20220113122447epcas5p266d44c8df143229d22dfa700c285a786@epcas5p2.samsung.com>
	<20220113121143.22280-21-alim.akhtar@samsung.com>
	<75ae8b8c-e416-5007-b995-f1317ef207d4@canonical.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.77.46]
X-ClientProxiedBy: lhreml709-chm.china.huawei.com (10.201.108.58) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected

On Thu, 13 Jan 2022 14:32:12 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:

> On 13/01/2022 13:11, Alim Akhtar wrote:
> > This patch adds a new compatible string for exynos's ADC-V3 variant.
> > 
> > Cc: linux-fsd@tesla.com
> > Signed-off-by: Tamseel Shams <m.shams@samsung.com>
> > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

Please cc linux-iio@vger.kernel.org for next version...

> > ---
> >  .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml          | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> > index 81c87295912c..9303053759ca 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> > @@ -14,6 +14,7 @@ properties:
> >      enum:
> >        - samsung,exynos-adc-v1                 # Exynos5250
> >        - samsung,exynos-adc-v2
> > +      - samsung,exynos-adc-v3  
> 
> Please use SoC-specific compatible. IP block versions are tricky because:
> 1. Documentation/datasheet mentioning which SoC has which block version
> are not public.
> 2. Neither are public the datasheets for ADC blocks.
> 3. The versioning of IP blocks can be inaccurate.
> 
> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

