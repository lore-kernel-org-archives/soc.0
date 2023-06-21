Return-Path: <SRS0=fGjY=CJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96003EB64D8
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 13:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5DB8CC433C0; Wed, 21 Jun 2023 13:11:12 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F33DCC433C8;
	Wed, 21 Jun 2023 13:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F33DCC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id E5F0B5C0099;
	Wed, 21 Jun 2023 09:11:07 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 21 Jun 2023 09:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1687353067; x=1687439467; bh=V2
	hL3U1w2JHdrbmWngS75xdGAMG7mQ5v2+dXo6i8FSw=; b=gyK+/3SaYpg9dq0ox1
	ZxIVZujbI0RrBAvN6QAJbGyj6/vWAsG9a1kmTJODjFhbz9iRBEa4rJlY2i8Ypj/Q
	i6sWrFwoy+iH2oYXC6fFbUIArWGNcEUecYL9ED1dGAH8rHf1MHdJKNy+c6qR5w8T
	Vx1UHYRSsFcB//WL10bflgx4VzU12sagAJAGLLnfj41RDWbDHIebN01+eSzuCQB+
	ku3+YeE4jH/UGtTbTAMiBwkzou3LpaI5pFQ3shLx6ec5V0oVES+oQ/etN/9tg93J
	j5Q235Pdo6p2JB/E6DMiLRVDCdXgnW/+cEXHqLNtdudC1F3c+/qnApZ7tx+RPDKH
	tgcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687353067; x=1687439467; bh=V2hL3U1w2JHdr
	bmWngS75xdGAMG7mQ5v2+dXo6i8FSw=; b=WTWfW4XLKOVaz4dUJTemT7Z3go2v/
	45PshK6e6oBmUk+oHGHE/OTOU8uKjOD9t+602mPxXiqFoRGYW8eFM5aS1A3a/pC5
	A8YTp/L6v2NjodEw6HBjpiEskK8Kt6odKxoD5GeNPzBYsivMtDDsmgnv0kX7AREW
	hf7+WlyjaGOWcFkcp1+zhkFdWmyKqCcL7++eFE0Hmx3zY/gYzPZTEFQ7sdhSm8/K
	Sfaj0n45nmY5PSf+Kph8sYEeatrRzGdPY18g9yQQhZRUBiFXi/IDjrSE8GOcOYZZ
	6WB7S4ScrfmvLHAeOSFHa0x9oGeQSNLLGfiWjYNuQR6QytxlKaMNqsibg==
X-ME-Sender: <xms:6_aSZPsJEev6KEcRLpvlYdPfhOdVVvmR5GqALjn0SzU0Zw6VGV4igA>
    <xme:6_aSZAfekoqSyswXFa7ui3hIAO2ihpOgUDnuM8Met9PdItNFWjMugge824GMxc-8u
    lWgaoXz-qXOG9ulQ8M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefkedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:6_aSZCwr16vqsumhsz4aL7_4RQgFZsOCOv-3AuIIyMqfxbaeVTtYjg>
    <xmx:6_aSZONV2rSWUo2Hp_-2mxpHh0BeX-xcxoBtdxL_vTPvdup0m0oOgw>
    <xmx:6_aSZP9HqG3GMqvHwxJwuzNoyipuBMQhCgn7BilIqbT6OkcgrOh5rw>
    <xmx:6_aSZLZy5aB-SP4vyS1nDcL6Ajubn9SibSSKgU_tFkhH7uibIfPBKw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 45884B60089; Wed, 21 Jun 2023 09:11:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <83094b7e-5298-4d9d-9eab-8af979c3f710@app.fastmail.com>
In-Reply-To: <20230621122854.yvffeuhhp4ywqcla@mercury.elektranox.org>
References: <20230615174940.jmzuv5kb6o7htkwo@mercury.elektranox.org>
 <5dd55b3f-9a12-4c3e-99a8-b81add924cbb@app.fastmail.com>
 <20230621122854.yvffeuhhp4ywqcla@mercury.elektranox.org>
Date: Wed, 21 Jun 2023 15:10:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, arm <arm@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kernel@lists.collabora.com,
 "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [GIT PULL] ARM64 RK808 defconfig fix
Content-Type: text/plain

On Wed, Jun 21, 2023, at 14:28, Sebastian Reichel wrote:
> On Wed, Jun 21, 2023 at 11:36:48AM +0200, Arnd Bergmann wrote:
>> On Thu, Jun 15, 2023, at 19:49, Sebastian Reichel wrote:
>> > Since I did not get any feedback for the defconfig patches from [0] and they
>> > are fixing a KernelCI regression (Rockchip Chromebooks no longer boot because
>> > of missing PMIC driver), I prepared a pull request with the defconfig change
>> > instead as suggested by Tony [1]. It consists of the rk806 immutable branch
>> > prepared by Lee Jones [2] and the arm64 defconfig patch. I will send a second
>> > pull request for the arm32 multi_v7 defconfig. This is targeting linux-next.
>> >
>> > [0] 
>> > https://lore.kernel.org/all/20230518040541.299189-1-sebastian.reichel@collabora.com/
>> > [1] 
>> > https://lore.kernel.org/linux-omap/20230604060436.GT14287@atomide.com/
>> > [1] https://lore.kernel.org/all/20230515152425.GV10825@google.com/
>> 
>> I don't think it's important to have bisectable defconfig changes,
>> and I'd prefer to just cherry-pick the two defconfig patches in
>> this case if that's ok with you.
>
> Sure, please go ahead. I just want to make sure that the regression
> is fixed.

Done

> By the way, what's the merge strategy for defconfig patches? Apart
> from my RK808 fixes we have some other pending defconfig updates and
> nobody seems to care:
>
> https://lore.kernel.org/all/20230504201916.1121243-1-cristian.ciocaltea@collabora.com/
> https://lore.kernel.org/all/20230604171345.1215276-1-cristian.ciocaltea@collabora.com/

I normally expect defconfig patches to go through one of the platform
maintainer trees, the same way that I merge dts or driver changes,
so I tend to miss patches sent individually, unless they take soc@kernel.org
into Cc, which puts them into patchwork.

I've applied the above two now, as they seem harmless. I see that
Heiko was not on Cc here, so he probably never saw them.

>> > The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
>> >
>> >   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
>> >
>> > are available in the Git repository at:
>> >
>> >   
>> > ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git/ 
>> > rk806-defconfig-fix-arm64
>> 
>> This is also not a public git URL, you may need something like this
>> in your .gitconfig to generate better pull requests:
>> 
>> [url "https://git.kernel.org"]
>>     insteadOf = ssh://git@gitolite.ra.kernel.org
>
> oops, I actually have the reverse thing in my .gitconfig and didn't
> notice it gets applied for 'git request-pull'. Thanks for the hint.

For the reverse entry, you probably want this:

[url "git+ssh://gitolite@ra.kernel.org"]
    pushInsteadOf = git://git.kernel.org

so that "git request-pull" always uses the https but "git push"
always uses git+ssh, regardless of what URL you have.

      Arnd
