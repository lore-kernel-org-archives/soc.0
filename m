Return-Path: <SRS0=Z+sk=VT=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AAFC433FE
	for <soc@archiver.kernel.org>; Wed, 11 May 2022 09:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01AFCC340F0; Wed, 11 May 2022 09:07:17 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A73D0C340EC;
	Wed, 11 May 2022 09:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A73D0C340EC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 8042F22246;
	Wed, 11 May 2022 11:07:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1652260027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SFLazLqodw88O+Oa2pGpE5oHQ9oeAxdq4SGRj/usDso=;
	b=EST04xsRjCrr5enoExqUbt/IzHag4Pa5FTLvHeE06M82WUupQntxibwz+Xd5OnqMGYO97m
	2A8zWmDafXdH8xirdjwB7nxHUY/eO+fbuW1Vkg3rfyzYKsl19N8LOKzO6hR9SfW6pTkvDQ
	LT4goOFPdNz+5PuvH4jl8CE7mntG4h0=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 11 May 2022 11:07:06 +0200
From: Michael Walle <michael@walle.cc>
To: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Tudor.Ambarus@microchip.com, Horatiu Vultur
 <horatiu.vultur@microchip.com>
Subject: Re: [PATCH v4 00/13] ARM: dts: lan966x: dtsi improvements and KSwitch
 D10 support
In-Reply-To: <20220502224127.2604333-1-michael@walle.cc>
References: <20220502224127.2604333-1-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <722a2b75211695b63699457f653a3f1c@walle.cc>
X-Sender: michael@walle.cc

Am 2022-05-03 00:41, schrieb Michael Walle:
> Add missing nodes for the flexcom blocks and a node for the SGPIO
> block. Then add basic support for the Kontron KSwitch D10.
> 
> The first submission of this patchset was a long time ago. Since
> then networking matured and is now working. Thus this now also
> contains patches for all the networking related nodes and enables
> them on the Kontron D10 switch.

Thanks Claudiu for reviewing and Horatiu for testing.

Nicolas, could you pick this one up for the next merge window? Most
of the patches are now pending for 4+ weeks. It would be great to
have the support for our board in mainline to finally get it into
KernelCI.

-michael
