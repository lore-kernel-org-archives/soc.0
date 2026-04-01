Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C333477988
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 16:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062272; cv=none; b=nF672vVGNzjf2Jt4eC2yXwNgHbVVjehOEhaTGR7KXTTTbQIOXSWlA2Bc9aUTQIYgNkC2kN2fmb1/DtT2JUQWyC9qJ21eJDpBxxuE6zq0MfhS/iMyF1tlrd+V4qf1sgQlOX7wez0QE5VYs/bGM3oZclOQTFnJIJwCq9bsvTlPMRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062272; c=relaxed/simple;
	bh=rWLr1RgFkWa6CwhZc97BfgtBCBdonmaFuRmweCGQGb8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=c+80v+NtrK1NCD7gqmvagEp+7UkGMyQbPZ7mi8LZxM0JvNGr4LxTJtXjkR5EvdbQtsI8IyHJjoiCPv4L6zqewW25qOn3oDwte6qnYXyW39N74oohdoNxP4yA6bMIAj0Bja6EGbOs68ULG5bmeVMqO2e1xMXT/A0i/dVXeoFefdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=MOwKB051; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y8l4CbSL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="MOwKB051";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y8l4CbSL"
Received: by smtp.kernel.org (Postfix)
	id 19F49C19421; Wed,  1 Apr 2026 16:51:12 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9694DC4CEF7;
	Wed,  1 Apr 2026 16:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9694DC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B102B140025B;
	Wed,  1 Apr 2026 12:51:09 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 01 Apr 2026 12:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775062269;
	 x=1775148669; bh=ntHteolZmRp8mw0hqZwOpCeITtp0TjCPhGc0JrTRIqQ=; b=
	MOwKB051dhkWhoz3SiwZCCUL7ySvUmMUNq/WdsHwkMk5O27t0IP++AHtn3vOGcqC
	K22Y9HB0rL3TMRbuJGWtLZSCFhDbvS+CKys0JEgdC3B8Ju2mxYyHqer9fqF0VjF4
	XWPHqgojjYhtyxqB/LyhmGdmreL3Jvw7CXkVbr6eqO7VteYdgB0bF9ohjA0Xl4zT
	/+AT1scIPsft0KVEcyMTAhqGSnyUjXzBpirPIskfax8Fw4jIjqrls9kI/UH2Lowi
	1gtZ4H/9dEY4Cs76l4MjUFQFo+iJ0Pz1EoxQFr+GKB4nmXX2LLmeodNp7d5UnHPb
	wMo6HdoDjA5Yx+5e40oF5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775062269; x=
	1775148669; bh=ntHteolZmRp8mw0hqZwOpCeITtp0TjCPhGc0JrTRIqQ=; b=Y
	8l4CbSLJUKneC6DqhBhOcfX9uEedQ1wN0qeKOxjQf/c+42iGhpPWUkVgPtARkDnt
	fyBQwZ4fnUAficd2PvVg1svI+6hRhLwaqsNkTzZfN0yIeIF8ZisPp9y5Fbk6k6LZ
	0PuSTg9XvM50CjhWahlsfzgOd6HbTDv1+7qrvPx9w0JTXrr/3om+MInaHobJjQy5
	cpwy4HZj9pJJeTY6/IYd+1RMVJkvgnaINRzf4AVWfPkBko2VW7mLoN+RQVl2rGZy
	3GgFK4I593ACzt0nbXQtD0EkW8ug86+4H/+FwH6l9X8jfuA4SFqcZI52Eybpn0RW
	4sIR4j39qxne4DE8yWVSw==
X-ME-Sender: <xms:_UzNabCYPDObcakokSLBKEF3s5woe-yVFMRPU0XUuZxFi-3FBt0-vg>
    <xme:_UzNacX2yX-GNPSo0JNTpag78cRtK2yZ-gYQXk38RBOMhDqPpGf_oDoZzhhYYvK4i
    CH7Mmzm3PBdSKqgoSsGnMcbc6Z_bQuBea27j1XOKffZjmWdSzHgnRa4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghroh
    gruggtohhmrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegs
    rhhorggutghomhdrtghomhdprhgtphhtthhopeifrghhrhgvnhhsthesghhmgidrnhgvth
    dprhgtphhtthhopehmtggrnhgrlhesihhgrghlihgrrdgtohhmpdhrtghpthhtohepkhhh
    ihhlmhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    shhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgohhrrdhhvghrsghurh
    hgvghrsehlihhnuhhtrhhonhhigidruggv
X-ME-Proxy: <xmx:_UzNaWjs4pmWuFxhaFdP6_ExLaBt_p3B4B1DJRGVpTQ-IR2ToP9x1Q>
    <xmx:_UzNaaEZWbYwsUf6J36o70YrsVtShKsNIUtvsAEaw50XavCKkO6OfA>
    <xmx:_UzNaYtngEtOCOP3W6yIuy_i9mbmJ3wBPj3x7wsrgAC59m4UkP-Aug>
    <xmx:_UzNabdv2VnS8BQL4f-p9sXjF7ZFRRdXH2FtllOE3qBtXMXTjx9cWw>
    <xmx:_UzNaWRDpY7sCoU28BmkMiB3Zz1ILQJ7Era7q6vJsadVc3GKwWKd8a-9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 330CD700065; Wed,  1 Apr 2026 12:51:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Au-GG9YHiX1s
Date: Wed, 01 Apr 2026 18:50:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: soc@kernel.org, "Rob Herring" <robh@kernel.org>,
 "Gregor Herburger" <gregor.herburger@linutronix.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 "Stefan Wahren" <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 "Kevin Hilman" <khilman@kernel.org>, bcm-kernel-feedback-list@broadcom.com
Message-Id: <9b120c3b-637e-47d3-aed8-62b344337344@app.fastmail.com>
In-Reply-To: <e060307f-5c85-468f-8f5d-6101dc0a2015@broadcom.com>
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260323190239.1890505-2-florian.fainelli@broadcom.com>
 <20260401-rapid-lyrebird-of-emphasis-da7b13@quoll>
 <2e47f487-da04-411d-bf78-4c76ac793a91@kernel.org>
 <df52b2ae-4b8b-487a-bb6b-07bf021500b5@app.fastmail.com>
 <3f7879d0-9e5d-4c00-a5dc-4871a049afd0@kernel.org>
 <83a52edc-1d46-4eaf-996e-924ed3a00c83@app.fastmail.com>
 <8d8925ad-22eb-4b9b-b6eb-6ae7dc3b2073@kernel.org>
 <e060307f-5c85-468f-8f5d-6101dc0a2015@broadcom.com>
Subject: Re: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 1, 2026, at 18:41, Florian Fainelli wrote:
> On 4/1/26 09:38, Krzysztof Kozlowski wrote:
>> On 01/04/2026 18:33, Arnd Bergmann wrote:
>>> On Wed, Apr 1, 2026, at 16:47, Krzysztof Kozlowski wrote:
>>>
>>> Florian, I don't know if there is a Broadcom specific policy that
>>> requires you to use the corporate github account, but if you
>>> are setting up a new key already, it may be a good time to
>>> also move the hosting.
>
> OK, I will get going with moving the hosting to kernel.org. What about 
> this specific pull request, will it go through or is relocating the 
> hosting mandatory for it to be accepted?

I've merged both now, should push them out later tonight.

     Arnd
