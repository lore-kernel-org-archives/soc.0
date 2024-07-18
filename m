Return-Path: <SRS0=Jvr4=OS=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57381C3DA60
	for <soc@archiver.kernel.org>; Thu, 18 Jul 2024 10:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E7EFC4AF0B; Thu, 18 Jul 2024 10:10:30 +0000 (UTC)
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC7FFC4AF09;
	Thu, 18 Jul 2024 10:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DC7FFC4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute8.internal (compute8.nyi.internal [10.202.2.227])
	by mailfout.nyi.internal (Postfix) with ESMTP id 016CA138039D;
	Thu, 18 Jul 2024 06:10:28 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute8.internal (MEProxy); Thu, 18 Jul 2024 06:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721297427; x=1721383827; bh=VGjOjQRKaq
	dv95F3MGDTs4HFNrWtN5vDUKq16KIIhW0=; b=fLnFzaA1pK0s3DYyD88e7Uh1Te
	aCoo5eiG68HiEu27cQNHIjFRfNKATmyclAhCJtEB6Q173FUZxWMFRaVYU2VjcZyg
	kZfHIEVJjxSDaWmP4a+x97xZTlbj+5bG2efVyZwtTmbVfkFjoO49mEET8O1hcz5y
	nxqa7rNJqEMISljjvITSn3zwjyrgZ2H/JH/dnT0ujaPOFEFGBisRbIGnpTcLnw9T
	Zo4vvvtGxQhPQCHryX4c9XkAYi5+wjJiWan7pj9azhbeNma6CuU7YJYlAlRaLccN
	FXKr5gvoiVJcZCzPyGnhnPHIWWSz4irdqmBh0yveVrwtLewH2IRmvD42PMZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721297427; x=1721383827; bh=VGjOjQRKaqdv95F3MGDTs4HFNrWt
	N5vDUKq16KIIhW0=; b=QBixUQNWA+6AAqiPJph1m4WW4cL3Bp0Vj8yMFGj6IMVs
	vShnfWPCqSKFsls3SP8ZrqOG1ejZx52gn+pWFnmm1tTeSueYnY5qOLEenRM0XUx6
	z1tUliErwdg5GoOG7jNSI3K7hIbZzxzZfh5lOAB0BPCEw5Yql2zHJjXkYleFuyM/
	8bCZN6QHbXfQjYmXVmAwuc/BFIk9rmCSu6sEKJo+Mxckjtb9i32rapmsl5OFmeNb
	MXrO22rt8oFwz9kCZU5SWsFprjxPHXk9XxZj8BsMZ97VENvIJhLNzNBuMhoUtTy2
	7OAiPJKDeWmc9Dm46B9C3gyV5F/OS3pt0Noo8Kj19Q==
X-ME-Sender: <xms:EuqYZmBwDpAKBkL3PGGJzPpHS5qwbELTFIAkQV9f1OEXhaU45QgC5Q>
    <xme:EuqYZgg1km-ogRptnYmfkKkPf6lSHJeZ6Tb8Ogu3zUFJAWNd33R62nchbIAbx8oyR
    Aj8QgyKkJcKEpAaUmE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeelgddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:EuqYZpkcpqenp_jtaDJySxwL_H5gpTegOBP-c57v7f2X8Z8PIVKnqw>
    <xmx:EuqYZkwPW-9zvxBDbj_ICTWF1UMFSMLSpg5ZdGHGYwi5dFVYfBYSSw>
    <xmx:EuqYZrSP1_cybMbZNKUM8rvePw0FFrvhvLDcogPlJD9pnl-icurUCg>
    <xmx:EuqYZvaDukReV55qgrSpDKBu3xQ97_vN34PCFRSfw8_-1FOdO9-RgA>
    <xmx:E-qYZpM4gp8-wHGnsRIm-5mwma8r1DAV0qLIC_X1nD7EDeM1SSv8oZyj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8C55419C0063; Thu, 18 Jul 2024 06:10:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <c6722b03-328a-4647-ac5f-d6c00835b61a@app.fastmail.com>
In-Reply-To: <20240718-unworn-showbiz-2fb68210b43a@wendy>
References: <20240717143016.GA94990@thelio-3990X>
 <MA0P287MB2822CE874640F2525DF59712FEAC2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240718-unworn-showbiz-2fb68210b43a@wendy>
Date: Thu, 18 Jul 2024 12:10:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor.Dooley" <conor.dooley@microchip.com>,
 "Chen Wang" <unicorn_wang@outlook.com>
List-Id: <soc.lore.kernel.org>
Cc: "Conor Dooley" <conor@kernel.org>,
 "Inochi Amaoto" <inochiama@outlook.com>, soc@kernel.org
Subject: Re: Fwd: [soc:sophgo/dt 1/1] arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10:
 fatal error: 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
Content-Type: text/plain

On Thu, Jul 18, 2024, at 09:21, Conor Dooley wrote:
> On Thu, Jul 18, 2024 at 08:49:33AM +0800, Chen Wang wrote:
>> 
>> Do you have any good suggestion on this?
>> 
>> DTS changes are submitted through Arnd, clk driver changes are PRed
>> through Stephen. DTS sometimes depends on driver/bindings, when this
>> happend, how to avoid the syncronization issues when merging into upstream?
>> 
>> Actually, I have seen a simiar issue on reset driver before, but this
>> problem occurred again on clocks.
>
> What I have done in this case is to apply the patches with the binding
> headers on top of a -rc tag from Linus and use that as the base for
> applying clock and dts changes. The jh7110 stuff is an example of this:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-jh7110_clk_reset
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-jh7110_initial_dts
>
> Both of these branches share the exact same commits for the two
> bindings. I have heard that previously that may not have been acceptable
> to the soc maintainers, but so far Arnd has not complained to me about
> it (although I have only do so sparingly).

Right, this is the normal way to do it. Some maintainers also just
spread things out over multiple merge windows to avoid the complication
entirely.

Sorry I didn't catch the regression as it happened this time,
I skipped some of the testing I usually do and relied on just
testing linux-next, which in this case had both branches and
did not fail.

     Arnd
