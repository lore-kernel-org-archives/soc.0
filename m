Return-Path: <SRS0=0e0n=KA=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3868C5478C
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 12:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67722C433F1; Fri, 23 Feb 2024 12:29:34 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E477C433C7;
	Fri, 23 Feb 2024 12:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E477C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 646DD5C00DA;
	Fri, 23 Feb 2024 07:29:31 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 23 Feb 2024 07:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1708691371; x=1708777771; bh=pxFPwb6HjK
	PvW27fwA8WFy+u7MzONuRNyoRKfC76UzU=; b=BtRBDQXSf9uD8JKfxK49mSp7Kf
	eNot6Ot0w2MrrHhwH4pY1XF8vdZ9+c1cwuzoyzD0q+2nQ5L6TfoGry9vobhGKIEz
	KRIlhRtSfXJxxMlnQpKk3Dn1bTQNsPD/eEtz8nDCQtpcJduivuGuguPvYfB74sRS
	rSjmUmddxrlX3QkjUKLbjiD06fOfDPZ7ECHcvr8w2LmzRhFzp2Kh+71kzRFJ/k03
	tRUzEWYkPYdVMFz6o9zFl45g/TN4Jaj1QALApwBBKV9FGQ6RHOPRjPXB1Onm2/H9
	iAoAl/jwyLylXN1LLP8HfCdhGMpQc1YP/9P5XiBsDjFDMimFZjiZ8JRptYwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1708691371; x=1708777771; bh=pxFPwb6HjKPvW27fwA8WFy+u7MzO
	NuRNyoRKfC76UzU=; b=Ejkqo9dIJDXfwNQzGuuhCKEfQtclpp7ahaCZ8fYO4oKe
	lfUhc92C9jyM/Cpsj7w4faqSqTIY+T86NLao3LM6k/1SLAB/EUUVM+qEBEtqNGOX
	LJ84kqY5/DbGSMOGpu32X6NMxqvsWUISDcNYtqqkydvvAXTDgJnRRR5DqxKvPP93
	KT2scOrouwwegbw9Fy67v82GCC7wHj2G00dI4WCEqm6bhwawQWiXdOvewJSLuRbj
	gr5JtZ91dbC+AmkqcJCXM0IWP1OiI4GPzVKHYFshV829KtEDI3GIM+hVf4hAjLki
	cvdIxUMP0m2E5OUZDuTHnu4aKCNYyL5MOCLaBgL4lQ==
X-ME-Sender: <xms:qo_YZewfDn4_UED6XvgwouWvIS4AOupm69VMydhWtw2hMWQmagUF8Q>
    <xme:qo_YZaS7N7pCEqQ97AhRfVD34--PisTz-c9c4OM9-VKNl17f5-6ADnFXoePjWSaHf
    4_yebuuIuTvN0_IBRo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeigdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:qo_YZQWV4IZwruGWlpnZv25yiA2hE5YiEjNBUStj9BYbFWKHaeDHZw>
    <xmx:qo_YZUhdAS_-nyDNh_jrRWRUJCGs6ZdWXH8lxQpBKpcWSKYrskwz3A>
    <xmx:qo_YZQAsB-gY5otUoThuzDKjoZx7r4xaWl_4ouHo3qf0nQLKOMnXHQ>
    <xmx:q4_YZayferdq8IJ67ge1k2XYRwAohLdugssS51NJbdd53we2XHZb6A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C8F60B6008F; Fri, 23 Feb 2024 07:29:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
MIME-Version: 1.0
Message-Id: <c3e68c62-b81f-475b-9b15-c983c94aed8b@app.fastmail.com>
In-Reply-To: <e530d504-dfa3-4d39-b903-b2570bb8b014@suse.com>
References: <20240221120123.1118552-1-ghennadi.procopciuc@oss.nxp.com>
 <20240221120123.1118552-2-ghennadi.procopciuc@oss.nxp.com>
 <f4465547-1fb1-4578-9a69-7d399e7661b3@linaro.org>
 <403e32c2-910e-4745-9ebe-fbf377c3fde8@linaro.org>
 <ad856766-8903-46c0-93af-24e101ad51dc@oss.nxp.com>
 <e538ded0-bd3a-4ca4-b2bd-8d20d8c8c3fe@linaro.org>
 <bcb79af4-56d9-4204-9503-cff996f1ba41@oss.nxp.com>
 <e6f6070e-8355-4a0b-a904-1a24970f249b@linaro.org>
 <e530d504-dfa3-4d39-b903-b2570bb8b014@suse.com>
Date: Fri, 23 Feb 2024 13:29:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Matthias Brugger" <mbrugger@suse.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@oss.nxp.com>,
 "Olof Johansson" <olof@lixom.net>, "Chester Lin" <chester62515@gmail.com>,
 krzysztof.kozlowski+dt@linaro.org,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "Rob Herring" <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 soc@kernel.org, "NXP S32 Linux Team" <s32@nxp.com>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@nxp.com>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>, "NXP Linux Team" <linux-imx@nxp.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Add maintainer for NXP S32G boards
Content-Type: text/plain

On Fri, Feb 23, 2024, at 13:02, Matthias Brugger wrote:
> On 22/02/2024 12:13, Krzysztof Kozlowski wrote:
>> On 21/02/2024 18:00, Ghennadi Procopciuc wrote:
>> 
>> Andreas or Matthias,
>> Maybe you could change your R: into M: and take s32g patches?
>> 
>> If not, then I will ack this patch making Ghennadi the maintainer.
>> 
>
> Normal process would be that Arnd would contact Chester to see if he is 
> not able 
> to do the maintainer work any more. In that case maybe Arnd could take 
> over.

I was hoping to see a reply from Chester one way or another,
I see he has been on Cc for the entire thread but not
chimed in.

> I'm not saying that Ghennadi won't be able to defend this, if it ever occurs. 
> Basically because I don't have a good track record of him due to missing 
> upstream collaboration.
>
> I would prefer that Arnd (or Andreas) step up to take the maintainer role. I 
> already have one and it's difficult for me to find the time to do it in an 
> acceptable way.

It appears that we already cover the dts files in the IMX
entry, whether that is intentional or not:

ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
M:      Shawn Guo <shawnguo@kernel.org>
M:      Sascha Hauer <s.hauer@pengutronix.de>
R:      Pengutronix Kernel Team <kernel@pengutronix.de>
R:      Fabio Estevam <festevam@gmail.com>
R:      NXP Linux Team <linux-imx@nxp.com> 
L:      linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
S:      Maintained
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
F:      arch/arm/boot/dts/nxp/imx/
F:      arch/arm/boot/dts/nxp/mxs/
F:      arch/arm64/boot/dts/freescale/

Added everyone there to Cc, having any s32 patches go through
the imx tree would be the easiest way as far as I'm concerned.
I've added the maintainers to Cc, let's see what they think.

I also noticed that the pinctrl driver entry still has Chester's
old email address listed as the only maintainer, so we should
probably fix that as well:

PIN CONTROLLER - NXP S32
M:      Chester Lin <clin@suse.com>
R:      NXP S32 Linux Team <s32@nxp.com>
L:      linux-gpio@vger.kernel.org
S:      Maintained
F:      Documentation/devicetree/bindings/pinctrl/nxp,s32*
F:      drivers/pinctrl/nxp/

       Arnd
