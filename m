Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D264620E6E3
	for <soc@lists.linux.dev>; Thu, 27 Mar 2025 10:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071393; cv=none; b=jSKDOUqUQRC36CLM6PnntT/8fuA3M7F9h0d/7TVTJ7sIL3s1F2MIbIpoVwRQBJfV6emNxNbs3K9pS6TaKjcg3yN1S3m0WKrsZvK9VXEgSNEllPphHS5miQJroD+zRsqN5VzU5+ZiD6jQRUQQ2Ia0ekjZ1HipDUYXG6MOknPaF4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071393; c=relaxed/simple;
	bh=Di0IeQB/07WzmntYoZ15VnvcgwhnRUmYQpeTYOArj1Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gaxTiZoB6P1SCgjH3ae1bxWbKIoSRlRTAf04Uh+BLJqSmVG6bOSjEmQOT7o7Bm+Rqx30SPH0+3Uuxa0earHa2WrCRVGKnKtEjrSFFqxDsGTwN7OXcbA/KJHd7/StUq2Wmt+l/uYN3g6y1KzRhLkGCC70Y8ppULB97B3Iqnh+G7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Z2LPBBtw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qDyZKNeE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Z2LPBBtw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qDyZKNeE"
Received: by smtp.kernel.org (Postfix)
	id C95E1C4CEEE; Thu, 27 Mar 2025 10:29:53 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1FDDC4CEDD;
	Thu, 27 Mar 2025 10:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1FDDC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7425D25400D3;
	Thu, 27 Mar 2025 06:29:50 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Thu, 27 Mar 2025 06:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743071390;
	 x=1743157790; bh=WCYSiAlHYmuAWqIvVZL2TaKjPyrpu3Ki0Js5DQS4y+c=; b=
	Z2LPBBtwgvqY916TkNWLepTOHcGJi3/GjR2ONLaHPmEIBDXGJVgG6Ok4flCMkX1A
	fXgqMl6iOTNpx8bCdTCprFF79ZhqcL+Z2ibfZyN/nZUqa1f57/EqVsqjXPBI7bNr
	gnewlMJO5unwvk03/2xr11N1G//bZfWP22M4WgaliAohJvUE4E8/p9NsfQp717BT
	CY28j+1wa7EbM4PyYxBy1BIMdp6XlgSUjsCLS6/qq+4FQnT6r8JCpH9LmdZkhPhe
	UGa/S8GbcqPN7xBm2eir1h93URnJOOvWVOYVupsWZlx+ncXoIiim/QMcv925b5zQ
	9AYuxAP7C3Tx/IonPR0IlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743071390; x=
	1743157790; bh=WCYSiAlHYmuAWqIvVZL2TaKjPyrpu3Ki0Js5DQS4y+c=; b=q
	DyZKNeEnrpXWTsRqV8cS3EEn3CFbnRcNoREdLY8gMEgzNP8+b7DLMdThv0TBO7ci
	UjGm6K5bkdw5Ib8fYPnc02muoglW+89rGGXb4J9OWM8duk8a4J8yyNFM7BOVe30A
	Md064ZkvWKAd0thNBap7O7PJdoGNVU2GUYUSu2T8eT/LxZCvcS9v2gHZDkWN8W1K
	EQGrQtVr0X9KYDUXbLvxHaSI7aNaVYB4sfWUO0kU9F0pu6gYJj8SkSMVckHRrJ0N
	s38b4sEw9u9xYnDYqz8fziRFu4yrLuEoUPqiM9GKnPLumF2LgwXq3DcV0dKooN+e
	LAtzjQi0m/0s8r6FjxWeg==
X-ME-Sender: <xms:nSjlZ6Ntn3ZrEP__L_P38ib6QYxJPiPheSUGqKUdHVCsJ13H3sa9Vg>
    <xme:nSjlZ488nHLynJXkGSzu5noU8FbL-AErNr4d-CoAY4Y0qXm6sGI9wNxQOaFnLRM6r
    i_90HDBNUo0ix7qcMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieekudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtohepkhgrjhgvthgrnhdrphhutghhrghlshhk
    ihesrghrmhdrtghomhdprhgtphhtthhopegtihigqdhkvghrnhgvlhdquhhpshhtrhgvrg
    hmsegtihigthgvtghhrdgtohhmpdhrtghpthhtohepfhhughgrnhhgrdguuhgrnhestghi
    gihtvggthhdrtghomhdprhgtphhtthhopehpvghtvghrrdgthhgvnhestghigihtvggthh
    drtghomhdprhgtphhtthhopehmrghrtghinhesjhhushiikhhivgifihgtiidrtghomhdr
    phhlpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikheskhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nSjlZxSbIviS_Apya2mpp532w2c02lRAbr-qj_JHqxC14OUGrIi2ag>
    <xmx:nSjlZ6trY1HGlLIW7Yyb-Ynb8su7b6kjvnDwiiLjubZPf7WBa_gRRQ>
    <xmx:nSjlZyc--MHa5Si5SUQnXPJDhJ4brXful4daztRkuv1ppZVdsyBw6Q>
    <xmx:nSjlZ-0cZD3fZ5QAEUs4juFCcv4UNAcgDEfq52dQTbBC3yg5K3I-Vg>
    <xmx:nijlZ1vSr25BqfA7nB64LzY0gceua2vzYocA9yM9nl1JrS9yAvj4Dbso>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CE7BE2220073; Thu, 27 Mar 2025 06:29:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: T24bcb56938053d3a
Date: Thu, 27 Mar 2025 11:29:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Chen" <peter.chen@cixtech.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Marc Zyngier" <maz@kernel.org>,
 soc@kernel.org, "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 marcin@juszkiewicz.com.pl, kajetan.puchalski@arm.com,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Fugang . duan" <fugang.duan@cixtech.com>
Message-Id: <faa1d8e7-e882-40ea-b64d-2e139121bc38@app.fastmail.com>
In-Reply-To: <Z-Ua7MK-Kv033uDu@nchen-desktop>
References: <20250324062420.360289-1-peter.chen@cixtech.com>
 <20250324062420.360289-6-peter.chen@cixtech.com>
 <865xjxmlgl.wl-maz@kernel.org> <Z-Nz0DU441Wwj1i4@nchen-desktop>
 <861pukm9yd.wl-maz@kernel.org> <Z-Tz1moMNozx23k6@nchen-desktop>
 <e43b1a00-b221-413b-a36a-3a65e17f800f@kernel.org>
 <422deb4d-db29-48c1-b0c9-7915951df500@app.fastmail.com>
 <Z-Ua7MK-Kv033uDu@nchen-desktop>
Subject: Re: [PATCH v5 5/6] arm64: dts: cix: add initial CIX P1(SKY1) dts support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Mar 27, 2025, at 10:31, Peter Chen wrote:
> On 25-03-27 09:18:42, Arnd Bergmann wrote:
>> Agreed. The usual arrangement for a new SoC family is to have
>> the minimum set of drivers (uart, clk, pinctrl, regulator,
>> iommu, irqchip) along with the DT bindings and the dts files
>> in one branch and have that go through the SoC tree as part of
>> the soc/newsoc branch. It sounds like in this case we only need
>> uart and a mailbox since the rest are shared with existing
>> firmware based drivers, so this isn't even the worst case
>> but still requires some coordination between subsystem maintainers
>> to ensure that all patches have been properly reviewed before
>> I merge them.
>
> So, in this case, we should add mailbox driver support in this
> series, and once the mailbox maintainer has reviewed mailbox
> driver, all the patches could go your tree?

Yes, exactly. Just make sure you describe this in the submission
for the mailbox driver to make sure everyone understands the
plan. I don't think we've had a mailbox driver as the critical
path for a new platform before, so they would usually go through
the mailbox subsystem tree.

     Arnd
