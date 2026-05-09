Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E707713635E
	for <soc@lists.linux.dev>; Sat,  9 May 2026 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778313781; cv=none; b=IFJP+fMOzQr9qK1B7+7z9UDNrrNWvJRyteTbYA3LRF0bjEzkvZQiLdOhmtEo4LE0/CV0Gc+igGXkEd/2NXQPb7Z8dP/CxnarIgINAXh8fskoG3SlPsaVP/sd+Vc31CV7YFbWPX4+YK4iQRAkW/96rd/sjRZxWjHcFyN3YgRYlFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778313781; c=relaxed/simple;
	bh=/lf17yyEUTPDP+OC+lCNeYI7IPCLRn/v5FCHJOEhxPA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YBw/i8gzi4nB1jxtcGJ+QfuwdSVUUTsS+nyCg1vZT191aAsqfU8FrwdP6xiutuPi7G82IuWQWYUPjysONUdh9M/NdlYP1Pnix/+/zD0eSrPwkLt0q0f1fHmsYY9e6QoGN4FDDZ7lQuj/Pqqn2PccQiiEr/yBJ+nmAdU6vtxWg94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=BDVlyFgz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uWfTRfme; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="BDVlyFgz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uWfTRfme"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id A4CAE1D000EE;
	Sat,  9 May 2026 04:02:58 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Sat, 09 May 2026 04:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778313778;
	 x=1778400178; bh=yrfntWl4W5HJS2l2YpyONwp5nB8SHlEe8JED50fKuY4=; b=
	BDVlyFgzMa2dpVBWpDD1wy1TJbmNXWc9lW1GNL7Z/bCX72zdKOlpRffs6jlM2H+B
	DLc4d/tsAAtRy4BMUUUvgIt5CZnI6rN4GWkK1dil0fmRbzIseZ8u+klncNBQbQmg
	BP7uDslB0YlgKx3V9CqOj8zlVyvKIdvIbNCeU29GZZFNVlwtU8TKIFQN0pJTKgy/
	vUEc/K0WWtVCGg6Yq4CSUy6ZyiWawChUHThWKaCII2RZHY37XN6ZEEIKEIy0ICE3
	NrP87tB3aB8+5dnbZ+I4iiXAmTEg5wp/3JO2odPHVGxTQ0EWLQqlnah8vvWlwd6L
	sAnK6bxk3NlB0hHKlHXF8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778313778; x=
	1778400178; bh=yrfntWl4W5HJS2l2YpyONwp5nB8SHlEe8JED50fKuY4=; b=u
	WfTRfmeeyBAwt5qHL1yynyQqkX6l4/N6wmUyD/E9LC8Vpy89n+UD4VrXtX30VOTT
	GwByB+NZoGJA/IIa+9NmjoiHXrz8k/nLC0MSLlcMC9NV1HajMtKzUXCAtenxFESm
	xtPp5S03spmEgws9bgM1nIHaZFCbFZqQXyna1qRHklsUtS/8B4UqyktRUZ2k+DEb
	Rw8WXcJgAEXsXMgmCepASuwUkbZGnQHF1F8Il+ejGu6nrhjHMAdbLuNoLGGxnXjc
	lOZTtZdFOS++85TrgS+VBW7slwMQJegiO3pAbZebNV2Ah8Y6N68pRKyWH0eCSF0P
	07//aFy8VBx+hbIu07h5w==
X-ME-Sender: <xms:Mer-ac6SG6gRNUKwLr2Av6hWgCCwIJ9NOFmq7vr9wlpmM3PzZgPMzg>
    <xme:Mer-aYtpGS-g7uccyvuq3DOnvBu_vtW_phzUKncCPn1a2Gdx5-9rrjVGdzU1tQ02f
    24RDb7h6XsFCRrutTDi4AIWrqB_lWGIRSHSMVM7GmIhra_-QRih5n0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduuddvjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghrrdgthh
    gvnhestghigihtvggthhdrtghomhdprhgtphhtthhopehthhhivghrrhihrdhrvgguihhn
    gheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugi
    druggvvhdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehoshhs
    rdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Mer-aaxbsKHJwdNdeTsSojz2gzxntrYzY2ZqfTkrDer0MZ58clT5Zg>
    <xmx:Mer-aW_-soMd6-qNgtYeWY50_weMb_DD9VrX_NDzeeEIbcSndOTiYQ>
    <xmx:Mer-aajj1vsi_xtqM0EGt8_NEf6LqySxi42gVRJVgnQmibkYyi15mw>
    <xmx:Mer-aVE-NSzSvL9XyILhuSkfw8wtrttFwh2M-x1VCkIDHToQaGqDOA>
    <xmx:Mur-aWO2G92Pr_CgyeHrmfWGKNM6gbAgcKFIM6JT13WI8IJHqBNlgr93>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C0DC11060065; Sat,  9 May 2026 04:02:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AVNaXOa3_wlF
Date: Sat, 09 May 2026 10:02:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Chen" <peter.chen@cixtech.com>
Cc: "Thierry Reding" <thierry.reding@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 soc@lists.linux.dev,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <183e763c-980c-4ca4-acdf-331351409f14@app.fastmail.com>
In-Reply-To: <af6K2w5uxcrbs3dR@nchen-desktop>
References: <eed505a9bd38a5fd015e2d18a57fdeb0@kernel.org>
 <af3AVz3CsHJM7jTf@nchen-desktop>
 <a6925bf5-2ffe-45de-9ea8-90240a2abfa3@app.fastmail.com>
 <af6K2w5uxcrbs3dR@nchen-desktop>
Subject: Re: manual merge of the cix tree with the arm-soc tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, May 9, 2026, at 03:16, Peter Chen wrote:
> On 26-05-08 13:06:02, Arnd Bergmann wrote:
>> this is not a problem you caused, just something to be aware of
>> when you send the pull request, and to check that Thierry made
>> the right choice in resolving it.
>> 
>> > Arnd, I deleted this patch at CIX next-tree. Would you please help queue it
>> > in your soc/defconfig:
>> >
>> > https://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/
>> > branch: cix/defconfig
>> 
>> Please send it as a normal pull request or patch to soc@lists.linux.dev
>> so your change gets mered using the patchwork process.
>> 
>> If you send it as a standalone patch, please make sure it applies
>> on top of the soc/defconfig branch. A pull request is also fine,
>> and that would normally be based on -rc1. Obviously this causes
>> a merge conflict, which we will resolve during the merge.
>
> Thanks for explaining it. So, for linux-next merge confliction patch,
> how to handle it better?

You have to look at each case separately. My comment above was about
the defconfig conflict, which will be resolved as soon as the
conflicting patches are both on the soc/defconfig branch.

> Option 1:
> Send pull-request to SoC maintainer once linux-next merge conflict 
> happens, and
> depends on SoC maintainer's tree at linux-next for testing
> Option 2:
> Rebase on SoC maintainer's tree, and still keep patches on SoC 
> submaintainer's tree
> at linux-next for testing
> Other options?

Neither of those really.

You should send the pull requests for the SoC tree as soon
as it makes sense for the contents to be merged. If you know that
there is a conflict (because you got a message about it
for linux-next), put that information into the pull request
text so we know about it.

If the conflict is against a change in some other tree,
we still need to know about it, in order to plan the upstream
submission.

Most conflicts are entirely trivial to resolve, so
upstream maintainers are usually ok with them. If you
encounter something that does not look trivial, that usually
means we need to talk about it and come up with a solution
for that specific case.

     Arnd
