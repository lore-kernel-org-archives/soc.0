Return-Path: <SRS0=C417=NE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6739AC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 18:57:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2011560FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 18:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2011560FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqibkjDDZ/6Dwk3YPOeVSYAU4X9QtP/xfz0UsAc7Y2s=; b=mYzWqPNGHCq39c
	p3ZW3l/UuPeDa754m34V2/5FPRoQmDwLAg2GNS4oolbPq1Dul+cBqotYX2snjBo6pp85jBrd4nyOx
	zC/8gXZQulL/3BkZc09AliqlWjlGE4AtWnLwMyV6gc1C++DP7iDVQCO2uVedG5JtxkCTHfQLhR+tF
	Ry2+tYwgEmqNAS0spNAu/2oEdv/zBQIlXVHwBQff1bCd3KFtp1dHZi3+gepPDx8l67oK11bV9LSF+
	BmcM1B1MPyxzBklPEr6khXM82x7YGvqUEpY2yQGbw/IEhEBC2h93Msg6oUtRUAU6zyXBJ7aONzxdM
	y9/NDgz8GnOBQ7HYN8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEcKy-00DO2J-KZ; Fri, 13 Aug 2021 18:55:24 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEcKv-00DO1Z-4e
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Aug 2021 18:55:22 +0000
Received: by mail-oi1-f171.google.com with SMTP id h11so17388067oie.0
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 13 Aug 2021 11:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cng24zHOfefhsIyuo8+sls9JUJaOQc7bK59B/LvqdMk=;
 b=NtfLwxRhN2w1pV/4FkZDyDCb5kXKLlctPzhFw3AkMZUGoxLvFTqBdQwKrwROowyvqQ
 G8gr0F/p1kJdPZluOObsK6UyL9DuH/gPhQL6s0PTXcA+hffDI/4tSP3BEnmcx6BM4UDi
 +bdKpSgtnGfYvRGXMmAJUxY8ZulF6z+g941pDRT2ZVMF78AvKqPdp7SinhClmmWTmfQL
 IlDj+70p7OoDNUOSS6a2ZWtlgHlnnoehR4OPHELqbNs07ZJ+LThj42CScy8MfbM6QaAN
 0Rd4yux/gGH7RJZt4yROURls6eRH0bbtikeTGZCEdTJqQb3RHuYMztxOTvTKmLzwrGot
 qJEw==
X-Gm-Message-State: AOAM532zRRvgW0Xcnt880Aiq0oOumvoB5HOlE4j6BFmhh2CnRYc5Glr9
 iP6r19etBCQsMjMEI+TBzQ==
X-Google-Smtp-Source: ABdhPJzwh8U81EC0A8V3HPWGGTJ4J2sIg/6C2OiLum4E+86UHhc9fu+Yxp/WTdfVouHPjIRsBKPoDg==
X-Received: by 2002:a05:6808:bcd:: with SMTP id
 o13mr3401856oik.61.1628880919869; 
 Fri, 13 Aug 2021 11:55:19 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t3sm520494oic.13.2021.08.13.11.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 11:55:19 -0700 (PDT)
Received: (nullmailer pid 3859064 invoked by uid 1000);
 Fri, 13 Aug 2021 18:55:18 -0000
Date: Fri, 13 Aug 2021 13:55:18 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 2/7] dt-bindings: add vendor prefix for exegin
Message-ID: <YRbAFrGzKv9s0mKe@robh.at.kernel.org>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
 <20210805155357.594414-3-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805155357.594414-3-claudiu.beznea@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_115521_224496_BEAF1E4E 
X-CRM114-Status: GOOD (  10.44  )
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
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, arnd@arndb.de,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, soc@kernel.org,
 ludovic.desroches@microchip.com, olof@lixom.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210813185518.cG11kad8L82cTAGpMDUKmFbXbX3S9U-QsJ_SiZBjGNU@z>

On Thu, 05 Aug 2021 18:53:52 +0300, Claudiu Beznea wrote:
> Add vendor prefix for Exegin Technologies Limited.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
