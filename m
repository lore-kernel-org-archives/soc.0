Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800F1419A4
	for <soc@lists.linux.dev>; Fri,  8 May 2026 11:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238385; cv=none; b=p4A4PHSoym0TlUQ6eOe74S3SF6g2+poQnVLvTxcEj0yan39xn9Qw63PeXPPHfXtvnGF/1OXYGBzwl2nUgb465UrCMMlTYViH2oa+jJokDAO5uHnLtM24+rPYt62J3j8mHA+JP4J7OAD85mM18K7I5QDKOYznMrJcIICfdCT6/Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238385; c=relaxed/simple;
	bh=+yEPBYX7SLgPaaA5cCyTO3Geta+MSF9sInbff3aFmSc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=n38/Wn1Pib1e89Ds8kAQ9zVWSDEQPDnVqyV3z4ukcqK9E2wL5zAA2EzvkXlbxiQDJ10/30iFhsY+vo8WVRO16ho2ivmMqylQQc4x10vC3np2CLFLgR4ib/MHtVZIjKxYeYqAEpykTzLt5ePkp+q2E2gfz3UKx2wUu6vWxNbINtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=jFuyDpBp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OiGNkD7f; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="jFuyDpBp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OiGNkD7f"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 916E2140007E;
	Fri,  8 May 2026 07:06:22 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Fri, 08 May 2026 07:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778238382;
	 x=1778324782; bh=hkQIjzZkdHZ+Jjp/iHN6387eQvQT3yoevGVHS4MBjWs=; b=
	jFuyDpBp73js6U6vu7/1Rb4D9Y66SJvX5gikVM0YWOxWAk02/zw8PmtG2iKOZOH2
	hRtUlDdg85kOrTzugDFRQOiWuzU+APYfyLbgmENdFykd4+MYRIJhm+CsJiun8Clf
	3fte/A91Mr86Lu9/3XH4W71BjhA5CtRHg0LLt5tPEGflZOprEC+43q9tS1xpizO/
	hLBFqKoSSKT/S63xdjeRgrwT+SnUfWFZMalFvN75yQlGbr/iIpE/QaHEm/NSaF3j
	5+WvR8hogzIvUFir/1qNbPGRp43gfBITp2+cRx0qDNDw7oJYY02BjfUI+e4tSQfx
	VUVP9fMcVT0MdKfqcsK2Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778238382; x=
	1778324782; bh=hkQIjzZkdHZ+Jjp/iHN6387eQvQT3yoevGVHS4MBjWs=; b=O
	iGNkD7fT0gMMAk9z5KA5qe7dz+ssVga94mKQZBxjP+rGQZ/Ge5m7nKMNLDg8aUBJ
	qgKHievbZrWAWwh8W6HfhVy5O5XH+iuMdIIKfociUIg0catbldwxHF40p4WHTfgo
	PkmRQ/l8x5kUiipRM7hkM519vA28onkTyznn/zBcWyVd435JxlsUYtl/M/+pQbuA
	qzsc/nNF3R749ufEBwPJPvmFbby6ZMFgWQv1tSB7ZVOsBQ3x5C1PylE5a+kaGYbX
	xrlCJ7H3gyxC95zfi4VLabJLxAZd6lcCcsDT7AX45hyWqsSc3vDciTMLfuprvs2Q
	41IaWj1b4ukJJf4Yd3zXA==
X-ME-Sender: <xms:rsP9aWNiSSK_9p5jmjDaOxPNj6NBLKKutPyOYWyztYTQTZ214N_5qg>
    <xme:rsP9afypdvDh8fzeXkK9rxmAkj3PCeh4W9RiVvMxeWJVIPEAQYwwjcRjsh6pFewxh
    1gumrpcqcM0bz8l0_fuAWQAhaignTT5TgoXnUurUTyc1cRdQohFOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduuddtudekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:rsP9abnRqeZ7eLVfw6y4I090RwDGCd43SIjMo6_jqSNsfBOX4ctpLQ>
    <xmx:rsP9afjv9RsZ1kUsNAbXX6uM9Io29Kzh8KmJHITPjhYWk1JWW6o2sA>
    <xmx:rsP9af3QpG3PmWE3BbvZH0lbkYD_tND58TER6XOruEUM3T6bA-xFVw>
    <xmx:rsP9aYKpeSSktWXLTOhm0oL6NjxQGBwI84yIXXWHRhZpJHtTvKxbxA>
    <xmx:rsP9aezY3bchyC4DktFYdFmj6WIIyCYgMtodRyGO1wVGZfNKiV9mDSnV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6107C1060066; Fri,  8 May 2026 07:06:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AVNaXOa3_wlF
Date: Fri, 08 May 2026 13:06:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Chen" <peter.chen@cixtech.com>,
 "Thierry Reding" <thierry.reding@kernel.org>
Cc: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 soc@lists.linux.dev,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <a6925bf5-2ffe-45de-9ea8-90240a2abfa3@app.fastmail.com>
In-Reply-To: <af3AVz3CsHJM7jTf@nchen-desktop>
References: <eed505a9bd38a5fd015e2d18a57fdeb0@kernel.org>
 <af3AVz3CsHJM7jTf@nchen-desktop>
Subject: Re: manual merge of the cix tree with the arm-soc tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, May 8, 2026, at 12:52, Peter Chen wrote:
> On 26-05-08 11:12:23, Thierry Reding wrote:
>> 
>> It looks like the patch from the cix tree somehow partially landed in
>> the arm-soc tree, even though it wasn't pulled yet.
>
> Hi Thierry,
>
> Sorry for about it.
>
> The above CIX things defconfig changes have reviewed near to Arm64 v7.1-rc1
> merge window close, so I have not sent pull-request for it, and it left
> at cix's for-next tree. These two days, I rebased cix's for-next tree to
> v7.1-rc2, and this patch is on top of it.

Hi Peter,

this is not a problem you caused, just something to be aware of
when you send the pull request, and to check that Thierry made
the right choice in resolving it.

> Arnd, I deleted this patch at CIX next-tree. Would you please help queue it
> in your soc/defconfig:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/
> branch: cix/defconfig

Please send it as a normal pull request or patch to soc@lists.linux.dev
so your change gets mered using the patchwork process.

If you send it as a standalone patch, please make sure it applies
on top of the soc/defconfig branch. A pull request is also fine,
and that would normally be based on -rc1. Obviously this causes
a merge conflict, which we will resolve during the merge.

     Arnd
