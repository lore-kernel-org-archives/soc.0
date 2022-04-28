Return-Path: <SRS0=dR5z=VG=lunn.ch=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA8BC433EF
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 23:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A1C5C385AE; Thu, 28 Apr 2022 23:26:58 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B47FC385A9;
	Thu, 28 Apr 2022 23:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B47FC385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=J2DaY/L9lR+odLjYmINpHt4Diez0fj7s9J9Uzcl4Ln0=; b=6KnF6zerY+KrTa1cLe6DCvGd5y
	GZXEPgoOzzmFz/0GOMR5X0/NE/IW7oooQM0FUyv7PT3kdCmG/0iOgB4LOA7uP54hHjJtmwc9dykRR
	wY9wL+iBkis6PnYNZHYEXfdUgoyOaJxaVyoBLbDGG3qHSlHFovaRahU8Ydcjs7QiQGog=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1nkDWz-000OOo-Bt; Fri, 29 Apr 2022 01:26:41 +0200
Date: Fri, 29 Apr 2022 01:26:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mauri Sandberg <maukka@ext.kapsi.fi>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	DTML <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [RFC RFT PATCH v1 0/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
Message-ID: <YmsisTq28nsSlf3k@lunn.ch>
References: <20220427162123.110458-1-maukka@ext.kapsi.fi>
 <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>
 <YmndWe63ELJbQe20@lunn.ch>
 <b9c7eb81-c49e-76bf-5b49-b97cb5c2b03d@ext.kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9c7eb81-c49e-76bf-5b49-b97cb5c2b03d@ext.kapsi.fi>

On Thu, Apr 28, 2022 at 11:25:00PM +0300, Mauri Sandberg wrote:
> Hello Andrew!
> 
> On 28.4.2022 3.18, Andrew Lunn wrote:
> > > > - there is no concensus on how to get ascii formatted MAC address from mtd
> > > >    partitions so eth is not fully functional without setting the MAC from
> > > >    userspace
> > > 
> > > Ideally this is handled by the boot loader, but that requires being
> > > able to update
> > > it.
> > 
> > The mv643xx Ethernet driver is happy if it finds the MAC address
> > already in the hardware. The vendor uboot often does this. Does tftp
> > boot work in uboot? That would indicate it has access to the MAC
> > address.
> 
> The u-boot is really limited and I am transferring new images over kermit.

Ouch!

If you can, try kexec. You can use wget or similar to grab the kernel
from you host machine, and then something like:

kexec --append 'rootwait ro earlyprintk console=ttyS0,115200n8' bzImage

wget will be much faster then kernel.

      Andrew
