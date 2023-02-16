Return-Path: <SRS0=5CiF=6M=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EA7C636CC
	for <soc@archiver.kernel.org>; Thu, 16 Feb 2023 06:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 785CFC4339B; Thu, 16 Feb 2023 06:51:30 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id D6087C433EF;
	Thu, 16 Feb 2023 06:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6087C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id BB2388050;
	Thu, 16 Feb 2023 06:51:27 +0000 (UTC)
Date: Thu, 16 Feb 2023 08:51:26 +0200
From: Tony Lindgren <tony@atomide.com>
To: Colin Foster <colin.foster@in-advantage.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	soc@kernel.org, Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: omap: add phytec pcm-049 som
 and pcm-959 dev board
Message-ID: <Y+3Sbnau5qtmFabI@atomide.com>
References: <20230209025525.148872-1-colin.foster@in-advantage.com>
 <20230209025525.148872-2-colin.foster@in-advantage.com>
 <20230209173534.GA539622-robh@kernel.org>
 <Y+yGYycS7rrBRBPN@atomide.com>
 <Y+0Ma9En4JLbR41t@COLIN-DESKTOP1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+0Ma9En4JLbR41t@COLIN-DESKTOP1.localdomain>

* Colin Foster <colin.foster@in-advantage.com> [230215 16:46]:
> On Wed, Feb 15, 2023 at 09:14:43AM +0200, Tony Lindgren wrote:
> > * Rob Herring <robh@kernel.org> [230209 19:35]:
> > > OMAP maintainers, if no one is going to convert all of omap.txt over to 
> > > schema, can we at least start an empty schema and add to it instead of 
> > > here...
> > 
> > That sounds like a good plan to me as it allows moving one device at a
> > time.
> > 
> > Colin, care to add the initial yaml binding file with your board?
> 
> I'll give it a go. To be clear, this would be
> Documentation/devicetree/bindings/arm/omap.yaml and it would
> include my device? I'm taking
> Documentation/devicetree/bindings/arm/sunxi.yaml as inspiration (for no
> reason other than it was the first one that I came across that seemed to
> solve this same issue)

Yes just something minimal to start with.

Thanks,

Tony
