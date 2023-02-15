Return-Path: <SRS0=vt2+=6L=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6C0C636CC
	for <soc@archiver.kernel.org>; Wed, 15 Feb 2023 07:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48235C433D2; Wed, 15 Feb 2023 07:14:52 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 2784DC433EF;
	Wed, 15 Feb 2023 07:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2784DC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 4D05A80CD;
	Wed, 15 Feb 2023 07:14:44 +0000 (UTC)
Date: Wed, 15 Feb 2023 09:14:43 +0200
From: Tony Lindgren <tony@atomide.com>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Colin Foster <colin.foster@in-advantage.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	soc@kernel.org, Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: omap: add phytec pcm-049 som
 and pcm-959 dev board
Message-ID: <Y+yGYycS7rrBRBPN@atomide.com>
References: <20230209025525.148872-1-colin.foster@in-advantage.com>
 <20230209025525.148872-2-colin.foster@in-advantage.com>
 <20230209173534.GA539622-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209173534.GA539622-robh@kernel.org>

* Rob Herring <robh@kernel.org> [230209 19:35]:
> On Wed, Feb 08, 2023 at 06:55:24PM -0800, Colin Foster wrote:
> > --- a/Documentation/devicetree/bindings/arm/omap/omap.txt
> > +++ b/Documentation/devicetree/bindings/arm/omap/omap.txt
> > @@ -131,6 +131,9 @@ Boards (incomplete list of examples):
> >  - OMAP4 PandaBoard : Low cost community board
> >    compatible = "ti,omap4-panda", "ti,omap4430", "ti,omap4"
> >  
> > +- OMAP4 PCM-959 : Commercial dev kit with PCM-049 SOM
> > +  compatible = "phytec,pcm959", "phytec,pcm049", "ti,omap4460", "ti,omap4430", "ti,omap4";

Do you have both "ti,omap4460" and "ti,omap4430" SoCs variants for
these boards? If not just drop the SoC variant not in use. If you do have,
please mention it in the commit message.

> OMAP maintainers, if no one is going to convert all of omap.txt over to 
> schema, can we at least start an empty schema and add to it instead of 
> here...

That sounds like a good plan to me as it allows moving one device at a
time.

Colin, care to add the initial yaml binding file with your board?

Regards,

Tony
