Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FA316A92E
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 16:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736957626; cv=none; b=TB4gRwoe543PPBddhpz0qjofBydLZ7R+jvzJoEpKG8O/oY7dxMrgTXDWRLHwn4tv7I9mDVeQDtzJgIxYq8MgShrfvikg2zIZ8qfk+aQT56cayXlc5l6G/BJ6BEWLnCekmqiUwGG8Wm8vSz9uLmXuvgTd7coG7KNC8+iKJZefBRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736957626; c=relaxed/simple;
	bh=/HX1pKnHo4l3ueb55wf8odbF32bOWtqZiFigHYtN6QQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hE4Mb+vDRpEkXLv+/jDyqZp5rCTXR5eZVR/bhPlS6kaB42CDN5RvIg9Hb7pF/LPBBXbjT1QH+ZM1hRWlRPS+OIt80b2WmS2G+5daGeHAnvy1iaSWXmUHwZn64sL9MCeRaIt1PjXTjvUwil0SGrxtZ9kPzwFiUllBVszgwcz07jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ittFJ5JZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MmqhH0YA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ittFJ5JZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MmqhH0YA"
Received: by smtp.kernel.org (Postfix)
	id 88E35C4CED1; Wed, 15 Jan 2025 16:13:45 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CFE8C4CEDF
	for <soc@kernel.org>; Wed, 15 Jan 2025 16:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8CFE8C4CEDF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6C3B525400DC;
	Wed, 15 Jan 2025 11:13:42 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 15 Jan 2025 11:13:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1736957622;
	 x=1737044022; bh=dkuohqVG+IvJc3quNTj2+aGrwlRPRoHWzyB5G/pyZzE=; b=
	ittFJ5JZET32icpjQvUOHKu1zt061kyx8AkR4Xy8nLPA6dH3kId6BIJBsyKc28ha
	gaVubIlTWIg8+A4WeBxR6+kMitEQz1fU3z/1RLpzN3sIPmWseYyPOPxvkIeEItub
	gq9OO0fAhQvz0OsMkvYxRgXtgRVCailygsdYy1UpASyXI6C/DVTmCzhvs0XLzDph
	+EKelDhcMoOAoJcIN0M+nuVvePM2NtIBDJ3GDb4dEa/LkQdo2oC1Ft7v9k1CVvyV
	Cy6LjxRctYoetZtzUx6QijR39+4A6Ua8w30oKXagBXJJ/7x/+ggRwfUezc7E5719
	1LYm2alYlgGGzyNdDLWgqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736957622; x=
	1737044022; bh=dkuohqVG+IvJc3quNTj2+aGrwlRPRoHWzyB5G/pyZzE=; b=M
	mqhH0YAct+mQhrEbpmY8vpzv7DcHLcHhisCUEIhTwY0EWX3f4sec/TA7knIS51Wp
	+PXkyiNBrK4xoGd4W9z/e/DVClRUbI3h+xCi72/cY5q/2tNc3mEy5VHN6blIol/8
	o6XUdJ46PffJjam/n8lg62CNDJTABvpayIZ5XHMnDgzGJoOfcGlEvmavZTqaaLkh
	wky23sGSueOKMxEvY+KUGTMjeWjZBc9ux1x6pA5mNmDHgTrJWmvT2+3VPizAvxBi
	lFEprD3yDnScIoHc/0hXac9+6VCVGlKNelHu68ithaJ6h0WpPrHC6uBPyFHSCLug
	6v4yMzhSws5VZGZoTR+Ug==
X-ME-Sender: <xms:tt6HZ8eA7pGASXWm0mFlJk1IliEcZT0FcovugJ1mX8Wwd6qKQplWQg>
    <xme:tt6HZ-O6qfvDWQ6Fs0iVFQv_DoHeAtOw4wfNunBgKn1lWazz_5FtCvUnQ5kkZGghk
    bJhhe_q5zBnz7f5XpE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsrhhunhgvthessggrhihlihgsrh
    gvrdgtohhmpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphht
    thhopehprdiirggsvghlsehpvghnghhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:tt6HZ9jc0L_IFxp5ExAnEd34lrX0CKuyw7GybZQXJ_dvELb0rrg0pA>
    <xmx:tt6HZx-EW34_rcrPVwEaE8bkLv_hV2ckN9xwNVq9h4l-6oup4hzwww>
    <xmx:tt6HZ4vfgvBUsk7ocybqJISTig-aM4-GOMhSvtgiRr9bdZkjxkgOrg>
    <xmx:tt6HZ4GsmhsqhzTaEhOtvJU4qKd_eyzqX9O5VoesiGjdOAWe1yFiCg>
    <xmx:tt6HZ6I0rNHc_hWOMNnvRWafG6Sw4ExGcnYJOxeqXHbbApBKh8oZ8JI8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E11272220072; Wed, 15 Jan 2025 11:13:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 15 Jan 2025 17:13:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Philipp Zabel" <p.zabel@pengutronix.de>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Jerome Brunet" <jbrunet@baylibre.com>
Message-Id: <d0e58f29-4e12-445f-b110-49dfbacf5b74@app.fastmail.com>
In-Reply-To: <20250113163648.1757178-1-p.zabel@pengutronix.de>
References: <20250113163648.1757178-1-p.zabel@pengutronix.de>
Subject: Re: [GIT PULL] Reset controller updates for v6.14
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jan 13, 2025, at 17:36, Philipp Zabel wrote:
> Dear arm-soc maintainers,
>
> The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:
>
>   Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)
>
> are available in the Git repository at:

Hi Philipp,

I have no objections to the contents, but it would be good to
avoid the back-merge of rc3 into my current branch that
is based on -rc2.

I see that the two patches for the reset driver depend on
commit 5ae1a43486fb ("clk: amlogic: axg-audio: revert reset
implementation"), which went into rc3, and this was clearly
the reason for using that as the base.

Would it be possible to rebase your branch directly on that
5ae1a43486fb commit from upstream?

      Arnd
