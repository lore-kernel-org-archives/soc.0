Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C6222D9E3
	for <soc@lists.linux.dev>; Fri,  9 May 2025 20:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746824121; cv=none; b=A675aep9Y9Bg8X/gy9fvog27YD5p5Zm3qbOhXphOuRMhfsyaQSL0mUhTlgK6jsSGkHA7/36/kMmAZWTTFY7YQ0dv1o6gQ0WBkYkXyrR1ikS9n1n56m2I8RgykMUT85k1oQNiQDq3QzzLOn5+M0YnYHS78BsTB8kOhZq+fTaPlUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746824121; c=relaxed/simple;
	bh=iWzTi6F8jC1N2zJrEfIb6TyNnhdMr7NfeEAwGRKOq54=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SC8zvwOswTPS9t4ncywVC6KdgxemkceX1cPIBRpMPegwC2ouFtoWkyoac/3sCYtqVu8gSWzZ6Mi4+XbopzLXyQZ88qb9J62beWsS73P7QQsxF0QfjtxnITFB0dW2weynco9LYnhg4/Y/6PXg8sfxGCpVkOsFwcpHbmxyFm84jwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fsIVmiSM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WnfJHMrO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fsIVmiSM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WnfJHMrO"
Received: by smtp.kernel.org (Postfix)
	id DBEA6C4CEEB; Fri,  9 May 2025 20:55:20 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5EC64C4CEE4;
	Fri,  9 May 2025 20:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5EC64C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0167511400AB;
	Fri,  9 May 2025 16:55:14 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Fri, 09 May 2025 16:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746824113;
	 x=1746910513; bh=zgmYvXadLes/aaQVGDqBlJcqTMY0YA4Y28DDv3jcOmo=; b=
	fsIVmiSM4GKMMNKiZWvJLuRcTRRNszlucN7FmoVf2Vga4OXXSEMn3BuvkPLsf/uj
	nzyVmMZNVwllFHmgeD0BD0a7p8tMNoOuqdyUlkaNdAO6MXnd4Sfj8/9FAFnxyzry
	abLGRXqrq06DtoTaopdQ9dw3p3/m4LGjcBnOBIQfCjN/Ozfcxe21lRHbLcV4rowO
	wCaf+0ae5zxYC5+YHYrhTQX+RWkWIjT3qQsdhaKsDu9WF1T1pCYUQot+bf6ftLr4
	M4ExVJXgJtYhm5Ger7lYs8J63jGIisP66eqSv2+WCKnlOy3T/8J+CMNmFtYWEbIs
	2CQsP1r3OxbYXl+e/ps/CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746824113; x=
	1746910513; bh=zgmYvXadLes/aaQVGDqBlJcqTMY0YA4Y28DDv3jcOmo=; b=W
	nfJHMrON2XFRbUJS4T8+5OwwjjJ4rrgFwot8GFyode6oPwZAJ5Fvfhm8H2HwlhJ4
	MtBPh5+pwRmyNneTiHcCGmmvkzvxP/p/fpO5E3KMISsVZ08mGSTnN5+Kd3sBwI0a
	egRxZOIFb4ngZu3iPaUkQzLBHjSdt61NGv5/X1WFX/JS+w2NQYACriJf7aHuHoQ4
	l9RQ44WI0Xo1e2/Qi+W8cYIHNcljC9ICLfPKoK5J/WvkAlbrKr6i8DJOjFQbE327
	zNNyyec02On8HMb//eDXxfVwwc//yGzp4xwnqBhnKeGvJjTB6De7KVFj2aru08fw
	TMgmJBnFJx7OyAuwQpNNg==
X-ME-Sender: <xms:sWseaIbOb3soMwrIbDfzPWKMc6t5IjINtUTrWO53ZKPkJaODIu2-gg>
    <xme:sWseaDZvpeFqNzj4hsjw_Dx2yIQxN6zyDBDSHuG3qiotiZE9fdfYVeVqCDAS-gBZv
    mHhnGq0fmzigN3rLlM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleefieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthh
    hinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegr
    rhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghtthhhihgrshdrsghggheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhi
    nhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:sWseaC82gwYE0RATIolHnlqRKjrYUTKkbDNRu3Gyz-lIjLMV0qPT8A>
    <xmx:sWseaCq4w6L_fDMsB1G0IgIZP0-6cWBgIX8VYPt2KvBnjaHVZXvhdA>
    <xmx:sWseaDrqxpNjezemPCREIFT100etOLcbirUOrzynxXyIKaSszQp1xw>
    <xmx:sWseaARzgFxupy2JqEB0FVlATP9cBBD9QMud8MFeQrsnyaDhNGK14A>
    <xmx:sWseaIB_vIpA2tRWCJl6GxdVgLTd-aICtuIrrLbgT9FPeQHvgAVTrGAl>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 71A271C20067; Fri,  9 May 2025 16:55:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: T486ad80ea708375f
Date: Fri, 09 May 2025 22:54:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 arm <arm@kernel.org>, soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Message-Id: <7e8718b0-df78-44a6-a102-89529d6abcce@app.fastmail.com>
In-Reply-To: 
 <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
References: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, May 6, 2025, at 11:17, AngeloGioacchino Del Regno wrote:

>    - Since SCP firmwares are available on linux-firmware, the
>      necessary nodes for the dual-core SCP were added to devicetree
>      along with the firmware-name property in mt8390-genio-common,
>      enabling hardware video encoders and decoders on the MediaTek
>      Genio 510 and Genio 700 EVKs.

This looks wrong to me: the devicetree should never care about
particular file names in a Linux repository.

Usually what happens is that the device driver must work with
a particular firmware version, so the driver is the one that
constructs a name based on what firmware is knows and what
hardware it is running on, so a newer version of the driver
can attempt to load a newer firmware that may be incompatible
with the old driver.

The other patches in the branch all look fine to me.

Can you resend the pull request without these patches and
try to come up with a different approach?

     Arnd
