Return-Path: <SRS0=gUmy=BP=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCD3C77B7A
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 13:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5CC07C433D2; Fri, 26 May 2023 13:52:06 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 769B9C433EF;
	Fri, 26 May 2023 13:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 769B9C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 5A3D15C0150;
	Fri, 26 May 2023 09:52:02 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 26 May 2023 09:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1685109122; x=1685195522; bh=1H
	fjunF3qC83yMMigxn4CptScPVYadkB9fpzT+3XMY8=; b=eg7CPF7ZQF82kqI7RS
	1ga29oIx5edxP9GjReA1uRew47cOE3A+wFX9BTL6liKvKxDUf+6TG5oR/djmYlEu
	wbEl8HHJKsMGflGVRAeVH9kCtQKFKibVucv7MnGoOvDTrlfHGUy3vx7zle3ooP89
	V+q0k06Wc3UrsMY8DtRNtXeSYqc8yHcf/7q+/issnyZcQ3k67HtuT2nu/UwWGpSv
	LQ7GX+4LBndOTHyeMy/RkI7qUrc/SuRmaxhn3mzgOjFqiala+XWhKrbLsRTNze11
	d6qQ8fgx5gMDaQJ+pfR1BDdPSdFmyGA8P2R6UIjUZmtxr2EXMEmLWtBGkfeJ3eoy
	9PCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685109122; x=1685195522; bh=1HfjunF3qC83y
	MMigxn4CptScPVYadkB9fpzT+3XMY8=; b=oPS4CqmMKFmGwZZmyrrLpx9RKn1QB
	AQqPhi/xsm+W/k+KgHYXTXv+RH+2rKP9+Z2P64YHcMaxz10qaQWPgspk97QfRx+f
	F94dBQTmzWkH3JMHjYzg1bL2nzw/U0fAxiwmXv9Dr/lP4n7UW9XXO8x0SMymvFph
	wAUp4C7YQS2uWRLA+7uRFoiYQkg+WO8p0/4sxAPCqvSiZHGtfV2LLTALCCdq/qzR
	H594vo4AZbl+ePyWB4+GQ39rlVqUsssXWFEdZ0IYlpYR0c6iyIq+SFNaV7VSQLBq
	FSc0TAIB2ZCCMWpGaJoOuIqOq5UcopZU7KBP2LjXFjjvkjvgWSugHOrIg==
X-ME-Sender: <xms:grlwZLXdNWtKNVY08zDiHu0KqxFsmAnSDQzFRDHE2_sNyShZR-M5Ew>
    <xme:grlwZDkg8qsg2q3Eq4mdmFCwcD2KCurRjJTmvj0taDe2VhqSPj3B7VlyXtOCKef7r
    hMNQNhIQpF8fGojRhc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejledgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:grlwZHZG99iGnhLcw5OKxHS3CHSHZb1l1iZTFfINz1Vt8Kam0Q4Fyg>
    <xmx:grlwZGVwQhjkflZQHZRjdm4z9QNzz1Fs21xrItpeakXDvnNJtWbIaA>
    <xmx:grlwZFldpHTcxtbW0gJQEAJ-I0d5MYoY5lYgTq-N3sqdqVGxJFwZzQ>
    <xmx:grlwZEt8_i0mqGg_ZH9JllciYxL9SHwKzY5j7HehZkRpYdlBoMTLAw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 13849B60086; Fri, 26 May 2023 09:52:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-441-ga3ab13cd6d-fm-20230517.001-ga3ab13cd
Mime-Version: 1.0
Message-Id: <994a0b2f-d9e5-4b70-8ca1-a75d7dbbc297@app.fastmail.com>
In-Reply-To: 
 <168510182800.28560.13391294049505767823.git-patchwork-notify@kernel.org>
References: <20230508040433.13648-1-lukas.bulwahn@gmail.com>
 <168510182800.28560.13391294049505767823.git-patchwork-notify@kernel.org>
Date: Fri, 26 May 2023 15:51:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <linux-soc.lore.kernel.org>
To: patchwork-bot+linux-soc <patchwork-bot+linux-soc@kernel.org>,
 "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org
Subject: Re: [PATCH] ARM: s3c: remove obsolete config S3C64XX_SETUP_IDE
Content-Type: text/plain

On Fri, May 26, 2023, at 13:50, patchwork-bot+linux-soc@kernel.org wrote:
> Hello:
>
> This patch was applied to soc/soc.git (for-next)
> by Arnd Bergmann <arnd@arndb.de>:
>
> On Mon,  8 May 2023 06:04:33 +0200 you wrote:
>> Commit 0d297df03890 ("ARM: s3c: simplify platform code") removes the line
>> in Makefile.s3c64xx to configure the inclusion of setup-ide-s3c64xx.c,
>> with CONFIG_S3C64XX_SETUP_IDE. So, since then, config S3C64XX_SETUP_IDE has
>> no effect and any further purpose.
>> 
>> Remove the obsolete config S3C64XX_SETUP_IDE.
>> 
>> [...]
>
> Here is the summary with links:
>   - ARM: s3c: remove obsolete config S3C64XX_SETUP_IDE
>     https://git.kernel.org/soc/soc/c/5038e62d4b4a

And dropped again after I noticed that Krzysztof has already merged
it in his tree, sorry for the mixup.

      Arnd
