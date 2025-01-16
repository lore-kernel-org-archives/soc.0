Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7D422CA0D
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737045569; cv=none; b=kvWE5AST9fIOn9NxUwd818twUx0gK1q7tjdIfQaFaB57QPW6DOk6NB9NsgooUNM7jdRr2D08un4eZY3HQL9Bz1M3mjVcZSaX/OBqoUsiRw6hBXQhODWwnKJGp0yh7+Q5jhmrN8QNUoXLAidk0EOUGroZt3KEiz12QoyWjVcFF3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737045569; c=relaxed/simple;
	bh=xggYNx0BYbQ/wCBnQV171BeBnDI6N2JLCuJjVqQiClc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=t7KHWCDI54VFOyJMSawlLcVWDg7Stvk+pXtoOnUFKWDCXTvZWVjtlkL/7ENjb6HYLNL1igFph4QRhQGanEgNThJnxM4N7GK41fE0Npa+OX8IIE22ZjPowOw2mMmqwOwMgG+qDYh+ZwHfgXTS51qPiD/fUDdzAsiAeMnuMStzPIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=tp3VvXVJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wWHKtsmO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="tp3VvXVJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wWHKtsmO"
Received: by smtp.kernel.org (Postfix)
	id 336DDC4CEE2; Thu, 16 Jan 2025 16:39:29 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DBDD0C4CED6;
	Thu, 16 Jan 2025 16:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DBDD0C4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 9E8231140192;
	Thu, 16 Jan 2025 11:39:25 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 16 Jan 2025 11:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737045565;
	 x=1737131965; bh=7geUCbmReCXzmlkt85CSJgfKGD/03e0emrqRlFpi8ro=; b=
	tp3VvXVJe5dQTHK9cTU1ydJiuT3MjPizKwof4s3XQEPdI84WqJKQyGh2A4BVupWW
	mp7PbXGNK+VDgxMAem+aCIhltE5kZOCzpXlZBTzY2P5MLVwqlVmORIf/v8lGFeL0
	kbhvDQWBO4Benw1VweWdwY3I6ax3JPE1LGMuawOsowTPsE2CoQ1kdGMVRPx5UIvu
	15f6hPzCPsW+yQapFBJ9pNoAp6iII+43K1PALkbvj+Rf32KViYGJfjEoeNScCDRf
	vtFdeO7yTcMUGhKpf8BY/DtkK4EcZrM4UABOj4V77/CG9mjNCA4ITXZvgI6esnwb
	/cU0HLAE1mlwxtCQjMmmpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737045565; x=
	1737131965; bh=7geUCbmReCXzmlkt85CSJgfKGD/03e0emrqRlFpi8ro=; b=w
	WHKtsmOrLaKCXEAlObuAkiYsj9pYXijIGCcaAFnbAVaBJiqYIjRuod+aY7TlyCbD
	prrD3kxBDjNRTYMYkDbhJ+gQLnMB6q25PbIqFn6IKkNqA2UfQLfnuIdMLtsph2iJ
	UqxGfFbAaQms0ZR5hUBHZs67crQ0qng+tPqxQzrvIpnbpxYd/RK2L1NX1/pN+wE4
	TSiDVhb0jFLkqcxw2a1YM1RS8GND5HkOnwcMC22/MUBFzvLVgTciDx3FQU4QdE0O
	ceM7+lja2ISJe7AQBHdE/9sRWQwEXKwo1UEaBkactRzXbP4moOwGsGOoc2/sNOHN
	qkkjeCy5jZY4laL3opHdQ==
X-ME-Sender: <xms:PTaJZ8JH8kcesZJ9lVI7Wu2ly_WjHg3hZngzH3gFk9EMg9Y-gTIyPA>
    <xme:PTaJZ8L1bvmm_2KFO4s2WgiykB8qFet4iPKMruLzHICvPx6n-N8xXnFq_eJyukVkB
    hXTfeL4cYCKr7rKGOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiuddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvihhlrdgr
    rhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdgrmh
    hlohhgihgtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:PTaJZ8tHQ6dsRojE8BjEYk4zySnaVxPuX9ioIG36bWBizbv2yo7EoQ>
    <xmx:PTaJZ5ZfLSgFtqkLXHTFRwDyfvKnd4da6aMQ1TU9UvMVAL-4Z-omgA>
    <xmx:PTaJZzY7vk1KhFns1AevQqobv9vZrp4gWsDZmh9s5578733PCg8Mbw>
    <xmx:PTaJZ1BW4O0xvDY9VnWQg1t3WJLGdFSRm9GvoWP05lBBcUvBAweuZA>
    <xmx:PTaJZyUdoKK8828_tbyB_QDBaOQpdR3c7AYc5Yn4PDM1rj2U1husRB2v>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 26BAA2220072; Thu, 16 Jan 2025 11:39:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 17:39:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Neil Armstrong" <neil.armstrong@linaro.org>, soc@kernel.org,
 arm <arm@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Message-Id: <909e85a4-8861-41ee-8b4b-97d4bad29994@app.fastmail.com>
In-Reply-To: <724c4e81-184a-489c-aaaa-85c21a19b64a@linaro.org>
References: <d22513cc-c326-443c-982b-78adf755d3dc@linaro.org>
 <724c4e81-184a-489c-aaaa-85c21a19b64a@linaro.org>
Subject: Re: [GIT PULL] Amlogic drivers updates for v6.14
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 16, 2025, at 16:23, Neil Armstrong wrote:
> On 06/01/2025 15:25, Neil Armstrong wrote:
>> Hi,
>> 
>> Here's the final DT bindings change that will give 100% success in Amlogic
>> ARM64 & ARM64 DT Bindings checks, with the mmc-slot bindings change routed
>> via the MMC tree.
>
> Gentle ping, it doesn't seem you pulled this PR.

Thanks for catching this, I had indeed missed it in my first pass
through the backlog.

When I first looked at the "drivers" branches, I decided to skip
it and instead merge it into the soc/dt branch since it's just
binding updates. I don't normally care which of the two (or both)
the binding updates go through, but if the drivers don't depend
on it, I pick soc/dt.

When I later looked through the dts branches, I skipped over this
because the subject said "drivers". I'm now in the second pass of
looking at everything I skipped originally, and would have
eventually caught it, but it does help to have you look at what
I'm doing to ensure it doesn't get lost entirely.

      Arnd
