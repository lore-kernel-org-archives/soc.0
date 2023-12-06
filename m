Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C70DC4167B
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 16:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6DA91C433C7; Wed,  6 Dec 2023 16:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A155C433C8
	for <soc@kernel.org>; Wed,  6 Dec 2023 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701880828;
	bh=Mn/vsehwV0EopowsP6c7tz7pI9eAdX7Oh2TdBUxpflQ=;
	h=In-Reply-To:References:Date:From:List-Id:To:Subject:From;
	b=QSDogPt2qAYZ7WKV/bz1K6kUpVFC9PatFXfH/MQlkZUsqj1bSFG1mCY+gw5Rnji9Q
	 fvgE9wGVb84fMNgCQDYaWwROr/glpBvx1Fs16ZDgawyMEGnTUCrgpl9QAdLnDDqDV2
	 ordlvD+7Is8GZbO8aMwZl5pX2/PdvT2uyXfjE+Ue3moexaEpEIwbAEnFB0mHDIRhzn
	 o5whWkj9BBoK8Td3G0qPfYIwr9oNL0SGkoO3Umu10BaHuOOJgBxwAt61hVUs7Dzre+
	 70pvh1IQG/3jDoqrtmuEL1jkS54CFSyH7KR+ez4X7UhokdAcx6UNYNys05AdBxV21D
	 Pe9CDcZ119iMA==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailauth.nyi.internal (Postfix) with ESMTP id 0BA2127C005C;
	Wed,  6 Dec 2023 11:40:27 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 06 Dec 2023 11:40:27 -0500
X-ME-Sender: <xms:-qNwZVdJGYtAwBmZoLos9-lvp-1XkEDLfbJSjAvWAbYGq4zr6JsPWg>
    <xme:-qNwZTOA0kcHwklOV0fC6YrsJm7Cn_oFzXvRcqerwHRSeJr59yOV3MQu6oflMXPxR
    z6-b6SQW8WiJJ1068g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudektddgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpefhteevteffveelgffgudetfffgheeiffeujeekvdejteevffeukeevvdei
    udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddv
    gedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdrug
    gv
X-ME-Proxy: <xmx:-qNwZei_MhSYRN5QXfAcjM-IGF_W8TvZYFsqsbHkp2L1Yu4UNscKpA>
    <xmx:-qNwZe-RyZBlKp399xPc0ANOjyFPHbRTyUwMCLQ69o59VY5tRg-jxg>
    <xmx:-qNwZRuhh8WA-4JqsjXHPSwyv23Sbrhw0OnsIAqat63FAw9HK8lJdg>
    <xmx:-qNwZSVMgX_qi6VAHRe0kI1PR9LJWSESY9HlN5Wu0ThCn47Q0Kq2sg>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AA41AB60089; Wed,  6 Dec 2023 11:40:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
MIME-Version: 1.0
Message-Id: <7c9b9b51-9ce6-4214-809c-81b39cf4c555@app.fastmail.com>
In-Reply-To: <20231206162337.emy3kirnsmbgpvye@bogus>
References: <20231116191603.929767-1-sudeep.holla@arm.com>
 <20231206162337.emy3kirnsmbgpvye@bogus>
Date: Wed, 06 Dec 2023 17:40:06 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "Sudeep Holla" <sudeep.holla@arm.com>, arm <arm@kernel.org>,
 "SoC Team" <soc@kernel.org>, ALKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] firmware: arm_ffa: Fixes for v6.7
Content-Type: text/plain

On Wed, Dec 6, 2023, at 17:23, Sudeep Holla wrote:
> On Thu, Nov 16, 2023 at 07:16:03PM +0000, Sudeep Holla wrote:
>> Hi ARM SoC Team,
>> 
>> Please pull !
>
> Gentle ping! I see you are pulling the fixes now. You may already have
> this in todo list, but since it has been close to 3 weeks and during the
> LPC week, I thought of replying so that it doesn't get slipped.

Pulled now, sorry it took me this long.

This one was indeed one of two pull requests I had missed while
going through the backlog but I would have noticed it today.

    Arnd
