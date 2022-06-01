Return-Path: <SRS0=ACcd=WI=startmail.com=hanetzer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41883C433EF
	for <soc@archiver.kernel.org>; Wed,  1 Jun 2022 10:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E1BBC3411D; Wed,  1 Jun 2022 10:59:05 +0000 (UTC)
Received: from mx-out1.startmail.com (mx-out1.startmail.com [145.131.90.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1CB8C385B8;
	Wed,  1 Jun 2022 10:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A1CB8C385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=startmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=startmail.com
Date: Wed, 1 Jun 2022 05:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
	s=2020-07; t=1654081133;
	bh=xLfn3Y0/yusqS6Eog6u344rvDpPcQgkFd+Nc9svjBZc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:From:Subject:To:Date:
	 Sender:Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:Autocrypt;
	b=yKR1FSWQZKbmWEJq56tQ7+c8inCVHzc/rmVKOXmTvPxNJFpV+LWFw5BanJCRftdiH
	 P+xcq4HwEtf6xrHoas36nm9U5blUYUV4dPHXZUb4LkZruJoC4SFEk+l9CwXLLl+H08
	 gi+Fr0mfxIsDMCNJr3YBNv2FCMJDM89OfpnOQrpny8JU0kgxu5nYrooYNWsRSY4pAK
	 nLE7939OCvlXlFWiVLi/w2+7QBptE2o1wAgcBzfwHXyzgVLJ0UE7PjcrtyG7iIs0Nq
	 Llsezfhj7YOheX1YykDGie3p5GrkY8a4UQ/SyAhc+uzxNVQORsQlEa+2HHM728LeDe
	 pr+gnnUvXrpDQ==
From: "Marty E. Plummer" <hanetzer@startmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, cai.huoqing@linux.dev, christian.koenig@amd.com,
	devicetree@vger.kernel.org, gengdongjiu@huawei.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux@armlinux.org.uk, michael@walle.cc, miquel.raynal@bootlin.com,
	mturquette@baylibre.com, novikov@ispras.ru, olof@lixom.net,
	p.yadav@ti.com, rdunlap@infradead.org, richard@nod.at,
	robh+dt@kernel.org, sboyd@kernel.org, soc@kernel.org,
	sumit.semwal@linaro.org, tudor.ambarus@microchip.com,
	vigneshr@ti.com, xuwei5@hisilicon.com
Subject: Re: [RFC v2 1/2] clk: hisilicon: add CRG driver Hi3521a SoC
Message-ID: <20220601105846.7hriawg3stxb657f@proprietary-killer>
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
 <20220501173423.2473093-2-hanetzer@startmail.com>
 <f42cb4d0-7133-eea5-b456-b5169bebfad1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f42cb4d0-7133-eea5-b456-b5169bebfad1@linaro.org>

On Tue, May 03, 2022 at 01:37:42PM +0200, Krzysztof Kozlowski wrote:
> On 01/05/2022 19:34, Marty E. Plummer wrote:
> > Add CRG driver for Hi3521A SoC. CRG (Clock and Reset Generator) module
> > generates clock and reset signals used by other module blocks on SoC.
> > 
> > Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
> > ---
> >  drivers/clk/hisilicon/Kconfig             |   8 ++
> >  drivers/clk/hisilicon/Makefile            |   1 +
> >  drivers/clk/hisilicon/crg-hi3521a.c       | 141 ++++++++++++++++++++++
> >  include/dt-bindings/clock/hi3521a-clock.h |  34 ++++++
> 
> Bindings go to separate patch. Your patchset is unmerge'able.
> 
So, assuming I have the following patches:
1: +include/dt-bindings/clock/hi3521a-clock.h
2: +drivers/clk/hisilicon/crg-hi3521a.c
3: +Documentation/devicetree/bindings/whatever

In what order should they be applied?
> Best regards,
> Krzysztof
