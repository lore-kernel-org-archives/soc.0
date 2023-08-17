Return-Path: <SRS0=/a2O=EC=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569ABEB64DD
	for <soc@archiver.kernel.org>; Thu, 17 Aug 2023 11:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25B39C433C9; Thu, 17 Aug 2023 11:54:36 +0000 (UTC)
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D313C433C8;
	Thu, 17 Aug 2023 11:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D313C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id BDB3C2B000AC;
	Thu, 17 Aug 2023 07:54:32 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 17 Aug 2023 07:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1692273272; x=1692280472; bh=NEdJCPm3giyMs38ZwoeWXBuWGg84l871vU8
	5HFz7yDw=; b=Hb18gsxbOh8QiDuyG04mw0z4nqAJJX87xwSI8Sz0J9SgFsN1nnj
	PVbM2K+3gwQ+xH9/p65YqtDqq60qYE71ivFqwiDci58/Y0zO6FkthYgPWIGPMmP5
	QgcWrFws9iUzjereb4EuGh7FWdLLmtNDkOHb3N8+lOIQ+wy01m71pwrGl+uarCjZ
	h4UeJojzhmQ6xDDgxBBKD+szpkaq8K0zr70ul4gHIo34Nkt+h5TkNS8vtPcUyqkN
	xF0CCXATNHZeYfwLc/A7Lg658646p/za2B/CSnwvu31icMglSltHSRtaDwczs4GF
	Du7nDhlmvuTvdp1nUoRF7XPu5Xw3xicKGiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1692273272; x=1692280472; bh=NEdJCPm3giyMs38ZwoeWXBuWGg84l871vU8
	5HFz7yDw=; b=rGn9CjcfNjKbS1TUTUNlig6VXF7VBSJ1Uu8oXjIOH0uNFMOWP9u
	DsCYuXRlv4lv9ACoIDnv3DY9bh0x8sJvJDaOqo64F5WJavOYlFBEORapqJbJGwY7
	1mqDpPU4mPNQqDkCOeZ7784wXQNoGoM4TMiGS0r+exC6j6BW4nfIDwgT+LRaSnUY
	PRswXqZxM7lxyLmnvJ9UNLTjrOP57OJstFcm3TnZ0nmNGWxQ1U7PmMzubTH6wfvk
	dh9SJLFchTTNYNT7xgQAVn47TTIaMW8NK2F1QepjOVbWUtR89StNk1Sim/MPh4Yq
	nZvhTyRuIMaj/eOaFqOoGI8xz2r0Jg+yJ+g==
X-ME-Sender: <xms:dwreZF7SHI-f82bILVMiyNIt1qXbz-H2ez9hF6p_2sMhOjzwdAXXnA>
    <xme:dwreZC4i5I69h-NKVB_NqdLzdzMWz5Xu6TAMtAEd7QoyIfUbWFn-lKIqs_oYOAyb-
    Lb9ha69eCkVDRfiR9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudduuddggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:dwreZMc5oCs3KV09-SaAD1ziOu8ZMwkkSjls69u6Ewfjo5tGT_zkVw>
    <xmx:dwreZOLPeKGGazo_fX3vWLn_utuQyedB9l4XcVubGDD5071v5h-lDw>
    <xmx:dwreZJJT0SfHC5kBFVwho6YRB3mF7kV03JH25tpdbrdF6IDsLduEiQ>
    <xmx:eAreZGEuJ4zZgH5v4spzrFcosB55X_DqLm5UrISHcUkhfEexXrNce7T5vRc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B53EBB60089; Thu, 17 Aug 2023 07:54:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <4f72b1d7-00b4-4318-b3c3-50d11e4a233c@app.fastmail.com>
In-Reply-To: <15c26edc-eb4f-a90c-d52c-dd532c9d12ea@huawei.com>
References: <20230815125233.65469-1-lihuisong@huawei.com>
 <74f99c2f-fd9d-4cb9-a541-b699b79b928c@app.fastmail.com>
 <15c26edc-eb4f-a90c-d52c-dd532c9d12ea@huawei.com>
Date: Thu, 17 Aug 2023 13:54:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Huisong Li" <lihuisong@huawei.com>, xuwei5@hisilicon.com,
 "Arnd Bergmann" <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, liuyonglong@huawei.com
Subject: Re: [PATCH] soc: kunpeng_hccs: fix some sparse warnings about incorrect type
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023, at 03:37, lihuisong (C) wrote:
> =E5=9C=A8 2023/8/16 21:17, Arnd Bergmann =E5=86=99=E9=81=93:
>> On Tue, Aug 15, 2023, at 14:52, Huisong Li wrote:
>>> @@ -199,8 +200,8 @@ static int hccs_pcc_cmd_send(struct hccs_dev *hd=
ev, u8 cmd,
>>>   			     struct hccs_desc *desc)
>>>   {
>>>   	struct hccs_mbox_client_info *cl_info =3D &hdev->cl_info;
>>> -	struct acpi_pcct_shared_memory *comm_base =3D cl_info->pcc_comm_ad=
dr;
>>> -	void *comm_space =3D (void *)(comm_base + 1);
>>> +	void __iomem *comm_space =3D (u8 *)cl_info->pcc_comm_addr +
>>> +					sizeof(struct acpi_pcct_shared_memory);
>>>   	struct hccs_fw_inner_head *fw_inner_head;
>>>   	struct acpi_pcct_shared_memory tmp =3D {0};
>>>   	u16 comm_space_size;
>> The cast still looks wrong, while both comm_space and ->pcc_comm_addr
>> are __iomem pointers, casting to a non-__iomem u8 pointer should
>> still produce that warning. I'd suggest casting to (u8 __iomem *)
>> or (void __iomem *), I assume you still need a cast here to get
>> the correct address.
> Thanks Arnd.
>
> You are right. So I modify it by dropping (u8 *) here in patch v2.
> Please take a look at this again.

Right, if pcc_comm_addr is already a u8 __iomem* or void*, that
works, I though the cast was needed since it points to a larger
object, which would throw off the calculation.

> If it is ok for you, can you apply this patch to soc/soc.git?

Yes, of course.

       Arnd
