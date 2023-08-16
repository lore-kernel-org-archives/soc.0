Return-Path: <SRS0=EXQ0=EB=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456E4C001E0
	for <soc@archiver.kernel.org>; Wed, 16 Aug 2023 13:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA939C433CB; Wed, 16 Aug 2023 13:17:24 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFA0FC433C9;
	Wed, 16 Aug 2023 13:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AFA0FC433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 3B531320030E;
	Wed, 16 Aug 2023 09:17:22 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 16 Aug 2023 09:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1692191841; x=1692278241; bh=Vj
	n94xi5RWGCup7AZFCIyVNKiwp8ToHDiiSrA8NQtEk=; b=Fn5CSScABfL/LpltM6
	RuiLwN2eNbqKTn1zVR2FGU1k+wPEdfQc7E0m10n9kl3gdxPiJbLP3aRlZXaUNoZg
	RZWmN7kL9ZrJXDOdU9fVyI4gFhS5kyB1I6LO3IIEda8qZZS8BoGNsH+HwFTcYzfg
	PNXIOFqO+YTnARXBHO4R2lk75L94KTwJTPCDOFdSTp8qHlD2cWCTBXrynxnH6t8N
	M7Yrvzp73hnI2F0dQF8eACN8sSIvEKrieLBnBgfY6DfT7FmU759h+3rsub/CDRRI
	qO8nepuo+ktX0wMBhyKqPKcufYEbcQqGwGDcdduI4AynNlIvdYBg7O0B3uDIRESF
	vAag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692191841; x=1692278241; bh=Vjn94xi5RWGCu
	p7AZFCIyVNKiwp8ToHDiiSrA8NQtEk=; b=B9PAXlckkzHQk+FjJtz34hUqaLkRl
	7ysvLKweClUgqPRbz1pW38aQcMTjVYYk2THincLg8PqkZV6MACfL7ZYJMyftW4+c
	rRexstTs31G8+icb2pVy9hu/X9p7aovs/k1ZH76Rj/sCiTW/WYYBa7H3Nsbh+G8w
	3No8Sho00yTSiVBoF9eknmceLXW9fe5TlIKixSY2aZtH8ZffebHLbaXXWcdDS5Xq
	FebXfqtEyW7BPRe/Q7JGoRQ8/rha0Bt6xTBx9vrp5GYEFYFSsTrsA+b7qoBzXndq
	75nDwo9F4Fhd8XyJUM0KpEA18SrRDu6j8np4K4SDcH14//m1j/7OJxw5Q==
X-ME-Sender: <xms:YczcZFYTGLEDkgopkLLOEIkRwXq3sxS271xAV3WmzginuwwBt8DWFQ>
    <xme:YczcZMab3bcuCd2mvH5mE6pC-mU39-EmUPuGD8-75AOyZkikpfsEFV6oMYaFiFHcG
    R4zE1kBKU4Uls3E-Cc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtledgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:YczcZH-PN6k4_r4RfW2ddMHYkctx2u3eCsLBRlagrI4G_DVpSCARWg>
    <xmx:YczcZDqfi6ffiLkeDW_W_8jI2ZI9Nc31glu8QD6vud-5HzIP5S3t-w>
    <xmx:YczcZAqsPBnSPLO7lcE-2SWoTjxnH0mTYuvo0WMU_tzhTFMW94i-2Q>
    <xmx:YczcZJkWBIxGTPuT1v_t0vvp_y6hbhyuJcTTPJtD86teLYvfglUuEg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0264EB60089; Wed, 16 Aug 2023 09:17:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <74f99c2f-fd9d-4cb9-a541-b699b79b928c@app.fastmail.com>
In-Reply-To: <20230815125233.65469-1-lihuisong@huawei.com>
References: <20230815125233.65469-1-lihuisong@huawei.com>
Date: Wed, 16 Aug 2023 15:17:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Huisong Li" <lihuisong@huawei.com>, xuwei5@hisilicon.com,
 "Arnd Bergmann" <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, liuyonglong@huawei.com
Subject: Re: [PATCH] soc: kunpeng_hccs: fix some sparse warnings about incorrect type
Content-Type: text/plain

On Tue, Aug 15, 2023, at 14:52, Huisong Li wrote:
> @@ -199,8 +200,8 @@ static int hccs_pcc_cmd_send(struct hccs_dev *hdev, u8 cmd,
>  			     struct hccs_desc *desc)
>  {
>  	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
> -	struct acpi_pcct_shared_memory *comm_base = cl_info->pcc_comm_addr;
> -	void *comm_space = (void *)(comm_base + 1);
> +	void __iomem *comm_space = (u8 *)cl_info->pcc_comm_addr +
> +					sizeof(struct acpi_pcct_shared_memory);
>  	struct hccs_fw_inner_head *fw_inner_head;
>  	struct acpi_pcct_shared_memory tmp = {0};
>  	u16 comm_space_size;

The cast still looks wrong, while both comm_space and ->pcc_comm_addr
are __iomem pointers, casting to a non-__iomem u8 pointer should
still produce that warning. I'd suggest casting to (u8 __iomem *)
or (void __iomem *), I assume you still need a cast here to get
the correct address.

      Arnd
