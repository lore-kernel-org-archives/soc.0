Return-Path: <SRS0=9FPl=3W=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFE3C433FE
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 14:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22D61C43470; Tue, 22 Nov 2022 14:39:09 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98E5AC433D7;
	Tue, 22 Nov 2022 14:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98E5AC433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 597445C029A;
	Tue, 22 Nov 2022 09:39:05 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 22 Nov 2022 09:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1669127945; x=1669214345; bh=HgcTvrOzWb
	rPEnstFV8N3bfoqJK7apCCploBv7wYBhw=; b=ESNGfJ+jFIkSMLlVpTo1AUnlfw
	fEipvAPutMXPzQJUxlnQfY3kxH2bJ3fuQKJ8h55IDz/fR2qhS+W+45GMsxRXqIFd
	cB5+3/XptWILd0mn4JQzjJBTEES08cbi3puH5jUm465BWVBL5RggcWbICOXuMhPs
	t5jJ3xdwzgAHCqLVH1aqdtStc7JjQVVGJr/iyDfz42c0RhO3dQoEgs1dSoXPj4Qj
	374WxO4XAkS06aS0rNsP+kMxNkcSqZt3tMyg/deGO8XPbhcRPJeoykLgXGm28pjT
	nJnjrux6m/n+klkFWmDvRo4wRodkDDkQh7dA2gtF9jdYC/2XFR31dsCFiKIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669127945; x=1669214345; bh=HgcTvrOzWbrPEnstFV8N3bfoqJK7
	apCCploBv7wYBhw=; b=cRh1RRtVVPMzGEbUpD2FiVLytODIaaZqxnOmTE/Ge/3C
	9SJS08wBZ4QnB5dPMae3O0KSeL110kih5naj5qMjmpQcBnvA7D2aUqvDvOR7/BlG
	noqDKfELYq8nBSkbO+5oYu/IdX2dIhXZcbtmp4XNQY3+4uSjqJFv+/JqgtfnjVdq
	iqeUIwdawzEFfRJID52x4aj4HwICtbauRYephzCPh1cVKi8rqVGfRJtanjvrqweP
	J/+iHSBk1WuJI/4ATm/zj0opS7rvXBlvnRk8t5upS4oU4vzGvdhaYLkxRKgwlwAd
	79bAKaKXrmY9y/LnzY330R6p9RQMol3liT23Dl3k7Q==
X-ME-Sender: <xms:Cd98Y9zdQ0pAfhz3A-rvWW42Fd3bRYp_kTBzca3UEQcV_NyuhfetDg>
    <xme:Cd98Y9Q6_y70zf3aSolSSWjbT90RQwK_ZZRDeSvS7ZbutkD4DmkB3ORjMraFC0Elh
    K_Bb8rQnAFNbjXZYLk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheelgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Cd98Y3XcVlxLI8ukN8uUG-VPUsxvFjMu4qwAB8mdOwdAKPSp2iynUQ>
    <xmx:Cd98Y_hnzFG5MFeEaxvaLWMl8PwURpDAv911LbY1pZnYafzQGQqnZg>
    <xmx:Cd98Y_DYVJ6HB-GodaowopaC-vwrIs3Btqx19IV_jCwLCEzmFp-C_w>
    <xmx:Cd98Y056G6pU38nS_JpZZfg92gTyqIOuzvozC-CpnW-6BMIYloTOhw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0FD8CB60086; Tue, 22 Nov 2022 09:39:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <608037ab-1e9c-4f70-b85c-5665a4bb1769@app.fastmail.com>
In-Reply-To: <Y3u0Oydiv2Wauda2@spud>
References: <Y3u0Oydiv2Wauda2@spud>
Date: Tue, 22 Nov 2022 15:38:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Conor Dooley" <conor@kernel.org>, soc@kernel.org
Cc: linux-riscv@lists.infradead.org, "Palmer Dabbelt" <palmer@dabbelt.com>
Subject: Re: RISC-V SoC Drivers for v6.2
Content-Type: text/plain

On Mon, Nov 21, 2022, at 18:24, Conor Dooley wrote:
> Hey Arnd,
>
> Same stuff applies here: lmk if there's something you'd rather see changed.
> Perhaps you'd prefer to see PRs per vendor? Although I think that's less
> likely to matter here than in the DT stuff. Again, I'll try to get the PR
> out a bit earlier next time.

Applied, this looks fine, just a few things to keep in mind:

- please add "[GIT PULL]" to the subject line of the email
- Splitting up a large pull request into smaller ones can be
  helpful to make sure things don't go in unnoticed. I try to
  (briefly) look at each patch, but if you have 20 boring but
  large patches, and a small but important patch that I may
  need to comment on, that is a good reason to split.

> Not too much to see here, Yang Yingliang has added some error handling
> to the setup of the driver that reports SiFive cache topology
> information. I've put it on -next given how far we are in the release
> cycle, feel free to put it on fixes if you disagree :)

This is fine either way, as none of the fixes are likely to cause
any real issues. I usually like to err on the side of having too much
in the fixes branch instead of risking to miss something, but I'm
just as happy to follow your preference here.

> RISC-V SoC drivers for v6.2
>
> SiFive:
> - add probe error handling to the ccache driver

Since this tag description becomes part of the git history, try to write
it like you would write a commit log in the future. Ideally that
avoids bulleted lists (I know they are easy) and instead uses full
sentences that explain things about the state of the patches. If there
are bugfixes, are users likely to need the fixes or were they found
through inspection? For new features, explain who would have the
corresponding hardware and what it does. Again, what you have here
is not wrong, but it can always get better.

      Arnd
