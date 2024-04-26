Return-Path: <SRS0=b8qS=L7=lunn.ch=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83E1C4345F
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 18:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96471C113CE; Fri, 26 Apr 2024 18:21:55 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C52BC113CD;
	Fri, 26 Apr 2024 18:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C52BC113CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=APx8CNyepfOybgKgsGIZF2EVtiy+hTSLRQRf/E9nabU=; b=Lkd4kQSlimcG5lR+SZQuW7x4KN
	PZ32NgZ7oaNfZktV7lUzWd6fZynuAB/CSVMfPhvJDY8SjHDfTLPg7Rqy+mxyz2m/N7OdiAkfpraX1
	sOAOmTUxR5Qkj/NirZOw8Hn1XLi4T5/+9opyOV5lI41mlpQBVYK06cQwmtvTHNGP7MXE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s0QCd-00E66x-Qz; Fri, 26 Apr 2024 20:21:43 +0200
Date: Fri, 26 Apr 2024 20:21:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 8/9] ARM: dts: turris-omnia: Add MCU system-controller
 node
Message-ID: <4c5993d2-a75b-4f52-a0c7-cbbb153b1e28@lunn.ch>
References: <20240424173809.7214-1-kabel@kernel.org>
 <20240424173809.7214-9-kabel@kernel.org>
 <87bk5w5d0v.fsf@BLaptop.bootlin.com>
 <20240426184004.2456f2e6@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426184004.2456f2e6@dellmb>

> But I am guessing it might be because of what new U-Boot does: if it
> finds the MCU node in the device-tree, it will add a reset gpio property
> for ethernet PHY, linking it to the MCU node. So if this
> patch got backported to older kernel where the MCU driver is not
> present, and the board had this new U-Boot, the kernel would not create
> the eth2 interface, because it would be waiting for a driver providing
> the GPIO.

You should make this clear in the commit message. There is a danger
the ML algorithm which picks patches for back porting decides this is
a candidate. Hopefully a human will read the commit message and then
reject it.

       Andrew
