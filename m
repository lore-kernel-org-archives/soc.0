Return-Path: <SRS0=UdQh=P5=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFFACA100C
	for <soc@archiver.kernel.org>; Fri, 30 Aug 2024 19:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E124DC4AF09; Fri, 30 Aug 2024 19:57:49 +0000 (UTC)
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CF82C4CEC2;
	Fri, 30 Aug 2024 19:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6CF82C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6CF7D13801C9;
	Fri, 30 Aug 2024 15:57:47 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Fri, 30 Aug 2024 15:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725047867;
	 x=1725134267; bh=I90X1cA09m6b0jqWdVrE7ppASsSkbTWhdh6c/+7A8MQ=; b=
	fatagvbqbh8iKBUrZlI38DJkezsMG0E3FLDQSRwRum5SFByJXOL+Y/03pHp5FqyP
	jMLcAjTuUqf29GMwMvEQueajuNcT9H6YX/ocDDL82Ns8HCY/dPqRZ9Ex8dt6Oryc
	C4vZDgjbceTT3vlzhphYlkKyFyc5nwrTBREN96IPV+XQ8kylczcMYN+hS0Sf2jSu
	tEPTpgwKjNnEHFR6FXNyfpnJnrCFjzk6OJkHO0RlEVCaPH9TXm1RweyxHBcS0n1M
	00BQWT5s5Uc0rQx7ySvegzTBR2/DxJiVvLbNnb5JgpWF4DfEqb/gJ0ENwXA9st9S
	yDtaOqLfaPAN2TcA1ThGKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725047867; x=
	1725134267; bh=I90X1cA09m6b0jqWdVrE7ppASsSkbTWhdh6c/+7A8MQ=; b=J
	U/JAx5R5PntdjM9nD9ae0OldMIlENtVO4Qe7hjGZEblJqEPaRyhtOfHqzvTVcKrw
	cHGXUILwn1efoUW8iYk9DAUd6Awd9jXYDs2EwT00DYLALD75eMOz5I2Zf+Uo0qNA
	RWFXQ+hkzlYkejsIKesSU+RIwheBOWKvk9qR5kERsJjgtVs8O4PV4uM1mTPuhiNk
	WRjzLmOhwvqYPTevl1I37KM79ERfEmSFM0BpqhsQwhHa0KnyITsnEZAED766LaAG
	RWCsteo/k52J/oRtvM/yyUoRal3ClBE1tY9jcKcTI/md/z695PzZSB9lr0oF09fZ
	1cvAQvFONvcCYjcc4XNkg==
X-ME-Sender: <xms:OiTSZpnyX7tL-XlTn2JycUJAB7AfhhGN7n5GCB8HT8QZ5-baIQF5Bw>
    <xme:OiTSZk3d0ZYjd1HDtPFH0dKIScMSjj-vIesNC3Z4iRJ0vKCKOnfAUWlAqUd6-gjsM
    KI1T037UwfiVOEukg0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefhfehteffuddvgfeigefhjeetvdekteekjeef
    keekleffjeetvedvgefhhfeihfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdp
    rhgtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsohgtsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhi
    shhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeholhhofheslhhigihomh
    drnhgvthdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhp
    rdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvg
    hv
X-ME-Proxy: <xmx:OiTSZvq_ioQ1AB6Q1Z2iRQ5yPvJeSJ7CGZAj7heoPRpU0ZTsWq_Dsw>
    <xmx:OiTSZpnF6SIh_CQQu8cvoca8CoqHNKfBl6X976ts8aIe8yjhoyGEnw>
    <xmx:OiTSZn1cYPiCtL9KbxIbSkdvgrd8UfD2kgP04sku3AiqWy22jI6TRw>
    <xmx:OiTSZotLQn7TekXJuobtxY4XC1Ryo02R0C_PEqeT5sIJuqbj7u0W8g>
    <xmx:OyTSZhowA0w184hwI2kX_-EbH32xlMVKuhn8eKKAcux7QnKYppfBsCbY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9FDB02220083; Fri, 30 Aug 2024 15:57:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 30 Aug 2024 19:57:24 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Olof Johansson" <olof@lixom.net>, arm <arm@kernel.org>, soc@kernel.org
Cc: "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <2aa68d3e-9d9d-447c-a2a4-5cfbb4062ae0@app.fastmail.com>
In-Reply-To: <20240826170749.3271888-1-claudiu.beznea@tuxon.dev>
References: <20240826170749.3271888-1-claudiu.beznea@tuxon.dev>
Subject: Re: [GIT PULL] Microchip AT91 fixes for v6.11
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 26, 2024, at 17:07, Claudiu Beznea wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
>
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
> at91-fixes-6.11

Something went wrong in your pull request, presumably an incorrect
"insteadof" entry in your .gitconfig caused the wrong URL for your tree.

I instead pulled from 
https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git

      Arnd
