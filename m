Return-Path: <SRS0=aYPc=MK=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DABC10F1A
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 12:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24926C4AF63; Tue,  7 May 2024 12:16:06 +0000 (UTC)
Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 689B5C2BBFC;
	Tue,  7 May 2024 12:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 689B5C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 38B5A1800095;
	Tue,  7 May 2024 08:16:00 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 07 May 2024 08:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1715084159; x=1715170559; bh=HWVcQkuyNh
	J6YB2kHQMpV4nKRP/UJMbsrUtkQrq1C3c=; b=GWAV3DhODOVGMwKE5UJ4oyo+3N
	ZMcKZdyapzuFo0Z/tbvDNP+wZ+PEWn9droU29pSPY3ML8NpNyExVF50WMBpYHz27
	Wb35D/pLpYP/0A8fxMemn2GXg3RIbIGkVSbl7G1I3zWpmmujWT1YfY+r1yFmgSR1
	CsShIGWoiycEzh1ZaT7kPhFDc//IjSWjQvLQOjjECYTvs+bySbxbDbK2yle5VqU8
	raJan+gqwlmld5JXwXXWXU8Yy9Xnq9aVPEUKB9Ug1ILZEsKpsBdVk8WS8tvYIW6U
	xnyDKXHtswl+4gd7qB1D/EDY6bNtEmgC5Ybz2aLI82IH6OBOv046Cozbxbbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715084159; x=1715170559; bh=HWVcQkuyNhJ6YB2kHQMpV4nKRP/U
	JMbsrUtkQrq1C3c=; b=iQb+/Gf7oR43rWmHqkwU92WCU1lkVR6FEFm7Z8a3kbs7
	5AvH0A9KQmnDdxOHddvStqWJE7eJq7RJWlaq3jkvRPPOmrdkdc3BtsSrlf/o2fcQ
	2lD2GkfICJx0I9DR7nlxgyrnyG2fSQkId1wd8bjAmmx5+8yqKk/cfBxMSF8I7Dss
	RdMSTpeqdKexMLNnuVyYZ5XrXl40K2Xte0Dcsop3yIALsleex0BjzgLuAUi4pQBf
	W1M28PRY2BrWitYgYmGyjSMz1fOCnmG8ov/KlYD40K+NdQPNlO+je92MWI8gj3nn
	dhSKKEBGt7a/2c74A7khX7chkFeFJnNN9OBM6w+tMQ==
X-ME-Sender: <xms:fxs6ZjrCFzqb6iDlo1c5dIQNv6T0tspSUv3z76VvwSa7HrXz7mFgRQ>
    <xme:fxs6ZtrqC7bNUxQHCao6MYyDC6iLa61aDm22rKFpkz1UYvR1C8LQLSEwD1n8MtlPd
    Ew0cTE4Z5U9DeGNvs0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:fxs6ZgMza7zRHMdpQgpcFkAyh8rg42ILHwU2mXTFSR-KWOqehRbyMw>
    <xmx:fxs6Zm7WIG8kJXyF9W6ULiv_wn3YdNTkCetGtMYkiyFEHG8jcB1rbw>
    <xmx:fxs6Zi7lTR9mjID03CsjkE-fQndatOII7dfA-alJhXVfl6oxi_CJbA>
    <xmx:fxs6ZuiEYPsq2CdJ_G8Mv17ian73OZlckPhLt6vzg6K6koreqi4kUA>
    <xmx:fxs6ZomfLY1F0hsgBC03WC9C7Pki2odx_1vRkVH4StG5aps7UXorkeY2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 76350B6008D; Tue,  7 May 2024 08:15:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
MIME-Version: 1.0
Message-Id: <9031c5c8-1e93-491d-b756-5794cb87d1cb@app.fastmail.com>
In-Reply-To: <20240507-concrete-come-2899fab0888e@wendy>
References: <20240503-swimmer-botany-7368a8a17b1a@spud>
 <5222e581-a189-4477-ba6a-edf4ce369eb0@app.fastmail.com>
 <20240507-hungrily-squash-2ac370e05fc0@wendy>
 <b618c311-8925-4717-b6bf-f3699b106189@app.fastmail.com>
 <20240507-concrete-come-2899fab0888e@wendy>
Date: Tue, 07 May 2024 14:15:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor.Dooley" <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: "Conor Dooley" <conor@kernel.org>, soc@kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.10
Content-Type: text/plain

On Tue, May 7, 2024, at 12:21, Conor Dooley wrote:
> On Tue, May 07, 2024 at 12:08:13PM +0200, Arnd Bergmann wrote:
>> On Tue, May 7, 2024, at 11:58, Conor Dooley wrote:
>> > On Tue, May 07, 2024 at 11:27:36AM +0200, Arnd Bergmann wrote:
>> >> On Fri, May 3, 2024, at 17:24, Conor Dooley wrote:
>
>> >> If you are able to extract the DT bits that don't depend
>> >> on other branches (jh7xxx, microchip, bindings and
>> >> new files) and resend those, I could still add them to the
>> >> same dt-late branch.
>> >
>> > The jh7xxx stuff does actually depend on another branch, although that
>> > branch is fixes. Do you want that removed too? If you do, I'd say to
>> > just drop the whole PR.
>> 
>> As I wrote below, it's fine to have a branch based on a
>> fixes branch, so please keep that part.
>
> Cool, just wasn't sure if you were intentionally contradicting yourself
> or if the "below" part had just been some general remarks. I'll try to
> get a "revised" PR sent tomorrow.

Ok. To clarify: basing on a bugfix pull request is always fine
since those are already in Linus' tree by the time I send my
pull requests to him for the merge window, so the branch contents
as seen by 'git request-pull' are clean.

For dependencies between the branches that are meant for the
merge window, I don't mind taking them when there is a good
reason and we have discussed it in advance. It means a little
extra work for me as I have to be careful about the order of
my own pull requests to ensure that the branch that contains
the dependency gets merged first, and the commit log on Linus'
side is what's actually meant to be in the branch.

I also try hard (in general) to avoid dependencies between the
soc/dt branch and any of the other branches, to be sure that
there are no incompatible binding changes. This wasn't a
problem here (I think), but if you send something late in the
cycle, I pretty much don't want to have to think about that.

      Arnd
