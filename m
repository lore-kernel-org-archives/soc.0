Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9676C376A01
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021530; cv=pass; b=LiH7lhMhY2O0hTZYn7QVs1Aa38z+PuTY1TRWK55VExk2FGGg5sJy6GF462Rec9HrYB6Z+uGoDzbSqj1i/DJ9pAHokMaJPeWs36CKEbznhPnIdo4wjtcxmBYUjNP5VK3XGv9uli+2gvjGV02Bqh3BqFrNuSv6OjsaqJoMVXYJA0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021530; c=relaxed/simple;
	bh=Jy9jDEpZOxjpSYSJjItrb6zdU9ipr07BpUOmlr4rZXo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CA2I9U9HVdavbg8v2NzrMhY/oRP1krrLMZUBPoH/UeIlrftHayljbTToWn/bO4KcVxhinxW/94/zPRyYfoS+r68HT2+86gjIHgwhpHTnTwojVDQZOL3xkH5ldEweINWO9zxHig4FkN6u8Q8ivU4utv7H/thg9fHWNroHDC6ij3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=QygQNULO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QDhbPw7v; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="QygQNULO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QDhbPw7v"
Received: by smtp.kernel.org (Postfix)
	id 752541F00899; Tue,  9 Jun 2026 16:12:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781021528;
	b=XupqJo6EfFND+UZ9U8LlnZxTg3LO4JhqNRzZDObaSALLWtb1ExBBMblT8DPQ2T/spbOi
	 /ANlZ6UoOPy4zpSGfTBSmASewWTNF84X21gv00W+H50HTcRV4LXxGaFCyx5qyIwG/nOy9
	 Q069dloKUX9yyoY2jjXucq7tHqkcJ0qhOtTe2JJd0rwquG8HBuwuy5c6Xmww4zT9UsNlh
	 gnHAbLzOyl6xSO9Qo4vClBhiQkfI50wZdGoS/vCN+g2wo0J/RVbGGtkT+afkLwAiIPpX4
	 T62MlQCCakyZLAs1T485sOgDrLTt1YBzIYKHJJ4YkciZgdsHK+uys64eAN2uTg7SCgQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781021528;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=/RvxSYlM/twIIgpH3kj5I2fsJv0XikpfNScMhyHup9o=;
	b=g5IctVf8plyCl0rOWaO1pGgOuhBh8iZhh/aHGcsyRkBOME7xTYdUHjz3JInrGpIK3HJe
	 LAR+rYbOf2yowFJ0H2CuV57ff62M0owFTLDa5f0ea/QbvcU4vGcLuXpXUyzKOz0zAlhed
	 0Q2l4hxcS2rilpn0HZw7/r8dZjVzdcf7Tw3a4sSgiF9LxmGrpEdAF/S6HMxPbHGumzNkX
	 7PbSLkxAHuQZna27Na9066oT8u1a46toS8Lx7kZ7p4efPUd3pdIE7f8L37pvBUexZ7FPE
	 vwkRC/7SVDpCzfnqZUDGxoATKzXSu1bEnAWNSwTHEqEBma/Y2CPH8/6/rb5EHSd37Pw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=QygQNULO;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=QDhbPw7v;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=202.12.124.148
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82AE91F00893;
	Tue,  9 Jun 2026 16:12:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=QygQNULO;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=QDhbPw7v
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 82AE91F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 6E2C81D0006F;
	Tue,  9 Jun 2026 12:12:06 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 09 Jun 2026 12:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781021526;
	 x=1781107926; bh=/RvxSYlM/twIIgpH3kj5I2fsJv0XikpfNScMhyHup9o=; b=
	QygQNULOkUV4nWCxEImhr6xamOaYyI3aJtv1XjCya7JmSG8IfPhMYx5pKFOVML+j
	C45cuLQKukTZ7uDBbbTkT5QTg3dfcbLdjnDqapBocmQhS394wsVGiaMILT7lMb44
	hILvnY1w9yaWoJTheDt73/AMWgi/SCmGvQWNjDEplniLyWFguy8UqxHVwD0NVaop
	w2kXp/dAHZljXmaOKk20KHWl25UBqum5+43t7oDYxxqTtzq9YFMwE1MaNbqPic6X
	3/XYuxc1qqe6+02YYvQUk4hT7eQF9IbIemBjRSAp10iFUM1dmc8aEiJRe+0dLD2l
	o+p9G/vUgm5HGAJ8UmK3Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781021526; x=
	1781107926; bh=/RvxSYlM/twIIgpH3kj5I2fsJv0XikpfNScMhyHup9o=; b=Q
	DhbPw7vEzr3x4Q42tcJIJhnt0AfQlxA0u+44aEBkfFqM6B1ys+HONdSBK5sze+1V
	Zs7DNTDEGFj9GvBOylPvrCDQ70AKIZ4dmzpM6mJtx7LGnzYBhlmdpKTJfrDwPX+9
	cLkG7Aut56DucMiJ0xJKDkh+/G5PzZTgY/2kpZDxlwdF4jPZVzQGtWlsjsA+w/XA
	f8ztk3/z4weehX9Fa5un5oK2EaIP/E+mg4uScQE6XRYRHkXb+2tB7cigQr73eQl4
	sCODc/LZNVw2pnPzj09bTwgFHRuYS8SZpawo80Rw5wtBEbHwCazXXlQxXxTtt+PO
	SL4Cw1j2mG/PR3uqvJhgA==
X-ME-Sender: <xms:VTsoavKUnL6v-nXhZXwJlIMPyxImA-yX7z-Z5ngRIuHGYlmIMjsprQ>
    <xme:VTsoat-qI92DlKuc2Gee-sI66BAi8VPAnVMccEuh75KWbnhQFsYv3NSsyjY8_6zMt
    KJ9ohlFzF5B7OsSPp5EjdeGab_1vqbBvG9qGlNYc0pWPX91hl1XeiU>
X-ME-Proxy-Cause: dmFkZTFb6VnIwIzooEwwEqskmLizFX/ukRKZyIcrj+/WWSHHMok+ECOHIw6mfqN6BeZAQD
    ddihDiuzVNRot2dlu1hkyg1a2hTRnDX+OezP6PWXpRfObYrcZ3Q0A5RgHiUqqW58k5oQ6D
    ZcmptSb4RO8wiD7sNgEQ+v+KK45zAd1b1zEZqqZ8guT3udGa+QUlBhHJWgL1sRu8Nl2DFv
    Ga3fmvQy8kydhBqw65Qtb2IxZeL7cadcghKymODatCb7q8UV586nWU/cnWP2ImOrQIUYa4
    sp8e7eoIjKoEIA/FPUUge2Fd/8LuD9wcHGexvJBYmPMIc7OTzfvhi+LQPEBeSDsh6U74ao
    5chIzweQNPu5dYa2n4+KF292g1QiddImilql6+ps7Q4mrI+KrOJxI4cHzo3Arfxry7aMBD
    mHvfdECx652VAYlmPapjij3biPz5nK1l5T75tCTuyBe7AgxoXNoctwY3aTyYIkFsCv9xI9
    aLxL6SBCuS4j4daJzBsDGsxtihLxfRmvP7fzQdqkQ7U9G953I/XCpSfq1OjYz3urAemCjE
    htAfjYXaWSpPGuyVnt3EpupBq/XrPArcGnMnHRqBAfMTLf+HcRQHOq5ge6pXYIhdyXHbqG
    LjzjgpM9g86PVYM3aBPMJMuf/QCyABf91lefZ1oUrvZg7XDrjgHvtgMK78sQ
X-ME-Proxy: <xmx:VTsoajCb5V4euRW4p7nB0YEV3vuFipWebrU9Bsg3we4N2pfmBA9FXA>
    <xmx:VTsoaqOhH_DhoUU_ywOQ6s8QLtG1FuXlS25o1SVZkN9w_PBaaqxRKg>
    <xmx:VTsoaswYqUw86rw4erh-yyGKyzRNOMzc5jB1vgev2x6ksciOtAjfPw>
    <xmx:VTsoaqU2pKa7tq35G2fimgY3nizedD_H9abq8sS7bZN5oA7q8qEAHA>
    <xmx:VjsoapuOL1krTF8kMralGT7XGqPLEbhT0Fx74A9ofPdJ7pzSgh4n6U8e>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 89A8A182007E; Tue,  9 Jun 2026 12:12:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AUV8JOC_Zpjc
Date: Tue, 09 Jun 2026 18:11:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Gregory Clement" <gregory.clement@bootlin.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 "Aleksander Jan Bajkowski" <olek2@wp.pl>
Message-Id: <bf8092a3-d037-44ee-8e08-8b2204e5cc95@app.fastmail.com>
In-Reply-To: <8733z1c8uj.fsf@BLaptop.bootlin.com>
References: <8733z1c8uj.fsf@BLaptop.bootlin.com>
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.2 (#1)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jun 5, 2026, at 17:20, Gregory CLEMENT wrote:
>
> ----------------------------------------------------------------
> mvebu dt64 for 7.2 (part 1)
>
> Mark EIP97 as dma-coherent for Armada 3720
>
> ----------------------------------------------------------------
> Aleksander Jan Bajkowski (1):
>       arm64: dts: marvell: armada-37xx: mark EIP97 as dma-coherent

Hi Gregory and Aleksander,

I'm a bit surprised by this oneline change. Since you successfully tested
this, I assume the change is correct, but I have two questions that
I would like to have an answer for before I pull it.

- I would expect a missing 'dma-coherent' property to cause data
  corruption, as the DMA master may write directly into the L2
  cache, which is then invalidated before the CPU accesses it.
  Do you have any idea how this one ends up working even when
  the property is missing?

- I see that the Product Brief for Armada 37xx mentions that it
  has a "High-bandwidth, low-latency IO Cache Coherency" interconnect,
  which also indicates that the patch is correct. However I don't
  see why it's only the crypto engine that needs it. What about
  the other high-speed DMA masters (neta, xhci, pcie, sata, ...)?

       Arnd
