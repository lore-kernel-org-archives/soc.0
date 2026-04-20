Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AB1264612
	for <soc@lists.linux.dev>; Mon, 20 Apr 2026 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776698782; cv=none; b=KlpyUE+T0d8sO7LfS8nS7U/fZf28/0SK1+/Emr4dDcQx0CbQwXh20G4YRANp11vTQc7TV2UasOCzs5O4o0cQgdaV+Oi1Ozcvbx6OkuabxvZehx0S2+RTEAzgRZL+hDTA8GG5pJTnMqJNwjOAW/wuJyI8p0d39lEnCfAX6hkvVy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776698782; c=relaxed/simple;
	bh=JKExE7kIMYLc0V/QX1up1I0ywNHl/LVsUKJ+YIq/5zY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=q3HS/9IT1OGcbDatclDxJ9S6bpIHZk9IgsNUQ5YHCiPTk73hKuvbPZhmlFuMpSpQxiFnJDMeeQzV7wURyplkU3AUN8ybcNyXbZ8PUMX6G2CWjGu9/3Efhc7Mr9HrRzQGfTL41bX1SthRbS3/vq0ZABXeiK4kIZyW2poNa9aFbe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=LHjUKDh/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KsmxS2Rb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="LHjUKDh/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KsmxS2Rb"
Received: by smtp.kernel.org (Postfix)
	id 9B9D7C4AF09; Mon, 20 Apr 2026 15:26:21 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 569A8C19425;
	Mon, 20 Apr 2026 15:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 569A8C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 342427A01E5;
	Mon, 20 Apr 2026 11:26:18 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 20 Apr 2026 11:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776698777;
	 x=1776785177; bh=WG64U7O4YHnHzzDsRKT6WiX+Di0okWd+p5FmNql78I0=; b=
	LHjUKDh/6YwZF3oR9vdJzD7M+fPjphxXhkKb85uaGq3pWD8ExNg8B1luJVGGMOI2
	7WI6xGWIHq9OQ8cGfQqqBcmEv/yf4lecltsC2rNl/f0zmkV6c9PEgELfois8hZ99
	BtXqQGEWdnESMSHmrgZmP3hMC5OLByiGc4diR83Y86kF8HsKK7k29GSTgmXiiX53
	jhT0uiG0hxWiKMFb3VnigvbVbqAhNvzLTWtfimzZq7c2p4szelmaK6F62XUJ1ErZ
	KYjtUXmKZQatOkab2UOeIsbpxTPvMPRfnNHz+FWphXbz8LpMHly/RX4j8eYWKjZI
	cRLNuHpPzd5xzq29/PG2gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776698777; x=
	1776785177; bh=WG64U7O4YHnHzzDsRKT6WiX+Di0okWd+p5FmNql78I0=; b=K
	smxS2RbBcLv7q2JTz1AAVmSmISofcDDnT2njoy5/HEfYyKUMZ9GuWxmibJ3ip6b9
	eSqN6nH+XkFJzCGvezLULhI3DPpDV88lh2u+iAfJslBZ6NysYyxYGftIHi86Chdz
	ixADTgAMPEA+fuTnAfo8rpWXmytfIihFq5EczfxSdn6PFENT49T9vu9aMckKvo9y
	eCvoCl8ZSG8EUjW6Pf7MNNhhVIaclsr0ATq1LSpjJxq8+R7U250Ov6GZQcyeKRvK
	KcvvcH++NVriD+IHKgDx79h8Nyd9m8UihPJJ18/euZcFMHg15iP1BHXEtYQBb0Ss
	3BHqqW9K3dNcSZWodghnA==
X-ME-Sender: <xms:mUXmaSFUTEo7pwNymPfKyfYUBF1BAWM0CH3SWYJo4ixhNhfXKKFNbw>
    <xme:mUXmaeJLED6ij-xV1uBjXY46d8TOtWdW44evD9TXpezhIv-nF2CBUF5tf5MHCO9gC
    2oubllKoxyZ_lRemwbtAvCCghSi5C6C1CcVNSH0-64sEN_b2Azpqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehkeekkecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:mUXmaYlrZISYGLMpg2tCTD4mcOvQ63FQ1yFF-qMIGpMjIMnHITiHbw>
    <xmx:mUXmaSz-2hYVnXVwMWREH-DEkqCUjYIARuANc7cjkca_vtPzHgwX4g>
    <xmx:mUXmaVo3MgJmfQ_qgQ9FDgNgTQQjc1mcFA1jjUFFU7QKnBoq8aPyzA>
    <xmx:mUXmaZ5x4h698xrBFcGfH96fEkUJ-FrLGqwwhn7GDoSDEMziPrqObA>
    <xmx:mUXmaTyiqtym4SNWIFGkCfNlIjwal5buTf_nRL7lnleVoYpdAKyESemw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C2391700065; Mon, 20 Apr 2026 11:26:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AvG_jmLX_3YV
Date: Mon, 20 Apr 2026 17:25:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: soc@kernel.org, arm <arm@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <43ae9d05-5cc9-4f68-933a-99eb744756b7@app.fastmail.com>
In-Reply-To: <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
 <20260411-spicy-apricot-newt-afa8a7@quoll>
 <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
 <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
 <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 13, 2026, at 09:30, Krzysztof Kozlowski wrote:
> On 13/04/2026 09:17, Krzysztof Kozlowski wrote:
>> On 13/04/2026 09:10, Neil Armstrong wrote:
>>>>
>>>> I will wait with this. It might miss the merge window if v7.0 is
>>>> released this weekend.
>>>
>>> Ok wow, just like that... I mean the amlogic DT is stable, all patches
>>> patches bindings checks and none is critical since it mainly touches
>> 
>> You sent your pull very late, just before v7.1, and skipping late
>> posting is not a new rule. It was always going late pulls, which might
>> make it or might not make it.
>> 
>>> new platforms and the incriminated commit is a low priority fix for
>>> 10y old development boards...
>> 
>> I did not check which commit was not in next. You can provide feedback
>> to my reply with actual argument, because such explanation was missing
>> in tag. Instead you decided to be surprised that patches needs to be in
>> next...
>>
>
> And to clarify, I did not say that pull will not make it. Considering
> the timeline:
> 1. You sent the pull on 10th April, Friday
> 2. v7.1 is released on 13th April, Sunday
>
> and that people are allowed to take weekends off, then there is simply
> almost no way that pull can be merged before v7.1 is released, so by
> definition it is a *late pull*. The policy for late pulls, like that,
> did not change.
>
> Lack of exposure of a few commits to linux-next is only the explanation
> why I did not pull it while doing last round of pulls.

I'm looking through the backlog for any missing fixes that should
still make it into -rc1 or -rc2. Just a few more points to add
from my end:

- I had in the past always trusted platform maintainers to only
  send pull requests when they felt the contents had spent enough
  time in linux-next already, but I did not have any scripting
  to ensure this was done correctly.

- I see that only a few of the patches in the branch got applied
  during the fineal days before the merge window, while the rest
  had been part of next-20260330 or earlier. Aside from just
  sending the bulk of the contents earlier, I think the best
  solution on Neil's side would have been to send two separate
  pull requests, for the earlier and the later contents
  respectively, even if sending them on the same day

- I see that some of the late commits are clear bugfixes that
  we should still merge as soon as possible. Neil, can you go
  through the branch and send another PR for anything that
  qualifies as a bugfix? While by now it's clearly too late
  for any of the new features, there is no need to delay those
  any further.

      Arnd
