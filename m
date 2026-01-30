Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB20D18A6D4
	for <soc@lists.linux.dev>; Fri, 30 Jan 2026 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769763555; cv=none; b=bSaKekVAS0D9gQiprGdq5YNU/J8mcBAB1nH1BCD7cNT0vMuwBJElPe4XCF18pcmO0rHNemea2NX6OlHrSySuJC0JLlgaN25vssfY57ZValywEXL1eXfSWzpQLev6nCm+ulLJDTTIyEIfsmQJ88/CYX2rApazR9AW4esD0FwT4g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769763555; c=relaxed/simple;
	bh=YIziIJrmvVBI+4xCk5aHis/kl3CE4kD2n9g29sIzl3U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=g6YCIRVmPdeKyBPPP6wvkw6yd2zI6wserx3WBpCfxnCMT5NYBNV+XEPUuIexbmwEv9Zl+iWxPRn/2i0AmpfHRyHhDGOnEPrsNJH1bod1WXCON7RW4gWa0D8Hm0MUXkgyXtPqWgy70S07D/55hmNbKOttL8lcrV/LEJqr3kwHAME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=jZjo46jc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gKU7xZgj; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="jZjo46jc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gKU7xZgj"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 80CEE7A006B;
	Fri, 30 Jan 2026 03:59:12 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 30 Jan 2026 03:59:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769763552;
	 x=1769849952; bh=MqHUmsGNQXV2y+7VYbmSgRiDDTAtnxMDFNlT3hVXtrU=; b=
	jZjo46jcnTpbePFHbFu9O5ZWMiOpCPyg4Dt0C0lIX+n4E3F34jO/tpwC2I+vBJMT
	PtDSNgM5F4VZVxtVo+3zEyODf561zh7CeJT/JVYoSJHWaNLq7l+jlyWgJJxZ/vv8
	OS5kAoEWTgkHyA5qM7/PQAIxQIPl66FQHpbG4+j/N/+aSfrrxcl/4cORi8UJJRY9
	DfwFouAzWfTiJk+0m6rWODS+gm4joSC+CPi3IINh7dsEGF7DhS6E1mLs/6ARtw+q
	bczJSlH926SMorufjd4+G/6STcPPTyL5j7uZDmbGKmDVM/zxUUonpZDwezxoxV5A
	iNnRyBsWQsv/I8QWTPQYqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769763552; x=
	1769849952; bh=MqHUmsGNQXV2y+7VYbmSgRiDDTAtnxMDFNlT3hVXtrU=; b=g
	KU7xZgjj+pnxO/r4+lQ3cUyhgajlhtSjoLsfWtIk+9HrUNX/1tHb0U0kWR+/89lG
	HDQJyFBurjt8Klp1STao7NRKtUoB8SSryAnjS7G5A+SaF5L61KlIYc4tsgSTa0DO
	2b2ntm1UUUVozvzIsG8D/fmZOcz0mW5OWS23WZ9MdMBPUwPKsebJIbLWHfB06Zjh
	BHZo6NmK/eWViNcAGjikHqjR15HRbcXkQTXa+FirjB/O8pqwuH5BDyL4Z4vp82+z
	vFY3J+Mh9XcKeAEU+7Wh56Zr8B3UxSWTUar4S31C409W+cKqmFOLeUrXocemlmN5
	DV4q9MoXqENCbTgntpciQ==
X-ME-Sender: <xms:33J8aZO-RPnGK-D2uE6MZK_4XqnDcs-71gKQiqFZrRcZBsiBbZ4Ayw>
    <xme:33J8aWwKkOrsIftQHUpqzLexi5sp0ly6c5dKcDgjCH60VmpFhrUOMicR5wXBr-zLw
    Uo-w9wunPnECYzok5zRF937hzgn-gbhXrsWvTu7Lqw6-ByyhVc4W14>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieekiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepshhtvghfrghnughovghsihhnghgvrhesghhmrghilhdrtghomhdprh
    gtphhtthhopehjuhhnrdhnihgvsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhn
    uhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprh
    gtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:33J8abWljcjP3SmeN7kCTLoXQ9MiSBqtM5nPXuMRV-fqUKB73M-wDg>
    <xmx:33J8afB5oq4LMgxCmgT6-q3Sp33bRXXWggCZkOBL3BTc6u1osrJX1Q>
    <xmx:33J8aa6e5mU9sjcOE_CiU91lzuJDX1vhuwEwlfP3h_RyeaAeG16DUw>
    <xmx:33J8aazKVt2A-MdH-rFvyZ4v5vnTHQc48eMH_OnfjOq-O30fZdSV-Q>
    <xmx:4HJ8aeyE9p6sspAJNWhC3hsvLfUv1cmaYxESF9qo9-y1zBC8AG1lpyok>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 894F4700065; Fri, 30 Jan 2026 03:59:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Agif6myIRndF
Date: Fri, 30 Jan 2026 09:58:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev, "Jun Nie" <jun.nie@linaro.org>
Message-Id: <9325c1b8-40f8-4403-8098-b924124e3868@app.fastmail.com>
In-Reply-To: <2936803.ElGaqSPkdT@grey>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
 <b94d1ea2-8092-4692-a5ec-02d83ae1c1a2@app.fastmail.com>
 <2936803.ElGaqSPkdT@grey>
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026, at 20:38, Stefan D=C3=B6singer wrote:
> Am Donnerstag, 29. Januar 2026, 01:00:08 Ostafrikanische Zeit schrieb =
Arnd=20
> Bergmann:
>> On Wed, Jan 28, 2026, at 21:34, Stefan D=C3=B6singer wrote:
>
> I am certain switching to EL3 is working here because I am using it in=
 the=20
> same way to set up ICC_SRE_EL*. (And yes, I know this code doesn't bel=
ong in=20
> this place. It's just more comfortable for my development tree for now)

Ok

>> I've never seen a Cortex-A53 without FPU and NEON, but since this
>> is optional, it was a matter of time before we got one ;-)
>
> The ZTE 3.4 kernel code suggests that there is/was a zx297520v2 that w=
as=20
> Cortex A9 based, and then ZTE replaced the Cortex-A9 with a Cortex-A53=
 and=20
> left the rest of the system unchanged.
>
> A later version of this SoC, zx298501 switched to 64 bit, including ke=
rnel +=20
> userland. But I don't have any hardware based on either of them.

Right, it's quite possible that v3 was a node shrink and Cortex-A9
was not available for the new process.

>> Support for 64-bit cores is actually quite rudimentary in 32-bit
>> more, as we are missing a lot of the errata workarounds and ARMv8
>> specific features in the kernel. If you can figure out how to
>> use 64-bit kernel mode, that would be ideal.
>
> One of my co-hackers is giving it another try. Pairing a 64 bit kernel=
 with 32=20
> bit userspace seems reasonable. Of course the other question is what q=
uirks=20
> are hiding in the hardware when we run them in a mode the vendor never=
 tested.

Right, that is clearly a risk. I see that we do support FPU-less
systems, e.g. 82e0191a1aa1 ("arm64: Support systems without
FP/ASIMD"), but I doubt that this code path is well tested.

For the core itself, I would expect fewer problems with 64-bit
kernels than 32-bit ones, but the problems are going to be different
of course.

For 32-bit compat userspace, there is a chance that you have
device drivers missing compat ioctl handlers, especially if you
need non-upstream drivers. There are also a few differences in
handling of deprecated instructions like ARMv6 style barriers
or unaligned ldm/stm data accesses, which require you to enable
the workarounds at boot time on 64-bit kernels.

     Arnd
