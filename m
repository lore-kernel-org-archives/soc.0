Return-Path: <SRS0=wNEs=OZ=bootlin.com=alexandre.belloni@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7E1C433F5
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 16:28:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2A16F61381; Tue,  5 Oct 2021 16:28:23 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0585C61372;
	Tue,  5 Oct 2021 16:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0585C61372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CD54AFF806;
	Tue,  5 Oct 2021 16:28:16 +0000 (UTC)
Date: Tue, 5 Oct 2021 18:28:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>,
	jarkko.nikula@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>, Pratyush Yadav <p.yadav@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Linux I2C <linux-i2c@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	"Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	DTML <devicetree@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>, ka@semihalf.com,
	Tomasz Nowicki <tn@semihalf.com>, jam@semihalf.com,
	amstan@google.com
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
Message-ID: <YVx9IMk7cJSCK79/@piout.net>
References: <20211005143748.2471647-1-pan@semihalf.com>
 <20211005143748.2471647-3-pan@semihalf.com>
 <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>

On 05/10/2021 18:22:12+0200, Arnd Bergmann wrote:
> On Tue, Oct 5, 2021 at 4:37 PM Paweł Anikiel <pan@semihalf.com> wrote:
> >
> > On SoCFPGA systems, it's desireable to have fixed numbering for
> > i2c busses, while being able to enable/disable them (e.g. have i2c1
> > be mapped to /dev/i2c-1, even though i2c0 is disabled). This can also
> > be achieved using devicetree aliases (see i2c_add_adapter). However,
> > having the driver be self-contained without relying on aliases is more
> > robust.
> >
> > Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> 
> I don't see how adding a nonstandard property in one of the i2c bus
> drivers helps at all. How do you expect this to work when there are
> multiple i2c controllers in the system using different drivers? What
> should happen if both an alias and the busno property are set?
> 

What happens when two nodes have the same busno property because e.g.
one is in a dtsi and the other one is in a dts?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
