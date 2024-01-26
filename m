Return-Path: <SRS0=Ip9B=JE=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52027C47DDF
	for <soc@archiver.kernel.org>; Fri, 26 Jan 2024 12:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20993C43399; Fri, 26 Jan 2024 12:59:27 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E65E8C433F1;
	Fri, 26 Jan 2024 12:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E65E8C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 147C23200B3C;
	Fri, 26 Jan 2024 07:59:23 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 26 Jan 2024 07:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1706273963; x=1706360363; bh=4sZDCaBzZq
	r8GMW7eF+P0uSCkwQVxOGU/MF1Avmocng=; b=B+f/fsLS8e5s7dmhK23yVv1td7
	CumlYBMX4pSqBmfF4XKlGbfsr359ZJJDqp5VnM36VaWnIJu1oc0aVcTgWHNSTcPM
	x6+AklCYTiokig60zlPbr5GjOoInS3QccR7vTlZ1btlvCAueH/arQiG0V1RUNWL8
	RQZqcFLf4s2cAQzZSh7Yp/dl6nDbbkweWgfiSYshspsO6F126+W2dopE6EWOMeh+
	LRqQ+/I7q5AtaumiTp/gz2ZZqiJlHv4holf6eZG80ifO8BEkQmJxcDD3zsNi7fM9
	RBlgsYOaQV0gmN56OBDH5f3EmgJs4G4WRCbodZaZYbIRPwLccbi777x2J2/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706273963; x=1706360363; bh=4sZDCaBzZqr8GMW7eF+P0uSCkwQV
	xOGU/MF1Avmocng=; b=MsHmK8Zi3TFAjQF8NMmFsZdfcwIYa4ty8LeyBoVR4cO+
	JfFh1cmK5jVCfcFwJVV7xREzX1mT/muOnuDYK+l9huppZV/gks1Rcg7higunzHAS
	nD5ARzou2Vc05dogt1F0o+tXxMdHmssi0M28j2CCUL0cAA5nvrgxSpQ4AQ/gpgiR
	KYBFANK3tDqgZ/dxdOZzSnPdrS4ZjlaLtlQCdZIPi/oPaYal8Okr/ut5CODJUP7k
	PdfEaLD6N11J2KlMOo3awuwq1B+veYL0phakkm8V8mxnXIF6DBsFBmCmypR5NS77
	JXJuMPeQZunj4NI8eC5PiENR91zGfDYg96qf2Gw6qA==
X-ME-Sender: <xms:q6yzZQATnyUdhx5Lpf6wPr8LMA6Ji-E2fcVLfazcY6LMp0OAekI2oQ>
    <xme:q6yzZSgzw7ueEEcCxu6LvRXftiyLe6-1Lz-w9dYTtZymUDlq1SxzCGHJiMhsZAzfp
    Fkg0eMG66vmB6BPzM8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeljedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:q6yzZTkQUyKtZQKjNiEo1qfxxWTERtKKvBza8qt3mshQsbbha3SUyQ>
    <xmx:q6yzZWyKYOVuP3Ns8YCwaOeMWnOSB5AwdmDGMlvHsU34hXRr1qabHQ>
    <xmx:q6yzZVS8S-YzERNHEqLTYFjWLXKVXK6H3JEdP6UBag9GJIqzI1s_AQ>
    <xmx:q6yzZUE49xJet4YrdZupIy41so53raBoJ0rhL6kk0LLWSiFbRISmdQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0C143B6008F; Fri, 26 Jan 2024 07:59:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-119-ga8b98d1bd8-fm-20240108.001-ga8b98d1b
MIME-Version: 1.0
Message-Id: <82f0b93c-d73c-4c99-87ec-d289fb43208e@app.fastmail.com>
In-Reply-To: 
 <MA0P287MB2822632A358DFEF21FCA333AFE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: 
 <MA0P287MB28228572C526C5099A8BDA2DFE7B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <0f091a2a-0bc8-42ca-9d5d-aa218fa88e93@app.fastmail.com>
 <MA0P287MB28229E73972FE184B461511AFE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <cf70dd11-18fc-4c57-beab-b682f8edb220@app.fastmail.com>
 <MA0P287MB2822632A358DFEF21FCA333AFE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 26 Jan 2024 13:59:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "Conor Dooley" <conor@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, "Inochi Amaoto" <inochiama@outlook.com>,
 "Xiaoguang Xing" <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 "Chao Wei" <chao.wei@sophgo.com>
Subject: Re: [GIT PULL] RISC-V Devicetrees fix for Sophgo/SG2042 v6.8-rc1
Content-Type: text/plain

On Fri, Jan 26, 2024, at 13:31, Chen Wang wrote:
> On 2024/1/26 15:10, Arnd Bergmann wrote:
>> On Fri, Jan 26, 2024, at 08:06, Chen Wang wrote:
>>> On 2024/1/26 14:11, Arnd Bergmann wrote:
>
> I have re-sent that patch to soc@kernel.org. Will it be merged in master 
> in 6.8-rc2?

Yes, you are lucky as I'm just in the process of sending out
a fixes pull request.

      Arnd
