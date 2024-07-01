Return-Path: <SRS0=31Gx=OB=lunn.ch=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62ABC2BD09
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 13:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B28BEC4AF1A; Mon,  1 Jul 2024 13:01:38 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 580C6C4AF0D;
	Mon,  1 Jul 2024 13:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 580C6C4AF0D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=2E3BLTy0WuJ2t9f1JjinnzPKZ4WNi8N08TB4y741yVU=; b=JV
	soXaZMB7qfZzoGH+rlO6J9vbC07m2adjTV6NoeUq/GgsLZBU7IpcBGAxTJOkyzQdXeRzJvExlqqyA
	inksPSqK0cTQvUsuRanvmH7t/o7tGqycJ2q2Vj2Prh5Jnyb7MrGhRrq/9WS7Y7hE99YBiDCgIasO4
	5blkI7o0Ozu4sl4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sOGex-001XBo-8r; Mon, 01 Jul 2024 15:01:31 +0200
Date: Mon, 1 Jul 2024 15:01:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v13 7/8] ARM: dts: turris-omnia: Add MCU
 system-controller node
Message-ID: <f3ea3044-a64a-4c4f-ad86-2d2ce9220c41@lunn.ch>
References: <20240701113010.16447-1-kabel@kernel.org>
 <20240701113010.16447-8-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240701113010.16447-8-kabel@kernel.org>

On Mon, Jul 01, 2024 at 01:30:09PM +0200, Marek Behún wrote:
> Turris Omnia's MCU provides various features that can be configured over
> I2C at address 0x2a. Add device-tree node.
> 
> This does not carry a Fixes tag - we do not want this to get backported
> to stable kernels for the following reason: U-Boot since v2022.10
> inserts a phy-reset-gpio property into the WAN ethernet node pointing to
> the MCU node if it finds the MCU node with a cznic,turris-omnia-mcu
> compatible. Thus if this change got backported to a stable kernel, the
> WAN interface driver would defer probe indefinitely (since it would wait
> for the turris-omnia-mcu driver which would not be present).
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
