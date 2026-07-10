Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FE9348886
	for <soc@lists.linux.dev>; Fri, 10 Jul 2026 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693458; cv=pass; b=u2L7agvk70nHf5UrUEmTt7m0EhLqw7O4ThZDeJJYJLmGWwMqsqyBZUSZIeY7mV/wEG4TEuqlejm0AMddjOENkGoRzapWIdJL320vRZGJfqoSEfkWOZAEbcYkynWz8/Sy7sWPXm7yPLmjvXpRca6v/XWxf5o+GQrvaowHQUnYH7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693458; c=relaxed/simple;
	bh=TGcMIc0m/3V9AIzfvV0pJ4TO18aZccjqdyW2jeK7bSo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IdX42F4Xjb3rWQDafOfteHSHsYqxIsAUneqQrw5u1HooJFMiitDwvnVL3sHetEf68GR1ru76TY2dF+xUtZwBu5pTcA3xnQUrWDmx35pelBZVHAPBO5TkIV5bhiTjC2j6/L10hxd4/m24ra4u8uLGbvgHmuIwlWsdNioNBUHooMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=KcReVP/f; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T7SxRJj1; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="KcReVP/f";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T7SxRJj1"
Received: by smtp.kernel.org (Postfix)
	id 4A5B41F00A3A; Fri, 10 Jul 2026 14:24:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1783693457;
	b=oyuuhNJEzm3YjUZwywGjXLO82uiHkz/+4CsxzGgTiOpFm2COt6fJWQUBZcXj9LOPnJky
	 3KHu00DhMjmmAxSgLG4mBaC4KideVx1Lebkvdn6OUDwNiC5zYCqOOAVZp1zlWVSMwARU8
	 BjKxMVqprzDfWFIaQWs8pOQvNUZnkCO706zTrXdB/qqbuV8W9+Z9uvZskEhDbiI4qlFbs
	 dJGzCtjtQ+ooYxbEoGo7K7Bc01r+pvg2YfGrVnAjdUQ+umn2rR/7RNOsRNKBDPKpbPA0L
	 ffUH/cUxvGFZRIt3zdVwerOOS44INn+6aN322wSD7jShju5RX7CaftH5Ml1rILXxApQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1783693457;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=I0M6LfptZTcKLS8CnN8AzILITWzUURi8rWY5mGa7zRw=;
	b=nG22mR1yl03ovDU1xmniggHbkt4USqcyxolS2eHg5EBp1kVyfh8tphIZAPKyLBfp75e0
	 PfqwJkUf1OUIp/KkPpEHhuCfKCZg5wvtEr1rDxSLVyq3xrQZUrRy5PsmyJ+Ovxp8fu+3N
	 AvQP9EClrrLVl4yqnA33omyeHmM6fEH1xpyA3Ep/tQSQ/vu/ScbR89e0wUaoVllXH4zOl
	 +fJ7Et4QgFroiPJN8RZBs5ye0cmXes5C5Cp8VA5oHBUQSyxGiNNcOfIqxQA62MrJqJznH
	 M4LGslw4ZrP4qI9gqIOev//xu9Rq+AAn+pshFrtmrLvS+C+feD5o9NYcJkmayOgLHGg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b="KcReVP/f";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=T7SxRJj1;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97B631F000E9;
	Fri, 10 Jul 2026 14:24:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=KcReVP/f;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=T7SxRJj1
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 97B631F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7BDCA1400124;
	Fri, 10 Jul 2026 10:24:15 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 10 Jul 2026 10:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783693455;
	 x=1783779855; bh=I0M6LfptZTcKLS8CnN8AzILITWzUURi8rWY5mGa7zRw=; b=
	KcReVP/f6VGxxEIacCb8OFhB4GYSkKqDgVHxGA0/9fZfSt58u9ktFncWKxSZ9jM/
	TV86CeRr5l5qH8OXQ91S1vmO70iO6D9qwBC3fSnBGT+77L4XENyM8UpHcL8AE23B
	KaGqvFJ4gaPPIJU6IV6ne0AzuLgjzdcfnhTaREaoiInC8VWYpv7dKl2xce0AmFu4
	lAQbDHLvebeqyiGkReJYVMJ20MPA+cpMt1jEeyVORfVp4iEiAYBk2yEcmMzo5vhH
	6SCpkvGHCSbnm9xXp16Q/GeiC/Is1O5tYdnD2LzARfdrgZ3s8HJ9WBTs+OFln9be
	Wx2ChZwNrYWh4Nauw6I59g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783693455; x=
	1783779855; bh=I0M6LfptZTcKLS8CnN8AzILITWzUURi8rWY5mGa7zRw=; b=T
	7SxRJj1fgLftd66sohkydUSSFIuSmektkKdTqnJRNeUPBrK7FSr/6vipN0VPzloA
	u4Lcbnd8QJ9069u6efMsQrFPNtwayf6ptYZ1cBtjCzP2TtQuFK1iaQIEIFQCROm5
	FkADWgL02TE42Ced8eAQ4LGRJVmK/qJ5xzm1w/7P0vSswIzvbyHeHv/25d0n3Co7
	ANQgAVu165mOGJ5sgJairjsBWnMK464iTeVQdLbpiJ9naGnQrvsrUS/eCzeF4VTm
	NE/BR0aatcuFunvsxo9zY0hO/g0dB7czu93YBhpxFLry3o0NVFomKZPGUNojvjWK
	YgcRnP6lGosuUFkVGoJsw==
X-ME-Sender: <xms:jwBRaloDsOFgRXIyTHG9D9x4P7s9WilGdcrHV5cxtbziZDb-ULSzPw>
    <xme:jwBRaicdezlQmo5b4crAMn9ysZGMg1Jk1nODTkJFjS2ZHFSSS5odhe5Yv_KmZOcrf
    JblLALtXYJtHrd4mt5F7T2n5GfkSjMFjBetgjV676Jgzazuhj-CIUw>
X-ME-Proxy-Cause: dmFkZTGYxMZDU4x6fQf/RciM8257I9FixCyODKFI/alj9C/tuXfmRgoPcc6CQi7yWJZqRD
    B0yjY/cmTp2AaGCEDIlqCmIw9JCXn/jhmSIzMVPaKD7sAiXPbaLUqkvUI/gdywvDgEEml/
    O277Yi/m5c28v8+KreEOrpsHEfUYLyz4fds6MmCJbfzXQ6MOQrQjSfvmKKCmmtYwe4Nz76
    mKM2ozlgg2qCTYuxVFi3FFAgfe3HxGwrk6AwwIP7kZUgwSlgYP47uQ997CCsHIB/0C9Tbq
    o5St2lclqrCRK3VbLZV/NnxZOdSkZarQvMUjeR1vLJt5CAI0L38+gt2g69PPlxDSxAFyHo
    im0NBLt2IiSP4F8g+gntGaNX2kgx4Hwv2zik2j71GQs807BbARqKa1Q0AghtaC3YgG2hVj
    Yp5cCQhAmR9DO0Fz43U0l11kBS4MV12h43aeQN2p0jvlHbnBpU8oLAaFH3nZQu2jpkJB2p
    yZdsZxmRstat3qfe5PbAOQi2kPVIBdnd0QVwJDLyDUvdIQUJ16vLyy1LRXngG9GQ9JeLA7
    Bp3iPHR9yLXOKd3Bdstm/qGl4ajLK0jXTLD0iC+vkIaWj+DAi4reiLHgqqzh/cRfJ5+JBN
    /8c4uw9c2pL9V36A9vFDA+0uBmXiOkVDkEE/ssHX3srWOvfUZPZ0hqr9u0Zg
X-ME-Proxy: <xmx:jwBRas6Slia7Ma8gBNhkWarE1znVd4BSwEPuxUvCHSyNaF1SyvvMGA>
    <xmx:jwBRauVLi8GM64Yt-Unv4li3jTjZ3LElSD0tXwCoMP_VbDNK1RpZ3w>
    <xmx:jwBRasIKouSZa6WWTmHIvTSZfLc-6Ra9KgM7PnpC0oFrfXtL0WL_lg>
    <xmx:jwBRaovHTI3VLR7a12dQcbXDtGHm36FiORab0O_KkR5RIgwiaASzvA>
    <xmx:jwBRan7dmmRxVylRXPQ7w12Uhx_c6kI09f0_9g5IsxYxhE8_k3gm8lgm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F24291820082; Fri, 10 Jul 2026 10:24:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AxFSti9e2Kpo
Date: Fri, 10 Jul 2026 16:23:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Drew Fustini" <fustini@kernel.org>, soc@kernel.org
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>, "Conor Dooley" <conor@kernel.org>,
 "Paul Walmsley" <pjw@kernel.org>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Message-Id: <f0f61421-5db5-474b-b904-b5764352671b@app.fastmail.com>
In-Reply-To: <ajAt3ml9pMIMTLTq@x1>
References: <ajAt3ml9pMIMTLTq@x1>
Subject: Re: [GIT PULL] RISC-V defconfig changes for v7.2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jun 15, 2026, at 18:52, Drew Fustini wrote:
> Hi, this is a late pull request so no problem if it misses this window.
> It is just a single patch for the WiFi driver on the TH1520-based LPi4a.
>
> I recently setup new branches for riscv defconfig patches and they have
> been added to linux-next. I talked with Conor and this seemed like a
> good way to pull in defconfig patches that RISC-V SoCs need without
> adding more to the plate of the arch maintainer (Paul).
>
> Thanks,
> Drew
>
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
>
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>
> are available in the Git repository at:
>
>   git@github.com:tenstorrent/linux.git riscv-config-for-v7.2
>

Hi Drew,

I assume you saw that this didn't make it into v7.2 and you
already plan to send it again for 7.3. If not, note that
the URL above is invalid and the tag is no longer there.

When resending, please use an https:// type URL.

    Arnd
