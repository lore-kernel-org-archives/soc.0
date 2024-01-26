Return-Path: <SRS0=Ip9B=JE=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C01C47422
	for <soc@archiver.kernel.org>; Fri, 26 Jan 2024 07:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C603C43390; Fri, 26 Jan 2024 07:10:54 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF914C433F1;
	Fri, 26 Jan 2024 07:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF914C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id B62C55C0130;
	Fri, 26 Jan 2024 02:10:51 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 26 Jan 2024 02:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1706253051;
	 x=1706339451; bh=vx8aBoq4VDpfChLhvsXQYuGwkmZ2BRhvxF8t7Vyu4Jg=; b=
	hoWZKAtZuT+LukB8FLCxR83ilWjnPIsfKi/l86PvO4GIBkcgKeWot8eR5pzX5F3I
	uSpzxhp4q1s0O4Nii3+reXjpChIgC3o+q5pFh58IqtVxcE4fFjDIrnsDqpRe/y65
	ceY+0HN7zqLddX7TGX6eqgQNuGW2hfrUKXLV8Y9jIdlm9LIHSRX8Y/qAYasleg7D
	rqBn0ZBIatzqst60xBGSdObFPPMr9mFTVQWYUR26cZsn1R72o/yukY9IJySnjptM
	cTsB2i5rGWTIg2IbafcjDORfOaxrPZc9m6F4OAwdcldMdGjgvpMc1fwthCMrwyr2
	YChK3FBJGmonqg9kmu2upQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706253051; x=
	1706339451; bh=vx8aBoq4VDpfChLhvsXQYuGwkmZ2BRhvxF8t7Vyu4Jg=; b=P
	5qHPd3MMTOVK3RiEaJAKnHXsK15loOdRdZGvxYkfD5OP+cn763UMciSYbrB8bTfu
	46UzQDch0P5AUog0A8A6ScCtzOFQ2/Yp02f9YJrI8EahsGOblQXxbdp0S30w+tbN
	u2xeDvRrgZmHtzGbMs8IND4uXXmZKb51UF8s5S77CZsmW2CbTFW1npCKZUb3sADA
	OovqBqb+7WrXRbTYQOehtrcyJWw/IrOHYS8jLl815lI6dvBKZw7i9PYn1USMpR8O
	0wn9tNtUXGrePd/rbqM9v5fVv3XpMRX9OP8x1/afLvrMSt7pwX6hY0GT9luvHeIo
	xTJnM57TTt8uy/DjasvbQ==
X-ME-Sender: <xms:-1qzZRTxEq28XLD_Zyn_vZvMX_nCeVk72ilXHbODaggVP0C2BT-ALA>
    <xme:-1qzZay5DpQ8JQqfg7gi0fjY29mi6oDjB0g3CSAUin7U5oxzV47CRP4QkMYCgnzik
    k17twiHPs0HGcBpIJE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeliedguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:-1qzZW3uBY_SwbNNoP1oIdVVKz60ejnTAdXwFvZUqsqzOGq7xP3WVA>
    <xmx:-1qzZZDeG9Gd659q66HuKy9oCd3pnnIRzFEsVsLNv0raOud_OYRyrA>
    <xmx:-1qzZajn1lvVeqNDXXIiETrYIBCmhLicq2dgGy46EZbfDDjnO4ywEw>
    <xmx:-1qzZVXDLoAD8Dz5EhFuM04HW6PfBSIR47ZacipVNwBqp8eKP6HO-A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 178C0B6008D; Fri, 26 Jan 2024 02:10:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-119-ga8b98d1bd8-fm-20240108.001-ga8b98d1b
MIME-Version: 1.0
Message-Id: <cf70dd11-18fc-4c57-beab-b682f8edb220@app.fastmail.com>
In-Reply-To: 
 <MA0P287MB28229E73972FE184B461511AFE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: 
 <MA0P287MB28228572C526C5099A8BDA2DFE7B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <0f091a2a-0bc8-42ca-9d5d-aa218fa88e93@app.fastmail.com>
 <MA0P287MB28229E73972FE184B461511AFE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 26 Jan 2024 08:10:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "Conor Dooley" <conor@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, "Inochi Amaoto" <inochiama@outlook.com>,
 "Xiaoguang Xing" <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 "Chao Wei" <chao.wei@sophgo.com>
Subject: Re: [GIT PULL] RISC-V Devicetrees fix for Sophgo/SG2042 v6.8-rc1
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024, at 08:06, Chen Wang wrote:
> On 2024/1/26 14:11, Arnd Bergmann wrote:
> [......]
>> The tag description is what gets turned into the merge commit
>> when I pull it, so it needs to be something that makes sense
>> for the long-term git history as well as for me to understand
>> why I need to pull it.
>>
>> For a normal branch, that would mainly mean that you should
>> give a summary of the branch contents. In this case, I see you
>> have only one patch, so it's probably easier to send that
>> patch to soc@kernel.org individually, with the same cc list.
>
> I have one question about your mentiond "send that patch to=20
> soc@kernel.org individiually ...".=C2=A0 If I sent it as a patch, wher=
e=20
> should I add the explanation of what I explained in this GIT PULL abou=
t=20
> the omission. After all, the content of this explanation is not part o=
f=20
> the commit of that patch.
>
> Should I send this patch email and then reply it, and then explain in=20
> the reply email?

There are two common ways of doing it:

a) You can add extra information below the '---' line in your
   patch, next to the diffstat. This text will get dropped during
   'git am' when I pick it up but is available when I look at
   the email.

b) You can send the patches as a series using 'git format-patch
   --cover letter' and 'git send-email'. In this case, the cover
   letter will be numbered as '[PATCH 0/1]' and allow you to
   add the same kind of description that would go into a pull
   request but won't become a merge commit.

       Arnd
