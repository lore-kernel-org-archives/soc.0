Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AF51791F4
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736960994; cv=none; b=lf5/TdEmzjN7LgogtdKToC10paN2wOQ0Jh5KivhBGhSbdAbGlTgyg4D+tUj7V2dl22Wgr4LAxsRqyfHR6xlPINQmPYGmvTyBKi0Uk50bcfvFSDxk5rCz3LBYEiCmHQ5rPV+xhf7sp4phcERkBDYffXtMtnedqGhfEneOzpwveWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736960994; c=relaxed/simple;
	bh=Ob04iOdsfbjyBGl9FVfYOpzq1V7W2cw4RztsXVl8iRc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Ci16uKpjfGZh0lXE8tJ8n+8iFTpSHW0L1K/MM5+Wpgnaj47/YGV1+Xk7FSVs6vG06OE59oBZyPLjIVSFkXDLcZsJ7iMb9TqIhd0fUyzHWdO4WvfAoXiDdcvx6CZ55rY9INTBUZ2yp+Q1JPuePvnILEUHsAD9j5dMhx2zLZ8Ig0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=mJ7t0nWV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NHHMmC/e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="mJ7t0nWV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NHHMmC/e"
Received: by smtp.kernel.org (Postfix)
	id 0CDDBC4CEE5; Wed, 15 Jan 2025 17:09:54 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8623CC4CEE0
	for <soc@kernel.org>; Wed, 15 Jan 2025 17:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8623CC4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 7D94D1140159;
	Wed, 15 Jan 2025 12:09:51 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 15 Jan 2025 12:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1736960991;
	 x=1737047391; bh=SLJcNprBNwlNaVjEukVmXIvT0Sm2Ve9ZPO+CpNdmDyo=; b=
	mJ7t0nWVhaCFWns1/EkGnJuX2rfCr3yHkwzkCpq9L41uPoVOj2OmJB19/uR6tXtj
	dCnJSAxYoUJTFMawF/hmpCTS80giXXIrHXUUlllVo/CZ4C9BBnsPzrjRVx+kymUI
	HKJaxF7GIXIjKnHEQuxGcJ3g1HFsvg90D56bcxoza1vPGM5eOVOwhYJsxvGD75J6
	wPsrvWZY293EMrDT/29SPVR+hYq7iPW+ey3qvrSZoS0vyieNg4dxsAC8Ej/9IaLb
	ZIASYhLTa1VRxFRESlUe8+w6QhHzSKl8Izs4sC5SRsYuXCI/3TkjrlkMef1/4+L8
	JOyYIpN4iy/xMIvgk2Rn0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736960991; x=
	1737047391; bh=SLJcNprBNwlNaVjEukVmXIvT0Sm2Ve9ZPO+CpNdmDyo=; b=N
	HHMmC/e9V0GxoGeBz5wIQuilWNZKZ/lSenYHqW9HDfNSAznByXWnG8NFyokIkEwc
	1BdP2lJXbCa20BHkQSGfWxOj4VOP/k924Yn2zfKPf3Nstt6ItSait/Nc3BAtstNs
	xCYEF9GF+FHeG/G9GBaL5Fj3FIPktFVknP8zMOoQKiy9U462LGg+gxvBOC9uwiZB
	yp6pWECUl4OSspFjM1jp38RSMBnbskQynXO/K0I22k/1a2kPehyqArJ2glrzAKJH
	/k+bHqOKTVMsd/+l6rS8pk9qvmotgqyFIDw7JJf9FxmMyFG1JM+UhRP3IRZf+q6+
	2CrfyqcxmetobumCbC0og==
X-ME-Sender: <xms:3uuHZ8ttsdCPSg1kRIVkmTpesvdg9PbfBwLU91xNKHKpM-heu9G9hw>
    <xme:3uuHZ5c9Ss0fSpjmbxFw9J8Hia6ct9fewXdTvxGsDus5WNJeG0wH9GE1bPc217rTx
    r_VQNl4E0zw3Pmwqx0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsrhhunhgvthessggrhihlihgsrh
    gvrdgtohhmpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphht
    thhopehprdiirggsvghlsehpvghnghhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:3uuHZ3w7hszPsPfglGH0Z2rx4LaSyT1VtiZHEJ7mWoE4ftDycaQVbA>
    <xmx:3uuHZ_MnzFE5bLctc32dYFqCGoMY_btPxiCeWHdOfLRZIWKZUcvTgg>
    <xmx:3uuHZ88YGQpXDoIrvr3_bUtHPwtP82kqwsgMdSZp1makq661bY0L8A>
    <xmx:3uuHZ3UmtLpGX7Y8LDsTu7mPvttNRAsIzGixjSWjhHvflx6tJDN3fQ>
    <xmx:3-uHZwaSKDFSTol1QKgx0iGOmC0YvoFSpND-8Fgj97Oxoa5TqyqoIOTG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CA8302220072; Wed, 15 Jan 2025 12:09:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 15 Jan 2025 18:09:29 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Philipp Zabel" <p.zabel@pengutronix.de>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Jerome Brunet" <jbrunet@baylibre.com>
Message-Id: <c5eb7690-85b8-4f44-b8bb-598badf3b729@app.fastmail.com>
In-Reply-To: <d369dbc38c38a7cb5b2ae2af4aeb8470250c9c77.camel@pengutronix.de>
References: <20250113163648.1757178-1-p.zabel@pengutronix.de>
 <d0e58f29-4e12-445f-b110-49dfbacf5b74@app.fastmail.com>
 <d265b2ad8d04c8e37b6fae2a312d0d1c9a3366a9.camel@pengutronix.de>
 <d369dbc38c38a7cb5b2ae2af4aeb8470250c9c77.camel@pengutronix.de>
Subject: Re: [GIT PULL] Reset controller updates for v6.14
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025, at 18:04, Philipp Zabel wrote:
> On Mi, 2025-01-15 at 17:58 +0100, Philipp Zabel wrote:
>> Hi Arnd,
>>=20
>> On Mi, 2025-01-15 at 17:13 +0100, Arnd Bergmann wrote:
>> > On Mon, Jan 13, 2025, at 17:36, Philipp Zabel wrote:
>> > > Dear arm-soc maintainers,
>> > >=20
>> > > The following changes since commit 78d4f34e2115b517bcbfe7ec0d018b=
bbb6f9b0b8:
>> > >=20
>> > >   Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)
>> > >=20
>> > > are available in the Git repository at:
>> >=20
>> > Hi Philipp,
>> >=20
>> > I have no objections to the contents, but it would be good to
>> > avoid the back-merge of rc3 into my current branch that
>> > is based on -rc2.
>> >=20
>> > I see that the two patches for the reset driver depend on
>> > commit 5ae1a43486fb ("clk: amlogic: axg-audio: revert reset
>> > implementation"), which went into rc3, and this was clearly
>> > the reason for using that as the base.
>> >=20
>> > Would it be possible to rebase your branch directly on that
>> > 5ae1a43486fb commit from upstream?
>>=20
>> I've rebased=C2=A0and sent a PR for a new tag reset-fixes-for-v6.13-2.
>
> Sorry, it's late. Same for reset-for-v6.14-2 instead.

Ok, pulled this one now. The fixes branch was already based on
-rc7 and did not need a rebase, so I kept the previous one there.

     Arnd
