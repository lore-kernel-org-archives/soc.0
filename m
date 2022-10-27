Return-Path: <SRS0=FTzm=24=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FA7FA3743
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 12:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DEEC9C433B5; Thu, 27 Oct 2022 12:19:59 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D233FC433C1;
	Thu, 27 Oct 2022 12:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D233FC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id CC0EE5C00E9;
	Thu, 27 Oct 2022 08:19:57 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Thu, 27 Oct 2022 08:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1666873197; x=1666959597; bh=FUld14XjKn
	KMFXv/UVH0lX7uw/zb5d/sjLEMjFLzqh8=; b=HVHCdmGvYA4PYVmDGHzMywaVOF
	vdEo6lxLO3N9pnnp+gO0Kc0dAzh/I4lm0rNS0WmQ68pzAkvcpseP5RdK0xERwq0e
	nV7eSguy33ncdHv6shVBKfwZygCZISXtsgzTvQsRs13Oq8W+lcTncI1FFRtX/he5
	0spl/2ADAJe/6QuklzJJCkS0cXoBOTJpx5HuWkObDqrmB4bFs2MOX6QP+Cm6rsqs
	Coxrp76G9XgBFvFmGKaQ5hpKcOaZqCzrZ8T16TDBhpOpFGTDfQZbeZhuq+oU3287
	eKkcMMVhiuVVRJrDu922HNpFAuThHB14KzlUfeuTooVRfI/dTwHox1g8fOwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666873197; x=1666959597; bh=FUld14XjKnKMFXv/UVH0lX7uw/zb
	5d/sjLEMjFLzqh8=; b=fYyTK3eBb5rPWJfZGXg4jCphdK0z8TXh0XLZ8UnJaK6L
	BYwTFAANvaWm89RqR8HCL8jAL4sqve++WLWJCRdQsNoaQOi4XVh4W93EawG59j5O
	2S0IUBLGq+/ReQ5Nh5Evk9KMHURS0gl5NQtPYq7NimF/SFfQhNrRytailG3i/0dk
	R6zrsG2OB0eN2D3UUx/LGFhQSTkUJqpUYDPE5LR1S+liRVfTcOfItorvu8CTv7Ii
	GI3wX8eufk1oE9A6BYj/CZGyfYqHdrwlPsRVxo/jzc3NMuqbrGDFUHD+jaAJ2O/A
	OAyy9j4xpiA+zWp5ov7u6NHC1cO0lK8xpIYAbZxkFw==
X-ME-Sender: <xms:bXdaYx3n_WCnKCPI5BKKJ3ouJ598TcyOvIMeuZFQSp13MDkN9Nm8jg>
    <xme:bXdaY4GRceZVeRNj1RAcgSUcjpwJIH2rrlJ7hdMP0PHp2HtAFfUQXWvHB6k5tc1hS
    xxFK2ObtBomVTkF6Lg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:bXdaYx4yYR-11gMHlzbJHQOtO7_sN5Nj5DGCiC68d3mdcZ52TjSshQ>
    <xmx:bXdaY-229CsyK99-0-lYP5UxPJfmUqojKeAPofBuIxX9_NWjCJ-KYA>
    <xmx:bXdaY0GVSvhbGWlxLX5FFq-I67QxlPZYpnpEZ9z-3nn8U7VkvK6DoA>
    <xmx:bXdaY55N1-DyPdQW8DqqAnKaauGSFA_DdL7_umGD5Mum6keTiXEg4w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AFFF5B60086; Thu, 27 Oct 2022 08:19:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1087-g968661d8e1-fm-20221021.001-g968661d8
Mime-Version: 1.0
Message-Id: <43a50889-5229-463b-bf3b-349a48c21d94@app.fastmail.com>
In-Reply-To: <fdf94c6b-0293-5dd0-1717-176d1a2056de@socionext.com>
References: <20221027045157.23325-1-hayashi.kunihiko@socionext.com>
 <20221027045157.23325-5-hayashi.kunihiko@socionext.com>
 <b3c4f9ec-ba8e-4af1-b347-e07b06530d6c@app.fastmail.com>
 <8c11d7c4-dfc4-b84c-82cd-a9708bd79aab@socionext.com>
 <dcbbde62-fcf1-4435-8f65-665b25ec3b0a@app.fastmail.com>
 <fdf94c6b-0293-5dd0-1717-176d1a2056de@socionext.com>
Date: Thu, 27 Oct 2022 14:19:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kunihiko Hayashi" <hayashi.kunihiko@socionext.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Olof Johansson" <olof@lixom.net>, "Masami Hiramatsu" <mhiramat@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: uniphier: Add NX1 SoC and boards support
Content-Type: text/plain

On Thu, Oct 27, 2022, at 13:58, Kunihiko Hayashi wrote:
> On 2022/10/27 20:28, Arnd Bergmann wrote:
>> Using the GIC is preferred here, because otherwise you lose
>> all the benefits that MSIs offer, regarding latency and CPU
>> affinity.
>
> I understand, however, unfortunately GIC-ITS (or something alternative)
> isn't supported in this SoC, so I think it is difficult to use the GIC
> itself as msi-parent.

Ok, got it.

     arnd
