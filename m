Return-Path: <SRS0=7GCi=6J=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B34C64EC7
	for <soc@archiver.kernel.org>; Mon, 13 Feb 2023 15:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A158CC433D2; Mon, 13 Feb 2023 15:16:16 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BADA4C433EF;
	Mon, 13 Feb 2023 15:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BADA4C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 9B3175C00C2;
	Mon, 13 Feb 2023 10:16:13 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 13 Feb 2023 10:16:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1676301373; x=1676387773; bh=Kf21iTfnOc
	0+gof5tcdtuyQ6cwJSyn5AiREfLstk/+8=; b=WsrWRYLFY3iXtoXKqkfDMKVSZM
	AlXa9zzZUyEE2yK+voeMWWtDDtJ6S9JiVVwnPJJ1Kjiz0yprUva3qnuqPHllP9lD
	bolY1/aE79/OfRtsMOo+Ke+9bbzR3qc/Jzvx6bWbZ4yULDYKaM6ZD9oGdMjyJQOc
	euLYlfE/G3nJb5e6bixh5L/8JvxtKBTvHOVaFoBx4agY58VBqT5w40kizVLnyVjz
	qzMqve59ehaaLoL+Bq9Y+I2lPm+16e+X/XfWIbZJTZHS//bNjfzJhH7GkYc8ZoCK
	IPglYQFp5EHPVDOq/JtHPxPUGc2SOaSxfingjdaAvd8VHM+esHch7pSQgfiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1676301373; x=1676387773; bh=Kf21iTfnOc0+gof5tcdtuyQ6cwJS
	yn5AiREfLstk/+8=; b=YL9VlNLu8+grsInifr7V85mTyOxIn8EP3VcMHQdgGKaZ
	2egufunr0fxxGhA/OCTAleBbghyPyLagzaeWZi0iSHflGcs8AGCsvjFcL9u8pQiy
	BWurJTJUNkmRAgQWRVzjcn5m7NM99Fk97h+Xn+apZB6IMPgZJF2T8f+fiA65IvG7
	WkYb9CsA+8KKy21tYQvaua32dezc4MD0vCOZUO55IPGlTCxx9h5gUwYqb2Gq+oYF
	+PLOsH2e4ytTrjj/yPbz1BxWvNTwSobx/3O2npHAsLsY6/wHnSRT+3V733nlBY7y
	kMysgo5eu3qGMeGo7++ODEoEhaTzKsIs3t6M7x1fkw==
X-ME-Sender: <xms:OlTqY6nOVMUPNtnOyIqMhfqaKSvPNZxK14yqpv57AzvPr_gMiI9l0w>
    <xme:OlTqYx3wiZANxaPMnNbOM40iA5eg-mE0ZWQQMJPdm0ZZ_GPUkJkB8woCcyt3GOBxY
    XcxC8hi7KGNUOLTXYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiuddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:OlTqY4qikfA7yh-ZrjhYk84ukOtBH-js5gY0C8goxMd_uQmsoHSTlg>
    <xmx:OlTqY-mcJQ7MjiMieLE36JproXG-dHJ3avycCQJI3vO40k5Melhi-A>
    <xmx:OlTqY43pDMJZtFCwCIpTKxbfA8oQkW4mX_ioafzp1iKOM1IFxNiyZA>
    <xmx:PVTqYxv5ZKNvZy1gJC6oPZkADJZnlVXagBgxNRVRacpiL-_MY8r38Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C9FF5B60086; Mon, 13 Feb 2023 10:16:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <467e7a7f-1703-4f13-8604-6d582e4f9b3e@app.fastmail.com>
In-Reply-To: 
 <CAK7LNASRz-apG_pNwvNOqxXy+-tp+WGHV--g6yYU-UQnZx5tgA@mail.gmail.com>
References: <20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org>
 <20230203-arm64-defconfigs-v1-3-cd0694a05f13@kernel.org>
 <CAK7LNASRz-apG_pNwvNOqxXy+-tp+WGHV--g6yYU-UQnZx5tgA@mail.gmail.com>
Date: Mon, 13 Feb 2023 16:15:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Masahiro Yamada" <masahiroy@kernel.org>,
 "Mark Brown" <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Nicolas Schier" <nicolas@fjasle.eu>, soc@kernel.org,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: configs: Add virtconfig
Content-Type: text/plain

On Sat, Feb 11, 2023, at 08:37, Masahiro Yamada wrote:
> On Sat, Feb 11, 2023 at 4:54 AM Mark Brown <broonie@kernel.org> wrote:
>>
>> Provide a slimline configuration intended to be booted on virtual
>> machines, with the goal of providing a light configuration which will
>> boot on and enable features available in mach-virt.  This is defined in
>> terms of the standard defconfig, with an additional virt.config fragment
>> which disables options unneeded in a virtual configuration.
>>
>> As a first step we just disable all the ARCH_ configuration options,
>> disabling the build of all the SoC specific drivers.  This results in a
>> kernel that builds about 25% faster in my testing, if this approach
>> works for people we can add further options.
>>
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> ---
>>  arch/arm64/Makefile            |  6 ++++++
>>  arch/arm64/configs/virt.config | 39 +++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 45 insertions(+)

I like this a lot, I think that is very helpful and we can always build on
top of it later with other fragments.

We could still combine this with another Kconfig option that
just hides all the real SoC options, which would turn this fragment
into a one-line file and avoid having to update it whenever platforms
get added.

> Yeah, I have a _local_ script to apply
> a similar config fragragment.
>
> When I run QEMU, I disable unneeded CONFIG_ARCH_*,
> and also disable unneeded sub-systems.
>
> Not only me, many people are doing similar in their local env,
> I guess.
>
>
> Of course, I will not upstream my set of CONFIG options
> since it is just my preference.
> After all, this depends on people in my opinion.

Do you have an opinion on the other two patches? If those
look good to you, maybe I can just merge all three through the
soc/defconfig branch for 6.3.

      Arnd
