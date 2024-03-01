Return-Path: <SRS0=+ucK=KH=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F2BC5475B
	for <soc@archiver.kernel.org>; Fri,  1 Mar 2024 18:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50DFCC433F1; Fri,  1 Mar 2024 18:00:44 +0000 (UTC)
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05650C433C7;
	Fri,  1 Mar 2024 18:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05650C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id DA3A91380125;
	Fri,  1 Mar 2024 13:00:41 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 01 Mar 2024 13:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1709316041; x=1709402441; bh=Mstj23e8M+
	zZCqcSyr181S5/vGyFrNsavdRVO8Avn9w=; b=Ancgegr/eBTjHNS39hGmsN1y+C
	2uOxqGRzYLIf4E4RxKvStcPv2l0/vCgeWUl3Vp6Dj5WZwE7aVhqnPFO3SLGA0s3l
	PkK89/EQT6DvQg78nE5DS3aOlps9fJ4qKuo/o5sUjqFbTpT2PB+EIzvQx3WxQULA
	pbYcOtC9XSywMt1+8lkXZvt8Bey2k1USvTVlFnt6G9SB36RVOVpAD99EWpc2RW/L
	XuewyjbwHVmfcBNkg51gM33QSIroAPu94nncS6jrYnhBPxfQpGv2uBaNrAalUOPU
	BDsFce/pxjZgcnH8KWhJrvqcrMJDGkEl4zq5N5YHDd0CAWRbzUue3P3y2UDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709316041; x=1709402441; bh=Mstj23e8M+zZCqcSyr181S5/vGyF
	rNsavdRVO8Avn9w=; b=npmWQZ/uZqlG3aWPW476u2oALsYCWnjr82sEGHG4GdGp
	9viQQKsc9ss1IXsDxtAKkxO2NPdrzBc3C/mcrEtSI4QlqJm4L1D7wTWz6JRLTS6f
	ACx6k1mUjaMK0tXSts+lQQqTD3buWz4HCyUfyaDE2jpN5x87liYdOyfz9p14cY5u
	Swir8sJVSe9eEbVrljuP7IKJIv767Z9qW5zyfsVivkcbcJsm6O54D8a1Y0PRTIBP
	gw77VAoq2x+SinDnjGZD54X6csUpAhzC5LOO2AWLC/+mJ8/UoraO1u5jbLPbkXoE
	rU/7bW+ye81vD1v+BOHQryNQE14gkg/buswUaQ/peQ==
X-ME-Sender: <xms:yBfiZfbU54YYfMuL2jR0DVmYAczmtUMywzqWNe-aaHziNeb9qnk9dw>
    <xme:yBfiZebMyKjurR0Imycc8Z5dWqvQ2Nx7pjPtkYALxjw9q3YAlnsTSGZjFYooO5KD5
    UKpFjB4FpL5_K63Tjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrhedugddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepjedvvddvudeludehjeeitdehheeivdejgfelleffiefgvefhhfeuudfhgeef
    feehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:yBfiZR86_pTy1rIbKoL2Cf7fXlTotaWf79BZxEbvJmUfjCwVHZmJCA>
    <xmx:yBfiZVoF7pPJUiACatLc2UF7LoDY8wkjIECOaDm6UCu_0DqOAsCsJA>
    <xmx:yBfiZarnYgw1Y55TRTJMe5Ucy_tWttvEu2EeS3CMkXV7IBH8lwJ3cg>
    <xmx:yRfiZWfou_7HnAzj_yCQNdtkD1WOVZ9mT0BxlE9Pl-E6WO79WIRJvA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B12F6B6008D; Fri,  1 Mar 2024 13:00:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-205-g4dbcac4545-fm-20240301.001-g4dbcac45
MIME-Version: 1.0
Message-Id: <b2bfa163-3695-4d92-9bcd-1e05dd4c6af3@app.fastmail.com>
In-Reply-To: 
 <MA0P287MB2822E853325154E87EAD3DEEFE582@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: 
 <MA0P287MB2822E853325154E87EAD3DEEFE582@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 01 Mar 2024 19:00:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "Conor Dooley" <conor@kernel.org>, linux-riscv@lists.infradead.org,
 "Inochi Amaoto" <inochiama@outlook.com>,
 "Xiaoguang Xing" <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 "Chao Wei" <chao.wei@sophgo.com>, "Liu Gui" <kenneth.liu@sophgo.com>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.9
Content-Type: text/plain

On Wed, Feb 28, 2024, at 09:14, Chen Wang wrote:
> The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:
>
>    Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)
>
> are available in the Git repository at:
>
>    https://github.com:sophgo/linux.git riscv-sophgo-dt-for-v6.9
>

This does not appear to be a valid git URL. Can you resend?

       Arnd
