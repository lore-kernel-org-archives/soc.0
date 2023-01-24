Return-Path: <SRS0=L/UR=5V=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3808CC25B4E
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 11:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01382C4339C; Tue, 24 Jan 2023 11:37:33 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0474C433D2;
	Tue, 24 Jan 2023 11:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0474C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id D31DA5C06FE;
	Tue, 24 Jan 2023 06:37:29 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 24 Jan 2023 06:37:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674560249; x=1674646649; bh=tmBI/aGrf4
	vkozl9Y+z8fJZ1F7zj81i0otgoA1X/TBM=; b=fMOBsP/OFLBHC8YP4Gi/XSYrzN
	bnsKdd9XSX9fhfh/0emk4V5yDRiszLwB6GwttEXbbIqccR3NrzhDTGPTBqeHHr1y
	U8ZOHLJQWb3xMfXqJgMEoNCI+dElTA2CXEukpvJGXJLmpXLTz+K4aQzAy/586GlA
	TISVDO3U14QJgf2zNiWamd+kr87XBoWsvA0FF2vgJJXo5WXlfU/KlQnc34GHRSm7
	5l+OWjv8Los7UATnVkGxuWstBuA11ibeHLEzTT4nw97C9WXETNSjGdCAwz9Qu2k+
	UBNf18NZc/1m5qQkrQ5mpWTmgZtvXV3FgyuqGOWuATtXVFKdExvhPWLDUIcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674560249; x=1674646649; bh=tmBI/aGrf4vkozl9Y+z8fJZ1F7zj
	81i0otgoA1X/TBM=; b=PxL3JoXD2iSX5Mb+bfFkJ8Shp5n2ZmQVNSrfPXABhTFH
	Mqmyt8YTduB5O70lq/+bR2VrGbWzpMewHoxJncBXyrfzWpKvLozF1Qm4J820TuzT
	jTY6EjPkB5vrefhs2JXWWdfve5XGiDvw0ZF2x+2L/Ms0Rquc1slGBcWnE2Ysu0es
	uuEmo3NxzgK+xJGkoHG14EQuR3zk71xzLJKiG1mII4NJg0qBeG17b69bQfKcFv0b
	5f7zhHj08UgS7TaPUxObonQ26Do6W+lxZi4gbjWuj2cqFbHfmLs2LJdbdzJECcy8
	Em1Tf22RpribpjcIjaH/GazREvHCC1ryiU7z5DanYg==
X-ME-Sender: <xms:-cLPY-1_L5DMf6Nxm7L4_hBBvNrc4QrJbfF6UGwayVANf_BVvOT9Bg>
    <xme:-cLPYxGCms04UMIbfWRTbTFHWhGWPYEDW2pAnbWLlwlQTi5rwBmfhliyLAST_rduz
    FfJ9KUlGjRcI2RVq40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvtddgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:-cLPY27_sPji-ekSouw1hvxCF9YsL9yJTckppGWuqkJlVzFsUoNDKw>
    <xmx:-cLPY_0BJQvi5BAbG8lB6Pe6MSaQRb4Ohy3F3OGM9ovdlUL2BYne4A>
    <xmx:-cLPYxHrCnbhY3f6C7SxqsNue-IO5OrLGbAPgIZUEGyOd1vKIAK-zQ>
    <xmx:-cLPYwCcIgJVJMSzNxhb5brCOna1QHeGz8yNlfSyhLbnnC9iPRlD9w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4768CB60086; Tue, 24 Jan 2023 06:37:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <56c22956-5e1e-4d82-8dd2-4a1f3654d0de@app.fastmail.com>
In-Reply-To: <4775166.GXAFRqVoOG@steina-w>
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
 <3629553.RUnXabflUD@steina-w>
 <7ab893a2-2b4f-47c3-be42-684c3d8ceb5f@app.fastmail.com>
 <4775166.GXAFRqVoOG@steina-w>
Date: Tue, 24 Jan 2023 12:37:10 +0100
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

On Tue, Jan 24, 2023, at 11:30, Alexander Stein wrote:
> Am Freitag, 20. Januar 2023, 15:00:35 CET schrieb Arnd Bergmann:
>> On Fri, Jan 20, 2023, at 13:43, Alexander Stein wrote:
>
> Thanks for the explanation, although I'm still lacking deeper knowledge how to 
> configure PCIe properly.
> I tried adding the following line in the 'ranges' property:
>> <0xc2000000 0x0 0x20000000 0x40 0x20000000 0x0 0x20000000>, /* prefetchable 
> memory */
> which was taken from the old example in Documentation/devicetree/bindings/pci/
> layerscape-pci.txt, removed in Commit a3b18f5f1d42e ("dt-bindings: pci: 
> layerscape-pci: define AER/PME interrupts", 2022-03-11).
> But I couldn't detect any difference, maybe it's just due to my PCIe devices I 
> have available.

Right, you need to have a device that actually wants to use prefetchable
memory, whichi is something that 'lspci -v' tells you. I'm also not
sure how this particular controller needs to be configured. Some
drivers read the 'ranges' properties and program the windows in
the PCI controller registers, while others expect the firmware to
have set up the hardware windows in the way they are described in DT.

>> It might be worthwhile to check if your system works
>> correctly with ARM_LPAE=y, VMSPLIT_2G=y and HIGHMEM=n,
>> which should be the best configuration for your system
>> anyway and will keep working after highmem gets removed.
>
> Thanks for that hint. Having this setting the board seems to still run like it 
> should.

Ok, good.

   Arnd
