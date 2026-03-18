Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB163CE494
	for <soc@lists.linux.dev>; Wed, 18 Mar 2026 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844153; cv=none; b=F0PCCQXwXMqKqjz92rTvq6YURrmqB/j8a3xOn4Ncd9fDx+8COEArhJUiaVNa5PRg+lBU6UB6txaPW9k2WqmwWlVSaxREZBU2PiZANhUqK2JndAmeRINwA2q49WCobtj24XS2bSXOR8ROHXCMMLWiyJl/UTeitbgrBjkGHwtkfTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844153; c=relaxed/simple;
	bh=IFDdMPDpNL5enCihTZbaZboOl706ehGGcrAAwJ9YJto=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Kws3/B4xmJN53yET5ffa8O+7OJ9+J6t7vXp3aWfEpQbTmgfkR3wbstu3YQO5nP6WZUAWWTh66qoC3WrhSD+uy6z30BFKyudTjwqutGAXL0oQwZlOZiBKya0CbO3dc/E/4UsEsXE/ZYvINxXpGeQSEIe3AM+EJkRDl5WllLgMWYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=kE7XbrDo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TgdlHS2M; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="kE7XbrDo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TgdlHS2M"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A78AA14001E3;
	Wed, 18 Mar 2026 10:29:11 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 10:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773844151;
	 x=1773930551; bh=ZF546ExVdkQ5ArVhjKR5umS+gc+eyL+L55GnLaFRRW0=; b=
	kE7XbrDojBzfXPvloseSsh+3IqcTvHv4DXsJlS96elasH/sO24zlypLvcpx23GLl
	HH5nWOG20+UtRGGxXze6NNLpoih2/6TXuhl24QP/Axkap/1ss0km8AoYzOKDipjB
	s9OKtt9+f9VlIBuI9RsSBMJwa6vsTGdsu0mZVw5iSfYTxfl3W6q61R/SyLTrA3En
	eJuVxBhY0ZYONfQsiFzViFYk6p7uIljozQSLf1zcCDHgQOgesQ3ibpL14FYnGsq3
	SMlJxSsC5nSVECiUF0rMDqeotJRi7WdMnWh1+2q2nPSjSnyG2ubXILCWK9eTJJfJ
	2Hxdpt4yIm7zjV7cCwqykA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773844151; x=
	1773930551; bh=ZF546ExVdkQ5ArVhjKR5umS+gc+eyL+L55GnLaFRRW0=; b=T
	gdlHS2Miju98tMCtqeP5xGuBIEvYRd8Fxp1Gyohb4R8AAIsx4Wz7XLaSwiRqb9aO
	t/Gse5usS3Bh9RiHx05Os0KhSQlvY+qaLD530uUbcvaHB3JLdRFf6MggF9AREZPH
	bfnUe4LteIfJHOqauKexOTf8/S5VOMjtDkQdbjrmBNcgDKVOqH7jS5uXWnRu9wXr
	kSNKH0XbplRmPn46SJppEc+vnQNBvxRhw6NBe5mT5pLD6HIMVDN3XS/4wzo77kFp
	hUJ5o8I46vR1vPGAFhbYRwHzX+NACydOPOUnauUYNGEslyd9R6MY8KXqisNO1GJp
	UZnAgZelzVjIDt81N4iYQ==
X-ME-Sender: <xms:t7a6adCcwektrn5OIKuvP2Yp37gpTfm4PFQI1qgrHeWwH_MQNngrHg>
    <xme:t7a6aWV4oUXkXcnWYVwc1Ufki_LqHHhCTgfN3YsmKJJxDeukgP-OTdFamkWlEpzzt
    GS3ND_eHFencbTstl4CKmNgoEJupcwFPZMQT-erBwS2AlRhGASQlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegfeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepkedvuefhiedtueeijeevtdeiieejfeelvefffeelkeeiteejffdvkefgteeuhffg
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlvgigrghnug
    hrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehfuhhsthhi
    nhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhushifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhrvggrlhhtvghkqdhsohgtsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidrug
    gvvhdprhgtphhtthhopegthidrhhhurghnghesrhgvrghlthgvkhdrtghomhdprhgtphht
    thhopegvlhgvrghnohhrrdhlihhnsehrvggrlhhtvghkrdgtohhm
X-ME-Proxy: <xmx:t7a6aT8zv2YxEl2cEKNiqgFtYZ9xMBC5_GFNNSU7T1fwNW1o7mP3kw>
    <xmx:t7a6aU6zB5hXV8QXBYFv1papV7YVgnLtlho68noEj9jAMOHYbbqGhQ>
    <xmx:t7a6aUb0sbWG4HOMd19A3BgvusBhdw1rjR3SHkkyw35hI7FAEx-lIA>
    <xmx:t7a6ae8k4sAGCmKmnoLDFjS6f2eP2GAN4KuyDLu76877lJn_cnPO1Q>
    <xmx:t7a6aRXvajgXlyT6ogHVOv1YTq_mLJRAQTYvzQDkyEHRsWrq2JJps5zD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4FDDC700065; Wed, 18 Mar 2026 10:29:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Aj4MA5-83_jg
Date: Wed, 18 Mar 2026 15:28:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 =?UTF-8?Q?Yu-Chun_Lin_=5B=E6=9E=97=E7=A5=90=E5=90=9B=5D?= <eleanor.lin@realtek.com>,
 linux-kernel@vger.kernel.org, linux-realtek-soc@lists.infradead.org,
 afaerber@suse.com, "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>
Cc: "Drew Fustini" <fustini@kernel.org>,
 =?UTF-8?Q?CY=5FHuang=5B=E9=BB=83=E9=89=A6=E6=99=8F=5D?= <cy.huang@realtek.com>,
 "Stanley Chang" <stanley_chang@realtek.com>,
 =?UTF-8?Q?James_Tai_=5B=E6=88=B4=E5=BF=97=E5=B3=B0=5D?= <james.tai@realtek.com>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Message-Id: <e4c0187e-566b-42fb-920c-3cf73ed6cd6a@app.fastmail.com>
In-Reply-To: <405a9783-0f77-4ce0-8288-43eaada09cff@kernel.org>
References: <20260318114047.2804171-1-eleanor.lin@realtek.com>
 <405a9783-0f77-4ce0-8288-43eaada09cff@kernel.org>
Subject: Re: [PATCH] arm64: dts: realtek: Fix memory node unit-address mismatch
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026, at 12:46, Krzysztof Kozlowski wrote:
> On 18/03/2026 12:40, Yu-Chun Lin wrote:
>> The memory node unit-address should match the first address in the reg
>> property. Correct the unit-address from @40000 to @50000 to align wit=
h the
>> actual base address (0x50000) defined in the reg property.
>>=20
>> Fixes: b095c27fc874 ("arm64: dts: realtek: Add Kent SoC and EVB devic=
e trees")
>> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>> ---
>> This patch series is sent to both Realtek and ARM SoC maintainers.
>> While Andreas F=C3=A4rber is listed as the Realtek maintainer, there =
has been
>> limited activity recently.
>
> Unfortunately nothing new, likely two years ago I was also complaining
> on lack of maintenance on Realtek, but the solution is not to send
> patches to soc@.
>
> Solution to that would be to remove the platform, for example. Or work
> on maintainership.

They have already offered to take over maintainership, see

https://lore.kernel.org/lkml/3ab263bfa4904b428245152b83340363@realtek.co=
m/

> Did anyone from Realtek offered reviews to my patches posted 3 and 2
> years ago? I don't see that.
>
> Kent SoC was accepted under condition this will improve.
>
> I drop this from soc patchwork and please do not send code for review
> there, but either fix the lack of involvement from Realtek or let's dr=
op
> the platform if Realtek does not care.

As Andreas has not replied to the MAINTAINERS updated, I would
prefer to merge both that and this patch in the bugfix branch
for 7.0.

Krzysztof, can you also dig out your older patches and resend
those to James and Yu-Chun for review?

       Arnd
