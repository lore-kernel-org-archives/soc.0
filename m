Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A177D3264CB
	for <soc@lists.linux.dev>; Thu,  5 Mar 2026 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772717190; cv=none; b=SQVkPyF25eKYuXCaO04iS6Csehch3QMTb+cHX3rbkC0qRmsxw07pA3yBP4Y7QeiH6NOwqRhA0PxQ77zG55D9AJwNtbeBKETjmtpKOYN4m87FWfqlbv7DBhwuYSt4mwUtVL3ZNlmayIrxsE0mFdoQWSvU0E/1/t22MfbywtrTqvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772717190; c=relaxed/simple;
	bh=30AjMuR4/+j5+hXlsjLpuVmKb1uH8ow2npoh0OFD+bY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pJu9dsJuwfpvs52QUnCIe1HMWUb8j3UYnEXV9T0kBI2JSW/Vkaijbaod343qYrOqZmkov/lvXS/hVhkiykJHWfWD87ChDMI2LmOXKmnhbwi6OV4xXhNOf1MdtwT9A6rMM9z4PijvoodIChE0V/gJfotYvI7uvytAJniBHxPfM28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=PDUcRcjY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DmLjiiKi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="PDUcRcjY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DmLjiiKi"
Received: by smtp.kernel.org (Postfix)
	id 46547C19423; Thu,  5 Mar 2026 13:26:30 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0809FC116C6;
	Thu,  5 Mar 2026 13:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0809FC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 1B790EC0592;
	Thu,  5 Mar 2026 08:26:27 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 05 Mar 2026 08:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772717187;
	 x=1772803587; bh=s2HoU5gYG3iEDH/ODUYOKG32ATI9XP9B3HnmAGJenf0=; b=
	PDUcRcjYXR93wC8/uQeCk1KB8exCL89IoOlAQH+kEJriPV78CmUdJTspLFcKHxoc
	6SpG8vrlNF7BuYo1CF8+5QvDgGRIMt5QJzZ+bhybdpSQGzdzc89EgniRSf+LYAWv
	hxKQdhIDCxjY2xUrmlDbT9gQQIlG7Zzmxt19J8m4ExVeYEIG0lMLM8MS13tsfF3l
	9PhaupHOUKIpCHQ4cugBAyeciQXGrtm4xVvmLUoqSimyE3nGcthrjbhBbnPxLEEh
	NBw5r9NwcZ/rFXlXbcK4Pb9NiUx7QI+tZid+qwBPMoqnS2rSTCkMlkXcfW3MuGhG
	NGO5YK6edWqfL4bhuwNmMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772717187; x=
	1772803587; bh=s2HoU5gYG3iEDH/ODUYOKG32ATI9XP9B3HnmAGJenf0=; b=D
	mLjiiKiFvr4EdJ9XWHoDkOr7iwYnGNZJ55TXmn456qLZ6aUv+69tz8AZ/rJ+jxZs
	gAXtdp/g/NRQegs76sJSl6GoJL3a0v9HhYU5daRA6QWG4oKN9fczLhRko2hXSbwI
	gsokhBlc2lEyopW17EPQeSydY+S5la6hhCYxRvro0vOvK84AIrJfswTeUECkK/ty
	3MRbYq7buLHuddMzLmPfYZOH4Q3+EvkwJWQtFeSKsgLPnBDtk6T0AZyyf/5OnZTd
	pnOjcAgCrLdipcbYqZxqTXXfZAcwLsTyw61ax0VdLOVm+PuzE+SkqqIG9Z5vU8aL
	b9RkEmuxSxv5gBK7Waong==
X-ME-Sender: <xms:goSpaR_0YarC5ff8sEoHT2AsLZESe-nT5h9Bt7qy68_w_Yu-_0Vj6A>
    <xme:goSpaQifK1cuxRkPneFCIog8w8cUuu7EipBud1Jli0GAg4B0gY6nt4c_AXGZVayq1
    JmT4Q-RX3QtSwqfE21mwyghsjAH1oVvYXvdkWhvCQd2PhCe_Fpvatg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeihedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepjhhonhgrthhhrghnrdgtrghmvghrohhnsehhuhgrfigvihdrtghomh
    dprhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhhsfieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggr
    ugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:goSpaXf9_YyBQjiyxvl-WyL6wctH298uyLTRW86Nl2tTKDkdT0gu8A>
    <xmx:goSpaYL0waQAEajZCvC2pVV8xuInMEVNjerQ5yNZNpTzfHZxaYLa3Q>
    <xmx:goSpafhdIprAGdTXzGXXUsEy7zAKQW4_F3oOg98aMpPJD0EQB7G35Q>
    <xmx:goSpaeTWfDCX9rfRognCCjoIzTxUQnJp3m-FEnwmO0xL4Cr22Z51Hw>
    <xmx:g4SpaZ-r-vXBSWOvWoec3FvAt-UG0uomBSnGHnpA4BOF25VRtoVZMpNI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7BFCD700065; Thu,  5 Mar 2026 08:26:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AkBvdCgULreF
Date: Thu, 05 Mar 2026 14:26:03 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linusw@kernel.org>, "Conor Dooley" <conor@kernel.org>
Cc: soc@kernel.org, "Jonathan Cameron" <jonathan.cameron@huawei.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <e6297b8b-17c9-47a0-a481-ca064313f6b0@app.fastmail.com>
In-Reply-To: 
 <CAD++jLnsT7B5FO1ThYS+NgdZh5E=ALnE-V3k-TiGw3JEYv8dwg@mail.gmail.com>
References: <20260213-stole-economist-d5b0ac711d42@spud>
 <CAD++jLkDHh_WozDAot4c=1kYwy24sjH9-5_i8-Vmi6oXLp9wUw@mail.gmail.com>
 <20260303-crazy-shrink-ef2c085c99c4@spud>
 <CAD++jLnsT7B5FO1ThYS+NgdZh5E=ALnE-V3k-TiGw3JEYv8dwg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V soc fixes for v7.0-rc1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026, at 10:51, Linus Walleij wrote:
> On Tue, Mar 3, 2026 at 10:41=E2=80=AFAM Conor Dooley <conor@kernel.org=
> wrote:
>
>> There's no dependency of course, I'll split it out.
>> Ordinarily I would always split them, but I'd swear I was told at one
>> point that since fixes were on one branch in the soc tree that it was
>> okay for me to do the same. In this case I did it on one branch to be
>> less work to get onto a potential fixes PR that went out before -rc1.
>
> You might be right about that, I'm learning myself.
>
> Perhaps you know more about this process than me,
> despite me being one of the SoC maintainers now :P
>
> Let's see what the others say.

The pull requests for -next have to be split because they go
to torvalds as separate branches, but for bug fixes, I never
made this a rule so far.

I just merged Conor's PR before I saw this thread, and decided
not to undo the merge because it's fine for the current way we
send the upstream PRs.

We could consider changing the process though and having two
separate fixes branches for DT and non-DT changes, as I tend
to have to write two descriptions for one tag anyway, and
it would be more natural to send the fixes separately.

There are already some maintainers that send split fixes PRs
anyway, but we'd have to make sure to communicate it to everyone
before we make it a general requirement.

      Arnd
