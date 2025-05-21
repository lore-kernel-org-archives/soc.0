Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685CC2BD010
	for <soc@lists.linux.dev>; Wed, 21 May 2025 21:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747861750; cv=none; b=g99vyF47tuKBfWATjgEWAU0e6Af7AXaZB2sRqBPl6dyHoRWBLUSK4VcGBK/Ek4VUOleZkcr9bDRHg1J+k9Jfu7TnkniVyyctCY5qHdyfhmAVO0/F1ekmyHD0DV/sUFEp+dtFgFWz+evHI/rSWpJva3cp+7jUYG5wLqXZG70ZGBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747861750; c=relaxed/simple;
	bh=xXFRdNR9QdDCWVBHssDPSw6xg2diL0TfiBKrO8SROgk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GUDnNhFiGuHIIwn1Y6ypEJiFYnTQv25NiePLZ+pQMvFaJqEtn1KRea1ND0IIKjvJXsxf4JZf51ha/4ol49bTtYCoh6y8L0C0I7n7WHkGbClCRVvy1WnVMSW6fsNk8BWg1aXE8IllB0joCMl97ZpjRPq/uPJu1c/OmQR/k3wHoJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=cuHbERiS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Nb3c4tGm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="cuHbERiS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Nb3c4tGm"
Received: by smtp.kernel.org (Postfix)
	id D8458C4CEEB; Wed, 21 May 2025 21:09:09 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A1B5C4CEE4
	for <soc@kernel.org>; Wed, 21 May 2025 21:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A1B5C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0965711400DA;
	Wed, 21 May 2025 17:09:07 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 21 May 2025 17:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747861747;
	 x=1747948147; bh=yGOeA66w+OpGoYUQErfCEqq6S2h5DbPkXjXDWmJ2iH0=; b=
	cuHbERiS98QPAqaSvq1vV9SNduqQxd0ISgYX5HXrIj7guzl7IDIbpcwCICfETONI
	G7KIOpXopua991TiLaw8RLI8cv0+BLycoRtevaLnwupvdB+/1B597uUsgfMYIAPn
	mdjMkHURRkeHDQZvUgI4TeiwY+lwZt7ULhnt1MLwTOIeAPV5/MZc7NhhAmupt9ab
	p7FG6NO+s5b5xsCXag6MX+E8+xtsLKW3cNMi93U2iRfTG1iR777Bq1GcN8D3/jQd
	tezHPpRlyDgfDvm96aUSaQQCH4SEiNHC4NXc5EUA390IrgC/oGJELagj+4qZBW0a
	CRk9lkHCznRQxvPOKzdTTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747861747; x=
	1747948147; bh=yGOeA66w+OpGoYUQErfCEqq6S2h5DbPkXjXDWmJ2iH0=; b=N
	b3c4tGm2MBWVG49NSdUz2k+wPsORCYZR+NQ4cXjn3ynUE+Nyv3A9SS0vDaJz3Jhd
	q0/hEMxIWG0KLmjDifOr4jsJJYcYAnVZNinZGajf+pdLQPecllqEO1sdVg9KPAbF
	Non+OF2WeB9KpZwZ6FIetpqPs35YDBeOoQoZ4dP3nkSKm3R2t6nuj5C2xNJCFzKU
	rLH3ByRXxvPBLhOvGz31lcWTn2J1S6wj3kCNBhe/wKOTG+LrQEbO+aCwlcwzQ2vt
	J1dHteu5siHn5ec6s+9aMl5Zk/FKyx2QtZLFw23v33WONBb8JiXFmdEQtPk6OJas
	vCUR1qv3HetGxdd5a8UEA==
X-ME-Sender: <xms:8UAuaCGGuQ1g9bPDcHw-BLhvLV2rgLs6PY2yArnDudyjLaWnSKnyDw>
    <xme:8UAuaDXe4RKKYACTCWRusl5hlJ9pZp4NVGFEk3B5a2OwUU_Rj_zy9r3mvo-qWxmpr
    CnETbvWuQZKi1FCpD4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeguddvucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgj
    fhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuc
    eorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedu
    keetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdp
    nhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnug
    hrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgtphhtthhopehjohgv
    lhesjhhmshdrihgurdgruhdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8UAuaMKSC75pzGUnXlcrn9n7WxEoCr5YW1Mhf1S7Hm36rcDUQiwg1g>
    <xmx:8UAuaME0gxxy4M3q96mwVK6ux_rtHhIUV8Nog709xUu7OaZjdn1J1g>
    <xmx:8UAuaIWgckHuD1kl_qgu2sZYrzb_oEBtJAvIjbCx7ROXaWvnABVp0g>
    <xmx:8UAuaPNyiKtHzidZrP3gcBU-ciHYdhSw36P7k8nbUUPV8Dhw34lZ1g>
    <xmx:80AuaC37qJe-fb7Mux3niwILTeinAj_-vu_Uf0u1sIQbG1IjPC8p1j8X>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 871A01060060; Wed, 21 May 2025 17:09:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: T754422f7f1c177a6
Date: Wed, 21 May 2025 23:08:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Jeffery" <andrew@codeconstruct.com.au>, soc@kernel.org
Cc: "Joel Stanley" <joel@jms.id.au>
Message-Id: <971e4c0d-5b8d-46a8-9803-6d221573bcdf@app.fastmail.com>
In-Reply-To: 
 <20250515-aspeed-drivers-6-16-v1-0-eb467f6b7a7c@codeconstruct.com.au>
References: 
 <20250515-aspeed-drivers-6-16-v1-0-eb467f6b7a7c@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] soc: aspeed: Minor fixes for v6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, May 15, 2025, at 08:30, Andrew Jeffery wrote:
> Hello SoC maintainers,
>
> This is a small series of small ASPEED SoC driver fixes for v6.16 that I
> didn't think warranted a PR, however let us know if you'd rather a PR
> instead.
>
> They've had exposure in next via Joel's for-next branch and have
> otherwise been around for some time.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Hi Andrew,

Patches are fine here, the main difference is whether you think
it makes sense to summarize the series in a tag description, as
that content is lost otherwise.

However, please always remember to
Cc:linux-arm-kernel@lists.infradead.org. I have set b4 to
pick up the patches from there, to ensure that everything
I merge is also visible in the lakml archives.

Since all three patches are simple enough, I've applied them
manually.

     Arnd
