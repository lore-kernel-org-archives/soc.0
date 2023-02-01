Return-Path: <SRS0=/iKC=55=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0AFC05027
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 16:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B52F4C433EF; Wed,  1 Feb 2023 16:35:41 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B952C433D2
	for <soc@kernel.org>; Wed,  1 Feb 2023 16:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5B952C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 7D8D45C01CA;
	Wed,  1 Feb 2023 11:35:39 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 01 Feb 2023 11:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1675269339; x=
	1675355739; bh=PQ55DThrIA7C3XV6iTavLQb3CYvfIt4UPAPCXl/s2Ag=; b=r
	HJYrn8RyPTA+FDJn7bgRnCbd/o0t7kc46wAC8f7qXUUWQ1QxjIvW3+6Bh75UVXWL
	Or1rePZEKq6dK0jprV/x6hwpBXL5S1cs1tukNS/Puq0wosPHpFz880YTI7bRxoqD
	ScHpIpyhu9RiCSxlDWTP2O4MtsgjzgvwmE4H0zmkxk337NlSS5gqFhpARm1V7b6M
	+crwGHY1wEJ/ZSQmSpGBm0nmIiNeL+xjnNwiZDI+lGC2UGzGWVa75bJBMlYgtOun
	64B+Zr4U6LLuiWE6dzPcUXA9EqAbJEdVqzg+mP++UdzwO6Okcl7+ZpCbhDb6g/EM
	cj0CwIRiBj3gCDPSdNTLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1675269339; x=1675355739; bh=P
	Q55DThrIA7C3XV6iTavLQb3CYvfIt4UPAPCXl/s2Ag=; b=IbDOHL8/jfZrE7oVe
	H1pidHR5G+ifVY47dJDcU4hqSGMv3WTE0zhN2eW1/nYK8sd0RlRCjneBjbD2oCcq
	iUpo9p/3MB5D1HQ9xsIlXXzO6vC/ekOdj5/xZYJ2z8UTZNPvl+Wv0wAvOUowVchg
	3IH0MFo8BkoxGQUfeyTp2pXPS+dIGkKEbezXWp4vWqtayv7nunkLZIQpElcLA3QA
	pWafeP6xxFU+pIqU/mORZ+t9w1a2QDnakgQM7HfHsWdMzC3Paof47/0Hc09fY4ip
	DkMDUUO+lE9NWhVmeVIvzO1sFPlO7Kf/snWQacLuF/GPcqqNBG6HXssl3TBACPJK
	ZBS1w==
X-ME-Sender: <xms:25TaYwsX1vDQqCJDbZYf-vReVcydC7BRD2bpBgurdECQm2n9uRCvMA>
    <xme:25TaY9fN9fP3JxpnPG3XhOUy5pzfsenUrHyaA6wSgcJxxBEw2pEcrX6PwergweCck
    k8ODzvvECQmBolnDH4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefiedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffektdffjeekieehtdffveetvdfhvdfhheffgfelkefggfevfedtfeegkeev
    vdejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:25TaY7wmLOJb1-laLBYdnTZcat15CIFpyE0dlf0Pl6Bjy52SmWaoDg>
    <xmx:25TaYzPSzPmvSwJrhiG_rEnWvZq1py-xXzz4ax1KEoKSOVQpT49DTQ>
    <xmx:25TaYw8WV561ZR31Ffz08Xw7WgLXOtM2QxEZcWqSdCGREk4Fsen_NQ>
    <xmx:25TaY5JEX9a1LY6Q2EWh1Yc-16a6Ob5MxVKEKKY2fjQVaYoMwew3nA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 330FEB6044F; Wed,  1 Feb 2023 11:35:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-107-g82c3c54364-fm-20230131.002-g82c3c543
Mime-Version: 1.0
Message-Id: <703e3446-d073-4069-8710-32be5cb176e8@app.fastmail.com>
In-Reply-To: <20230201051717.1005938-1-joel@jms.id.au>
References: <20230201051717.1005938-1-joel@jms.id.au>
Date: Wed, 01 Feb 2023 17:35:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Joel Stanley" <joel@jms.id.au>, soc@kernel.org
Subject: Re: [PATCH] soc: nuvoton: Add SoC info driver for WPCM450
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 1, 2023, at 06:17, Joel Stanley wrote:
> From: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>
> Add a SoC information driver for Nuvoton WPCM450 SoCs. It provides
> information such as the SoC revision.
>
> Usage example:
>
>   # grep . /sys/devices/soc0/*
>   /sys/devices/soc0/family:Nuvoton NPCM
>   /sys/devices/soc0/revision:A3
>   /sys/devices/soc0/soc_id:WPCM450
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Link: https://lore.kernel.org/r/20221031223926.241641-1-j.neuschaefer@=
gmx.net
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Soc maintainers, this has been in -next since the last merge window. I
> think any changes can be done as follow up patches by Jonathan.
>
> Please apply for v6.3.

Applied now, thanks! For some reason the automated email did not get sen=
t,
but it is there.

      Arnd
