Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6987D1C1F13
	for <soc@lists.linux.dev>; Sat, 10 May 2025 20:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746908359; cv=none; b=FqhnHPjLgO/985hMGtkJWc8YlS3AnN1yn/lmVeCWds3/hlcVTgasjVDHXJfPItGv2sI+vSuyEuuDEfOBQmCTLI626Kt6udK3BFu0VCyDwaCE+TP1YwwprY3XwVW7ngPzx0MZIZhsI5FX7pADXBLmn7jTRGZ+YntqCjOWenEHkEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746908359; c=relaxed/simple;
	bh=y7mnAbRPruqWS5VuDDQTyrIYvsqL3H8uRFdPkPiYEno=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=m2yAUUvnASQSjP9IM3tusYahi0JD/XDzyDfZTNDGH62FYbz6gp9dVAoAWb41zxQycu2Y3DM9LospWCiOzgwNtIkDGMpyi5G6LpUTPtqVKcnbdwRT+6/ZM1HFT7Pe5FgHslielYA9xKmnkAsaZvvJ09k/HDfbRQPHh9XXtrYJB4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=W1roBAZH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KSH/bjor; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="W1roBAZH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KSH/bjor"
Received: by smtp.kernel.org (Postfix)
	id D9C4FC4CEF0; Sat, 10 May 2025 20:19:18 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F425C4CEE2;
	Sat, 10 May 2025 20:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F425C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id ECAAE1140080;
	Sat, 10 May 2025 16:19:14 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Sat, 10 May 2025 16:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746908354;
	 x=1746994754; bh=uMTY9qFogQa0Mq320HhUniBejxmAeYawCBgAAg59X50=; b=
	W1roBAZHchvU7brkv5sM+bEPS6+gPBxpN9gdQRR3tsG+7vbQDJ7sw+IsjKONi9Ea
	p2+m8URLPJxGPTz8V5ODbG65PFYHpk9OXKz6ZsKcfAGYcfEYQWN9RgqQH4hfigFN
	+gfMQRVA85DY/vc03Vf92KVAslm+wH1qX3IWJ//Soql3A3Z2ZW581gR/cql0Umqa
	K/yX7gYK3h5ESrbzyohgP2rC8xF8+vcxj0CTpIWOjXe6Rp5x4kHNhjOdys2cNXCP
	IeMOz5TZBFOv1yLWC9Ud0vZI/GWHxmN4wFCZoJ8Vbi/U6ilI45uIlyc4vu0rEjZe
	PikbmnQ1GSFSzhJ8DTx4Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746908354; x=
	1746994754; bh=uMTY9qFogQa0Mq320HhUniBejxmAeYawCBgAAg59X50=; b=K
	SH/bjorPMgfh4SJiCT2jhxZ89WsG0wowhuT3ljJKMy4M30LEDPQaAU/W6I47T16K
	RdA7wd88tpcVJMk3v+eOO93VNew4UtFc6mQbIb3QHXaJ/9rBZz77MHBiW63sjtWA
	8Qa4PDpiUU/jgHYW7QnqNb1Nbwo2z6fvd1nrWrxBDq5qOyfEgIStSTmr+/3pbLww
	e46aRDzdYq3NU1+YOg26BDADq785/fWHTEMYGKf/u+d8MsNYgpIJrzaXHh+gTyps
	3xlYfy1KUmwjXFEWaIEHDZCxmjVQymLG4Kv59kGP18O+/lmd1l0aevRblu35taCY
	wh4tUqYym5ncdszs1reLw==
X-ME-Sender: <xms:wrQfaI5-GTxu5-SAYyEQ2M-xFj3rYxxFjMWdoGh90jGnI6RhXsyGpA>
    <xme:wrQfaJ6SbJVb6Xret8fhE70NUWTQJZzvOgXnV4HtyhtXLj2ty8AGaUaCSWScuvnVu
    0H0FRUNSpuUjSM1RiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeigeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeej
    feekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguihhnghhuhigv
    nheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:wrQfaHe5_E_y10KKiRmwHJuBabKD2gu8Xp85cPArkxajpCWSGiuHIg>
    <xmx:wrQfaNJN0437e2noiJoV9lDzMFQeLmVlDCYyyKYDh5vTXXugiZn3zw>
    <xmx:wrQfaMKSvlDq5RY9pUROEQDT7xMKeH-gAETfOufv13J9RW3-f0a4Qw>
    <xmx:wrQfaOxkvaCKoj54Ft0LhQUvWgRezYwnCBpTmkj7gDeiESCHI12XKA>
    <xmx:wrQfaMskA1r8DApt5puWdB5-BIdb_mfBiGK5ZdJHOFRIR2O6LWR-ycKX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 52FD41C20067; Sat, 10 May 2025 16:19:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 10 May 2025 22:18:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dinh Nguyen" <dinguyen@kernel.org>, arm <arm@kernel.org>, soc@kernel.org
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Message-Id: <b8257b35-04b7-400b-bc58-948dd5fdf799@app.fastmail.com>
In-Reply-To: <20250506004825.134929-1-dinguyen@kernel.org>
References: <20250506004825.134929-1-dinguyen@kernel.org>
Subject: Re: [GIT PULL] ARM: socfpga: updates for v6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, May 6, 2025, at 02:48, Dinh Nguyen wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
>
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git 
> tags/socfpga_dts_updates_for_v6.16
>
> for you to fetch changes up to 8dbffe5f5dd531a3c3f9d603462e499085449277:
>
>   dt-bindings: clock: socfpga: convert to yaml (2025-05-03 13:33:23 -0500)
>
> ----------------------------------------------------------------
> SoCFPGA DTS updates for v6.16
> - Updates to dt-bindings
> 	- Document Agilex5 NAND daughter board
> 	- Convert Stratix10 FPGA Manager to json-schema
> 	- Convert Stratix10 Service Layer to json-schema
> 	- Add document for Terasic's DE10-nano board
> - Add support for Agilex5 NAND daughter board
> - Add basic support for Terasic's DE10-nano board

Hi Dinh,

I'm not sure exactly what happened, but I see that this is
almost the same as the previous pull request that you had sent
for 6.15 in late march.

I had already pulled in the previous version, and if I pull
this one now it would result in duplicate commits. Would
it work for you if I just cherry-pick the "dt-bindings:
clock: socfpga: convert to yaml" patch on top, to avoid
rebasing everything else?

Note: the list address has changed again, so please send
future pull requests to soc@lists.linux.dev, cc:linux-arm-kernel.
The arm@kernel.org and soc@kernel.org aliases still work
for the moment, but the real address is the @lists.linux.dev
one.

     Arnd
