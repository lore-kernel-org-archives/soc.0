Return-Path: <SRS0=Ndmv=ZZ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED9EC6FA82
	for <soc@archiver.kernel.org>; Thu, 22 Sep 2022 21:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4BCBCC4314C; Thu, 22 Sep 2022 21:22:30 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CBCDC433D7
	for <soc@kernel.org>; Thu, 22 Sep 2022 21:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0CBCDC433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id D5DD4580A45;
	Thu, 22 Sep 2022 17:22:27 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Thu, 22 Sep 2022 17:22:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663881747; x=1663885347; bh=7E8ohZ7amP
	4gmMgu5k2Mte2rYzeIOBzbLxi1Q9hD2zg=; b=GMfVkGZn3p8Dxn9TucP9T3PrS3
	xWyJvvFRO8ZAR/0pZedq8FzHUhAkqg0DPJmy3GXVf2SET56ofTB4HoJUECJhMeM3
	gE6s2XAXb/1AKX8fhABqwNsJE4f39jKdnnbJo8wDy4DVQDgbr4HLFo2s+K3l7XBD
	zkvyXKoDltk4/SK8OOt3SG4HbO2KY2oc/PiJA3a5lXlbpdxRbnKhMjw7k2k0LpvV
	ALRkyyq7zo3Rp0mV/AZSIgoFjUOcAs60jGfP1NBusPlZE9f+d6mvdubYDlUOEPWg
	d0nwIayIJDoWWFlDMZuswiPLysgcw887Ms2xoh9tFpYtJn98nFCB9FSzafcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663881747; x=1663885347; bh=7E8ohZ7amP4gmMgu5k2Mte2rYzeI
	OBzbLxi1Q9hD2zg=; b=LmBHiD21tAxTykxG34ksZtjWpvHgfbnWZGim2j/5TypW
	SGK25hrcFGVwhrm/K8KVoLk4hDCjV/lc2jJU5ema1Msaxu5wGXaL/GvNljF9mOY7
	dGygsEN6QbChnQ2iLgJOUfGJgdExYccts6Tk6dzJAmX1EZxpczF1JHhdNGDSpY8+
	p+yulxajHiUIBeh7LLuivK0hOQlveT94gPL1QXd9BptpPDWDpnCTvtS6PBuffIOI
	MoPurj8uWdwFey+uoMgsBvA4CyK2wFWPUMEhsqmfG7RnBXT0CUhNu4ua/21eDn9o
	rGUefThDtbWlrJrtvuKI2kUA3xZr/VLIyvZ+YtIN0A==
X-ME-Sender: <xms:E9IsY-lgY_ho1mCZU6OGT74D_5jI18EvVv_MrONjS-a-EfcPW7C6lw>
    <xme:E9IsY121I7gb_r53vQ4O9B2lNzmKKS_FynnE4J8obJ1FbsapP9hbYfnvrz3jtM1m7
    5kEwnBTDxp9H8oyFvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:E9IsY8oeQksar82wOFJC7eB6v68g5IpT3eWJCNduXh4YptDgHXlb-A>
    <xmx:E9IsYykE7EVAD1YU1z0OIpVIWZ7m_CTtlyOu5ACZVw_-H7pEdPCnrA>
    <xmx:E9IsY81fSnH8fR65CuPwjwFK0U32JyUcHhT5Mb4mQsoOLOvIPUkzAQ>
    <xmx:E9IsY6C5grSqbvP86x1XZGj7EuFM90gwf__KW80jyndid27exKQwlQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6948DB60086; Thu, 22 Sep 2022 17:22:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <79fed88c-7dae-4131-a005-b8374b5fe660@www.fastmail.com>
In-Reply-To: <8c1c4506-bd21-a35e-d6e5-3c7897715c18@gmail.com>
References: <acdecda4-b11a-4e15-9ac9-6d2696218012@www.fastmail.com>
 <87427dd0-7307-57b2-4008-2ffb839a099a@gmail.com>
 <CAHk-=wiux9J6zi8sEHyLBVYc7zsWe6JwYOf7ggF+Oowc6fp4tQ@mail.gmail.com>
 <8c1c4506-bd21-a35e-d6e5-3c7897715c18@gmail.com>
Date: Thu, 22 Sep 2022 23:22:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Florian Fainelli" <f.fainelli@gmail.com>,
 "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.0-rc6
Content-Type: text/plain

On Thu, Sep 22, 2022, at 8:17 PM, Florian Fainelli wrote:
> On 9/22/22 11:13, Linus Torvalds wrote:
>> I could pull your Broadcom fixes directly on top if you/Arnd would
>> prefer that as a solution?
>
> Thanks for the offer, no real urgency on my side, if there is a -rc7, 
> maybe Arnd can submit a follow up for ARM SoC fixes, as there is a good 
> chance we will accumulate more of those between -rc6 and then. If not, 
> and Arnd is fine with it, yes please pull mine directly, thanks!

Yes, that was my plan already, sorry for not making that clearer already:

I still have a couple of fixes pull requests in a backlog, including
yours. Since the fixes branch was already large and the rest has
not been in my tree yet, I decided to send whatever I had already,
but planned to pick the rest up tomorrow morning to send early next
week after I get a successful test result from the build bots.

      Arnd
