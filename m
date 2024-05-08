Return-Path: <SRS0=UipH=ML=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9209AC25B4F
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 19:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65F75C2BD11; Wed,  8 May 2024 19:52:56 +0000 (UTC)
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9C78C113CC
	for <soc@kernel.org>; Wed,  8 May 2024 19:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E9C78C113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id C7E0C138012B;
	Wed,  8 May 2024 15:52:53 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 08 May 2024 15:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1715197973; x=1715284373; bh=IMIyXHu2wZ
	xir+ShHxRmPfBqCERLIp/nmTyslInbFcA=; b=irTvVL6NQj2sG4C0wifx1wNqCY
	Pr110BDj+0JFlE437JgHjgQZOtbyIDSCEyiyYRMkG6UTFktldw6MoPJNPNgZ7VCj
	2GHuHcqHNnZ1eC+Dt7Gd8F/A6NgGWFubesyO8a+z2J7DuR1aT05N3pYmSPIHXKLt
	oiwFh9IbPqrH7WS/f7TseyzYqK3WBy/EZY+GjhwA77sV1ukvpnCTliCO6qtiyc8j
	DwJQN+TyIUOaSFPRveQSMaG77qHgdac7Q8+50gDQ1XHJhF7BevLxbn44ueaIpR7s
	u7Tw0yel4BUZ/kf2aWU7hpHm5oPADQWL2sHCX0Sm9rWIih8Bwnq5vzEYEZ/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715197973; x=1715284373; bh=IMIyXHu2wZxir+ShHxRmPfBqCERL
	Ip/nmTyslInbFcA=; b=gSStlt4yD2EyjboBFWbV+JQdWooaNgOxPQ0MAyunUsMi
	PiffntyMyBfaNnBRg1rurd7wxsboX+HyA8gXicljqr4Or89KUmRe56KoIAank1P1
	FIOPpfmqOjqOX2WN49bAF9kdRkjYjphhmGtYTwqULkPwBPoFHJutUyoRVm+D0BI4
	f1E/KhEiNz6hlpjICf3jf4WAIu6FJ7hAYwx//6NibRhZlBxo3ha0AtHS3n2UT6S4
	53V5pVaJAMoobqicZFr+NaCt/N8FWxArxvbCvxQrFnNSmJuqnJ0n9bocNevWL/ss
	LGjEJECQ3kf7nd2YkfgnS2Lt7Ih5pSKKm3+Ej3hLnA==
X-ME-Sender: <xms:Fdg7ZjmrrC2CJea6gWGCV3qvftCgzG0O-GLEhHGTe0HHKQSp61EU1A>
    <xme:Fdg7Zm053CIui9twGNlrI-fOWdACxab-chkbfXQogErG61HV9tEjTSN-d2FkQKIVn
    UqQuUbDX2jl2cp98ow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeftddgudegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Fdg7Zpq5OCEQzn8HjeqGvqJmoyVZ_jhyZbh9x3iL5lr96VHEw4Uymg>
    <xmx:Fdg7ZrnOwgbZg8GK39WbcVoZ9GByn04QDe-6rxfcOrIBl6Q4rKQwQA>
    <xmx:Fdg7Zh3_eyOHnQCUBy2f-tAsk8OEsj3m3jhSwhO-Aj5AuLvZMhoocA>
    <xmx:Fdg7ZqtJolgopMJ9ZC_Ta0bx71IvzlyeUQXgk6tkKwWAU8xazsOMMQ>
    <xmx:Fdg7ZqwZDPlYSsSowrdQrjYwpZGKaqczBtjc-S0W8F5bMluUgqLHaReu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 685E2B6008D; Wed,  8 May 2024 15:52:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
MIME-Version: 1.0
Message-Id: <9c7ff142-214a-4329-b288-00f260ba50e3@app.fastmail.com>
In-Reply-To: 
 <CAHk-=whbpyM=Vgb8cM_aoRtZf7GDWq7Wa-cJ=J0DpVkfnd1PBg@mail.gmail.com>
References: <7abb76bb-eb4a-4136-af2f-6b22fbf3d79f@app.fastmail.com>
 <CAHk-=whbpyM=Vgb8cM_aoRtZf7GDWq7Wa-cJ=J0DpVkfnd1PBg@mail.gmail.com>
Date: Wed, 08 May 2024 21:52:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM SoC fixes for 6.9, part 3
Content-Type: text/plain

On Wed, May 8, 2024, at 19:22, Linus Torvalds wrote:
> On Tue, 7 May 2024 at 23:00, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> ARM SoC fixes for 6.9, part 3
>
> Hmm. Some of this already came in in "part 2", and your diffstat is
> wrong as a result.
>
> You seem to have done the mtk-soc merge again:
>
>> Arnd Bergmann (3):
>>       Merge tag 'mtk-soc-fixes-for-v6.9' of https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux into for-next
>
> and this part of the diffstat:
>
>>  drivers/soc/mediatek/Kconfig                  |  1 +
>>  drivers/soc/mediatek/mtk-svs.c                |  7 +++++--
>
> doesn't show up for me because I already had it from your
> soc-fixes-6.9-2 pull request.
>
> I've pulled this, but am a bit confused about how you missed your own
> previous pull..

I'm still not sure either what happened exactly, but I do see
that this is a pull request that I ended up pulling manually
using 'git pull' instead of using 'b4' because it had a malformed
URL, and that confused the rest of the tooling I normally
have in place to avoid this.

     Arnd
