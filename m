Return-Path: <SRS0=AlHn=JS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D235C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 22:08:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DFFC61437
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 22:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DFFC61437
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9I6TLzDm+P8W9iLiBeCSXdD0QVe+FOGR46Ov0o70AQE=; b=QchgpLpoA5CWbUE5pyaqxZhM/
	3uc107U7IpHc3AlyM9hoTnso2rdyDXYS62v3gFqV7cHROAmajfh4wKa0Me1orx3+swbyllQ/1MRvE
	rLTiSFtrkD9Qtkr4A2/e4wfFHeP19Q7ZHsVCQHpgGcAPZbtGaZ0Xfxszr5e8oghlZE+nSoZFqJPRX
	969CMVcx2jqrn5ZvymgMfe7dlwedUkLd7gbjRxuo8kRc9On7CCQKC4MhToe2D05E7CbrhTFOSDL0B
	umLRJzgPXlCNWDTTZPf3/n/RFKaZVcuClC132uzjMQx8elRvGiGOReO7QS/yxrebi226H0GtdEYq7
	eb1XikQWQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZL15-00FGVK-9L; Wed, 21 Apr 2021 22:08:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZL0w-00FGV5-G2
 for linux-amlogic@desiato.infradead.org; Wed, 21 Apr 2021 22:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=B7HN9kmJqg3nDcnNpEUGeHtWjMZ+HAbcP7LqiewTvjU=; b=0NQED5NTyEVdiJaMg9zUdHbzuU
 4kd1UsBTs4rXss0POEnGB8b7lWlEt4XKL1UZIadUXwuyP6uhYA0UXezoBsLHYOQmOyNJCE6OZD87N
 ICzY5qTfFaR4K8vHdnnkq0FrVF6EfZYublUhrc0gInMql186OwqdctkpInHtcX7YFuVgL6j8RWOnb
 deCc1y6ouE8pqL1GhPp9UUVLlPdiIUXS7F9vBd+2i08MgChwqIe2wfDG18XswxGxovQxsgRix61pp
 HV6ExUx0xd1odvyEgLm4x9B2dYhvtAICXDewOxPO88ZaOx4d4ZDVvcsKS6TE5nvTJYKO073p4C6tM
 5R0sYq/g==;
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZL0t-00DDih-Ul
 for linux-amlogic@lists.infradead.org; Wed, 21 Apr 2021 22:08:05 +0000
Received: by mail-oi1-f172.google.com with SMTP id v6so16074559oiv.3
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Apr 2021 15:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B7HN9kmJqg3nDcnNpEUGeHtWjMZ+HAbcP7LqiewTvjU=;
 b=i4nFbMiPlZKJAJXrhhO+IIiNjrcbMFw5xZ+g3e25A4FKSULhKcHy4t3rKy2zDBA6ZC
 g8YXylPxAW6+XUcka9ASRMirWINS9izP7+r8BjpCtvOYLZH0C4nPymBA/HEq1mcSCBgE
 H9xrI1SltH+4v78zE7gEMD5DSYhcs4Z3GHVEwjgjyiSjClYWZ6REh1H30jFnWHahPuAY
 w+NyyfmhEif2s5tsXEzM6LPhqf5AYuabuFWy0gdvgwv8+hZmq2BzySpBEwV7h+0pRwdV
 ZztPtjTd3r7ZnNsfYdqdu1aE9PONKUtAhIqfjmhrqRuEDVh1Cbn1ZGDHWTW2H+KafKkW
 ih5w==
X-Gm-Message-State: AOAM530NR4L0cLCuQkWoTfbka/y2U9kD57AzD+gKC4K5m6/njNsct3aw
 qRJtYW+MT75w4che7g8u3JUnryvw8w==
X-Google-Smtp-Source: ABdhPJx/l9P3CfVp/lDyVvVMMVcT02A6NeUzXDvkdb/rJGquK0l6K2PlpbcX527U5HSH3YPvrhcA9g==
X-Received: by 2002:aca:4b83:: with SMTP id y125mr8162994oia.31.1619042879582; 
 Wed, 21 Apr 2021 15:07:59 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 3sm195256ood.46.2021.04.21.15.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 15:07:59 -0700 (PDT)
Received: (nullmailer pid 1702061 invoked by uid 1000);
 Wed, 21 Apr 2021 22:07:58 -0000
Date: Wed, 21 Apr 2021 17:07:58 -0500
From: Rob Herring <robh@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>, soc@kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: misc DT schema fixups
Message-ID: <20210421220758.GA1702029@robh.at.kernel.org>
References: <20210421204833.18523-1-khilman@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421204833.18523-1-khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_150804_007656_0F3914F9 
X-CRM114-Status: GOOD (  10.01  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210421220758.RDGqUdqZ19jCqRR3KhFScvtvRmcTLe8UKIDCTv0xp1g@z>

On Wed, 21 Apr 2021 13:48:32 -0700, Kevin Hilman wrote:
> Take a pass at cleaning up a bunch of warnings
> from 'make dtbs_check' that have crept in.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  Documentation/devicetree/bindings/media/rc.yaml    |  4 ++++
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  1 -
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 14 +++++++-------
>  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |  2 +-
>  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |  2 +-
>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  4 ++--
>  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  2 +-
>  .../dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |  2 +-
>  .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |  8 ++++----
>  .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |  2 +-
>  .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |  2 +-
>  .../boot/dts/amlogic/meson-gxm-wetek-core2.dts     |  2 +-
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  4 ++--
>  .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts |  2 +-
>  16 files changed, 31 insertions(+), 28 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
