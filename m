Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46E748124B
	for <soc@lists.linux.dev>; Thu,  2 Jul 2026 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999651; cv=none; b=iOfXeqaIzH3eNtbxYdL6l7U0t0X4EtqYD5zx1gb9c+4FIG3biob/o9rwqKRdVk3W7lZKA74mPwCFBFaqmmpE2YxdoqqvORk+21sOGVMIkg8nfKHujfOsxe7rZCH47bdOk2luS0ZmC2m/x2ixxFNt3BNcdpPkyyQ4kZuKIky+D/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999651; c=relaxed/simple;
	bh=uKoVlPJ6LOdCaloZGbzMpiUXuk7HS4iVFKeyQqzv6zg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hExJdEFXRlvtSKo/txN6LOXCcAl7D+X8S4mk9AscX7v/SBDQzEfewpzERE1+Gri6foWdYyfzLfmzNyD93gkHxnVqiU9wL7XFOeLXE/77JA3xi8VsY0/7rQuTyjfFAfuOC0h+t9iTZhyS2AGU5elVJrEKpV2GX6r6jfVPO4PmYD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=e4oRmAIu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JldSok/k; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="e4oRmAIu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JldSok/k"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F1596140017C;
	Thu,  2 Jul 2026 09:40:48 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 02 Jul 2026 09:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782999648;
	 x=1783086048; bh=LonbSv6mOMlAd5WzTKA2LLMgfG2NEu6AB9P2wuSPqmY=; b=
	e4oRmAIul3LuXTdascpDhlp2nPcMzm0oyW7vsjD7gljWU6fI3jE8n1AlnTt6wL1x
	JaalVNR/Q2/70j7p2IrBt2fGt87F1ksvwtFMBZBlrFvDBcebBBog0hCeE0Bg1ubV
	Ksrcak1MMCySvnigDz3VyuQIwwiQ/BKtQF0TNCUpqEICcqOnJQl3f7AhBxY6ZhvL
	UlqDWiANpm92nfVK1E40KDikiMXq5wYOusHpeqtC7hC9AXYw5QW5wd16LC/LfabZ
	NId3gq2MdGp1baXUmX536kAEsIfSYEToa2dbWdbXx6elLIOZVzivzV+TUEvRyD4C
	JCqgjpyuB83G2vZCd4asFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1782999648; x=
	1783086048; bh=LonbSv6mOMlAd5WzTKA2LLMgfG2NEu6AB9P2wuSPqmY=; b=J
	ldSok/kXeQdGr6H8ictxaIhzW7eER7uaM3ws8lVmjPKxezEBwdwfdpUYjXstngMh
	965y7oMgDdIHLottHt/6R0MaLzzJgxCLrykd2T6/PvTCxyedetze8ocMeYqqjktZ
	kgaG+gKh+mf5zyY15s2kswf4xxy0JRSnxKTGrSAVQcBWe0jTUOvNu/9ioZEqy5ce
	NMJKIBTNZpEtuRlZ/EqbSZSrZtGlyVhwbBlmKgHz2BJLzoiP25zGVUjwbEcpZPBD
	jqE2RI/1cwiTinFQ0F3Jc7zSbglUVSA9PMkwioMuFpPKIbU3xwXfKx0VNkdNJ1az
	sZd5tm+iPbQWx2x09OkAA==
X-ME-Sender: <xms:X2pGatA0_utwEbuJdfD-jhnzsNj8qVEOtLdTL5jzc7_JI9yX3-OxPw>
    <xme:X2pGamUw_skwyhq9XvceJXPAU9-OXtEY_BqaXqJs8F_A50Ck3z8PYxzz9JYQveki0
    eWjVDoeCsOvmmYPmvW_xbBKXNNFcIGwDLXTGbCLg-8JtF-YgIOkJkI>
X-ME-Proxy-Cause: dmFkZTExK5qn4CPi5fOIwGaLWfCuad7dmp3ygrUxj+28CWnvQACOoCAeEABE0uas9IqI/t
    Ui34oWa+IJsAw+ZLWDSRP5orAfaqbWqBhZ3NB14W4eed4smj72XEywSA2C3dY+IUO4CvKa
    yXS/wa8BjhfajWIqNBfDL/2F8PTsCsIPSVuqlcOqHow9P9x98g+AaICNdSyxWp9hg6hvEQ
    HQkef+iohbzwDMX8eogs3GS7D+TQJI6Ja0PLb7zohGvpAIbKi9qWvbDbxCmneRTPdpUpHH
    w7q5/UA+kfuc1STyGYaVi9JjvHbE7ryAjSjJPnaXTdgDgHug1lVEHC6lqpcK40iw3m5kSy
    G4rVNThHIiudI1tY4KMeyPFWQqSE3XDkNisR6PgeA5e2V4vTaChEMzOlA9rt6i26RRvmAW
    uLICpIigt7ohckp/juoAOI4L7u2vGJ5wqIMnFWUratHa9S3jGRSe5r2viUqYG19jejTUbY
    fGnXFZwrPr4Bdtcuznv+/20p26kSIwUB4RiEvflLUEpPQYkzLiTT0k3rr2QesrQ9r3dxAo
    EKLWGqKBr2ecRPkmRNlE61QK1i6K8aiXMg/XeiZqbvnt4tjaH3Q1JzSkP0LE5Qq8mp7Z5K
    cAH28xhAMrEI0x4pM8hoVwM4iE8eVDKsqgrlU8W3eQXUoCAFO2RhXSxkfPmQ
X-ME-Proxy: <xmx:X2pGajaCnsOxZLK2sNVNjgtunWIOjnGm3c8Xwtzi_he6nNyMSLfu7A>
    <xmx:X2pGaos9qyRy0iuMTJ4C-CYImvYRQv2QI4zx1P2tOtQpKshwdeBiGQ>
    <xmx:X2pGar-L5K0tpmnGn8QJN0NSA7zGVV60DIIQvxoot7ROkj7U-qSHvw>
    <xmx:X2pGam-77TQNC0i6nLcPA4wQFGcfwCn6-VSNh5sLIYiztRs_fjKg9w>
    <xmx:YGpGarDeKqL4jyyVMDrUoIcpERlE9hCrd6sh_LRsnV3WtAM7C9ythHdY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0FEE71820086; Thu,  2 Jul 2026 09:40:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AY8ECbGwMVhZ
Date: Thu, 02 Jul 2026 15:40:26 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Daniel Mack" <daniel@zonque.org>,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Frank Li" <Frank.Li@nxp.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Ralph Siemsen" <ralph.siemsen@linaro.org>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Stefan Agner" <stefan@agner.ch>,
 "Stefan Wiehler" <stefan.wiehler@nokia.com>,
 "Tony Lindgren" <tony@atomide.com>, "Vladimir Zapolskiy" <vz@mleia.com>,
 "Will Deacon" <will@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
Message-Id: <6eba2de1-bb2a-467f-abdc-c9562c5b9853@app.fastmail.com>
In-Reply-To: <20260702133626d12c29ad@mail.local>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-3-arnd@kernel.org>
 <20260702133626d12c29ad@mail.local>
Subject: Re: [PATCH v2 02/19] ARM: limit OABI support to StrongARM CPUs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 2, 2026, at 15:36, Alexandre Belloni wrote:
> On 01/07/2026 23:23:36+0200, Arnd Bergmann wrote:

>> @@ -9,9 +9,9 @@ CONFIG_ARCH_MULTI_V4=y
>>  CONFIG_ARCH_FOOTBRIDGE=y
>>  CONFIG_ARCH_EBSA285_HOST=y
>>  CONFIG_ARCH_NETWINDER=y
>> +# CONFIG_AEABI is not set
>>  CONFIG_FPE_NWFPE=y
>>  CONFIG_FPE_NWFPE_XP=y
>> -# CONFIG_AEABI is not set
>
> I'm not objecting to the change this reordering is not directly related
> to the current patch, maybe this should be squashed in 1/19
>

I've dropped these changes now, I don't think they were
intentional at the time.

      Arnd
