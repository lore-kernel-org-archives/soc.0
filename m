Return-Path: <SRS0=GLt5=MD=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30770C4345F
	for <soc@archiver.kernel.org>; Tue, 30 Apr 2024 08:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06639C4AF17; Tue, 30 Apr 2024 08:06:55 +0000 (UTC)
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8611C2BBFC;
	Tue, 30 Apr 2024 08:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8611C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id A1D371380903;
	Tue, 30 Apr 2024 04:06:52 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 30 Apr 2024 04:06:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1714464412; x=1714550812; bh=uIJWRQ/GsH
	ANFmMHphyChIFItia/z5Pl0jXnpAecs5M=; b=AjlGQUEoh+KEIOsH2Ud7xVCZSn
	3v0RVla3lL+C/slzwG3AOb/vqg43pfaXY2nqG5JnN7O91drQI2rpclDIfcsVm8tW
	sdesTTbt74UPPrcoBx3VAYHDBTGuJI9x39OBg/QXl3EYZDnGdC29V/apaBEhMAwI
	sjUE83aUTkytr3OpqmHeRZDhE+1ZCLJ83lSLFYx4N4SgB4Kyley1rDPNxgNU3hA8
	7db5IAJrDeZo9n3+841/MsbiLeknsR4vb423T9Cqllj7bjPmlT94J/52aC0aZuYQ
	HQRwGj9r6/sJZq05huQxGxlJrcoxKUsx9kijfSvjdtkmqjtXSpa9+h/GIc4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714464412; x=1714550812; bh=uIJWRQ/GsHANFmMHphyChIFItia/
	z5Pl0jXnpAecs5M=; b=kVcaXL5CKezi2HbBsDM4xRGKk5YcdWo6ZKxSy7jseocz
	BHcPE50WYEk677GwEqdnMbuXegbkGwnkyjL6cjNuM+MiWo/bC8fQ8j2rcz7IIRuW
	JQV4+Shb3eKeYRxa7fy4Z/lqH+X3X0HvwyAHUmm1JzjZuBRW1Pk0feIw5FpXRlZu
	HeOpACcIAePLInOayrZqdO9dvAZFSqXSBLuQSuhdgUjCBpSKGMstEQ5NYcDvPVrT
	6TZbgmkbk7ijP43OyL3FQwPNgwIxR003shFzt8kZ4Zpn00IiHMXUxY5nLbITvtp2
	aSmgVsiJzjhdiPPOzktA4RbOF4emjmbYaSSI+7gwgQ==
X-ME-Sender: <xms:nKYwZrbLnUBL5mw7YrV3uAhODw4bQNvGPcbMjc-GB_-fh7noHaHBXg>
    <xme:nKYwZqZc8y8Ad3SkvmKroHy56Q1IyfS5vGwDcYerJCGQItMr-iqjIPXuh3r8dEX97
    Nak0NlZdfwLBWafe6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduvddguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:nKYwZt_uQ2QeHlFSq-lhSQ3aJPPg3fKUIpv9031TgPevUxRyJhIriw>
    <xmx:nKYwZhp7AJYc_m8I5AxY9xMYvq68NBTimaTeYQyELf304zv8aF32WQ>
    <xmx:nKYwZmqKCZHI4JzXpgiPybMfETPKEJl__PGqE94WtIx7eJeF7SKxQA>
    <xmx:nKYwZnTHCVoHgd_NKrEnDBg5zuL4Jtj7d8gd1CHXIAucnMAlbETRKA>
    <xmx:nKYwZvlX4EMc_kjysJcJlUUElQ6KQTHex6X4QFY1ftLSOOUdtkVsoX0O>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5D0E7B6008D; Tue, 30 Apr 2024 04:06:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
MIME-Version: 1.0
Message-Id: <8f777b2f-ab15-4df7-91e5-f779f408fd65@app.fastmail.com>
In-Reply-To: <2a683392-9fda-4da9-9bf5-ffa2b982634c@collabora.com>
References: <20240423102915.371782-1-angelogioacchino.delregno@collabora.com>
 <dc4975fa-82ae-4b2b-94f2-c518595f8694@app.fastmail.com>
 <2a683392-9fda-4da9-9bf5-ffa2b982634c@collabora.com>
Date: Tue, 30 Apr 2024 10:06:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 arm <arm@kernel.org>, soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree fixes for v6.9
Content-Type: text/plain

On Tue, Apr 30, 2024, at 09:55, AngeloGioacchino Del Regno wrote:
>
> Yeah, I have to fix my stuff to stop generating the gitolite address when
> preparing the pull requests.
>

This is what I have in my ~/.gitconfig:

[url "https://git.kernel.org"]
    insteadOf = git+ssh://gitolite@ra.kernel.org
    insteadOf = ssh://git@gitolite.ra.kernel.org
    insteadOf = http://git.kernel.org

That should be sufficient to transform the URLs the way you need.

    Arnd
