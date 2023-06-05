Return-Path: <SRS0=TH8/=BZ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FB3C77B73
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 12:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71339C4339E; Mon,  5 Jun 2023 12:00:55 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5F1EC433D2;
	Mon,  5 Jun 2023 12:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5F1EC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 40ACF3200033;
	Mon,  5 Jun 2023 08:00:51 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 05 Jun 2023 08:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1685966450; x=1686052850; bh=Hm
	VO2n4IR8EcYgz8xGvcBL19JXs9b2aJi2zXvALeGqw=; b=qPRm0DEOWNwBbWbSV7
	R3fFsfnApOpWs4BP6e2ti0iTW4UseDz2ibxGtQczcBcRIzwnvwosPwFpwQR+9yJa
	KG6a4m6SILkmbLYNpwuh0POLLd5WfW/26AkRtLpWAQWEQbA/ty93fhak1p3ZYiuZ
	aQ7coOO5wsOZAX1rwQFCKJeJJzXqOibfL9acQzmrC2hrNjygbSfWqWSm9l7lwrYb
	q9UjaOOgZ1sZ+Q6ztyyyBmtMjQdtbkh5mLmUDPe4cTOyAboW02vZKP7ea+LewzeG
	2VDxjz/tPinxy08idrN13QAvD6e9vWvpiuEcv6vjEbKWjtRdeVOEOKLi1PuP6UrQ
	g9eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685966450; x=1686052850; bh=HmVO2n4IR8EcY
	gz8xGvcBL19JXs9b2aJi2zXvALeGqw=; b=Ezxuf5w7NHnh3cjOECvD07RFsaRSX
	CBo3D0SoTQSIZH50UOUESaFMsY2y9G32BpwUT+NJ6aYBGzNI0gD4h5izXHgDBU0M
	RQ+TDfMnNr7hJNYRw45C2cyv3YuDkh+hYtJhVEt/PfJ5tRqa+HyeTyUqDNCNxKX5
	IIgUjTus/A1I0XAPCVCThcdrsVbshhVGp+D5/7stlAGSW+u1H5WqrpjY3Lt9s4vk
	yGoPeyH1pbvwvkyv0xKdMyLBNjLHlptsCGiGNPZgQNcH3uWw/+2/JO87WFE4kknw
	opj+MK3SCTNDvpJLH7uHOFKgZBAO4c30a/v3ApEKjf4Hs/U2lqAl6EdCg==
X-ME-Sender: <xms:cM59ZCxm-m4GBlzfGsV7tXYPXvGtj5btFRwqR49VqJNh7oxqmPXm3Q>
    <xme:cM59ZOQk79ghw6O2w0Ow-C3_YIsA2UMJvxTQicexI6UzKVHvF5i7qaLuE2Az27E8G
    e7A3zU2F3PgVCpXXo4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeelledggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepleejueevuefggefhleefgeevvefgudeltedtheejfefgueffhfeuveevieff
    veegnecuffhomhgrihhnpehnuhhvohhtohhnrdgtohhmpdhgihhthhhusgdrtghomhdpkh
    gvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:cM59ZEXlh-ra-hFBuH_D6pVXUVOzlpU2Dz3qWX9w3k-0Mav_6hpk6A>
    <xmx:cM59ZIgIWGpSFe-CDi8FCfLULaQdC8ZWKkL3JEmXn98EN-u3EL_MFQ>
    <xmx:cM59ZECWyWhBeG-boOu4qd6lbYfng27SubxZfeEt9oX1hOUO43KWqg>
    <xmx:cs59ZM5tdKx_GY7gJ1wgGVrDMMlWDk0JiaSafi-Z8hVzz8Rz5t9ajQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A8E17B60086; Mon,  5 Jun 2023 08:00:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <9dc45c49-02aa-4e63-a176-97e3536f14f4@app.fastmail.com>
In-Reply-To: <20230605040749.67964-1-ychuang570808@gmail.com>
References: <20230605040749.67964-1-ychuang570808@gmail.com>
Date: Mon, 05 Jun 2023 14:00:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jacky Huang" <ychuang570808@gmail.com>,
 "Rob Herring" <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 "Lee Jones" <lee@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Tomer Maimon" <tmaimon77@gmail.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, soc@kernel.org, schung@nuvoton.com,
 mjchen@nuvoton.com, "Jacky Huang" <ychuang3@nuvoton.com>
Subject: Re: [PATCH v13 00/10] Introduce Nuvoton ma35d1 SoC
Content-Type: text/plain

On Mon, Jun 5, 2023, at 06:07, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
>
> This patchset adds initial support for the Nuvoton ma35d1 SoC, including
> initial device tree, clock driver, reset driver, and serial driver.
>
> This patchset cover letter is based from the initial support for Nuvoton
> ma35d1 to keep tracking the version history.
>
> This patchset had been applied to Linux kernel 6.4.0-rc5
> and tested on the Nuvoton ma35d1 SOM evaluation board.
>
> (ma35d1 information: 
> https://www.nuvoton.com/products/microprocessors/arm-cortex-a35-mpus/)
> MA35D1 porting on linux-5.10.y can be found at: 
> https://github.com/OpenNuvoton/MPU-Family
>
> v13:
>   - Modify serial driver
>     - Added a check for oops_in_progress in ma35d1serial_console_write to
>       determine whether to perform the spin_lock.
>     - Rebased drivers/tty/serial/Kconfig and recreate the patch
>     - Rebased MAINTAINERS and recreate the patch

Hi Jacky,

This is looking good to me, thanks for getting it this far.
I see all patches aside from the last one have been reviewed by
at least one person. The clock driver is still missing an Ack
from the clk maintainers, but I see that you have addressed
Stephen's concerns from an earlier review round, so I expect
this to be fine.
Stephen, let me know if you have any final concerns about this driver.

The serial port driver was still getting some last changes, so
I only picked up the binding but not the driver here. If Greg
and Jiri are happy with this version, I'd prefer to just add
this with their Ack as well, otherwise please send only that
patch for any follow-up revisions. If you can finish this
before the linux-6.5 merge window, I'd add it on top of the
other patches, otherwise it should just go through Greg's
tree.

If anything else should come up, let's handle this as patches on
top of the branch I have now pushed in [1], no need to resend
these.

      Arnd

[1] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=nuvoton/ma35d1
