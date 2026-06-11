Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B362D8DB5
	for <soc@lists.linux.dev>; Thu, 11 Jun 2026 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184691; cv=pass; b=VtdszfHhQrYSQhxqcBQxUzuM+X7FlsXuiQMli31x2ArFQY3f0CctudyZOvzekh54qhAa0EMkKIKf+WvrEiywX7owqaR066aJhl7IbJ9AES+wRB9SdVqzKDOE6FNEUipQgEFTf5OvZsL6vG7HIm7lW1kUvmXXUahrNmYJGIfcWuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184691; c=relaxed/simple;
	bh=eNfReQwiSfYmgkbHcm0VimweVkqjvCRmOms5GoUSXhY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=r6A6bUnHxGj6q6hLQCW25ouJYywjndhF1g5ho/MkqgNk5YE0Psikokz0PkAN2+kWjPY1QPxjayUuI8UKTR450e6nzXMNS6lPvsYoFZGswktaWUOUkWYzn78hDWk8tkdCyJtbSRDRXrFuWx0Duq1rJtgceLhMMFlhmbPOZDi+he8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=PssYklmM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CT1UiX+l; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="PssYklmM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CT1UiX+l"
Received: by smtp.kernel.org (Postfix)
	id 4E6A01F0089A; Thu, 11 Jun 2026 13:31:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781184690;
	b=vkYBJJ1DiF7ioV6gcy0u8FfWtG0vPrJcAE5nGiMCrGX46jaTke0yf2ESm9Fo3ul2lEjN
	 UHVR+5OOetIx8Oy1w+m9doOuRsOeil6nivQ99RPI9hVWkOw691vepae5yOOVfrTK2zPdj
	 Dm3TklJXErcsbuGdzFvycMAL+elK27z7xovEYnC1Da0bvXMeWKYr1ZkNzHNclVsUjJHDu
	 gNLARoIT2V5x/vpb/7pAJQND0avPE65GMquk4pu3ikVETWWnvU2DLv714O0o36dxA6BN+
	 K1T4IQiOZfSjxN1WY5QdtHFEdBA7odgkf6pOER7gQRss+UyPpIh1Ra7DpXfE2lo8+NA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781184690;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=219KhmwH9vSJQBVzznt3qHsEccda/bfcCm5kTcULkl0=;
	b=n+YR9JUFs4esKkFRYOJJ1wjAR/0zWeoqjYtngJRywEGZKwbbpDZPCeKqdSJ7nnEarx5T
	 BSCg66tSEvvwQxn05YzaWePibUAkW+rKrEX7OO4xi1gPomIXEkns2qGbx7MhPzGUlZPze
	 2spJXM9AQVzk8MENAri/7CtnKaQM+Bux6nnxngOpqxPnUhbENyvoLTOqtO/b+HzZmCgCc
	 JT3xO7lS/MGLWvKXuU5SKsTAMk0sKSe2GrMCAXyF2ExLQONKL1ujxAsn0ykwSC09HKU6w
	 64tiyBpVYo4ovlf0LaqyOCNvIcxJV8g8kbOL9lIWbHn3wzEkyi5jm42nzmsu+nouUyQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=PssYklmM;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=CT1UiX+l;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E53921F00898;
	Thu, 11 Jun 2026 13:31:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=PssYklmM;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=CT1UiX+l
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E53921F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D31537A0126;
	Thu, 11 Jun 2026 09:31:27 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 11 Jun 2026 09:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781184687;
	 x=1781271087; bh=219KhmwH9vSJQBVzznt3qHsEccda/bfcCm5kTcULkl0=; b=
	PssYklmMgQd/NnegOykes7WiD+c+jK3rBjaDDaJP/DERwZGNjRRwtlcHp8N57RKr
	vmIMcgBnRxvlvarv270mXZtqRCfGDw3b6hsmA+Wc7GnG5kp5Yc/hVywPw2IAy74e
	lyXDf7kxzoyx80QgZQdm71OaC55kzXmzHTr52L2CB3Ps1HciFs95N5Vt0UcNN/TN
	mcdy/5YCSfPQy68XCSBRN5HUIFlflTKxfHBVuo8sgnYCZ4w7HgyGHsCMK7LJuhCa
	eUUOtI6IbzuOCnqnt6W2bUmphB2JSkR56/8ukmtzB4QaPhEhTtuNG5rslDUTv8Ak
	zXZdXVsBHJGIXVhYkTyiLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781184687; x=
	1781271087; bh=219KhmwH9vSJQBVzznt3qHsEccda/bfcCm5kTcULkl0=; b=C
	T1UiX+luP1/onOleAgWv7yjEiLS0siasnezAEza95WW4YPytNdDXaKBnz4qb9bVS
	z7cinPN4gt2gQ51Pa6SBqMy6FCHcYdc+cAmwBeFvPRMI9qXgDVihCntsACGlnrT2
	0kC9EyhlPU9DTZbI1v32V/CZ8Nl0Xr9tUh73bdp6XdwRAht+sV1FLkL3RgYCxRQ1
	ri/Z4E4YZ4eSm66OhdmNpkp/GfggZgLSLQbIZvJQ92NA2CNeBHYDFAxgQ0vSBIZq
	ck1GH1hZiciCZp53yrAgQ1LrtY7t+VtTmYhSS1kZbKGnrUG4ytByP2DLUT9YqWlz
	fDyGUK+UunpkIUNwXj9tg==
X-ME-Sender: <xms:r7gqag0bpm5ww4T4HVsdr1TbWgLE5SRfgGoIXQKRPTwZSA02XdPjRQ>
    <xme:r7gqal4GkmrHtD36sCj56PA4-gdPtkdMGZKwoINR-AlD49Q8fTy6oCad9QBQMHNEB
    5CC2Qr153-gE1JvnWc02wNPAYXdnJeIbc7vGw-Hzr7a_gS2ZDR1YiM>
X-ME-Proxy-Cause: dmFkZTEYPqUH0OyBvMlLDpHJgbwSXLSQRB+fH/e8ybYbUTpYWToxjLYyQcEgHUbFh1Itst
    k1oaJ0vZMj1Koa8RVRsUGgbbmsxoeIikzMQYu24GAbbg+bSzyIDj7KhlGyveNB+3XbBaf+
    bGX1zT8pAOH5krjE28tdXN/MBAYm4hJ8X7oBRR/c7NJaWCwmcTWXFAN2Nq1zE2AhzTioVc
    Fbe3kvg905wdMZSZn9Aa45i0Dd7qKvGzjnTUzqOme2F1QTxJEjX3AjhfDMc7g/KJRTeyfF
    Jpewztda69LMKEvcDiqniX6hxoBhvTAnVmAqL0S4saJWPiA7ROKw6xK3lOo+lmS28t80FU
    7wPr2i6w1USiY0fGZ3qEZ+ixFLgWOfxum225M09NG77ib+epuzVstK7xnAeNopFkRThc2b
    RcNSt8wZiyrnTIjZrKmyvgOjX9NgodFH0qGHw2KTtM5IVbbEmZe7hW2Osdc3T88TcKvl+8
    6Hvpk/fgQtUVdG24zGzhh6Bi10wtdpos5nhEKmuiLGJjWqOWupETIFuJfwGmCtreYCLuuK
    HuTnjxnEzf7hbWiNQ507mvE0OxwbHhEw0lDU3yjXxp+vvsmobXQ11JdPdLrgTdnRR0qWzU
    SsxUYZj6kjc6CfXUOfcPhK2V95EN+DJRDs2owabgnGC4RC3LSmMdM469yegg
X-ME-Proxy: <xmx:r7gqalP7iWbxcYWIDa-10JIZ8EjTgLtM3dSkyrDor0fPdZYLGibJew>
    <xmx:r7gqaooCwNmbhXeW4Bly6JjDjg_sgnqEnwXyz3DF9rlNhZnGAfV4zw>
    <xmx:r7gqaifl9YMKpjlDQlmpnLXekeJFMCOccEnebvnSOc_r3ZOsTrLGgQ>
    <xmx:r7gqamT71H8pbY9om7MsLzSMh_5aBUDLq-YG8i4QsFdlPMCIPc8SYw>
    <xmx:r7gqar6kd_mA-GCgtKwWlBp_Zt8Tt-_Dnnrbum4Jj1rzq5ouW8d5TE9i>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4E2EF1820082; Thu, 11 Jun 2026 09:31:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AUV8JOC_Zpjc
Date: Thu, 11 Jun 2026 15:30:55 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Aleksander Jan Bajkowski" <olek2@wp.pl>,
 "Gregory Clement" <gregory.clement@bootlin.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <8de15abe-8352-41f2-85c6-bdb50eb18e9a@app.fastmail.com>
In-Reply-To: <956403e3-d47f-498c-9f62-79d39c1cf5db@app.fastmail.com>
References: <8733z1c8uj.fsf@BLaptop.bootlin.com>
 <bf8092a3-d037-44ee-8e08-8b2204e5cc95@app.fastmail.com>
 <4e690104-b42f-4a2b-ac52-5ebfc82f6853@wp.pl>
 <956403e3-d47f-498c-9f62-79d39c1cf5db@app.fastmail.com>
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.2 (#1)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jun 9, 2026, at 21:29, Arnd Bergmann wrote:
> On Tue, Jun 9, 2026, at 19:35, Aleksander Jan Bajkowski wrote:
>> On 09/06/2026 18:11, Arnd Bergmann wrote:
>>> I'm a bit surprised by this oneline change. Since you successfully tested
>>> this, I assume the change is correct, but I have two questions that
>>> I would like to have an answer for before I pull it.
>> By the way, the upstream safexcel driver works correctly only on 
>> coherent
>> platforms. On non-coherent platforms (MediaTek), the SHA-384 and SHA-512
>> selftests fail. Since the selftests pass on Armada's SoC, I assume I'm 
>> right.
>
> It's not necessarily proof that this is correct, but it is quite likely.
>
> After checking the datasheet some more and finding that this should
> indeed be coherent everywhere, I remembered that even the old
> 32-bit Armada 370 had a coherency manager. At the time, we used a hack
> in  arch/arm/mach-mvebu/coherency.c to mark all device nodes as coherent,
> since the original DTB did not contain the correct annotations.
>
> I suspect that the Armada 37xx started out with a copy of the
> old DT files and also never had the annotation, but then never
> had the same hack because arch/arm64 does not have platform
> specific code.

After investigating a little more, I think the correct fix here
will be to mark all DMA masters in this SoC as dma-coherent.
I thought there was a way to do this for an entire system,
but I could not find that, so this likely has to be done
for each DMA master separately.

Not sure who still has the hardware and has time to
test this properly. Given that the incorrect DT has
existed for over 10 years now, I assume this is not
urgent and I will skip the pull request for 7.2.

     Arnd
