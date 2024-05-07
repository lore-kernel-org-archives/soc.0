Return-Path: <SRS0=aYPc=MK=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056EEC25B4F
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 10:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E550FC3277B; Tue,  7 May 2024 10:08:37 +0000 (UTC)
Received: from wfout2-smtp.messagingengine.com (wfout2-smtp.messagingengine.com [64.147.123.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6DC07C2BBFC;
	Tue,  7 May 2024 10:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6DC07C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 3DEF91C0018B;
	Tue,  7 May 2024 06:08:35 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 07 May 2024 06:08:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1715076514; x=1715162914; bh=/D928poWl7
	sSD2pVFqHXF695FzYfw9B3Pmz1rktdPVI=; b=Gf4bgxXUWAsZB/UBepBa0rIsfZ
	Z16xetzbusj3XZExdOukPZE3ver7ncdtbvMU5ctKwtamWPVEaXfaWW8ZHJSpHgUN
	70rhr96/n+lyD9VYkMaV4bzilWtHM4gsbHesAFjMLWJVbUff5kJXt93SH2az38bk
	18FbaHR8IO4ck47rsSzRx4CXeXBZcXvCErK0oHBbAtnPtzBd1raG0FDXgJ1OuBjT
	/zUgJ7sjJ4TirP85ut9qkTCOGJs1CiN6fEVwLoXNCdlFx2rWMddwCbXEKYEtUo9b
	TU9QJKJWKc5SLJR4mdDyaPQORu8aH/B3m/GRwes0NTlEKdu1ByXafwFQfdmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715076514; x=1715162914; bh=/D928poWl7sSD2pVFqHXF695FzYf
	w9B3Pmz1rktdPVI=; b=H3mP+PG5v1uiJjULzh4kN03XfX5vK1pv/Jp5HXhGrzb4
	SW7zkbnyohy+YD8jbDEx88yHSYIiz0sLVw3NpYLQ162JFvLpBgLKiGjtJoQMGi0h
	+VQPVZxH/jHzjb3+VQQP91cllqcXA/9sQ6XM1Uw0UI/SdBUdqG1jwlkWWcDMYuSs
	1kSaD31VpfuKxpUcgYmANrELWg0A8sngX6i9izxziAg3CnjLyWK6L6vJNAmBPPx5
	RvfyZxsbYRQFGFB94anp6jSuiePghoq72X7zjgvlNvZBCTs0RWIaC8C3DA51z40s
	3C3IlFuhwUPeeOrru37OmSqVtQgK5COBvWIVZS/T9w==
X-ME-Sender: <xms:ov05ZguCDtMsX28O7J_916c_VPvv7NzLusag_HSyb6i8RxhTql6pbw>
    <xme:ov05ZtdcHZo5aSDAOFCgpQRzyC7l_O2Rj6ENftn8LFezjn1hJEjiNYy35UVYSdF2a
    zk3yWs2FliIgxaHtUs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ov05ZrwJfv9SMIklhz1Ml4S4rGYN3Rd291luEKgeaZMAaNSS7eUhxA>
    <xmx:ov05ZjN5nEuDCSSv6ZrVbsTS1c3MDSImbz1PpAPC1FEx_dRzmO0M8A>
    <xmx:ov05Zg8xy_fRypZfnin0ZDyUcBAJHVa0UjFYBwCLTe3PGVymYxGuqw>
    <xmx:ov05ZrX5UcxpmII0TvDFNgN2tojg9mo38bl1I3yqOCzzu3JrsEBcQA>
    <xmx:ov05ZvYAeqiHIy7m96crkta4j2cB-aaSOzsjy6r4Rbey_cluDeHEHtQ7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 17D5BB6008D; Tue,  7 May 2024 06:08:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
MIME-Version: 1.0
Message-Id: <b618c311-8925-4717-b6bf-f3699b106189@app.fastmail.com>
In-Reply-To: <20240507-hungrily-squash-2ac370e05fc0@wendy>
References: <20240503-swimmer-botany-7368a8a17b1a@spud>
 <5222e581-a189-4477-ba6a-edf4ce369eb0@app.fastmail.com>
 <20240507-hungrily-squash-2ac370e05fc0@wendy>
Date: Tue, 07 May 2024 12:08:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor.Dooley" <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: "Conor Dooley" <conor@kernel.org>, soc@kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.10
Content-Type: text/plain

On Tue, May 7, 2024, at 11:58, Conor Dooley wrote:
> On Tue, May 07, 2024 at 11:27:36AM +0200, Arnd Bergmann wrote:
>> On Fri, May 3, 2024, at 17:24, Conor Dooley wrote:
>> 
>> I don't have a good feeling about pulling this one, given that it
>> is both really late and that it pulls in more dependencies than
>> we'd like to have.
>> 
>> I was really hoping to be done with new features last week
>> as I pulled in the other branches. There are two other DT
>> pull requests I got after that (amlogic and aspeed), which
>> I added to a "soc/dt-late" branch that I could send in the
>> second week of the merge window if everything goes well, but
>> those don't have the dependencies.
>> 
>> If you are able to extract the DT bits that don't depend
>> on other branches (jh7xxx, microchip, bindings and
>> new files) and resend those, I could still add them to the
>> same dt-late branch.
>
> The jh7xxx stuff does actually depend on another branch, although that
> branch is fixes. Do you want that removed too? If you do, I'd say to
> just drop the whole PR.

As I wrote below, it's fine to have a branch based on a
fixes branch, so please keep that part.

     Arnd
