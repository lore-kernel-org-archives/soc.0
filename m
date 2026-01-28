Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF891340D93
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637633; cv=none; b=KzGM04QxAOdxALUbflBDUffqJjtr2C6MmGDFYbHx015v7GPRFE8o6LIL56gHTRlS4gw92NK1TaHPVtfHEylDMFI5e4KD73fw1ML7jO3Ua+/01Z/ou/AkH8RsDW5r3fNC+ntA8cmSo1YgVe7OUA7vmBt59nYy0hZdGOWcmm2qhaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637633; c=relaxed/simple;
	bh=pIj+EWzyhldjn+daNqIvZAclo7JfcM94QM+h5dpb8mU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hEi32XqzJwX3SoZHJACyOtXWPzC4/Jsbf2gfr/qFZNS2qDVA/hVaIZKyhSjMQYh6SSHj0u2W2mLBlt2u4ANh0ynuaueEer+g+zmrFdPXert1TRbLsKDZRVtjY+rLRC1URxZSaniVu8xviwIobrwpyRKDYtWvy9GWVvUmnVIGMsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Vuk4lMUI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fhVua3WH; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Vuk4lMUI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fhVua3WH"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id A91E1EC0252;
	Wed, 28 Jan 2026 17:00:30 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 28 Jan 2026 17:00:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769637630;
	 x=1769724030; bh=8UhMJ0xKlVz0a7BlwVvXrSz12Jbk/HvXb373WDUkSrk=; b=
	Vuk4lMUI/POEfPTmp4MR1IIIYQBhzcqzMh9y5+BnGlhCvJFPXWzrkHQ5bdujuXDm
	jHgUtAyMTaHooRq2HGC7YCTx/EmmzRQYrmycXK9MBwCMVEe2LB31Ib2QGbQVrpTw
	BtxZKPfOibN1NamuYxNwgPLxkAJz9jBjWpq7UBHrAyshC5NTrAfvheUEpaNjoe6P
	XycK4i/PukF2x0of5+jaMSV8DdhaB38Pelh+8tLmgFCQqqibYmimdYkWV7dBJSzT
	tmUBDToIuiJJG9qA3OPbDBgCUKQHg1ts9UH5dAAb0YGHnjJoxMSArgI8pfT98CBE
	/K/ZFM2LyFBdtEVQ0UB48g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769637630; x=
	1769724030; bh=8UhMJ0xKlVz0a7BlwVvXrSz12Jbk/HvXb373WDUkSrk=; b=f
	hVua3WHPhdsh3aMCBqX9LLqRRd7d3viH+PTG3UX2Gd5aOSQpndV/SxosXo0SGv+H
	kjkMx6necYMkdfgHjQOF9KzvSZjF1WxgN9U95ilY/ltIt0GkFT2YKdM7MrRV49r/
	04aS60dOkICimuhBDkNpCQwlT3zIynqIVRaawLTS2+inKmporTAKFItD/ORT7AAF
	xJxz05djsCORKC/u746Vo6uSu3IEkW8Z2bPbjmzHa7T0URPHAfX6p+AonG4mBNeI
	HR5qEMoClxTrsHfDt4hIl/2rR6AXpaGe9x80lEQxqDu7/5kzxMzwpv/HEfbzI9QO
	k1riSIfUx2owlfvs45hnA==
X-ME-Sender: <xms:_oZ6aeN8iyQ08vjMn-WXPkwn723Yt42qlbJRET1cL2--KfGpAKCeOQ>
    <xme:_oZ6aXzyarjlvqp4IX7b9fQXU3cZpwfbhduTIv6CODvLN63QrC08MaoNV9aJy1lYa
    sKAxmo0IxKlinYXalfadPNYm9LbaS47FqlWx1KIdVZjx8xSuCxxTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieeggeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepshhtvghfrghnughovghsihhnghgvrhesghhmrghilhdrtghomhdprh
    gtphhtthhopehfuhhsthhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjuhhn
    rdhnihgvsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvih
    hjsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgv
    lheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohgtsehlih
    hsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:_oZ6aVsoozEV9idojAcMgMaWMqYMd07QwrFNb8G0nB4kZfofh4WYMQ>
    <xmx:_oZ6aZYPzmXImuJykVzwFvyjIZywyFFcAfgeR-DmSplrGljgdC-fdw>
    <xmx:_oZ6aXzdDftPZMYIW8otmVJTxyy_mk1QFhkvJmFkT9POOdsJX8Y2dQ>
    <xmx:_oZ6aRi6Ag_4TxVrDdMlZL_ZeY05eq8MelD7AAoryyu8gDgx8rUFQg>
    <xmx:_oZ6aeHMo5CMFzds1JEGWqNithUYp26cjJf5IWPK4IjrwKQ-kP1aE0-D>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5D2AA700065; Wed, 28 Jan 2026 17:00:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Agif6myIRndF
Date: Wed, 28 Jan 2026 23:00:08 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev, "Linus Walleij" <linus.walleij@linaro.org>,
 "Jun Nie" <jun.nie@linaro.org>, "Drew Fustini" <fustini@kernel.org>
Message-Id: <b94d1ea2-8092-4692-a5ec-02d83ae1c1a2@app.fastmail.com>
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026, at 21:34, Stefan D=C3=B6singer wrote:

> 4) The CPU is a Cortex A53 running in arm32 mode (in the shipped firmw=
are=20
> too). It doesn't appear to have an FPU. Reading FPSID results in an=20
> exception (so vfpmodule.c/vfp_init says VFP is not available). I tried=20
> enabling p10 and p11 in NSACR, but without success. NSACR seems to alw=
ays=20
> read 0 too. Is this really a Cortex A53 without FPU or did I miss=20
> something?

I've never seen a Cortex-A53 without FPU and NEON, but since this
is optional, it was a matter of time before we got one ;-)

I assume that you were in EL3 when you tried to write to NSACR?
From EL2/EL1 it would still appear the same as not-implemented
even if it is there but disabled in EL3.

> 5) Relatedly, are there any advantages to running in arm64 mode? The=20
> devices are relatively memory constrained (64mb), so the larger binary=20
> size from 64 bit pointers is probably a negative, while the larger=20
> register set might be a positive. I doubt switching to arm64 mode is=20
> possible at all, but I'm nevertheless curious.

Support for 64-bit cores is actually quite rudimentary in 32-bit
more, as we are missing a lot of the errata workarounds and ARMv8
specific features in the kernel. If you can figure out how to
use 64-bit kernel mode, that would be ideal. There is a
noticeably higher memory usage even with 32-bit userspace though,
so you'd lose several megabytes of memory as you said, and 64-bit
userspace would be impossible since the aarch64 toolchain only
supports hardfloat.

You would also have to deal with a practical problem in OpenWRT,
which as far as I know does not support building kernel
and userland with different toolchains.

> 6) The old removed zx29 code used "zte," as the vendor for the=20
> compatibles. Sanechips is a subsidiary of ZTE that designed these chip=
s.=20
> Are there any preferences for either "zte," or "sanechips,"?

I would stay with the previously used one

      Arnd
