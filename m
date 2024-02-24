Return-Path: <SRS0=BH0o=KB=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCC4C54E49
	for <soc@archiver.kernel.org>; Sat, 24 Feb 2024 11:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E4E4C433F1; Sat, 24 Feb 2024 11:42:54 +0000 (UTC)
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70BEFC433C7;
	Sat, 24 Feb 2024 11:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70BEFC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 518D911400C8;
	Sat, 24 Feb 2024 06:42:51 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Sat, 24 Feb 2024 06:42:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1708774971;
	 x=1708861371; bh=VHLGUt2+JC3h08E8q7nB+/pBA0spYS2QQsxczsx8+bI=; b=
	sJIS0hOYOEYoiGDjKndBQrQRmYHbGaA3IwhjtwOGq7KpuQf9jS3KzElBJ1z4c8LP
	Mx87HqXF2N82bN898Myg7QIIDie/XAqc99OqATRN5jbmnd8hsbsCMPXx9R8I/TOH
	72QaminAX4MtUEYWwNRQvG+a5uYk9/VYJqqhAHdywKLfNyXGJY+PFK9sbxYHl1+q
	c5FJRB8wZLZqsp8kErPro2NtzFzPdDcBAInqakJHx34jGPM9zY1J0GdbECIW6tdx
	cVd/TvttDe6AYT+HqFt/FwqaVWDrVzLexT1WtqpR4XYNRTNiRnF6kF8NK4sYL+Ap
	tBx6MpOjCgxlS/HlSCjR0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1708774971; x=
	1708861371; bh=VHLGUt2+JC3h08E8q7nB+/pBA0spYS2QQsxczsx8+bI=; b=o
	BVD06uX3Hg2bBf1flcHgX4E+8NkjkIqZXJFdPdtmRjhKAl9EBG7bUQ+lxA/GNe3y
	bf2rZnbsREasSrhUWF1DmT7RUuIdEOavNg3ri7yfYJ9hvClqxf6bX0MpMH6yNMjs
	f3uC5oqWosyfpZcmkXFAnJj8dL7hdKBOfU1ehMYHRXJFG0jRNLlf+MyXLQSfncQh
	l7Dlrz73ZOTHKE6hjxlA+dIR74cGuUFrLKu6HNxguoX6HeksSHbVhONWRgY7vG4G
	CGuVUvra3pC/2eaWglIPjVCqO4KvUohiez/6k4y4N41QDXiwaVc9RO6gw3t0lzAi
	NlW5ZOSFRdiwzxkh+muqQ==
X-ME-Sender: <xms:OtbZZfrUvaJcP4SW5WLteDKse2XJaA1qo_uUBP5iE7USYubJ5rry7Q>
    <xme:OtbZZZpmmkI5N_aMS3RaU1rlyFTNA4_swxLJQklWyUMnHa0dyt63KjcLa_kjB9HB6
    ByDWmJpS6FS8_CAAGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeekgdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:OtbZZcNjRC2SHGM8mqdhnqAwO2NWFurgTa3TE_NhSSWAgCM8FoNlDQ>
    <xmx:OtbZZS4YZw4dxtwuqUIpxzqe32fuub45yricTlXE1ALjLTXsaRBBXw>
    <xmx:OtbZZe5jSixGWel2qPNfFmCj1MqBNlT5sgfYh8fb9rieqozvBef0hA>
    <xmx:O9bZZbw63IAOQTOKoyJVHGyPcr2PwP3QAMHon208tP89gBBwmh8fnA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A8840B6008D; Sat, 24 Feb 2024 06:42:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
MIME-Version: 1.0
Message-Id: <57dce440-d24b-4638-9395-62dfb03ec002@app.fastmail.com>
In-Reply-To: <ZdmZ4JC0CsX2qs5C@linux-8mug>
References: <20240221120123.1118552-2-ghennadi.procopciuc@oss.nxp.com>
 <f4465547-1fb1-4578-9a69-7d399e7661b3@linaro.org>
 <403e32c2-910e-4745-9ebe-fbf377c3fde8@linaro.org>
 <ad856766-8903-46c0-93af-24e101ad51dc@oss.nxp.com>
 <e538ded0-bd3a-4ca4-b2bd-8d20d8c8c3fe@linaro.org>
 <bcb79af4-56d9-4204-9503-cff996f1ba41@oss.nxp.com>
 <e6f6070e-8355-4a0b-a904-1a24970f249b@linaro.org>
 <e530d504-dfa3-4d39-b903-b2570bb8b014@suse.com>
 <c3e68c62-b81f-475b-9b15-c983c94aed8b@app.fastmail.com>
 <Zdiu8s5Cgz9s6dLP@dragon> <ZdmZ4JC0CsX2qs5C@linux-8mug>
Date: Sat, 24 Feb 2024 12:42:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chester Lin" <chester62515@gmail.com>, "Shawn Guo" <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: "Matthias Brugger" <mbrugger@suse.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@oss.nxp.com>,
 "Olof Johansson" <olof@lixom.net>, krzysztof.kozlowski+dt@linaro.org,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "Rob Herring" <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, soc@kernel.org,
 "NXP S32 Linux Team" <s32@nxp.com>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@nxp.com>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>, "NXP Linux Team" <linux-imx@nxp.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Add maintainer for NXP S32G boards
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2024, at 08:25, Chester Lin wrote:
> Hi all,
>
> Sorry for the late reply since I lost connection with upstream due to a
> health condition, which affected my eyesights for a while so I tried t=
o use
> my eyes as less as possible. Please accept my apologies anyway.

No worries, and thanks for the clarifications.

> On Fri, Feb 23, 2024 at 10:42:58PM +0800, Shawn Guo wrote:
>> On Fri, Feb 23, 2024 at 01:29:10PM +0100, Arnd Bergmann wrote:
>
> Before leaving SUSE I reached NXP to see if anyone could take over it =
but I
> didn't get response unfortunately. Maybe it was too rush to find a rig=
ht person
> at the moment but I still wish that someone can take over this role ba=
sed on the
> following reasons:
>
> - Since I have returned my S32G boards to SUSE, currently I do not hav=
e=20
> a platform
> to verify S32G patches unless I could get a new one. I wish I could=20
> still help
> out but hardware & doc resources will be the biggest challenge to me.
>
> - My current employee may have competitive relationship with NXP in au=
tomotive
> field, which means I may not be fit in this role unless nobody cares.

In general, there no problem to just retire from a maintainer
position or mark it as 'Odd fixes' instead of 'Maintained' when
you are no longer planning to actively maintain it.

>> >=20
>> > Added everyone there to Cc, having any s32 patches go through
>> > the imx tree would be the easiest way as far as I'm concerned.
>> > I've added the maintainers to Cc, let's see what they think.
>>=20
>> It's unintentional that IMX entry covers s32 dts files, as they have a
>> dedicated entry.
>>=20
>> ARM/NXP S32G ARCHITECTURE
>> M:      Chester Lin <chester62515@gmail.com>
>> R:      Andreas F=C3=A4rber <afaerber@suse.de>
>> R:      Matthias Brugger <mbrugger@suse.com>
>> R:      NXP S32 Linux Team <s32@nxp.com>
>> L:      linux-arm-kernel@lists.infradead.org (moderated for non-subsc=
ribers)
>> S:      Maintained
>> F:      arch/arm64/boot/dts/freescale/s32g*.dts*
>>=20
>> However I'm fine with collecting and sending patches through IMX tree,
>> if S32G folks help review them.
>>=20
>
> This looks good to me as well.

Ok, in this case I would suggest we change this section to
only have 'R:' entries and no 'M:' for the moment.

Between the four of you (Chester, Andreas, Matthias, Ghennadi),
I think we can choose to keep everyone or drop those that are
unlikely to actually review patches. Please let us know you
would like to be included as a reviewer or not.

For the pinctrl driver, I would add the files to the "freescale"
pinctrl entry in a similar way and end up with

diff --git a/MAINTAINERS b/MAINTAINERS
index efeaeb51f183..c1924c0053bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2555,13 +2555,14 @@ F:      drivers/*/*/*wpcm*
 F:     drivers/*/*wpcm*
=20
 ARM/NXP S32G ARCHITECTURE
-M:     Chester Lin <chester62515@gmail.com>
+R:     Chester Lin <chester62515@gmail.com>
 R:     Andreas F=C3=A4rber <afaerber@suse.de>
 R:     Matthias Brugger <mbrugger@suse.com>
 R:     NXP S32 Linux Team <s32@nxp.com>
 L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscrib=
ers)
 S:     Maintained
 F:     arch/arm64/boot/dts/freescale/s32g*.dts*
+F:     drivers/pinctrl/nxp/
=20
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:     Alexander Clouter <alex@digriz.org.uk>
@@ -17415,7 +17416,9 @@ R:      Pengutronix Kernel Team <kernel@pengutro=
nix.de>
 L:     linux-gpio@vger.kernel.org
 S:     Maintained
 F:     Documentation/devicetree/bindings/pinctrl/fsl,*
+F:     Documentation/devicetree/bindings/pinctrl/nxp,s32*
 F:     drivers/pinctrl/freescale/
+F:     drivers/pinctrl/nxp/
=20
 PIN CONTROLLER - INTEL
 M:     Mika Westerberg <mika.westerberg@linux.intel.com>
@@ -17469,14 +17472,6 @@ S:     Supported
 F:     drivers/gpio/gpio-sama5d2-piobu.c
 F:     drivers/pinctrl/pinctrl-at91*
=20
-PIN CONTROLLER - NXP S32
-M:     Chester Lin <clin@suse.com>
-R:     NXP S32 Linux Team <s32@nxp.com>
-L:     linux-gpio@vger.kernel.org
-S:     Maintained
-F:     Documentation/devicetree/bindings/pinctrl/nxp,s32*
-F:     drivers/pinctrl/nxp/
-
 PIN CONTROLLER - QUALCOMM
 M:     Bjorn Andersson <andersson@kernel.org>
 L:     linux-arm-msm@vger.kernel.org
