Return-Path: <SRS0=5t4m=5Q=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D57C00A5A
	for <soc@archiver.kernel.org>; Thu, 19 Jan 2023 15:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3485EC433F0; Thu, 19 Jan 2023 15:09:31 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D1CDC433D2;
	Thu, 19 Jan 2023 15:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D1CDC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 617415C009E;
	Thu, 19 Jan 2023 10:09:28 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 19 Jan 2023 10:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674140968; x=1674227368; bh=93MK1e9ilZ
	3paFDFGrXMn6AVbSKSvQpQ50BYcz3A68s=; b=HiTx94/J6ekTZROPZlwRoFCM0O
	6rmOcL1zuj+XWZAnkM/gV2bNAdK/9Z6d/tGVpuYZ9W8RIqMIdpUIXvQn0A+O89/b
	/A8Na35e9kqYQPV0ckOIDlGS+7vHFbdj1BRfBbEnXz7NQPKCVewov6Z755wAfiP6
	ZKHvwuQnKNJf+e4/nIdc3ke0qJUKTtJ6SbkzX319L5yChf2sRrzOp5W77Bg6QgpV
	B16Ng6D0KNlbsW3niaLjwfIl3FphacGUCbjFGV46GqT/kHQYiUvmw+lcyYvHUNn3
	gXqMY2AUIkl1Rm08scXOwdEMZOM7UqnVz2CSQW3gb9lew2fKJSCpJF4Y/qfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674140968; x=1674227368; bh=93MK1e9ilZ3paFDFGrXMn6AVbSKS
	vQpQ50BYcz3A68s=; b=KmCQAc1G8LO5Dbj834YAx7mTgg6KVRw6EgJJcfRkeZ0T
	m4EeKlAPxRqQiml01IRMZOWb5BdtKUzGq18cvrdnoBvr/+LYZMsmS478MSfuBfIm
	jmoOpKCXuQLONnNmS8lUpRtUoGWL7SIGW4NrYAbSG/LUqVdwqHh2UhsH/VpkGcMM
	mQyZyNVUgPIBiwm8QaG2J5Okbv3ku2kS+QI3CAqVQoITOomScoEVUloSDNgeKOYj
	9i17A9BfLirIPt8ppLIWIJW8gTOFGEDevLZq9f0sqtGOiEetrBGotX4FZJjjIzMt
	5M4fnFwUAoqiXAauhs79ac1S298Ivw72qNFxbHlraA==
X-ME-Sender: <xms:J13JYyI1X5vpJwSghC0-Ri1b1CGN811o1k506xs5yl_TAIViPka6iQ>
    <xme:J13JY6JHlHAjlToIqxzmSypz1pphqXpzO_vVyk1NeQjXUvqS39xph4zw_dRUgcllR
    U78ssJoczQUrH6L_5c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddutddgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:J13JYytkNqQnjHWpPHA-KepXyTz4tv-Evc4uIG75UWhdvn2LYQ2SjA>
    <xmx:J13JY3a0rq9BzPnVwbIhmCCLSmJJuJ6owhigvjiIMDQPkREmyzQXmw>
    <xmx:J13JY5aekLBUsBUZceqXVy6pei8XlzWW9Bd4P_bkRypWh1QNyAt8rQ>
    <xmx:KF3JY7neURukhGOShGrfcMpvW2_A8jueEmYexJH8FoVO-yeeGGHI9g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D9737B60086; Thu, 19 Jan 2023 10:09:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <f1de9cd9-a163-4b56-adf8-319eaf85e38e@app.fastmail.com>
In-Reply-To: <20230119144236.3541751-10-alexander.stein@ew.tq-group.com>
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
 <20230119144236.3541751-10-alexander.stein@ew.tq-group.com>
Date: Thu, 19 Jan 2023 16:09:05 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Olof Johansson" <olof@lixom.net>, "Shawn Guo" <shawnguo@kernel.org>,
 "Li Yang" <leoyang.li@nxp.com>, "Russell King" <linux@armlinux.org.uk>,
 "Marek Vasut" <marex@denx.de>,
 "Marcel Ziswiler" <marcel.ziswiler@toradex.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 9/9] [DNI] ARM: multi_v7_defconfig: Enable CONFIG_ARM_LPAE for
 multi_v7_config
Content-Type: text/plain

On Thu, Jan 19, 2023, at 15:42, Alexander Stein wrote:
> This is necessary to support PCIe on LS1021A.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Can you explain why this is actually required? I can see that the
ranges in the PCIe device point to a high address (0x4000000000,
2^40), but I can't tell if this is hardwired in the SoC or a
setting that is applied by software (either the bootloader or
the PCIe driver).

If you can reprogram the memory map, I would expect this to fit
easily into the 32-bit address space, with 1GB for DDR3 memory
and 1GB for PCIe BARs.

I don't mind having a defconfig with LPAE enabled, I think this
can be done using a Makefile target that applies a config
fragment on top of the normal multi_v7_defconfig, you can find
some examples in arch/powerpc/configs/*.config.

   Arnd
