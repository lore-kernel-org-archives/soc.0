Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94758279798
	for <soc@lists.linux.dev>; Mon, 20 Apr 2026 19:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776714088; cv=none; b=WXiuYIA/MGrbxk1hAUE/qnLl/Kw8UyyTc+ZH/ueUMMNW+Mquwyhw0EIAwHq7PSREEz0BdPK7o1MZ8/FKfz58dgk2vvp18xfyV3JYVjxD2CJD5mBQ3myucXpdDV1f/0LAbwKfKcO7kAzJceJIfCsjdAOPxvTY2f2KVzUN69HNht8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776714088; c=relaxed/simple;
	bh=vb0/sUvLs4L8ywV5aPu7Pf/bm2oGUfVm3CTrMEICeS4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iDpnQ+O3O8g+4sYzSEFjf93WpkmnAPd99/360ptWnYWCqRs03cz9G2rTcESlCXxRU60Tu+fqPfjL6vSFjlZRVlB1DJuuTfTwh33kMoUTQkFoTAM9m5ouxYgm90NtRmustBJ6gnHyUiFY4n/MbgEsnjWzUCqAiiTqeHX+SlqRonw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Q8Qg0Es4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hADYUc2r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Q8Qg0Es4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hADYUc2r"
Received: by smtp.kernel.org (Postfix)
	id 3FD9CC2BCB8; Mon, 20 Apr 2026 19:41:28 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60CD8C19425;
	Mon, 20 Apr 2026 19:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60CD8C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 5E529EC05D4;
	Mon, 20 Apr 2026 15:41:25 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 20 Apr 2026 15:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776714085;
	 x=1776800485; bh=t5ZkqNq7ovZw3BANwX3fqguzu/wgJwpDrIbtpHMi9K8=; b=
	Q8Qg0Es4eFu1W7kGkTGr4448Z7L6zw0x4i+6eqe5oJTTKPH73z3TISv64ePeEOc8
	u+8u5LM+6rPqrJ0fjLXDeDcXDQJ/WfXC9G81xuKOclTUsFKOWZapvxRlisrAMMxQ
	4f0n/rHuIxkdNWzk3XNeGlcYJE8hp2PJSQk04yHou5ez8HZPVRAzPSG2VPjAhvo+
	m0aBjJf/we0grbHRzS04UwVoj9IojVm4+qW/DfTDMJy7DFf3Xbiuj1bau1i3q/r8
	LFAWfS5gW20HIxIBBV9Ia/pfvKR6DVVKU/r43CU+P2ruE8Kn0lSiZQYW+i0aFzip
	fpCKY7p+YOJWHYNwF9TeDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776714085; x=
	1776800485; bh=t5ZkqNq7ovZw3BANwX3fqguzu/wgJwpDrIbtpHMi9K8=; b=h
	ADYUc2rFRBuVTDhjm9LtBnmDBi689S6FdmKcTrochD1YxNSyoPaeF8IQqxe3qUhe
	EpC/JElRAe2Zc4F+eOZfE4rka4RRsYVMTEFE3lujoYDh2dTdIqdqbNaluPXHI8Tu
	AaBdybApTpRPcjqMTBqA4zeI8cz4I7JnR+vlUPK7B6qhxmUvERmFJznLyNIQ734f
	JGyVPregl01NZhyg6Q07GsP13hYRbbVSJR71lRrhixF3jgr/GGKrlmXd/8p0Cx0v
	n79IBctkA+Vq7r7bZLE6QEptGjkBNPFuaFZQzWb0KJSkcP4lWy1NA2Sb2Wb9AYxo
	RyRJKGd0d7zvAV/amCuaA==
X-ME-Sender: <xms:ZIHmaQZn0PGvHyIGRdqk2YHLY4TcloHgre9BGRWLPaCfGayaIZZNYA>
    <xme:ZIHmaWMVYjvOY6az6FsmxoiIGpFb3v4j_-7xK05Kz1CgthZO2JDNfB48YVZkf3kSo
    Ij1d6CitrVp-lW_TFwBlPdIourOjEN8cY20-74ry7tzViWrP-ONTHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehleeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtth
    hopehlihhnuhigqdgrmhhlohhgihgtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrh
    gruggvrggurdhorhhg
X-ME-Proxy: <xmx:ZIHmaZbYU8ATmh10MsIQ7alxZepKEwOn98BH8N_PvoJG5i8MGPvRBg>
    <xmx:ZIHmabUawoVFFrlAZyW70Uq0iZQ-vCj_n616kkTPGH1r-cxRM0xBrg>
    <xmx:ZIHmaa9ziPrkvHlgNjeXm-JPCVkNCHqD6xkUTIqEEnhxwPLfG8PG0w>
    <xmx:ZIHmac9_Kqo2BZ37-SoEfGy1B37Ix9tBej3ojToifDU_KKl0xl5pwg>
    <xmx:ZYHmadUfhFYXBSvYR2NVAo2Ul3b1UcqOGCIpJN4SFnQx3J7qHfVrq0M0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D828D700065; Mon, 20 Apr 2026 15:41:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AvG_jmLX_3YV
Date: Mon, 20 Apr 2026 21:41:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: soc@kernel.org, arm <arm@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <d95cfc82-327f-4bed-95ae-88a9182eedba@app.fastmail.com>
In-Reply-To: <5d9c1c31-5e89-4699-b910-f5ca2c36260f@linaro.org>
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
 <20260411-spicy-apricot-newt-afa8a7@quoll>
 <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
 <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
 <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
 <43ae9d05-5cc9-4f68-933a-99eb744756b7@app.fastmail.com>
 <5d9c1c31-5e89-4699-b910-f5ca2c36260f@linaro.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 20, 2026, at 19:31, Neil Armstrong wrote:
> On 4/20/26 17:25, Arnd Bergmann wrote:
>> On Mon, Apr 13, 2026, at 09:30, Krzysztof Kozlowski wrote:
>> - I see that only a few of the patches in the branch got applied
>>    during the fineal days before the merge window, while the rest
>>    had been part of next-20260330 or earlier. Aside from just
>>    sending the bulk of the contents earlier, I think the best
>>    solution on Neil's side would have been to send two separate
>>    pull requests, for the earlier and the later contents
>>    respectively, even if sending them on the same day
>
> I never did a split because I don't have enought changes to justify
> 2 PRs and I had some contributors & other maintainers activity late
> in the cycle.
> Anyway I'll make sure to send the PRs earlier.

Ok, thanks! Note that I rarely complain about a follow-up PR
being late. If you have the majority of the content queued up
early enough and have a few more things or even just a single
fix later, that's not an issue at all.

     Arnd
