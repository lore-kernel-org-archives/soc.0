Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0050821A459
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 17:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734714430; cv=none; b=lV0kslm4T+mm4PcrBEOyrgep8ALiv9k06HzBgYlLeWgkehGPLdedbnDMaGtbUMARSlf7TiVasXhGUPdHXrsm/riJZUg9c45TIfaDIM8rk1sf6Crf5rBb+Q4l7G8aCSE/KpqF1OMdYHsZRXLleDqZ2Y91KjMj1xftktR8/VUj0jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734714430; c=relaxed/simple;
	bh=xb5nUzqCJjWNy/jpc7svjH4cLvKDwIPASyQ5GLMWHvk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=J7apzoupZaVYylDdWSw6Gd1ho/Mb4HrKHTKel9EqxyT0mf2qhwLmJUDcyVoA3h2V/BMsUi147jkafiiIT4WJsifzd0xh/yIlhIhD8m+k7UXq8fwrWh5JTv90i9nZ7qv5/ZnouhU38pL9i3bGfOkvJxfxbt+IzDS0J9Uq8oRgkyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=cVwnjnie; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dCQGlbie; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="cVwnjnie";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dCQGlbie"
Received: by smtp.kernel.org (Postfix)
	id A389CC4CED3; Fri, 20 Dec 2024 17:07:08 +0000 (UTC)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3DF88C4CECD
	for <soc@kernel.org>; Fri, 20 Dec 2024 17:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3DF88C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D0B412540140;
	Fri, 20 Dec 2024 12:07:05 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 20 Dec 2024 12:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734714425;
	 x=1734800825; bh=gKbh784gSKI3i+Xb8BoJ8RM+wuGg+Udul1q+E+iU8Fc=; b=
	cVwnjnieistFLbwIZ2ck2NZjatfgBOiKFR/kAQQ4K+FKRlL8KQQbjhZhOWU069zs
	+zgIU3AbXP9+gkyt95dE3SIBNNA3kvw4E6UfF6OherufYWAvX0YKfApKCxp2i6zQ
	77g1yeVh0zAyGNG0wE9mzRntgkKspASoDW22pp6IITndzi2lTJ4HKwNs5nqoii3w
	4+HCH21yGGTdbQnKhCQRJ8uTM84A67EBk6bF2z8ez9dzxMBOu+tSLlYPfnH3AMRd
	YFaO1Joe4dFYu/kUD9v5QjDF3u4hCIvbGv8Ior03+1p2/LvTO+X2ZwJGkdDw3QD0
	lNjjkbwJvjrkXka7ONY9IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734714425; x=
	1734800825; bh=gKbh784gSKI3i+Xb8BoJ8RM+wuGg+Udul1q+E+iU8Fc=; b=d
	CQGlbiemfZDolaPsSx6dIh3Zy2pEsHaBs/FZwjo7AmR7XFj4fZqn3BZLQdNw1iJT
	17ecwD/VcWs3jAAGF/y28KdkqdfS4RvC91W+gHU+NxdA07uf0Jy1dTliDTv2nve9
	uIN7IaraXNbD84wpTAQ3BQJ6F1LxqG79Bbx/yyD4aTv6AAzTy5aClB4clbt5FO2P
	bNAyX/j7Lb8biFooKHhqg6Y0ij1PqAFSytVswDMlf4cy7sk1Ilc7uzBMTfsTA/H2
	IUCSKaTPdpIAUeqgmK189ibMDmyW7sZqRv3FHL7xXnUDc4+A64Hmfa+y7OiZoAn+
	hI4XcznclYJ9zInqBynoQ==
X-ME-Sender: <xms:OaRlZ84R-kzFHFhkxsWwmtvoGpFX4liL6es0xQYwIJnB1iBIbzOgzg>
    <xme:OaRlZ97EVsjrhU7qvxO6iZHcXvuiYymsnzpAg2IH0XFadKew3I4Osk_NFfVU8vMWX
    Y7ShD4EnHxq3ihh1a8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtvddgleegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:OaRlZ7ee2TnH3FQ-LBboFcEmjH5NZAZmDHibOgB9dxwBhty6GDqMuw>
    <xmx:OaRlZxJq2G0x78tz8ranjIqb-HRx0z0Sc6uSXruoYjFja-nwQBHW3g>
    <xmx:OaRlZwIaTdUokn6guHcSSJk27WlOZv8Gly2XG0BNutc7tLGd2upGwQ>
    <xmx:OaRlZyx78E0kyHNq3r1UCyOgvVimBZkit4uOjMFCSjSgFHOvsIbixA>
    <xmx:OaRlZ9AwFtxX37i_8NvGG0tbPEz9bSRIyR74VdXQgqSEXJjnaCvnOuU3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 15B872220073; Fri, 20 Dec 2024 12:07:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 18:06:44 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Olof Johansson" <olof@lixom.net>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Petr Mladek" <pmladek@suse.com>, "Yoann Congal" <yoann.congal@smile.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, soc@kernel.org
Message-Id: <c48b7e84-5287-4da0-84a0-7747581f49d0@app.fastmail.com>
In-Reply-To: <20241220125506.3157268-5-patrice.chotard@foss.st.com>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
 <20241220125506.3157268-5-patrice.chotard@foss.st.com>
Subject: Re: [PATCH v2 4/4] ARM: configs: stm32: Remove useless flags in STM32
 defconfig
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Dec 20, 2024, at 13:55, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>
> As stm32_defconfig is dedicated to STM32 MCUs, disable
> CONFIG_COMMON_CLK_STM32MP flag which is only used by STM32 MPUs.
>
> Disable CONFIG_SUSPEND, CONFIG_ADVISE_SYSCALLS, CONFIG_IO_URING
> CONFIG_POSIX_TIMERS, CONFIG_GCC_PLUGINS, it will reduce the kernel
> image size for these platforms which embed a low amount of memory.
>
> Tested on STM32F746-DISCO board which embeds 8MB of memory.

Out of curiosity, what is the smallest memory configuration that
you see people using on stm32f7/h7 these days? I know we had
configs that kind-of worked on 2MB in the past, but I assume there
has been a lot of bloat since.

       Arnd
