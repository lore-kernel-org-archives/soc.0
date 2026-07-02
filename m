Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167DF42A798
	for <soc@lists.linux.dev>; Thu,  2 Jul 2026 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981386; cv=none; b=Br2Sp4creGsG9nQfGvVG969Y/au61wv1y3N+5yMWr0mtCLgY8MFswl/y9Wo+/SKc8arERFmXXPLZ9GL8PN9XrCvtQSJ4/PA0UwVeAlGWRUjUBstHzMv2ZeyEwn6+wSdBJ4HtW58t5mw1tjacuyadzGA+oKQXrRs8KKLkwI47X5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981386; c=relaxed/simple;
	bh=aNrT//hh8/H52BKJ2ZoMMurL/dVvPGF+ZYALr9gRfwM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tYaCF9OxduTReo5ET7lCxdI2QbLIZFBYu5vvA5El7MqstDjXh2Gt1VwPt2RrgftEeTOJNbDJSy8wgxfbnQ34ljQ8Ypx4awfnSE6QRskKFs3684rdQlzJz2a1whR9U9VcCOIEKEEnGx3rTXvBbc+azPg0xuZ1xsQVjRcVFpsAKvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=gJbpRuRS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kY9N0Gnn; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="gJbpRuRS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kY9N0Gnn"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F319314000BF;
	Thu,  2 Jul 2026 04:36:23 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 02 Jul 2026 04:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782981383;
	 x=1783067783; bh=ItRb5YyzJnwgrGcK1uDkzjTd7POtGhF69tiLiuBSj6c=; b=
	gJbpRuRSvgqHQmKRlBRKpXWwWN442jBJ8LnI4eELmkWNenMu/LhbJKBw9dnHbbKC
	JG+SDSPcyh+Dis12W7Pesd4GsNH9XQ6l4UGb4TI3SijJc7nmbREwwfE30D+ESAZQ
	GzDnBV1it8E4yy8Uw01FAyrtwgocJcJWeRvKRxZBnfX9qzI554HLt9gGdwxsmLMa
	rqFTt5vF+02BtsVPqwnqjx76trgYGfRvwmy9dVyGj7iNHn5fTVxXwoUGzOLqLLJ6
	Djvf7Pn8rRs27VqmRLeqnicJoYqFRMZ1mHGCQHtRtzAdpTgbICdhE/n3EBN5qND9
	kqh5f5B7DoNxXZ2aH4IQcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1782981383; x=
	1783067783; bh=ItRb5YyzJnwgrGcK1uDkzjTd7POtGhF69tiLiuBSj6c=; b=k
	Y9N0GnnU6ucrSdD7EMrTnPinNuQnC8PPRskR2ywEI5PN5mOWSgJuHRoIUY7OhK3s
	uK4ajh5kOEEzKtDjv4YF/gclFhpCx/vVPhS0qes2jqJubPUoDZz0PoFbzEMRJuWz
	nwV/wrOYpCD7nqdYsmAoxBndCzvUt8OoXL4msafiRhQpLaOZEQJAwEw3f6fR4Ijf
	eDs6jgvDmK2/Onmn1zElms+2dvcn8bUQ4IeDfViSS57BC9a0sily5MM6ZJAr1zZ9
	2f2PgBPJI2ONPHKF41XTMfuhOR5LPravMjOdc71gp6fTd1oxtE6yqlJW8JvpXe/5
	HgidNqpuyGKk2Pm6dzpPg==
X-ME-Sender: <xms:BSNGahG09UwAtgkEFwX2Iz9I83SniI6wr4Qd7c_9YHlas-63k_blqg>
    <xme:BSNGahLFnx2AR_FOyEHzA8LZQE5WqWtsT3p_hnYR_ShAoPu7WnEV1c-AtAN3zSRLB
    M1I9E7_Eu21_I_EYpXSTmQWNOzc3Z9ijudg8BqYbAtP40uyO3FlfPA>
X-ME-Proxy-Cause: dmFkZTE6mB3voIYf1j7QCePQp8dWZpfj6LKnXWlhlUVsV6D3ZTUV9sYkKASiWOV/niIMHV
    I0hhkcof2jkhQuSi80/kqv1FleZfUjkOuB2J30tViw/QPuULcoB1AQ8kgiRTVD8GRq/qSX
    hF+RT5dYpnz+YKQq3wshnpGtZIYoELsC3qa5qJEwOS0TyaRQ1pZnmYqSvz0YWh/MiqNO1H
    Tkt7XWBbQuwzaxujd2DXnBkS4Z8XUHmTrafgivOwd+GW62UmlTOVb0oR2zilLve6m9EFsp
    gE6jY+ApeXOVweaGo6xiPXFpljaQHZdpzedkzI71mo3Xm8Uu4sGp+hMF5YDCclO7QOb/OK
    TmI25GbGZUGqSzP0htyAQXb9pdORTIVQHN2jV0lvtH/rTSyQ9Etmq+TeVg1USSu+TjxAqF
    liTiKnXlquvbuS7nFCc5a2TpgV5wFo56xvLWDwwtVZLmD4WrmbgMujc86TQCfwHgeM7NWd
    H47g11enuogEjAgOYqYg6Vs16M4qmy57gQ5RkQH6CS8xVNvVbvpXKto1o/bdOrVBeG4JZj
    5lcsLRfFydU5tsqvMNuLauDymndrnlr+V8xOc84b2kHGrIFxCL5Dj3UtK2HIrMDdhxBFli
    50VleocWf+vTwYzEY4blToYaJIRR20GcxSNU+936UNAaU2CT+olMvEk673ig
X-ME-Proxy: <xmx:BiNGau9iwZklAUBf6Ml6Hd-WPEQP_pIvKTiEjPJL3I6gkYwsytZXWg>
    <xmx:BiNGalAi9z-FTouNG3Z_KzhQQ1Qk-RiVJxi7KYbP-Rf-tVmQlfLHhw>
    <xmx:BiNGaqDxWTjI_2qQA8e1fWh3wiMIHz_RYezAPwV-MxtIekskO4STFg>
    <xmx:BiNGajxC3quhIa5HW6WA0E_lzLFi_kD0rbw5NsQHvSutfg_4ig4ZXA>
    <xmx:ByNGahnMxun3MC4Oihj7Fgr_fnu8DcxoFsII875B2Qy8Ht5pj2IuL_Rd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D6E11182007E; Thu,  2 Jul 2026 04:36:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AWIzbxp6I0Vo
Date: Thu, 02 Jul 2026 10:34:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Arnd Bergmann" <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
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
Message-Id: <88f5301b-9153-4f9e-97e9-6411a33376cd@app.fastmail.com>
In-Reply-To: <d48d79ad-6a30-4a86-8895-17d4e4fa2940@microchip.com>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-2-arnd@kernel.org>
 <d48d79ad-6a30-4a86-8895-17d4e4fa2940@microchip.com>
Subject: Re: [PATCH v2 01/19] ARM: use CONFIG_AEABI by default everywhere
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 2, 2026, at 09:42, Nicolas Ferre wrote:
> On 01/07/2026 at 23:23, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>>   - All machines that used to explicitly enable EABI can drop that line now
>>   - Machines that are likely to actually use old distros and had NWFPE
>>     enabled in combination with OABI (rpc, footrbridge, netwinder,
>>     assabet, neponset) explicitly turn it on now.
>>   - Machines that already had both EABI and NWFPE disabled in defconfig
>>     (at91_dt, collie, ep93xx, gemini, h3600, imx_v4_v5, integrator, jornada,
>
> For at91_dt, EABI was explicitly enabled (see below)...

Right. I don't know how I got to that list originally, but looking again
now, the only configs that I see using OABI but not NWFPE here are
spear3xx and spear6xx. I've updated the text now, thanks!

     Arnd
