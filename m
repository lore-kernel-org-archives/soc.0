Return-Path: <SRS0=N8cr=KO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4C1C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 May 2021 19:52:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 550C0611B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 May 2021 19:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 550C0611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HluxkwCVdatuHxrfqsmJ2Ia9tImu1HhLEW45EZjgRWI=; b=q9ql7mgRE3twdldm3D+z50gIG
	PegqGsARMnvMZGujoxf4RViY3dPj7CqkWMU91XphxeDF3U0SGIEYMv1BWf4l9WPutjgCntf5biC5r
	kcek37vFUjU+tEAN3CpshMpNTzugMTH3Ak9TbVV5kxob3MpX4VsjGDIX130sTSg8D9jkXohhPtYwG
	wHArb+5wHSlrybQTFsXQ0g7C7lBwMKY+zNyOr3e6cNTS2xgFqaLcophDvbaJvaeos1aohEwXi0SCD
	d0Cjp3zbgxSoIwj2ddxL4iZ3jFARgvTgIZ2854efLLNDJTPzOqE+48u1yYobGq7xd8/+vbrkiHBzv
	wojQeAa4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljSDS-004wdz-S9; Wed, 19 May 2021 19:50:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljSDP-004wdo-HB
 for linux-arm-kernel@desiato.infradead.org; Wed, 19 May 2021 19:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kx03fvdnhSjjspr5z254cIlvTfBxI5CrgzMJyPL5sC8=; b=43SKBM6is84L82R7Yl+s5x2sAD
 niAAvVuaGy5dszTMr3gTLSFPsDuxl94nr8nwYcmu9EyP9zW/c0J8urqv9Z6mVSS2Z56ltYlTR78vU
 h0xDhV2UJUeUpvvBMTOPIPSLE9VudUoklW2gf5CzFlll1CHWmCgqPaB8KI82Nx7ElN+Wmcu4FF4yG
 ivDXSOwg6Y4RG7hDpY3OHrtp1VOakTgdMGAezFaDYTqrSClNN0FuYQVpHttGO5Bm0G99HttMx6UcB
 wvl/BNXvzemzcVQHlRXQV1WcayM7B6urEvZGKY6D1hOSgWMQYvfipXFLpjuH0qcuf5RQ6geJ41b52
 J/NzaLKA==;
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljSDM-00FkV9-T3
 for linux-arm-kernel@lists.infradead.org; Wed, 19 May 2021 19:50:46 +0000
Received: by mail-oi1-f171.google.com with SMTP id v22so14225678oic.2
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 19 May 2021 12:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kx03fvdnhSjjspr5z254cIlvTfBxI5CrgzMJyPL5sC8=;
 b=LPJfvjNG49KHNdmcjjbmLYKH/ZbI8DhAvW4olWLZg8t8hBt0wZ/KMLIA677RjvWn5e
 lw6bu7ZfFDcSfzGmrjUOXkNdcuxiYguCSEW/0r9rrhzrVXMVGUe/rcJmIbv0U4z8KNRL
 iZKlOS4LhDMu0662Q+e3jBJneB6tfXddlyQr2iatMFGRveTam6yVBk4BsylY1Pxsb+Ba
 t1L0R3kgp9TL3ETT4qMMvYEh2TOoJUof/cT/YrI3aZ17t78hvj5R1J3sRAoU8Hdublsl
 gZLhUg2bg/XzF7a/FA9aIcJNY79I1KRS68pjrMJn1vmprNsblhefTf1LVSu9vT2NbWO5
 CB6A==
X-Gm-Message-State: AOAM5306WnhOnJnPdg2si/DIpDIldSA/SOguKSqohFlRWjHWo0Mm8BM2
 IWi7IJ4djyAkitXk/ln1bwbOQBZLyg==
X-Google-Smtp-Source: ABdhPJy6M4FHoTzsYmeTAl5vxwq7ZJTk3MzyMOfhxI/Egom/A/S5/+VLjz+C/vNSpN9gJ3u2ntpNLw==
X-Received: by 2002:aca:4b91:: with SMTP id y139mr787385oia.78.1621453843557; 
 Wed, 19 May 2021 12:50:43 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o20sm148796otl.2.2021.05.19.12.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 12:50:42 -0700 (PDT)
Received: (nullmailer pid 3535122 invoked by uid 1000);
 Wed, 19 May 2021 19:50:41 -0000
Date: Wed, 19 May 2021 14:50:41 -0500
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: linus.walleij@linaro.org, olof@lixom.net, linux-kernel@vger.kernel.org,
 soc@kernel.org, ulli.kroll@googlemail.com, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: add vendor prefix for ssi
Message-ID: <20210519195041.GA3535062@robh.at.kernel.org>
References: <20210517193205.691147-1-clabbe@baylibre.com>
 <20210517193205.691147-4-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210517193205.691147-4-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_125044_958473_0E6C704F 
X-CRM114-Status: GOOD (  10.32  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210519195041.9sWQWKCTRUcUYsFd8zlomS_1eWwEIAaxsSUN_6NweoQ@z>

On Mon, 17 May 2021 19:32:03 +0000, Corentin Labbe wrote:
> Add vendor prefix for SSI Computer Corp (https://www.ssi.com.tw/)
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
