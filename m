Return-Path: <SRS0=dR5z=VG=lunn.ch=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72F7C433EF
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 00:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5F2D5C385A9; Thu, 28 Apr 2022 00:18:55 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE427C385AC;
	Thu, 28 Apr 2022 00:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EE427C385AC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0E/cZusX8gpwqJUzB3w+9Rv4b0UfsFQ/mLYGkgPRNOs=; b=y+ijRyxoQ1DISj2pwyZhtX+dHL
	M4WdFl3JEly9NjkHVun/hJOB598V0S2NlmSQ/hmaUhZfNe1JEry1+g2CC5ZdvMiUbVXpr+WdhZpNZ
	Z6VhLCnpiXNNlNqkZfVwWLwn2+rrShqobX+ZUcWZfC86PLNJ3ujm64lhIYVPlaBe12qk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1njrrd-000Cwl-Qv; Thu, 28 Apr 2022 02:18:33 +0200
Date: Thu, 28 Apr 2022 02:18:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Mauri Sandberg <maukka@ext.kapsi.fi>, SoC Team <soc@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	DTML <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [RFC RFT PATCH v1 0/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
Message-ID: <YmndWe63ELJbQe20@lunn.ch>
References: <20220427162123.110458-1-maukka@ext.kapsi.fi>
 <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>

> > - there is no concensus on how to get ascii formatted MAC address from mtd
> >   partitions so eth is not fully functional without setting the MAC from
> >   userspace
> 
> Ideally this is handled by the boot loader, but that requires being
> able to update
> it.

The mv643xx Ethernet driver is happy if it finds the MAC address
already in the hardware. The vendor uboot often does this. Does tftp
boot work in uboot? That would indicate it has access to the MAC
address.

	Andrew
