Return-Path: <SRS0=mBfy=S6=lunn.ch=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BDFC433F5
	for <soc@archiver.kernel.org>; Tue, 15 Feb 2022 21:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34662C340EC; Tue, 15 Feb 2022 21:14:48 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBAA3C340EB;
	Tue, 15 Feb 2022 21:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBAA3C340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VciEL4ZTKshzMSUkJMx5NYRnWgLitJnacLtA5OTQXyk=; b=efPewsKMHHD2q2eSapMI5+IprN
	CSSlNhNN1fOCqFfsorY3b3RZ+I6mMVxq8FbtMWhBTB4BsdKXGXdtLAVeK81cD9FFlJL+Y7aRXF6tU
	AqHztH9gvn+9hhkOcRP4l4WkppEckbJUQXqZoRSOAbSKZq3wSk9HV6G47SxYZnEngObQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1nK59m-0067eu-Dh; Tue, 15 Feb 2022 22:14:42 +0100
Date: Tue, 15 Feb 2022 22:14:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Pawel Dembicki <paweldembicki@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Shawn Guo <shawnguo@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Oleksij Rempel <linux@rempel-privat.de>,
	Hao Fang <fanghao11@huawei.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] ARM: dts: kirkwood: Add Ctera C-200 V1 board
Message-ID: <YgwXwmypfyJmlTWf@lunn.ch>
References: <20220215163926.894-1-paweldembicki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215163926.894-1-paweldembicki@gmail.com>

On Tue, Feb 15, 2022 at 05:39:22PM +0100, Pawel Dembicki wrote:
> Ctera C200 V1 is kirkwood-based 2-Bay NAS.
> 
> Hardware:
>   - SoC: Marvell 88F6281-A1 ARMv5TE Processor 1.2GHz
>   - Ram: 512MB (4x Nanya NT5TU128M8GE-AC)
>   - NAND Flash: 256MB (Samsung 216 K9F2G08U0C)
>   - Lan: 1x GBE (Marvell 88E1116R-NNC1)
>   - Storage: 2x SATA HDD 3.5" Slot
>   - USB: 2x USB 2.0 port
>   - Console: Internal J3 connector (1: Vcc, 2: Rx, 3: Tx, 4: GND)
>   - LEDs: 13x GPIO controlled
>   - Buttons: 2x GPIO controlled
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
