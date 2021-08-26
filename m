Return-Path: <SRS0=ky5b=NR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3A0C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Aug 2021 09:49:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45887610C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Aug 2021 09:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45887610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPNGni+oOR2JA+xq+LttB78c/1uvDGbBID0eF9lkoGg=; b=bmSCuSUYKqjfYD
	WQ+yumDtA+SoasK4KMH1D5be+gcSX6hTVjxdkV6kKkZgQAi5gS7GOrpauAqb0C6LrRfrlVCMnc+pc
	H9O3KnUrJSPt+AoNkZfzvJs1X3GuObXQTM8NZeOOIRTVAG1qabwNSLR64uSrrefnq9Srdf/ZqNex4
	R3/43sOdpv45V6bjcVrfYPtwnO2OGz/dbigEqmVIROvfxqcDAtkRIW5OwtRYl+0qDlAd3FOdgvnuZ
	Rh5NUPytPJjMbEpKpH07Bn/WujyYkFM74+tRU4s0Jpc/PQqVxQWNJY1UzPjHdsIE7yvj3ntt4CViT
	X+vA/GySCQRBRsameY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJByK-009hna-Id; Thu, 26 Aug 2021 09:46:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJByH-009hn3-13; Thu, 26 Aug 2021 09:46:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2717360F44;
 Thu, 26 Aug 2021 09:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629971212;
 bh=UxrM0x4j8G0mI+Ow0VfTZTJDPmtZUpaAU+MPTSxQzfM=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=WbIzb9SmlHK6nBhcq3lt39+X5IkxAmkplDE6T9j/+9V6wCMLApzcAbQHW+gk/gtEy
 BoYHGggblkqolDo5CSpzRWDOdwArqzsxv7xJdhkgJ+XMVCAAxZ9M4vrzb6NHKlh4s/
 pagjui2iDzvKogbY9dMKOjvQHg2GglgAPvIdqMcxvleLLVx85dRdEIb/iILhrwQc1o
 u6tj/JvlzthvQGCC2MXty5slnwF5cuccY20iGWdyUD3WDjma7MO6TmmfBBCiX3uXeF
 AhVSE1wERMq6DzcwpwoikS+pGQ7xLqw4GfCzuymudmrlmMGu0jQWtxAr6bRn6jtIRf
 1md/1XzAZ0QVQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>,
	arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, soc@kernel.org
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.15
Date: Thu, 26 Aug 2021 11:46:47 +0200
Message-ID: <162997120229.839533.16666800980996064954.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <4142796.VLH7GnMWUR@phil>
References: <4142796.VLH7GnMWUR@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_024653_125372_350CC78B 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210826094647.9J8rH4PvvgxHqZ8mlK8RiPzWNtCQbPJ4iN4E7npfo8k@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 22 Aug 2021 12:17:36 +0200, Heiko Stuebner wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.15-rockchip-dts32-1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: bb4544c6d415d42018ecd67826c0ac714bf86b7d

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
