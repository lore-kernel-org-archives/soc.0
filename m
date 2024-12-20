Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54A6218EA6
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 16:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734713262; cv=none; b=StkFI8CMzA/zOVF0M+zK+v/g0YPXdOKkB1yc+pIqXXi2lxLcnEraKUd+//vQ8SNcB/Wr9wD+pAEdBsiQdQHBKc3wqDV8NbiEop3Jgx9wNH5HuWkNulFK2znpi8sq204ixX4ZZtf0izBvgbhnuNPw2/aS/BM7tQTt0iquhDe9jwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734713262; c=relaxed/simple;
	bh=MudEDeJpn3KQtyjRaiGMj+aRcLPRtWLkH6imXV40vWk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Sbhm1yWUXtKoPIcMcoofJCpppXeiGfwh6YiosA+Qb6PwoIw4OgQXWiMFbCg4eQYXSpEjP0nWVFB8eppFvvke4XPR/M1lbu6RuXZsAtAyGl41fGNx1pn5LA2syhr3JfvA7hZb8B2199F5hhlyhKIwo77y3/2hWAEXQww3bMu21Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=iP9uhXBC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MAxsBQ4H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="iP9uhXBC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MAxsBQ4H"
Received: by smtp.kernel.org (Postfix)
	id 7972AC4CED3; Fri, 20 Dec 2024 16:47:41 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63651C4CECD
	for <soc@kernel.org>; Fri, 20 Dec 2024 16:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63651C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id A338011401CE;
	Fri, 20 Dec 2024 11:47:22 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 20 Dec 2024 11:47:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734713242;
	 x=1734799642; bh=2Vwn9sPRO5eXk4lNtjAHB9sj4SoIXWEcgGa4IAJMV2c=; b=
	iP9uhXBCxVGpcfYFBt207T2nrth6YwPzH7dQoG1qT5qevs6d4YoYdjWTakplF/zV
	L/oP3JPYRhD3HIwuIIIDsTN1QRs2m8gySAYsMt3YHnZ+VQSphAsQbC6QDk1Q0qcX
	lULVZOdr3Goe1SqAq5Bl+vJeDhpSUYsV5qCnLcBgoh7TBn/Lf1SBry7o9XVeawDK
	9d7RaS/c7oDqz49L39pQpFAr6hPu9e5Eo5Ncn6og+WzV+3B8yEmvF5s2UcRIcnIp
	l2pjajI908rkwTSxvKPgbO9xXVcRS9UR6v8pCfMZFK6JKeFIZdq+N/c02kVxZz2w
	DZl1+Na65bmofS+68QxXBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734713242; x=
	1734799642; bh=2Vwn9sPRO5eXk4lNtjAHB9sj4SoIXWEcgGa4IAJMV2c=; b=M
	AxsBQ4HIpcH9/5msVU/NdbIfaU1VYVkWcaiYLZtpttmvfnK7dtft3o7XKsRaKhCb
	SHeSFjTC8AuvTrz6T35ZRmcRjdYI315BtrNvNuoJczcN/aWuZhUA9A9E6v5b17+a
	omOmfHIrC4k2QFUozKpAUdrUql5yY2m9myuiNzkxHSh1jnWOZn4jpe6zIniVrh2V
	n8Kkc2SUVpdWrnwR/w55gkc2QajbNheElu/FVcurgnWVy3gPe4XIyTZ6ZxPK4AY1
	Xgo4SrcCxSH6fcNVB279v9pc9fQ9ePMQSmCb2t+qWcPwHlgwB6I9dNAZbTxyuukb
	xTZQA0qjT+SlwIjGfQQAg==
X-ME-Sender: <xms:mZ9lZzMg3hFefTeRsmLQIIKcU5CnbwsS-ARE9nSnmWk5GLCdmH2V1g>
    <xme:mZ9lZ9-je13yHkgQVOIERT2q_svlSdVEbI312NCqtqafTUgelUKTQ_2cUWPPgJ8_D
    _8obROLuVUQuGfw92o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtvddgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddu
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugi
    drohhrghdruhhkpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhs
    shdrshhtrdgtohhmpdhrtghpthhtohepphgrthhrihgtvgdrtghhohhtrghrugesfhhosh
    hsrdhsthdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdho
    rhhgpdhrtghpthhtohepohhlohhfsehlihigohhmrdhnvghtpdhrtghpthhtohephihorg
    hnnhdrtghonhhgrghlsehsmhhilhgvrdhfrhdprhgtphhtthhopehlihhnuhigqdhsthhm
    fedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomh
X-ME-Proxy: <xmx:mZ9lZyR4000kkMqIPe6HcbMy5Isv4Nf6VEfMQcLEHrLuDXbbPB3DNg>
    <xmx:mZ9lZ3vrDV_WE5VSHAYyOdfLZF4A-5a3QaKNO8JnIvZ8R8R_S8FSWQ>
    <xmx:mZ9lZ7eJJfYKEzcdurHJWUc2o4cdmHiXTjYvny44R8WqFRskQrLGGA>
    <xmx:mZ9lZz2pUK9WfJmxtEL_WDJ6pltcdA3qr_hY1c9pDKOSzmlXyl-8wg>
    <xmx:mp9lZ8X37WHXI9_v-PXg2wdPQcTcCSfmpcBhdxl8W-KuJxogGlRLepcK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A5A682220074; Fri, 20 Dec 2024 11:47:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 17:47:01 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Olof Johansson" <olof@lixom.net>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Petr Mladek" <pmladek@suse.com>, "Yoann Congal" <yoann.congal@smile.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, soc@kernel.org
Message-Id: <c720715b-cde3-4ab4-991d-37e9ae91b16f@app.fastmail.com>
In-Reply-To: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
Subject: Re: [PATCH v2 0/4] ARM: config: stm32: Remove useless flags
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Dec 20, 2024, at 13:55, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>
> Running "make savedefconfig" highlights that some flags are no more used,
> remove them.
> Remove some flags to reduce the kernel image size as STM32 MCU's board
> embeds low amount of RAM.
>
> Changes in V2:
>   _ squash patches 2-7
>   _ split patch 1 in three parts and add epxlanations about flags removal.

Looks good to me, thanks for the update. I assume the plan is to
have this in another pull request rather than me picking up the
patches directly, right?


Acked-by: Arnd Bergmann <arnd@arndb.de>
