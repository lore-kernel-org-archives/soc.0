Return-Path: <SRS0=DM4H=MZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A55C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:35:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A79260F6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A79260F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4+qu87gJSUsbNhBFxxcknkugL+47yeYqKNLhtQFTw4=; b=DlnmpCAHkh/I6I
	ySjl2XNRW3mmxDwa4uSSesheipUf183StQmmN0RdHPylELrOrDTrqGC3nCPezc7h56I2JuUxr8mOL
	+iOOwdlCd/YmB5oUaxWFbB2j1N85Pe2ngFEjQp/Tnx+f7pM5crIFqjuHRYYRz0WoGVmkA6hghN374
	UINC+1RhLO3G7aT77spYT6QLK4GZ8J2n/QL4CVyNHoPUwX7zVOwiPZmBTo1dMYGt08YcIxOCXK4zs
	3kmaQ5y9jcw1fWW1Gkr9dZKSTcvBScpaWmHzrujHoaKTGZ+EpCDF1LQnUvPpnYUVKeUMpypChrGd/
	HzrnabMKbUodNe/+nrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAY4K-00GO7F-Cx; Mon, 02 Aug 2021 13:33:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAY3x-00GO4r-4Y
 for linux-arm-kernel@lists.infradead.org; Mon, 02 Aug 2021 13:33:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97A6F60FC4;
 Mon,  2 Aug 2021 13:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627911180;
 bh=5Utd1jsqdXvkifa65CMmossDe8JRj7ZzI8zHwZTHDqU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z+9Nmg43m/vyoQ6+hKtTfxSetJyY0VfI+jYvecW9fd/dxu7xLfJsG6tQRtr51DC7/
 G0Tr/cwVtdsY5YHx0nQxgdAAlY6SFy43j8Co1PlZd61rk6+1ictczkw7ytA6zWA7c6
 0HOZqae6IpyY4st13ndHsP9FK1/FOf/8/Bj5vRojWigM2iOtZobxEyNqIQDfKEUWZX
 IahAWtWvoFvfWx2iwMxfeRirT1fIyOYCnHZ87hcHufDiTOJo1YrNFXBJpYXScRqzln
 v3074W7adMjdnMXrH+t6y/vgp1nXjCSBoE12LgS8XqJedvdco7m1LcUkmq9tbEMj6a
 tywufG5G5L0mg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Li Yang <leoyang.li@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Stefan Agner <stefan@agner.ch>,
 linux-imx@nxp.com
Subject: Re: [GIT PULL] i.MX fixes for 5.14
Date: Mon,  2 Aug 2021 15:32:42 +0200
Message-ID: <162791113528.1139989.15546456709229753234.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210726023221.GF5901@dragon>
References: <20210726023221.GF5901@dragon>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_063301_239708_E22D685F 
X-CRM114-Status: UNSURE (   6.48  )
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
Message-ID: <20210802133242.KObvGXAg2IyCbETisxeDMMjMSu7JH98L1eN-xuG69Xg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 26 Jul 2021 10:32:22 +0800, Shawn Guo wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.14
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: bee757485161e2bb43fd0bcd5f7e17cfe2b11bbf

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
