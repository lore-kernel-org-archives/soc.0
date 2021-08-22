Return-Path: <SRS0=hiSs=NN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F7FC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 10:19:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C378861214
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 10:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C378861214
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXI0gwmuIaKfyrOwEHbZXeUQc9BmACf209VnTedD5E0=; b=4c3RrS+IhzjSit
	VBW9e/0BB1drIRY7+hoj39+7T0Whbr2sPpEkVBydP9RIcyG6Fqz+P4o06o/yELEDYbyl5VduacxYD
	/piDTM1YGzHAviw294Q7o01LlSb9EylsW1UkrgOsL/5ns3ZnxKdRiEZ4X6FCjjO6DEalo/Lsci4D0
	xmT8cwTcONH52R6wbNdMR0LwoAjtAjyLKDHr2KYfKfV8i7F7i0vjFA7gat/T60RykQ7pmyE+mJO1r
	/eYDWxdzLFrKaiXSsiH8nPCcR3fhMOefizHgkflbrR8pKozWDuWebV+IH1XQlwcZmh46OBSkqGWxa
	D7jOIgKlpvpCThfLqb2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHkXW-00Dp4w-0b; Sun, 22 Aug 2021 10:17:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHkXS-00Dp3s-3j; Sun, 22 Aug 2021 10:17:15 +0000
Received: from p5b3b3c9d.dip0.t-ipconnect.de ([91.59.60.157]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mHkXR-0003qA-1O; Sun, 22 Aug 2021 12:17:13 +0200
From: heiko@sntech.de
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.14
Date: Sun, 22 Aug 2021 12:17:12 +0200
Message-ID: <5500960.5fSG56mABF@phil>
In-Reply-To: <5824467.iIbC2pHGDl@phil>
References: <5824467.iIbC2pHGDl@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_031714_206474_98BE2533 
X-CRM114-Status: GOOD (  12.57  )
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
Message-ID: <20210822101712.FjN2_zAzBZcyuRAENwoC_KwZf04c28qhDgzk3uQPUyM@z>

Hi,

Sorry, wrong subject
new mail coming up for clarity.

Heiko

Am Sonntag, 22. August 2021, 12:16:12 CEST schrieb Heiko Stuebner:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.15-rockchip-dts32-1
> 
> for you to fetch changes up to 9d508827c7939242e8ed6b06f66aa87d9f7ea832:
> 
>   ARM: dts: rockchip: Add SFC to RV1108 (2021-08-18 23:48:35 +0200)
> 
> ----------------------------------------------------------------
> io-domains for rk3188 and rv1108, sfc (flash) support fpr rv1108
> and some cleanups.
> 
> ----------------------------------------------------------------
> Chris Morgan (1):
>       ARM: dts: rockchip: Add SFC to RV1108
> 
> Johan Jonker (6):
>       ARM: dts: rockchip: rename pcfg_* nodenames for rk3066/rk3188
>       ARM: dts: rockchip: add space after &grf on rk3188
>       ARM: dts: rockchip: rename timer compatible strings for rk3066a
>       ARM: dts: rockchip: remove interrupt-names from iommu nodes
>       ARM: dts: rockchip: add io-domains node to rk3188.dtsi
>       ARM: dts: rockchip: add io-domains nodes to rv1108.dtsi
> 
>  arch/arm/boot/dts/rk3066a.dtsi | 10 ++++-----
>  arch/arm/boot/dts/rk3188.dtsi  | 13 +++++++----
>  arch/arm/boot/dts/rk3288.dtsi  |  6 ------
>  arch/arm/boot/dts/rv1108.dtsi  | 49 +++++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 62 insertions(+), 16 deletions(-)
> 





_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
