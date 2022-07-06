Return-Path: <SRS0=okwi=XL=aurel32.net=aurelien@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E3CC43334
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 20:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32ECFC3411C; Wed,  6 Jul 2022 20:52:01 +0000 (UTC)
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 885D2C341CA;
	Wed,  6 Jul 2022 20:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 885D2C341CA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=cpsupG4wNSVWGSNGpgP/ZSMxTCTkjn3ZZ2DZK/f6x+E=; b=PmD0CeTOjqgFhCcczhh4k1/tss
	acu5odQz4clZS//sIRDDdE/5fOgKQ8OXZG4Fa0UABAq03WYr3hBeysXfmVbFVJxqW+S/vjvs3zYIz
	Wj7h2Vp0BeKAi9DDFcU0WoT6VGJGaofB54cL0XyPqUvtNSQNjoptyuggxXP/MMmGDYpbc++VEshFK
	jbCUNbmtMfT5ZhqbUDOjhvQowiV8mg2RKinC9CYPZFCDTiag66Aq848fGRmZStMBJU5H/PwpgmSpu
	VJAND4+fpumz/IMc95AhOzQQvUFN3SHWDdxPrpTXOas9fCoh5tCAgl2l8HsV+M3YDl21KylaBN+9X
	ZUYY7gdw==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1o9Bzn-004uGC-TB; Wed, 06 Jul 2022 22:51:39 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.95)
	(envelope-from <aurelien@aurel32.net>)
	id 1o9Bzl-0005Hm-Rq;
	Wed, 06 Jul 2022 22:51:37 +0200
Date: Wed, 6 Jul 2022 22:51:37 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, soc@kernel.org
Subject: Re: [PATCH RESEND 0/2] arm/arm64: dts: Enable device-tree overlay
 support for RPi devices
Message-ID: <YsX12ZQwWMtKfjQN@aurel32.net>
References: <20220427233607.1225419-1-aurelien@aurel32.net>
 <2cfbf1a0-2cef-057d-dce4-13ee50c626d7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cfbf1a0-2cef-057d-dce4-13ee50c626d7@gmail.com>
User-Agent: Mutt/2.2.4 (2022-04-30)

On 2022-05-18 12:52, Florian Fainelli wrote:
> 
> 
> On 4/27/2022 4:36 PM, Aurelien Jarno wrote:
> > This patchset changes the generation of the Raspberry Pi devices DTB
> > files to improve the support for out-of-tree device-tree overlays, like
> > it has recently been done for the Nvidia SoCs.
> > 
> > I personally only need that for arm64, but I have added a similar patch
> > to do the same on arm.
> 
> This looks good to me, Rob, does that approach work for you?

Any news about that?

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
