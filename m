Return-Path: <SRS0=dCw7=ED=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754C2C71132
	for <soc@archiver.kernel.org>; Fri, 18 Aug 2023 01:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34A7BC433C9; Fri, 18 Aug 2023 01:58:14 +0000 (UTC)
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56664C433C8;
	Fri, 18 Aug 2023 01:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 56664C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 58A8F2B00089;
	Thu, 17 Aug 2023 21:58:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 17 Aug 2023 21:58:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1692323889; x=1692331089; bh=fJ6K9gCA8vecOEH/ARwG9AIsRMEX95Pp58t
	EXomQVMs=; b=K0yEEkgYcu9LamQ5ErCWFihmSLeBlJXtBSHIGfs7+YF4Ez6oevK
	CwuKehfxrXLYFYS4iaTMUaNPodFHqCJIzuWmNexuNg34ZbCckcVbA6Fe0FP6bD00
	xyr4C5Kx5wroXXWGyAnfNDGp/4do/8aiB2/JDR8XyPodJJ6SlbtNDmjtu6AjGx75
	ZQUI7KFwQ4iU00P4S6dJe02Y59GcP9L5A9kpEtfgN79wKHCGTc+3CAg0vedIPn6S
	LT/C5OB4pBrbQiLLUUWSe9DdxtpCeUtEQhXX6Yxj1Qsmj+tkRk9rwwSR7Mu+KY70
	c+TnKNWctm6K+DuM8/yGcmENkLw/+yxNndA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1692323889; x=1692331089; bh=fJ6K9gCA8vecOEH/ARwG9AIsRMEX95Pp58t
	EXomQVMs=; b=P6fy3kA83/UkRHRWSpLQovV2K2xsG5IWoLSQcnyuxM1OA2Dqi2S
	tckUwbrMP9bolPG7D7UMEMIhmIYTrlZIxD+ySNRrMXrytQGggsAKyg2+10Uq0fy5
	DI031GmjDS36hNixwnttYz6mzXPAwYfef72268s83BpZm0rowRCanzeye4T/qGY3
	Bd6vHAAW1If68iDymbkWkikLnivUXtvQEl/NytTYk011aO41B8vy+Z75ASOm2Oxb
	Er+QeplqyhzfAC1Ai4Xr/AxAengDyzJZ4XbnDCH2UnpCEnmcL5LCxC/hzLW3ckfl
	tFtiCiO9uBAVQLi3Ok04X4dyKJKnjO4w4Zw==
X-ME-Sender: <xms:MdDeZH0GGkGVTtFL65SP8QM25TRX3-7mTKxQOd2Ope7vjWNRLHd6qQ>
    <xme:MdDeZGEtG8M76KspE6Akz9yCbbdbJV-0KVj-c7f60fpw4q96YsXPrMxPO5eKryTQV
    5eAaSompfcF84cbQbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudduvddghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:MdDeZH7QI2im-YNPq0y68j_FpXMg-IMQTRQGzjn18tZAxJjH6OIlNg>
    <xmx:MdDeZM1lnEHZ3rX_YAL2hiTkxmNiu8_dZkp88QhUNsbivz_qT_tLdw>
    <xmx:MdDeZKFKTU42wZ9lAFSZUbvbiuknI7bw6T-cw73o-WjeBZKEbsccSw>
    <xmx:MdDeZGi30wt-TXANrly1wFHDiqWiE-kbpjbWXuRM-FskdII6yebFx2XZuvA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0E19BB60089; Thu, 17 Aug 2023 21:58:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <2f47e7bd-fce3-4eb9-8166-d671b4eec828@app.fastmail.com>
In-Reply-To: <584734f7-3eb7-961f-10a2-3707cf03819c@huawei.com>
References: <20230815125233.65469-1-lihuisong@huawei.com>
 <74f99c2f-fd9d-4cb9-a541-b699b79b928c@app.fastmail.com>
 <15c26edc-eb4f-a90c-d52c-dd532c9d12ea@huawei.com>
 <4f72b1d7-00b4-4318-b3c3-50d11e4a233c@app.fastmail.com>
 <584734f7-3eb7-961f-10a2-3707cf03819c@huawei.com>
Date: Fri, 18 Aug 2023 03:57:48 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Huisong Li" <lihuisong@huawei.com>, "Arnd Bergmann" <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, liuyonglong@huawei.com,
 xuwei5@hisilicon.com
Subject: Re: [PATCH] soc: kunpeng_hccs: fix some sparse warnings about incorrect type
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2023, at 03:38, lihuisong (C) wrote:
> =E5=9C=A8 2023/8/17 19:54, Arnd Bergmann =E5=86=99=E9=81=93:
>> On Thu, Aug 17, 2023, at 03:37, lihuisong (C) wrote:
>>> =E5=9C=A8 2023/8/16 21:17, Arnd Bergmann =E5=86=99=E9=81=93:
>>>> On Tue, Aug 15, 2023, at 14:52, Huisong Li wrote:
>>>>> @@ -199,8 +200,8 @@ static int hccs_pcc_cmd_send(struct hccs_dev *=
hdev, u8 cmd,
>>>>>    			     struct hccs_desc *desc)
>>>>>    {
>>>>>    	struct hccs_mbox_client_info *cl_info =3D &hdev->cl_info;
>>>>> -	struct acpi_pcct_shared_memory *comm_base =3D cl_info->pcc_comm_=
addr;
>>>>> -	void *comm_space =3D (void *)(comm_base + 1);
>>>>> +	void __iomem *comm_space =3D (u8 *)cl_info->pcc_comm_addr +
>>>>> +					sizeof(struct acpi_pcct_shared_memory);
>>>>>    	struct hccs_fw_inner_head *fw_inner_head;
>>>>>    	struct acpi_pcct_shared_memory tmp =3D {0};
>>>>>    	u16 comm_space_size;
>>>> The cast still looks wrong, while both comm_space and ->pcc_comm_ad=
dr
>>>> are __iomem pointers, casting to a non-__iomem u8 pointer should
>>>> still produce that warning. I'd suggest casting to (u8 __iomem *)
>>>> or (void __iomem *), I assume you still need a cast here to get
>>>> the correct address.
>>> Thanks Arnd.
>>>
>>> You are right. So I modify it by dropping (u8 *) here in patch v2.
>>> Please take a look at this again.
>> Right, if pcc_comm_addr is already a u8 __iomem* or void*, that
>> works, I though the cast was needed since it points to a larger
>> object, which would throw off the calculation.
> This pcc_comm_addr is already defined "void __iomem *" type in patch v=
2.
> So that works well, right?

Yes, that works.

     Arnd
