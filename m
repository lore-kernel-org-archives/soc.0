Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D67C4345F
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 16:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2426C2BD11; Fri, 26 Apr 2024 16:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5570C113CD;
	Fri, 26 Apr 2024 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714149613;
	bh=9nlNpjXl2tclRLBwf7U2c3+7suexJGgJHSSMR5Q3zxM=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=dCWxMZMqrnYjsFMLJd4hWadH2UkfHRPpcOKTV9JmQqVgSg4+n2KdMaVNqCjvSPyAB
	 D+bSRM+tDfCbIyb3MyVCzHopupyN3JMmBAUT8DUrLvHXt1BDOsexBQ0IaXHQQmm2ji
	 8UoVjaaBSFZEm3F1/ZPoY8W+7hZd0+LEQB1XacfqZxbZ0lsKQC6/NSVf7axKv6ChEB
	 N/0yF8uSbseVxg/s65iYt9ILGYye/IyECbGA5f/6ePwWEc+K5foPciLeMPQZQAMB6o
	 seN+SbCWuWC5fFpod3qkv1vrbEu9ZGqtaEnmL/g7eGZpRESsGfLrmYgXPmYYqqTEpV
	 4OWKvNmlN2q9w==
Date: Fri, 26 Apr 2024 18:40:04 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy
 Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <uwe@kleine-koenig.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 8/9] ARM: dts: turris-omnia: Add MCU
 system-controller node
Message-ID: <20240426184004.2456f2e6@dellmb>
In-Reply-To: <87bk5w5d0v.fsf@BLaptop.bootlin.com>
References: <20240424173809.7214-1-kabel@kernel.org>
	<20240424173809.7214-9-kabel@kernel.org>
	<87bk5w5d0v.fsf@BLaptop.bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Apr 2024 18:01:20 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> Hello Marek,
> 
> > Turris Omnia's MCU provides various features that can be configured over
> > I2C at address 0x2a. Add device-tree node.
> >
> > Fixes: 26ca8b52d6e1 ("ARM: dts: add support for Turris Omnia")  
> 
> Is it really a fix ?
> 
> It seems that the node you add depends on the firmware support that was
> not yet added.
> 
> Gregory

It is a fix in the sense that Omnia always had the MCU, and so
device-tree without the MCU node was incorrect.

Since device-trees should be (if possible) backwards and forwards
compatible, this should not be a problem.

But I am guessing it might be because of what new U-Boot does: if it
finds the MCU node in the device-tree, it will add a reset gpio property
for ethernet PHY, linking it to the MCU node. So if this
patch got backported to older kernel where the MCU driver is not
present, and the board had this new U-Boot, the kernel would not create
the eth2 interface, because it would be waiting for a driver providing
the GPIO.

So hmm, maybe I should drop the Fixes tag.
