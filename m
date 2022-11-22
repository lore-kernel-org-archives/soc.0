Return-Path: <SRS0=9FPl=3W=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65195C433FE
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 16:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29E78C433D7; Tue, 22 Nov 2022 16:04:47 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F027C433C1;
	Tue, 22 Nov 2022 16:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F027C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 6C5CB5C00DC;
	Tue, 22 Nov 2022 11:04:44 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 22 Nov 2022 11:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1669133084; x=1669219484; bh=EDr1aVbSA8
	w8og+cv1/PCVytBR/K7r5BSLoDvaGCREk=; b=WIGpYupM776EbShw/A60vnvIVG
	sYGQRxO3UWj/rONe1GcckoGNhgUQYYYeayfNRmrauzS4Y/IkzaV8Y3uPOak4zZUa
	gy7a4ss9CMuUl+k/gRteTYAe39bWnX0UQ2ggj0IV4movHwjkP677XrgSy+eXqFZr
	0zq4o6/r3LvTXc9AnM4qJCgeY16BXpsUscW3umirl6F3EOg2c7eRtYqsqNLH8MlR
	sgqow0/5/WGAUA+sXPFE6VDOPQw0HMXO9rBt8wM85ekxTETIrc9P7lkHMf8ktRGA
	vkkZyY4ehRBdRGyE1Km5w+4Krwm0kc7XpVMPvoE0EhlH1NcS0B5QoYjm9KOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669133084; x=1669219484; bh=EDr1aVbSA8w8og+cv1/PCVytBR/K
	7r5BSLoDvaGCREk=; b=qcOwPejHJikwcqE0cWvLvaIAMyIJK/4bkszmsYLHdNOw
	sg0HPyveoCNPd0M9zUJInjNXyK8eHf/+uHimamzpQmAZPZxjIqr501gDhPhcq+88
	Kbl2NhikBTX4fuRaYZh4mPFGm+6wLnyEM84lT3Bxz6NXP7Bxpsa1CZOZL1FIeNoj
	ai3trVJY1H8SRd8+u3d2HSOBZC5s0U4RROt9kHBcKv6OV0trLoc5UCAzQLa6bPXj
	0CQc8GZOug0m4A7jlHknLpRKbro/bhU/eiUuoa/MVpg5t516TA9ncKTPwcp9GDgM
	XE5ggSu9vjCqXS+e1uyQjyw3WwP/t+n/OXiSRmAvow==
X-ME-Sender: <xms:G_N8YwIZDbHwVVKtiydgZqhhJXC6bYyYVtLiYG-IlXbXRkpxIa68Dw>
    <xme:G_N8YwKO2Thn2GqLWsaUtiXYW9Sgp0N-oXxszcsaJ2TNlDw-uHunzVfbJJHMNs1Rr
    IdbGYEvwCiJL53hHew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheelgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:G_N8Ywubb0dcBj9tFiWph_NEJklBOu2USIf4L2r6db5MMYI8iR85IQ>
    <xmx:G_N8Y9ZR2GyXxG-IFBlOTqV6Ix471rdLX0rEbjuss84593zD5gWhbQ>
    <xmx:G_N8Y3bgLPO7UJ6d2TcyPFYZvF_hU-M2yMJV3oEY8Z03M78klewkEg>
    <xmx:HPN8Y2lGC7AgfSWt6uOId_6XU1TOVkgBkY46blkjGZEgm6ID5QX9Cg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D1152B60086; Tue, 22 Nov 2022 11:04:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <0ac4e164-c2d3-46fa-8515-f8392fec348b@app.fastmail.com>
In-Reply-To: <Y3znYdAi8fS4Paak@wendy>
References: <608037ab-1e9c-4f70-b85c-5665a4bb1769@app.fastmail.com>
 <mhng-3945534f-98a0-453a-8a1b-3e1c8f3441a4@palmer-ri-x1c9>
 <Y3znYdAi8fS4Paak@wendy>
Date: Tue, 22 Nov 2022 17:04:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor.Dooley" <conor.dooley@microchip.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>
List-Id: <soc.lore.kernel.org>
Cc: "Conor Dooley" <conor@kernel.org>, soc@kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: RISC-V SoC Drivers for v6.2
Content-Type: text/plain

On Tue, Nov 22, 2022, at 16:14, Conor Dooley wrote:
> On Tue, Nov 22, 2022 at 07:00:00AM -0800, Palmer Dabbelt wrote:
>> On Tue, 22 Nov 2022 06:38:40 PST (-0800), Arnd Bergmann wrote:
>> > On Mon, Nov 21, 2022, at 18:24, Conor Dooley wrote:
>> > - Splitting up a large pull request into smaller ones can be
>> >   helpful to make sure things don't go in unnoticed. I try to
>> >   (briefly) look at each patch, but if you have 20 boring but
>> >   large patches, and a small but important patch that I may
>> >   need to comment on, that is a good reason to split.
>
> Sure. I'll try to figure out what makes the most sense for a split
> versus having stuff in linux-next in a reasonable way. I suppose volume
> of changes will mainly dictate the approach.

Note that you can split things two ways, either by time or by
content: If you feel that the branch is getting a bit large,
then use that as a hint that you should send out parts early,
and follow up with another set of changes later, even if that touches
the same files. Here I would expect later pull requests to be smaller
than earlier ones for the same merge window.

Splitting by content is different: If you feel that something
in the branch is not like the other things, then you can split
it in a way that would give each branch a sensible tag
description rather than having to describe two different things
in a coherent way. Often this ends up with one of them being
much larger than the other, and that is ok.

      Arnd
