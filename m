Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112FE25771
	for <soc@lists.linux.dev>; Thu, 29 Jan 2026 09:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769678580; cv=none; b=ME8IKa60VUl7npWJQNwy6b6oXAr6pdZoIkpePUODlRl+J8B1CTxhcIyLBVHdWjcMUMIorMmYOt4eaToyGVlcHGTNAyvMoae6KLG01H3+60msP95meGHVvVBrEdtTpQOb2fK4TKfkbt1rKFSqdl0Db30g7eyy/4sqfXEVkbyxHb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769678580; c=relaxed/simple;
	bh=CnxGJDuagXcr/kmDZi8tQakWtwSB8LZtG2aSMsf5WIQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VMpiusUTey22iY9A/X7Bc2zE/APZh0hFCAVAq86eGa3pPgLE3cUONzr1qMdop/8nvEwh51MnQhQRElMAenFWFcKq5cNdHtsnZJfucNEc3++d0tk0+vIKMteDgMs1iqxg/RScHzAblsl9Yu3gbu/xZ5m9ocFccPiXOL0oXw1Ddaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=PBNGEmvy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ep+vFh8/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="PBNGEmvy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ep+vFh8/"
Received: by smtp.kernel.org (Postfix)
	id AB27BC116D0; Thu, 29 Jan 2026 09:22:59 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DDF7DC4CEF7
	for <soc@kernel.org>; Thu, 29 Jan 2026 09:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DDF7DC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C63E17A008F;
	Thu, 29 Jan 2026 04:22:56 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 29 Jan 2026 04:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769678576;
	 x=1769764976; bh=t7Uq01nsUAbxcpsw//fEkbbEWwG3leShOVNkoOyKzzs=; b=
	PBNGEmvyoaTqsz5uf/QdoRkvy3AsIVmy0krtCwSXSOZ3sNS396WMf7I0HyrZaIq5
	exwNGHpy9m+Na+63ca1dNsqST3g7JSS2uT3b4xY/mc1BIzHUxXkGibCDvKn11xTC
	r9rujvvN3K49Y9W1VQb0ECVtCYb1ckol3aoIbAX7cDf996DjITVcmVbFTCLz7iaA
	Vw73i9lKU3KcIznVUmfcDV+5ruR4rrX1KBzHXabctSwFYkYPN6CnQcDv6kix8b9p
	vfhVgiquYiFmdaOCYG8U66y3L+kLuqPSj/vCElbOWwN254zJaGBLUCbhoTT0SZYh
	9eEjiY7k5I/RO3NcljY5cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769678576; x=
	1769764976; bh=t7Uq01nsUAbxcpsw//fEkbbEWwG3leShOVNkoOyKzzs=; b=E
	p+vFh8/eg3GyA0XWQSmZxViO6DTodO5FXT07FMIXMvLsse9jI4gDjpzk7NRl61Xc
	Y9Kya0xNy7NKq0JoGUQ/jsA2TpO6vMUdMI7QOew2dx+lgMxcpVV9afKNUp1/FkZG
	KR3aUxaRcn//PX3M13PfPlCp+SSNu8hn3fVz0Ue84DNnHS1Qsal1mEMSF5jYagK2
	ngIG5EV4XeSe/insMe1mR5e0yEJNn0npllFSzt4kDJQiQxPBw+osY+wqIUPlW7mY
	8HgasAzpsTBMQnIUXn9B9WfbG9tOtjn4yb3ndrW7pMy1vC4ot2SNN/OjHgBuWfEl
	I+SF6IAXx19qdfmWqpvsQ==
X-ME-Sender: <xms:8CZ7adWaISbRV90l7Qk3rxyrgYOlb5_F8i9vZ5M8fV1cmWgkm0567w>
    <xme:8CZ7aYYeVbtE4sw1CvBzAfo9AgxhEdqFk1t1dfnRcvZrpN3oeRq-67U9L8wDbTdlh
    AV-NYUK9Rh2SYFNBIN93MuemPbW0oWBFBNK6WkX3T8h5AseGdVafwU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieehkeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhkedthffgtdffheekhfegvdfgvdeukefftdfhheetieetkeeuueeggeejvdeu
    necuffhomhgrihhnpehpvghnghhuthhrohhnihigrdguvgenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhn
    sggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsohgtse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlhes
    lhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehkvghrnhgvlhesph
    gvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepphdriigrsggvlhesphgvnhhguhht
    rhhonhhigidruggv
X-ME-Proxy: <xmx:8CZ7aa_DbcMW_qaPYSiGHoF0s0cR7aizWhid7LWg7zvFoyIlVX7LXw>
    <xmx:8CZ7aYiZ_9MPkbKVEAOqO85OtPT3lhU4zUdiJAR1g2q0gXFB9rOYuQ>
    <xmx:8CZ7aafEZQ4BmBkpM9pQqItLc17ci-rbvMthffq4oEZdLxHUwvvtEQ>
    <xmx:8CZ7afoSjfqcAxJwPeNh-TdpMbfCgIZ1oO8e7DDFCzNS8HhPmNsybw>
    <xmx:8CZ7adinhH8BxTR_4F_nwZAdgTHauLlExWHN3pFGAvqh83tZeKtSufpG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 45871700065; Thu, 29 Jan 2026 04:22:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AUiDU-RBgMOg
Date: Thu, 29 Jan 2026 10:22:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Philipp Zabel" <p.zabel@pengutronix.de>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>
Message-Id: <04afe35d-260a-4ff7-a06b-1fb79b553917@app.fastmail.com>
In-Reply-To: <20260127102237.3945322-1-p.zabel@pengutronix.de>
References: <20260127102237.3945322-1-p.zabel@pengutronix.de>
Subject: Re: [GIT PULL] Reset controller updates for v6.20
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jan 27, 2026, at 11:22, Philipp Zabel wrote:
> Dear arm-soc maintainers,
>
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
>
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>
> are available in the Git repository at:
>
>   https://git.pengutronix.de/git/pza/linux.git tags/reset-for-v6.20

Hi Philipp,

The git server appears to be down, can you figure out what's going
on or upload the branch elsewhere?

     Arnd
