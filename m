Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F45376
	for <soc@lists.linux.dev>; Wed, 30 Jul 2025 06:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753855272; cv=none; b=DqYUknucBCIOvr6T6q5lQI2Tp4PTIa7S5o0fRDKcOkbPq30sVnld+ZzL8Srt7J5YhNCAtzSSDCzu8xDrpS/ulsB21wdblJQNmA/QYfXJaAv7TlSpQMYjoizLsPXqZYWSEHQD6QnXuq+TC9peM/o1swbODIL03ct0mDCtbhgegEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753855272; c=relaxed/simple;
	bh=+GsPm+YsoK8YYTSQ5UJyT2vBa2QDZ+MrUB1Vld8FNok=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=J4YUa3+0+r/Tx+qawSLzqfanXmxT9Jrfjhhgw3NRSEw8qOPEQt1T8msq2ulnEyYOaqFVboFuW2WZTLOwuka1rqMSgCuA2/hM19/jE1g8IdYRuP8I1w4c8+s1sq72T8WpyoCVl4/hD9fQca9/q9zEQrD+d+WQ6RaVndkqIMTBigs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=iwoNPyqH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ELhe+35A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="iwoNPyqH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ELhe+35A"
Received: by smtp.kernel.org (Postfix)
	id 5698FC4CEEB; Wed, 30 Jul 2025 06:01:11 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59203C4CEE7;
	Wed, 30 Jul 2025 06:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59203C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DE3CD7A23B4;
	Wed, 30 Jul 2025 02:01:07 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 30 Jul 2025 02:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753855267;
	 x=1753941667; bh=TpgfqUjDTUzvCSS2CBKYSETOJ96JgBh7t9ZmWs00Huw=; b=
	iwoNPyqHE+rTaigtpuiYhzTZjgKK7CutTOTtzPmh1XdQbOBaFpp/TEJCRJpMpYNA
	FZ9HDVpPnVf/MWnU3gsU0aCFT8Ze2Lxxp9V/Z+9LiQ+m/miRdWEy+nDFocqmBqq6
	wYQebPzy0ZCSLllpGZFcs98NDZL7lom7j8edEVkUVFSuMPcwN7nXza8S85muFr4P
	QgTr26RXeKGT/a3LZVrRjtfO0LrG1A+og8yFhV9g7mPQokqHIUkrFr/sA5yO5S/r
	UNJU+xmMiTLHNxQ0QNn/40z5asg5t+vh0d1V8YlRdpOjxd5e66YTRn7ZHYQlxMJx
	GkqX757vNJPUwTGIAOonhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1753855267; x=
	1753941667; bh=TpgfqUjDTUzvCSS2CBKYSETOJ96JgBh7t9ZmWs00Huw=; b=E
	Lhe+35Ahrgdd5UXaAkzckSXl+ZysYCdJtWZjWdSQhhOAF/+IYRjncLQJwUoOZvB5
	RYjtsDIjXyMd7Avs/hWg9hN4KfPl1zzXwTBH4LbDVNIhLN7aixiCpzveVE7dzwqd
	lG0UnjartYvl6nF3ETOpIAw08QR4yXx2Dm9Ry6oO5vwVcf3Ieq0Hdk+77Bz1OSHu
	MWBG2PBVpMqpXrqimpgrRCakSxVsYpiqQ8kF9s/g4j19/xwjy0KKz7iu/BlLNaic
	mX+1Hsqlb9vEDIzeSWSCzlIk0sl9wu3/zWDnHM577o66J0Q/Y2g3+pJjdimtl+OI
	8H8EkjGEzkIbOR2Bj+hTw==
X-ME-Sender: <xms:I7WJaI6MWQ_Wk9LTPjJCuB-fT14_8ZEz6hXjsdrlMNssEm92JSfpaQ>
    <xme:I7WJaJ6IRvyEgpEmufD_LcPSKjpEcsppTXe5XT21iQCFIDhuwLVlECxz2XfwbuODf
    s8u_GP1MXvvjL7u9Sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljeduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeffudekleehgfektdekieetgeetgfeffedtvdejteejiedtledthffgieetjefgffen
    ucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgu
    sgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehflhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghp
    thhtohepphgrthgthhifohhrkhdqsghothdolhhinhhugidqshhotgeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghn
    ughrvggrrdhpohhrthgrsehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:I7WJaN6uKPl2NxnEX0D-b-uFMTQHz5peLqbkMOz-hWuUHGl_6K_EWA>
    <xmx:I7WJaFf2_8krv8MpA_POQEAGdftQUxOIcsnUF6mfvwn7fCQJQbY8UA>
    <xmx:I7WJaBAbolwbn8JzqtuAHljz-LGa1rI68WHXIUdBfDE5i2_dANJFCA>
    <xmx:I7WJaI8bV5Ur6pYFe1kMR3o97lBTu0RMd1dhVL-G_173VLnMzZzlkA>
    <xmx:I7WJaJuYWUPbWLMJPTXaLzEs1NguPVV3blyms_3kfCR9Nlra7ZuhwIlw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 24BE8700065; Wed, 30 Jul 2025 02:01:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Td46d4ad4e5bb7d37
Date: Wed, 30 Jul 2025 08:00:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Andrea della Porta" <andrea.porta@suse.com>
Cc: soc@kernel.org,
 patchwork-bot+linux-soc <patchwork-bot+linux-soc@kernel.org>
Message-Id: <78b8cc2a-b76b-44c5-bc3d-c2017be75f9d@app.fastmail.com>
In-Reply-To: <965bf9c1-0da6-4851-a106-f90eeceebe96@broadcom.com>
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
 <175311192825.94241.11000772896570883971.git-patchwork-notify@kernel.org>
 <965bf9c1-0da6-4851-a106-f90eeceebe96@broadcom.com>
Subject: Re: [GIT PULL 1/5] Broadcom defconfig-arm64 changes for 6.17
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jul 29, 2025, at 23:03, Florian Fainelli wrote:
> On 7/21/25 08:32, patchwork-bot+linux-soc@kernel.org wrote:
>> This pull request was applied to soc/soc.git (for-next)
>> by Arnd Bergmann <arnd@arndb.de>:
>> 
>> On Mon, 30 Jun 2025 12:02:12 -0700 you wrote:
>>> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
>>>
>>>    Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/defconfig-arm64
>>>
>>> [...]
>> 
>> Here is the summary with links:
>>    - [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.17
>>      (no matching commit)
>>    - [GIT,PULL,2/5] Broadcom devicetree changes for 6.17
>>      (no matching commit)
>>    - [GIT,PULL,3/5] Broadcom devicetree-arm64 changes for 6.17
>>      (no matching commit)
>>    - [GIT,PULL,4/5] Broadcom drivers changes for 6.17
>>      https://git.kernel.org/soc/soc/c/aee4eeec7e5e
>>    - [GIT,PULL,5/5] Broadcom maintainers changes for 6.17
>>      https://git.kernel.org/soc/soc/c/2b12a400dd94
>
> Thanks for applying the changes, can you confirm that you also intend to 
> take in "[GIT,PULL,2/5] Broadcom devicetree changes for 6.17" for 6.17, 
> that appears to be the only missing from your notification emails.

Hi Florian,

I don't know exactly what happened with the notifications. I did
pull the branches in two batches some time apart, but as far as I
can tell, they were all part of the pull requests that I sent last
week and should now be part of Linus' tree.

Can you check again if anything is still missing and send me a
follow-up pull request in that case?

I tried to make sure that the information about which branches
I pulled is visible in both linux-next/arch/arm/arm-soc-for-next-contents.txt
and in https://patchwork.kernel.org/project/linux-soc/list/, both
of which show your branches as Queued, though some other branches
are still listed as 'New' in patchwork for reasons I never quite
understood.

     Arnd
