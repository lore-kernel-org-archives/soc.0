Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4A6C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:36:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88B0A60D07
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88B0A60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0cYLpmf05eoykcD4x39k2WABsqZfbyxZzu39NiwhsCI=; b=gITDmYTGW/b8B6
	hvCSUnc0+6AP1IGsxjap2HpHuaHnUqnKqAKzdmTrAoN4T2e37g116dwu8P6nRzfJ2sp/t3qSUrHbl
	xQDtnll9QtAom9J6NZSIsQTfDuBCFefMgLVPtCUiF0+Blphw8lNhLUspFvCNLLSo5jucp7O/YlPDZ
	r0gGIcqsaK+EIu5lPoW4WGrOGN6syaYzO61jImjuGd88uVV9Pyv6e2gc0C6N4TWYfbaI1HFDUD78k
	sFInbwRnj8ZIBSZnkWRQDfJhb2iwWpxdTCYEguBOi/8+CUJLOQFbKNLm/yRM4Gfa2DLPNS7oOqPnD
	8EftiQ5oI4wtptJXTjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFkFK-000OL5-4n; Mon, 16 Aug 2021 21:34:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFkFA-000OKF-1e
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 21:34:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC27F60F5C;
 Mon, 16 Aug 2021 21:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629149643;
 bh=irFg21km5G6NjoALA2TXJaOOVa6FN620B3pXiw89jSc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bRO6ymDV+m5C5OEQ80YaEW/rrroPEGmdS5yxIfEEy3Jc8Z8PdvS/nIrACiW25IbPr
 H5NkczuL6SKUhYFzfMVoiIKj9ZxCfOk5Ho4/wM4NuyOWZuXTCLT1wUjDsB/0o7uEA4
 NCHrQMds5iW/G5Yuuwp97/rtqu9UCknaccytu4xJdKKv2pEM+ITU0qLIZRd6eLwQ6p
 GadWx1Rn8ScVJVMDy3jKwnKk7J+Zpy4YHrMp9XG+R/PGcWo1Z132AvClx0Xv2JaS3S
 fIqZiVP2zjRyFO058TqqgcFNu0E2oBjEa+o/d+4gswRPKVxNwvkc+gigJji0eBZOoA
 1NJWRSN/VG3rQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Li Yang <leoyang.li@nxp.com>, Stefan Agner <stefan@agner.ch>,
 linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [GIT PULL 4/4] i.MX defconfig update for 5.15
Date: Mon, 16 Aug 2021 23:33:55 +0200
Message-ID: <162914958924.240013.14798086285090389269.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210814133853.9981-4-shawnguo@kernel.org>
References: <20210814133853.9981-1-shawnguo@kernel.org>
 <20210814133853.9981-4-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_143404_150070_7BEC3C5E 
X-CRM114-Status: UNSURE (   6.11  )
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
Message-ID: <20210816213355.PoJgKe4CVoH4fFWQnQR9AvAsod7fOOMBFmGmhLm9Hvo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 14 Aug 2021 21:38:53 +0800, Shawn Guo wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.15
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 1f69aabe1ac06cd5005352fb9314e7409b712487

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
