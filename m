Return-Path: <SRS0=PClV=JH=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616B9C47DDB
	for <soc@archiver.kernel.org>; Mon, 29 Jan 2024 15:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 229F0C433C7; Mon, 29 Jan 2024 15:22:47 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D3CBC433F1;
	Mon, 29 Jan 2024 15:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D3CBC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 683765C00C4;
	Mon, 29 Jan 2024 10:22:44 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 29 Jan 2024 10:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1706541764; x=1706628164; bh=zfdyI8/uIh
	Eoci5oXHguJ+MPbuObPA4iQSK9Qs2QNIY=; b=gSzrkH5Y92EOZdZN0keNL9AM3g
	6EzO/N1fRJifKgB4o3Q5PhXPkfu0U8ZnLPYX8XH3wDzi+f2ZNMkp9EkO4d33hqrx
	qO1QjZD6QBArKN18aQH15oU42xQt3dmWkniOiDfMqdLP3Dm6xsWniP8ylQARpwEJ
	PcdP6dFi5Op2LAN0HuuTMcd+p2xgYHV0/3fHAy6qPoNSbAcnGI/t37lYc041CmSw
	CXWKBkzlxDD7ObxMYKVfa8t9hNHAH6v+c/fOrONHNj7IeMCd2eHhQMfBfEbm8VdI
	4iw0JDlaS2icBaDcpKghOkbLGS249dnV1TfpX0lzs1LxEJpOmBr8ErErov4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706541764; x=1706628164; bh=zfdyI8/uIhEoci5oXHguJ+MPbuOb
	PA4iQSK9Qs2QNIY=; b=Kp7k3r+aHxj/dj7YydE5F+Y3Omp91Qbcs7DuaUZ8xvgg
	Vg/LKJL+Zf2kUu8CItLO1Vf29+bOYSG/0C9yXo1FoR9qnkHAqIVDqsNyHT091u3V
	og6mWnfgrshQ+nGKVp6MOJCW0VZw19oO7p0mqr7r2Yo4rSgtQZuBdFY7313QhpcU
	K5uaDqKrbofSRfkjiXnDbHmGK7ZUqIueeUBG19ZHh0dXtSDiipvO0PCrq8ZLYfpP
	+7SfZktP3SwZZnLzhuHeebdnBDT4Lp2eKKcxzsmVabprlLbO/9/Bxmp9oxSSeCHp
	5NBSlHoOBJ25mygmRcFehmBrS0E13oBGZj6ieCDIbw==
X-ME-Sender: <xms:w8K3ZcuIezQnAGHuZJfZqDxULEcbLk833r2YLS_O-Awo1vM1OlekQQ>
    <xme:w8K3ZZe8mcK3jRATjVbsQqhgxMTFKi5FNksr0_DVaqmNXijjtpuYuTmg9A1lgXcPu
    x5eFE99pR_GXdP6oIE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtgedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:w8K3ZXxOeb89XZ-jkLasJ0xaFyzeiEX3a2EO8g82fC2mmhepxhTthw>
    <xmx:w8K3ZfM-XapJCH92PqoDFpj3BmQ3jAeNlo-5x0u2A3CWjllLvnzivA>
    <xmx:w8K3Zc_jiU4ECtaHGcnop27KDVakDTMHDwHgshi2-Fnox0IGgUYuIg>
    <xmx:xMK3ZXYCXL_d9M3H9ZCNo7mAzJ0lcSZSpCG2s100fyaJ8T7m43Tt9A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id ABD58B6008F; Mon, 29 Jan 2024 10:22:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <ed322f44-6f7a-414d-a650-76c17c057b08@app.fastmail.com>
In-Reply-To: <9e1ad877-f55c-4045-bb92-c30614d6c1ff@linaro.org>
References: <ZbeJ5okKQ66FXGxP@lore-desk>
 <9e1ad877-f55c-4045-bb92-c30614d6c1ff@linaro.org>
Date: Mon, 29 Jan 2024 16:22:23 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Lorenzo Bianconi" <lorenzo@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Felix Fietkau" <nbd@nbd.name>,
 devicetree@vger.kernel.org, "John Crispin" <john@phrozen.org>,
 soc@kernel.org,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 dd@embedd.com
Subject: Re: Support for airoha en7581 Soc
Content-Type: text/plain

On Mon, Jan 29, 2024, at 16:08, Krzysztof Kozlowski wrote:
> On 29/01/2024 12:20, Lorenzo Bianconi wrote:
>> Hi Matthias,
>> 
>> I was wondering about the status of the following patches:
>> https://lore.kernel.org/linux-arm-kernel/20231001122418.2688120-4-dd@embedd.com/T/#rbafabf4bf2473327f35ce7d79623f63838630537
>> 
>> Do we need to respin them? Thx in advance.
>
> I don't see anyone from SoC maintainers CCed on that patchset, so no one
> will pick it up. Pinging makes sense if maintainers missed/ignored your
> email. But if you do not send stuff to maintainers, you need to resend
> to proper people, not ping.
>
> Additionally, this is a new arch, but it seems to miss any maintainers
> update.

I expect this to be picked up by the mediatek maintainers,
same as what we did for the arch/arm/ port that was merged
first. While airoha is a separate company these days,
I assume this is still closely related to mt7623, mt7683,
and mt7622, just like en7523 was.

     Arnd
