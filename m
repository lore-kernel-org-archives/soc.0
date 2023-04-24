Return-Path: <SRS0=VwEy=AP=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA31C7618E
	for <soc@archiver.kernel.org>; Mon, 24 Apr 2023 11:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A77D0C433D2; Mon, 24 Apr 2023 11:29:03 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D719AC433EF;
	Mon, 24 Apr 2023 11:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D719AC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 1B04A320069B;
	Mon, 24 Apr 2023 07:29:00 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 24 Apr 2023 07:29:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1682335739; x=1682422139; bh=jl
	uLqwa/xdNh9fu8d6w2h7proIqETJUWvos8WHNXzvU=; b=Y8X5NFg3yRlkJO6GHe
	TLaM8dldCatYqxWGpNzcHJ6kn2e5A6VCCQDbfSCiPKfB/EgnQtH9n2/G6xztnEos
	qyUrjBz0TGAEIl74RwlT6mcuKh27BVzDKD2AAxaYe5viqKO618hd/HfKigFCz9fr
	s8jznGP3lMOmaLrcdYjL4kq1nqugskx08nJrcxthuF3RkzXrj7ju32ljoRQUzis+
	V2vzqbR350tcjkDJeX4vP1NiApm/gDz8mrJUqMzZSLqvjnS3TAyAKpY2YgJ2FCtK
	Iuqo12q/GKWdtV6gekY81cXbExekQ6WthgRAqVZF9Z9nA1pwwlstMWtmccjre/Zs
	IA9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682335739; x=1682422139; bh=jluLqwa/xdNh9
	fu8d6w2h7proIqETJUWvos8WHNXzvU=; b=i+p3tO8BKCobWHIyCJsCp2vWLQmdu
	w6fetCdHYT4NDaVbto6y9q7eX2r8UoTAambJ0ByOtI+pJbfocXTGTgC2uU0osYWt
	mwjWmUizX9PZ87MRj3ZptbX2N82ZimlsZ/DOAJmyxTZEBiTWJuY/t3BP4AgPAn4l
	nj5I2OihgezMAihZpUW1QXqwQAlJKSyhWfBtIW0EzWm8+upmdt+m7jiE5y3H6oSk
	xLN6f6M/3KhrFEHe+esLHNm0O+L2G56y3g4uUMSe4dTmXGiA/cX1OIOdAsSF+x6G
	68BPgzM4hKfzyBp8pGdZL78sxUv20/gwQJtFhu2MnAPVES30TQyqO42YQ==
X-ME-Sender: <xms:-2dGZNgy3X8sjy5SPVRmgdfAMekHqO3kLE4FIm10BUq5ncodVCRdzA>
    <xme:-2dGZCDS8qMp2dFS2U2m940z-S48bT3SC8ayhl4Y0gAMFkzjL-qwCfAWhz82YaouC
    TCP1u-Y4Pq0h53nUyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedutddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:-2dGZNGPDGTTKkgSfMYD87fmPv90K0JjhLOXdKjzE380tfbdE3CHwg>
    <xmx:-2dGZCRuHvr-w4iZwIpW7_REflrvUAlSfOG2j77FihADTRYrBKxjgw>
    <xmx:-2dGZKwBXdOLhXoxBuw2AOAIgNcN9jnaR9jN5m4AJjdR3ZRkMI8DFA>
    <xmx:-2dGZPpW9zbCxZYSH5T8Yz0_khkPonLzOKs4NmP4fwCCdysDHJZkRg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EB4B0B60086; Mon, 24 Apr 2023 07:28:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Mime-Version: 1.0
Message-Id: <e429c0e0-7044-492c-a4e2-ed0c1185bb39@app.fastmail.com>
In-Reply-To: <20230424123522.18302-35-nikita.shubin@maquefel.me>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <20230424123522.18302-35-nikita.shubin@maquefel.me>
Date: Mon, 24 Apr 2023 13:28:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nikita Shubin" <nikita.shubin@maquefel.me>
List-Id: <soc.lore.kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Olof Johansson" <olof@lixom.net>, soc@kernel.org,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Lukasz Majewski" <lukma@denx.de>,
 support@embeddedTS.com
Subject: Re: [PATCH 34/43] ARM: dts: add device tree for ep93xx Soc
Content-Type: text/plain

On Mon, Apr 24, 2023, at 14:34, Nikita Shubin wrote:
> This adds a divice for Cirrus ep93xx SoC amd ts7250 board that has been
> my testing target for ep93xx device support.
>
> Also inluded device tree for Liebherr BK3.1 board through it's not a
> complete support.
>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Can you describe which parts are missing for BK3.1 in the
changelog? I'm fairly sure that Liebherr is still supporting
this board, but I don't have a contact to add to Cc here.

I've added Lukasz Majewski to Cc here, as he originally worked
on BK3.1 and likely either has the hardware or knows someone
who does.  Technologic Systems also lists the ts7250 as supported
on their website, but the only contact I found for them is the
generic support@embeddedTS.com. In case someone from Technologic
is available for giving the series a spin, see [1] for the
full set of patches.

     Arnd

[1] https://lore.kernel.org/all/20230424123522.18302-1-nikita.shubin@maquefel.me/
