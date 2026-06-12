Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3509037F8A0
	for <soc@lists.linux.dev>; Fri, 12 Jun 2026 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781257322; cv=none; b=XFuAhQZefXnSToPZWDuXt2G2BzqbPTKbyteDFiXkwB8bbb7tMTujOo5tdHrRyfw2CZ/c86pjhCy/09yYg8i0Wbo6tTJy9Kbvtzgi57mB5e7CNPjyGGH6Ni2gklApORLMJLSdFBXSVr5fOa4wmXSp0SDKJbEuan7PbndZPDKnyNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781257322; c=relaxed/simple;
	bh=JyRvb+y32F/YvAKoZ9WhbssqIxQEB98UBI8wChPTZeY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YEy+Pb/rHAlRQJpAzPE6kekTniNHgYlLrVtM+tx7rBkL1Ljlh14p2PZDIJDKmmEK/zRQuEoyHu+fqBFJbINprzX9lPZN/sj/mfWcjzpAKQABdYEfmPkFPwYp5P+NvL9VC5D9wKrFmHB4h8u0xsukg4zjxrHwZGsJLj3Ttlu81Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=D8dKg5fa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EBMEYjKf; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="D8dKg5fa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EBMEYjKf"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 13D17EC0064;
	Fri, 12 Jun 2026 05:41:58 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 12 Jun 2026 05:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781257318;
	 x=1781343718; bh=i/SGUs0YIEd66VF0qWd6efTVsGi0XgveZiOoh/RTgHw=; b=
	D8dKg5fajuE3OL0JkbZbNuDlvTzK3k2/SSOqUTeN46HcOkwbX2uea6DrkqbPigc5
	DnmTW+NVkTjVEOtAuNDBV30W/aGdRvTL+yDZDBs6wnF4x5vANJJW6MA9pxKEeXcG
	PnS7mkIxWMunvC1qmz2tajAkFMbx1BSqsa34SaOAEMzz7LOBd00eY8vRv7C5HPv0
	M/4G+9RuA+Mx2ui3P/OeH2frqJZYEfUO9ald0ZfgFYOeoaJsXnjd60HsRarERANk
	/PG88QJaUp0fY2lazG/QmR/atQTEmZCiTcF7LKtyhNNWSdUJP9g4Kv12uXaYDG6Z
	4TXLdyqf4yuM4OaoGTtHuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781257318; x=
	1781343718; bh=i/SGUs0YIEd66VF0qWd6efTVsGi0XgveZiOoh/RTgHw=; b=E
	BMEYjKfnEP8rMDXG+OnyejCTZegA0X8TZ1+hSuenPePtlylK5z6qmzAgS3SEReI0
	gvRahFO/RV+lgQhXfM5kzwKtxJbKEECaJBjCcJtJXFpsj7Wed52Xi2KwgcCdodP3
	uKAxMz1KP80qMCyz5Lt9M/L92jx3XLfHYBnHH5bIRw6ryQqvzM0ExmN9/4SEKOyq
	UI4Nc2liXduATAPihz63xu37md+6nAyxUR9EvkMXOM/DHRshRiATpPU0pciGEsuj
	eMEO6SjQsotigpUNAFtd4RObbyyAWz0AZn3o4ZJk2p0aA8HyBIg2oXKFftZx1oxH
	6YiMC70O3hpf7ds75nwJg==
X-ME-Sender: <xms:ZdQral3Txnp_3JimMTsQwUPG-p2Y4AeM7fLWFnmN8Tv9iMsZmNQ7jQ>
    <xme:ZdQram5g2ENuFmc5k_iNJajQmhQIVdoqgCi56fac6LiSeZ7ouIDInoAk28OLZT77h
    PHPhhjSJdwmyHx28jivF_IxwHRIwvPymedlub3aaoq5L3DTjiujlPGH>
X-ME-Proxy-Cause: dmFkZTEgOGkI4ef/CF24QtYWuT/qA10jYmWmTDetkenrgcnokgLI/1fIQX65pyUvZ6BqIF
    oKAfkJNgTaftZi+RwmlzvUhIM7wxaAJxC0Hy72I31N0XOwabtUw9tNg8DnBTL2+1UlrsNy
    8PXIVHl8E46TxotjHiKb7G/VQUBHqwZe+RcsEw4y1Bv1kVDYNE4PLKkB3aSY/F1OgAdu8v
    1xf96B7Rmc3aeaL5ouKhVsigTyeA3Q6vbC3hHePAipDPme76TA4rKM55E0eoEDX4EQsJX5
    79aIr1uzAzomOmVMv0FbvZCLSwgdxNYjKhaRCQNxhoXHlcMxIKqWERgg5XyMq9IKETVhsV
    Yle1f60NkBMJVML+stKP8wOJnQLIKeQ4BPZg3AXwO6FelAZHVhLlSQ06mqEUeIzvoOysKz
    9NLBorfV7y88B6MlRj90JtWCmo3DsoyYYLaJxn5X6RfKhtzYZxlSUVoCro5kyKYn6fo3ap
    Rp0lZ5N6Cx+Dt7e5jz7v2W9Mym2gBnR1isHRdxGTCC12s3DJot8YsdcV5psh/bFvWRxkJR
    wnxrk5x5ZksQfuh/OIwbq12bFqToGL6d8SGhpj8cB546XcpY106x75yXI8toT3yezQEdWO
    6lfcR0g1GGptt5+xGN6GAwG8OqdVBN16YvKfhB7g4mNlCqdChPaVpHQh38GA
X-ME-Proxy: <xmx:ZdQragX2QwQR8V3xWTpjKfUkq0QTKfTtjvu2Z-GoNQcFoKyKgu4ZeA>
    <xmx:ZdQragk8TOPrA0pEPVQ6WRnxflCwXPxdPDIJC_xmNgLfdZ8n3tiX7A>
    <xmx:ZdQramn2dO6dxAOsn5Towq7cXu06X0G9DzfmnqTg42xHDp0sNgt3CA>
    <xmx:ZdQragYhrwb1gx-RPOZ0hbNPdxYFL-670bBm-wvWhEsRYAA-ZdSCFA>
    <xmx:ZtQrakQYYh83HJpCgwDuIYjEPHBH2cpbM5MTwOcpGxDWDAio0DHZXVNm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BB036182007E; Fri, 12 Jun 2026 05:41:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Ap3K6gjQ-9OJ
Date: Fri, 12 Jun 2026 11:41:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>, "Drew Fustini" <fustini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 "Andrew Davis" <afd@ti.com>
Message-Id: <6a93097b-fc06-414d-a5f4-cf2dc98474d5@app.fastmail.com>
In-Reply-To: <20260612-indigo-sparrow-of-action-d2bcbe@houat>
References: <20260527084135.842736-1-mripard@kernel.org>
 <422d7885-67bf-485b-b2fc-f0604a2213db@app.fastmail.com>
 <20260612-indigo-sparrow-of-action-d2bcbe@houat>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable dma-buf heaps
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jun 12, 2026, at 10:33, Maxime Ripard wrote:
> On Wed, May 27, 2026 at 10:50:02AM +0200, Arnd Bergmann wrote:
>> On Wed, May 27, 2026, at 10:41, Maxime Ripard wrote:
>>
>> I'd like to wait until we have resolved the build regression
>> from the earlier patch[1][2]. I don't have a strong opinion on how
>> to resolve it, but at least for now Christoph is asking to have
>> your change reverted.
>
> I believe it's now fixed, even though not through a revert, and is on
> its way to Linus:
> https://lore.kernel.org/dri-devel/c7a9dbb0-a5c8-4e67-904e-1a52b3de9bb4@linux.intel.com/
>
> arch/arm doesn't select ARCH_HAS_MEM_ENCRYPT afaik, so this patch can be
> applied as is I think?

Yes, I've added it to the soc/defconfig branch already, though
the automatic notification apparently did not trigger.

     Arnd
