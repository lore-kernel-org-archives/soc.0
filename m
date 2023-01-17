Return-Path: <SRS0=tgyg=5O=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A73DC3DA78
	for <soc@archiver.kernel.org>; Tue, 17 Jan 2023 20:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5211DC433D2; Tue, 17 Jan 2023 20:03:48 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCBA3C433F0;
	Tue, 17 Jan 2023 20:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CCBA3C433F0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id C6E575C013F;
	Tue, 17 Jan 2023 15:03:45 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 17 Jan 2023 15:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1673985825; x=1674072225; bh=rblLYzdt4t
	B35h0HqI9SRH1Q3dV8Re767GfH9e1W2X4=; b=QMtpF7pga9HfjcN+olkKLnpiOz
	zjH1UI6YIYXIEO4g3H4gZVr09obMpM2wn/3Mwq2lhx4wfyONEPxdwIzUHSyTY2vz
	6vi3D9cYMkvqZU1E9Q+1MOIWYpUv1BlJc45xFY+zKJfCo5hrR1iQGQbbKcnoKPYA
	G046b6i77O8MKh1XlkCAamkdaeJo5EaxgJtFfZ9MPnzQD4nCvMeAvRE1Im6oHD+2
	vItpUuO6VlcUUQ3TTj4+L53/XJLFsJBm4kZybhzxH51wxu1+ed7/GdHlMwXc6U8Q
	OdNYdagDOFpTMo1E+K/V29sjqRicmjkOnjjEFQwCSoh2fb9nwLBfzQ/m5pdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1673985825; x=1674072225; bh=rblLYzdt4tB35h0HqI9SRH1Q3dV8
	Re767GfH9e1W2X4=; b=nIg87I6gE04+yhDLIy07Un1EFCzGQM9ak5ikpLCbQIj+
	pM2riMowXvqfGpKq67NTuS4NizCMKh/i73xpGtZaFUD0sVfWVz47Vn+9PmcPHovh
	ZaI/b5MZYdWNdZWRBWjJSieu8vsF/k2dnm98axeF8Z/8WDuk+EnF0CT0YVGiLQ1W
	MEAQu1WbADvuSRAbvse3qZNWsb/HadMK63zvxrpCLZpI4o+AZ53NvvzUZgBTRQmI
	SzZSs7RHS7BslGlTmMnxSCF4TbCZfIQYHsYtutbee0DTDEvah19cOmOJzTsXmLQN
	20cFOBpp6ArIZG0loS9xsiF8ezvEAFD1ZEJzw9CmDg==
X-ME-Sender: <xms:If_GYwBi7w8z0NqfbSC9RDpE-NFKVcX9e-ab82IJlwAp6lUxr7Fe_w>
    <xme:If_GYyjW7noJMxG8D0Z08UFK1oGseihEAO81lgXLpzF-DOCD7pcaKw0CIoMGkGdNx
    eIWphZf7b7l21DPV3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:If_GYzl3WQBQVoW0p5gYqkLgBpKSYPzMH1Ug5NOIMpJo5VmNXAnypA>
    <xmx:If_GY2xlpCI1iKRNlqmUAiHEic_KBsBS1SyoB87SwX6YPl9KYYANOw>
    <xmx:If_GY1T78dbxasgvS7sjbMajUqSXEoQbxdO8j_5ErZohLyTopmHYOw>
    <xmx:If_GY2Q62hB9dbEAX-KyCW0XOftYTBaDLnhuun8WQvAB9kPc3SNlhg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5DA97B60086; Tue, 17 Jan 2023 15:03:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1187-g678636ba0d-fm-20230113.001-g678636ba
Mime-Version: 1.0
Message-Id: <eec4d2fd-f305-452a-a47f-83203da494df@app.fastmail.com>
In-Reply-To: <d6166b85-01df-405b-3112-d9bde16b6bd9@amd.com>
References: <20230117164133.1245749-1-arnd@kernel.org>
 <d6166b85-01df-405b-3112-d9bde16b6bd9@amd.com>
Date: Tue, 17 Jan 2023 21:03:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tanmay Shah" <tanmays@amd.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Michal Simek" <michal.simek@xilinx.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, "Tanmay Shah" <tanmay.shah@xilinx.com>,
 "Mathieu Poirier" <mathieu.poirier@linaro.org>,
 "Ben Levinsky" <ben.levinsky@amd.com>, "Ronak Jain" <ronak.jain@xilinx.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: zynqmp: fix declarations for gcc-13
Content-Type: text/plain

On Tue, Jan 17, 2023, at 20:53, Tanmay Shah wrote:
> This looks good to me. Thanks for fixing this.
>
> Something must have gone wrong when I ran sparse check on this patch.

I don't think any of our previous tooling caught this, only gcc-13
changed some of the behavior around enums.

> Just one question, does this patch need "fixes:" tag?

Probably a good idea:

Fixes: a5e56980cfb7 ("firmware: xilinx: Add RPU configuration APIs")

I can apply this directly to the soc fixes branch if you like
and add that line.

     Arnd
