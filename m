Return-Path: <SRS0=64+s=BF=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A51C77B7F
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 09:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D233C433A0; Tue, 16 May 2023 09:18:02 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4CD4C433D2;
	Tue, 16 May 2023 09:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4CD4C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id AC3735C006E;
	Tue, 16 May 2023 05:17:59 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 16 May 2023 05:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1684228679; x=1684315079; bh=ou
	Abzm3pg12owJekmkI4OrHP4MIjaK5Cyk3ghNwnWvM=; b=Scv5gZLE73L16eV8qs
	yx/YQjZHiBbdM50gEUuDGu5uoR2PsMrykaVDh88dmhyMAy9SxST6fTHHnj1of+j9
	eCyKrWYleTM9X2nEMQx5kaZjgANR9ofard0jdkPqlezxFmT0N5Pwr0DPzUcid3GL
	5r3+CngRPJSz/HBd1Vjxj52ZtzfYQKoi6YeL7JG4wXyNN7OO98Sa1r4/2tN2+ofl
	LzIQnO1zAqdwDIjU/fgUD4GSRIQouKxv5tyM31Z9bQVR8WrzIoBRpzYHTIQnymmy
	seENNmp2YnygS3Sb8PaaPYqd4PINdIPRS0/TdGIdlSTF6ZuFlGS9/T0G45Br0vzk
	/Sow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684228679; x=1684315079; bh=ouAbzm3pg12ow
	JekmkI4OrHP4MIjaK5Cyk3ghNwnWvM=; b=QPdOfBO1nMitxg6xhrZw6OWidmLed
	QsNrZ/vtesaQBZ0H0hTfQGh60POxdwRJXwRdnMu1YYSVUA+CIlCcgmpURuNKNx8J
	cU9ek6OIZloN9dY40/AqRzD24LtlqINduUk/Sekf5QIt+XwQ9qiC0uZdfvsgoPWG
	LXtl6OvWQkyyNVLdiDYc9rYAXTSGTfeFx6mOmTzdxSmsqyaw0dmr6E0EpZT4sT9F
	bXs6ETUpYeWsGsu1OTI2Q96MhNkCHIPaxujujtwo9NqjjH4JhENRoeFIBDys+7qB
	nx0jcefuHwibUCS4GDCtSbaGafEUkrj4GySOwgZnuVwgJ17P3R6fXKYwg==
X-ME-Sender: <xms:R0pjZH33bkkqug3eGSCi8EyCoAng02eUp2yEB8arpKctlxfBIxvcAw>
    <xme:R0pjZGHKy8s8sWQrIzw4Ker6W6JXmDWqRSz7_lbQAFK2Rzh22rU2V7YxOurxEQbrC
    13I1thbgB9i3GCH4RE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehledgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:R0pjZH6pZISv1MrimE_nX7LQIR-K-fiXyXiXVrKK8kMZ4aNvOhn5UA>
    <xmx:R0pjZM3KLphSvZeikiYWlxUjKCyy3e7FDZku_TWocy_OhwMimMV0-A>
    <xmx:R0pjZKFLYM3plpY8t4rF40e0EjadghAhwtlK0nj1Zld2sgUP4cIQkQ>
    <xmx:R0pjZBfsKEfoMynmHkr1hT6RCRbnbPzA1iTvtsGnS5H04odF7zzGhg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5CC98B60086; Tue, 16 May 2023 05:17:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-415-gf2b17fe6c3-fm-20230503.001-gf2b17fe6
Mime-Version: 1.0
Message-Id: <ea4bc471-9cac-4ef1-97aa-9cf71b60c785@app.fastmail.com>
In-Reply-To: <20230516-grader-dejected-df65cdc584b3@wendy>
References: <20230515-geometry-olympics-b0556ff8a5f7@spud>
 <cf1c6b8c-8a3f-eca1-948f-e41946d4c34c@linaro.org>
 <20230516-grader-dejected-df65cdc584b3@wendy>
Date: Tue, 16 May 2023 11:16:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor.Dooley" <conor.dooley@microchip.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: "Conor Dooley" <conor@kernel.org>, soc@kernel.org,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Olof Johansson" <olof@lixom.net>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1] Documentation/process: add soc maintainer handbook
Content-Type: text/plain

On Tue, May 16, 2023, at 10:57, Conor Dooley wrote:
> On Tue, May 16, 2023 at 10:31:19AM +0200, Krzysztof Kozlowski wrote:
>> On 15/05/2023 21:20, Conor Dooley wrote:
>
>> > + - Defer the devicetree changes to a release after the binding and driver have
>> > +   already been merged
>> > +
>> > + - Change the bindings in a shared immutable branch that is used as the base for
>> > +   both the driver change and the devicetree changes
>> 
>> The policy told to me some time ago was that no merges from driver
>> branch or tree are allowed towards DTS branch, even if they come only
>> with binding header change. There are exceptions for this, e.g. [1], but
>> that would mean we need to express here rules for cross-tree merges.
>
> I've got away with having an immutable branch for dt-binding headers!
> That said, Arnd did actually have a look at this (and suggested some
> changes) before I sent it & did not cry fowl about this section. IIRC,
> this is actually his wording, not mine.

Yes, I merge a lot of shared branches with dt-binding changes into the
soc/dt branch, and I wasn't aware of a policy against that, certainly did
not enforce it.

I generally object to changes touching drivers/* or anything else besides
arch/*/boot/dts, Documentation/devicetree/bindings/ and include/dt-bindings
in the dt branches, but I have made expections in the past when there
was a particular important reason.

    Arnd
