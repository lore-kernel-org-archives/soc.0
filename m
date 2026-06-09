Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C13840D563
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 19:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781033366; cv=pass; b=s7WjPLqMxprSIQs7BC96sK6g4zubJMA0oaib4dfSb9yjE/Cz8F6LDNWLNBlrM3BcJygcPCz/GIALYzk4UcAal93t5l7XTWfkwzPPG4BxUjujTHayYV45HVANoGFxIvmravCQQv+vM33l7WWEkgQ9+ipiBxHNbw19/J89FhSIdlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781033366; c=relaxed/simple;
	bh=gzVwc0TsqhTOqWdVHGtzvO2nOqHau54Mzg4uaJKrUa4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Hx941SnbjQOTxs/KuljwNk9IRR0m32/n0ssO1E+9WLa/0sAVjHZ1P9qpLDxmhqUKKNABAvdrDPmTfPzTYv8HHJC+qSFMzgiWETSxkiGj1eUQbkLut2nzX0iTPycD8sGFCy8nzeliMDMqu/Ub6aec/Zv+yfUo+M9c68k7eTkSUsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=i1I3GlDP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=B/0SRSHX; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="i1I3GlDP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B/0SRSHX"
Received: by smtp.kernel.org (Postfix)
	id 410251F00898; Tue,  9 Jun 2026 19:29:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.144
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781033364;
	b=FJ8OCqsDTOauXWWhXb/PrUfjKJ9Yjx9MUrlTx32toUtiezqN0Knl4s98VLcRZn5pTVxO
	 KCawx6tas0BLLmTiudMuOYhYk7+KkM6Up6u63ut3cqT4svFS521iimzcItmm26xmVAxne
	 fu6w840OZBiXxSrXk5/7nho1xIM26jF05KolreGRvP+PjZYbwCe+ft++wwwalGNjQiG6/
	 pPVcwgVvujZ4MpDUHokDad3nQT5B/iirRLo9Uma3A8GL+JOkkSVZMOIcer0zfQQg5NCnJ
	 e4ELMGtHzmja5nHp+8gk9oE0+TTCVS99zTrYj99MIacoz1ACceEOZAOXlgLswi56QuQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781033364;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Cs605zMJrUshlZeCk45mL3y9U03ND7j6Y7qDtI/Ma5w=;
	b=VHJkSe6pULfpUVTC3+p5u7Gb+dgRhM+XmTSCzlbUx5H21H8iLk8X5BNQYnJCl/A54r1W
	 TducgkL67+x6XdCaqWkzEot2Vlho/7+iLexxt5SM2+f8LV95vIKO+kFf39FudBd5ZwVJp
	 k7uKnfYUN055dKXMLEjk4i5VOfsFhzVMvZv+pplL1RjhIzi+4jn/j+Vpbo1iWA48Gw8aX
	 8jXhiI9D9sYDnykIaZSsxdnVjgq2JIl9SE8sxR8fOujVQ4DxlLoQietxlR/Hin6azJ4T9
	 CYPDEoTTzA9q1YH9nMXct6oSwwy1ksMMFFE8GuwoKvN28UiF3viiKpOG5v3/mAcRp4A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=i1I3GlDP;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b="B/0SRSHX";
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=202.12.124.144
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 491761F00893;
	Tue,  9 Jun 2026 19:29:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=i1I3GlDP;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=B/0SRSHX
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 491761F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 33BF11D000EE;
	Tue,  9 Jun 2026 15:29:22 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 09 Jun 2026 15:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781033361;
	 x=1781119761; bh=Cs605zMJrUshlZeCk45mL3y9U03ND7j6Y7qDtI/Ma5w=; b=
	i1I3GlDPwmzPvHxX6edtGc8KzYo4kM7CBQMEVrU/FJozDmpIVGXGi9kLeiu+5vln
	ZHEHLYgYVpy1mH+SlZEcTHs9tTO0bKBcFeJiEqsXVX8gH0/XIK0TNl1j2Zw7GoMw
	85URutU+zE3LtS53XD4T80ve+lKTWh8yk7zTdD5hCHDc59OgDpp1790eYM/LrLzg
	OqeofCRhvGTCMYYogrIJMst/6X/wStDUywsgDI0yjSOH3aP12nitgugONIM8tamw
	aqczuBJYCT7uGW3gJ9xZvy7gqFpGFCcCknPgI9jZ97tgyiwZwO9JNMdI5eBIE2MM
	cBbta3uhow8nsEsfM7hRAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781033361; x=
	1781119761; bh=Cs605zMJrUshlZeCk45mL3y9U03ND7j6Y7qDtI/Ma5w=; b=B
	/0SRSHXxvj12/35zYAqsvk05ioBsQ92qrDiHhM4rTouPyEdkajji8vGjO6YSTuii
	Y7EK+p1Hi6xF2CKkAFDcTzN2Br8G0fudrdszTroP+38oYNSY+zGvM5O/yL7/QBF6
	pzt4POxKjpH5b/K7XuT25WZnWgGVhtbUN0XP1Ph68aN5sQfz3l5serG0e+4ezO2S
	zfbk1P0g8gdthFDJb4JW+ijfjBGlsZtIQLyRmYcYfzpYXO77pET6tpNG6lkFeAlH
	2/wTKitZFkkCaWQ1Z5mJQABEWwKiSezPFT/mdkXKHnn5mfPPXCsTiCtajWtlYxAw
	umZCkYeeeZ0WoHBLeZCzA==
X-ME-Sender: <xms:kWkoasHj73Oy7kuLAMfS0q4d_XtyVn8wRHAbJx0ZaZVoz89sJMAZKQ>
    <xme:kWkoagIzPhNDgLn857M8X-EZ1lWRlc7Zblk6Ykz17bRdHmApeguWnH5SPlj5xCahL
    k0rGOmI19_d5is7Iiogc6Kf2UyxmL0z4AJFhVtHg3spdvLpJ92eqac>
X-ME-Proxy-Cause: dmFkZTEQnMd57GWDMiaatNU5FEJEsKgWZwCtn8j2fFcJFJ0sQpxlDegCEJtcWLDSgbwHQG
    /Y5cejkcIVuQwnKvee89Gp+8fQ4rc5QwmHGx/3pM6Nx+FTk8YIcKXWgf1xeGUnYIvoy1zc
    ZWdS/lPztEi8t1L+/ziMgueMQ1ZsnjZMdgRJiOv8NVcQKq44NO6YJNdVSJL0kd6gbgqdyg
    aGbuJKdlI12qGR+UXqIqxIc6FCop3dhtr8kQnVpjdZovqPDqiR3tCLXjPLmNtEidoXrOZ/
    w2EummCV1XO+Vrc8mUWri+8XTwADJ9jm5plVToDqt5siprQzRBvstnA4MEQaecy7dG/LnJ
    1Ah+le0fZ9WeZvNdryQ3AfWngLfAb+mXkx40KxmGlEX241qdbevq92rye0cCjpPHyao7xx
    XsnZXu2YyVhR4bWALe4q3JLFXZaAtjD4nGZjO6N7y0s4Fx8JcVkm2yzVo3OxUWTx+8KHG3
    YMReSeniRCwH7p+M9vxmxOM8cJXM3fRKATS40L7zmAmo1FzUit91nHp0nCkXw3xWCvoOrf
    YFTAKKDHjpUjW+kSUod4lyjfKx/fi3S9fvjKDNQECzNFoaMyAb7ycx3POGVSJ87KBPNAas
    63fzM53hmdO6ENrLYa5Hs0xdGIga/GPUa6ZBNVQKhhpAJuQg/s7QZev5o00w
X-ME-Proxy: <xmx:kWkoaufGDUojx54sQeC7nJ_G3XFALO3e37KTiB8-teUU92RDzq1EiA>
    <xmx:kWkoao6oNCZw8g8yrcM68Q1FGvMG-PTTomhFGaGEFd2xKtzYHT7pkQ>
    <xmx:kWkoatsseGIeRgPFJBb6PFausiyLTt5lSndJGp07gUzdm7tcZgRYbA>
    <xmx:kWkoagg7qXsgzn_eubJhpqc8Kv9_h8fh63JFiUyolU9zFtg1dqW2EA>
    <xmx:kWkoaiwmA4jlgB0aprFbGFn0U-pauCT5lk4BZY8nCQm53_Wu-MTOexE7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 819FA182007E; Tue,  9 Jun 2026 15:29:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AUV8JOC_Zpjc
Date: Tue, 09 Jun 2026 21:29:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Aleksander Jan Bajkowski" <olek2@wp.pl>,
 "Gregory Clement" <gregory.clement@bootlin.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <956403e3-d47f-498c-9f62-79d39c1cf5db@app.fastmail.com>
In-Reply-To: <4e690104-b42f-4a2b-ac52-5ebfc82f6853@wp.pl>
References: <8733z1c8uj.fsf@BLaptop.bootlin.com>
 <bf8092a3-d037-44ee-8e08-8b2204e5cc95@app.fastmail.com>
 <4e690104-b42f-4a2b-ac52-5ebfc82f6853@wp.pl>
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.2 (#1)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026, at 19:35, Aleksander Jan Bajkowski wrote:
> On 09/06/2026 18:11, Arnd Bergmann wrote:
>> I'm a bit surprised by this oneline change. Since you successfully te=
sted
>> this, I assume the change is correct, but I have two questions that
>> I would like to have an answer for before I pull it.
> By the way, the upstream safexcel driver works correctly only on=20
> coherent
> platforms. On non-coherent platforms (MediaTek), the SHA-384 and SHA-5=
12
> selftests fail. Since the selftests pass on Armada's SoC, I assume I'm=20
> right.

It's not necessarily proof that this is correct, but it is quite likely.

After checking the datasheet some more and finding that this should
indeed be coherent everywhere, I remembered that even the old
32-bit Armada 370 had a coherency manager. At the time, we used a hack
in  arch/arm/mach-mvebu/coherency.c to mark all device nodes as coherent,
since the original DTB did not contain the correct annotations.

I suspect that the Armada 37xx started out with a copy of the
old DT files and also never had the annotation, but then never
had the same hack because arch/arm64 does not have platform
specific code.

> I have a plan to send a patch upstream, which has long been maintained
> downstream in OpenWRT[1]. But I need to think a bit more about how=C2=A0=
to do
> this properly.
> [1]=20
> https://github.com/openwrt/openwrt/blob/main/target/linux/mediatek/pat=
ches-6.18/401-crypto-fix-eip97-cache-incoherent.patch=20

The patch is basically correct, I think you should just change two
details:

- instead of defining your own SYSTEM_CACHELINE_SIZE macro, just use
  the existing CRYPTO_DMA_ALIGN macro that is used in crypto_dma_align

- move the 'state[]' and 'cache[]' arrays to the beginning of
  safexcel_ahash_req so you don't have to manually align them.
 =20
>> - I would expect a missing 'dma-coherent' property to cause data
>>    corruption, as the DMA master may write directly into the L2
>>    cache, which is then invalidated before the CPU accesses it.
>>    Do you have any idea how this one ends up working even when
>>    the property is missing?
> No idea. Don't have access the Armada SoC TRM. Maybe the folks at
> Marvel will be able to explain it.

ok

        Arnd
