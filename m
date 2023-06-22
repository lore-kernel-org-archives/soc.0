Return-Path: <SRS0=JtlV=CK=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2246DEB64D8
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 10:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6EC8C433C9; Thu, 22 Jun 2023 10:10:55 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C062C433C0;
	Thu, 22 Jun 2023 10:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C062C433C0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 4B3E05C008E;
	Thu, 22 Jun 2023 06:10:53 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 22 Jun 2023 06:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1687428653; x=1687515053; bh=rQtLPWivvoqJHEflH1RQG9ep95dMvO0UyWn
	P9cqsqPs=; b=hgNyx4A21ezJ3AFz5nxXKPLWcENK9ov93cxuU17cpSO5QTceB8g
	KmE2V/gzSbH899GspBkd/PvmIEHsNMjYTMr1FrPOUJsnUwYIYsADYucLseS5WRov
	z0RcE1dP105RKCupGkduFjcEy6w27UDxtC2neFgYesjFrzHIaCdo8perNV7FYit2
	4El7QoaWOVqkZBAlbpGmfYV1+iqDrXl3Ohtb28RhddWYPlSMzFsNHyYvC6qdkOXE
	B9m0E/bwzhvltmKXAp6y6L9OwrrVIU9py3y0/Wx+Fz5W3bmBuGjdNWiNWuaRp+ZC
	9OQPj/01xuiA1VcymD8TT/BiHEgfu7EkC9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1687428653; x=1687515053; bh=rQtLPWivvoqJHEflH1RQG9ep95dMvO0UyWn
	P9cqsqPs=; b=Lqp8Kg1AF6Jd7qR1ESsLmDMU+KhuEp3ddeHr0n7kSfY4a5ABWsX
	hfCzcu+NCfFUtPVm1SxnD2LYJPVCidiFquh67PPXWw9G3AyBdj/1fgoGsQyd0sat
	jpkYxtQITeKVlBlbcxTUQC4D6zuxtsTl19mP6K2M7zFYmiqAl/KTidQqF+270AGO
	tZsEYjo4eS+6WphReJdTrS9Wh0pdGevpgdEG3BgkjblKtHk7HBRr1Asu/myRFXj7
	wlgfJAO12LQbCm5Lve05l2Fjx+yQ/kgxhkQbm1XTckKi3DF2qHuyBoBKCH9Jhgyy
	DALSGSiucppmXislYzs1t6z2yCZjxb0lr1w==
X-ME-Sender: <xms:LB6UZCybnsLf6vIe7FXvVAz0zeVGSOzfzKDmB5AU_DMrETJAMorXsw>
    <xme:LB6UZOS1d9mkBJvpX5L--g4RS-RHmGaYGgfhS7n2ySsS1gCWZxExCFk8FYoH752Cv
    zD6cSU3roBwXlMb6dI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeguddgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:LB6UZEWi84JajD8g0Nl8xAB5IB8EtzWp9SMYZxKJDF8noYAusw4yig>
    <xmx:LB6UZIiBBVj0VlmMbK5_evoPPLaXrtOP-vTTIKSdpQLsoslGgtwmNg>
    <xmx:LB6UZEAbXALC1hBnp7VHGBrcL9Y4CZ4o4ufIkQ5dMTKDbTaAnPsR8A>
    <xmx:LR6UZA2mE8ZjDdDUHX9a7RKR56N_QNeBfcvy0eBp19JklhYebBSJSQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2007BB60086; Thu, 22 Jun 2023 06:10:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <c788d873-ad57-4a94-9be0-cdc5d1326cc2@app.fastmail.com>
In-Reply-To: <19e93057-46e4-1578-9e3e-138bd09cccfc@gmail.com>
References: <20230621031605.234149-1-ychuang570808@gmail.com>
 <20230621031605.234149-2-ychuang570808@gmail.com>
 <69c742e5-3270-4b1c-be31-1552d877677e@app.fastmail.com>
 <19e93057-46e4-1578-9e3e-138bd09cccfc@gmail.com>
Date: Thu, 22 Jun 2023 12:10:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jacky Huang" <ychuang570808@gmail.com>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, soc@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 schung@nuvoton.com, "Jacky Huang" <ychuang3@nuvoton.com>
Subject: Re: [PATCH v2 1/2] clk: nuvoton: Add clk-ma35d1.h for driver extern functions
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023, at 03:42, Jacky Huang wrote:
> On 2023/6/21 =E4=B8=8B=E5=8D=88 10:22, Arnd Bergmann wrote:
>
> I will extract the unrelated parts from this patch and create another=20
> patch for them.
>

Ok, sounds good. It would be great to still get this today or tomorrow
though, as the merge window probably opens on Monday and I want to
have the tree in a good state before I send my pull request to Linus.

     Arnd
