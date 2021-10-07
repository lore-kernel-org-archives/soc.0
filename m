Return-Path: <SRS0=FMRd=O3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462BBC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 21:01:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F320860FDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 21:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F320860FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J89fUmTkst0S+JxsVjcC09VvS1CBS1UZwGWWSWh/xfU=; b=BINn7rqd+9R9ft
	gsv6sKIESY+fNtVYI8LKSYr2m7AASO+g+yPVLouWX80TRMvkA0ELRrDC2o4+XhbuXrQc7bEfSh8sI
	pimJzuoo2YDgMO3K64HaMA71ioEgKorYxOY8zVQCyfi6+bPEd51xXWT31qO7pkRHtAYmahe5vwzXs
	P4GEtU9Jf7wdgr0LhMeYmMWl6wCJy0JfTm7V3eN2JHHEetRuzr+HISaVf4A3vgJGHrp2vaZMIoN5K
	WvAUCjhcYl9D7U0/k4z05/Tpxdv6sNqdJxt+Zb6kZWTU22dtuVlqKxqnJtPdM1bHsDCqhM128mD2Q
	cFNCogX5OCQ9NF5mfoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYaUw-000l5t-HO; Thu, 07 Oct 2021 21:00:14 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYaUs-000l3G-9H
 for linux-arm-kernel@lists.infradead.org; Thu, 07 Oct 2021 21:00:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=5t9Uq9pDfGhlTNstnpRIElreH30LAAQahsG93S0mqW8=; b=PP+d+28YbI6hZeLEUq8WuW2Tmt
 VECZkv2+recIqjG7oVmDJRTlqWC/lHSI4UBM5CfxuAaonRa4PNrwH95gy7OkLK9k606LTA40itT1S
 itflcBJYdlUxgghG0U9v4IfSkz7sKsSJVQpsUUUQZj0ba5klsP0M8Ao0g0NeyBeffWTY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mYaUk-009zgc-Ff; Thu, 07 Oct 2021 23:00:02 +0200
Date: Thu, 7 Oct 2021 23:00:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marcel Ziswiler <marcel@ziswiler.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Frank Rowand <frowand.list@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, soc@kernel.org
Subject: Re: [PATCH v3 3/3] ARM: dts: mvebu: add device tree for netgear
 gs110emx switch
Message-ID: <YV9f0qhwn770Hf8+@lunn.ch>
References: <20211007205659.702842-1-marcel@ziswiler.com>
 <20211007205659.702842-4-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211007205659.702842-4-marcel@ziswiler.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_140010_352511_B83DD68D 
X-CRM114-Status: GOOD (  11.89  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211007210002.24VUxBNUzz-DYzzYYAJfmv570kczOUaXVez1u9jmwgs@z>

On Thu, Oct 07, 2021 at 10:56:59PM +0200, Marcel Ziswiler wrote:
> Add the device tree for a Netgear GS110EMX switch featuring 8 Gigabit
> ports and 2 Multi-Gig ports (100M/1G/2.5G/5G/10G). An 88E6390X switch
> sits at its core connecting to two 88X3310P 10G PHYs. The control plane
> is handled by an 88F6811 Armada 381 SoC.
> 
> The following functionality is tested:
> - 8 gigabit Ethernet ports connecting via 88E6390X to the 88F6811
> - serial console UART
> - 128 MB commercial grade DDR3L SDRAM
> - 16 MB serial SPI NOR flash
> 
> The two 88X3310P 10G PHYs while detected during boot seem neither to
> detect any link nor pass any traffic.
> 
> Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
