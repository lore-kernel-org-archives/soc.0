Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD59FC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:15:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A61E822203
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A61E822203
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hoZoi2ZGFgp4nYY4gPcIORcenFGWyzOCx9LgDdu2yGM=; b=Rk5pSvrclyUlpCD1vAiz7Lyrm
	yuZXQwCRnHektdTCEkN5TPBg5dkbEgZI2g13f20JDiAASJvY7/f+IlB/xHSJuRfMPvXe2q5dyvBbW
	7uVRQ3pY+Po7VF4QwBDjJSmrR49QOULGgXydzOUCuzyGuFs3ZTLdYv8RcpaeZbCRFvWKsU3a+DZGb
	PAz9yLemkGvk0bX+85EsjhSHFCtsJRJNvBw6bRNPaeyvhHSscOwzHKTMYL+J6Fcrcff51eQm3AYyK
	hTIykCcxGiUJL22rj8jTnSdP/rSR+zcFT7sEp2an/977pCuFieQxPzwQ2cdA24sq6gj4AtB6PZksr
	aavx2RbZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmmBO-0007Yi-0s; Tue, 08 Dec 2020 23:14:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmm8Z-0005oS-U2
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 23:11:17 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org
Subject: Re: [GIT PULL 4/6] i.MX device tree update for 5.11
Date: Wed,  9 Dec 2020 00:09:55 +0100
Message-ID: <160746884798.2839681.17624616146820987866.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202142717.9262-4-shawnguo@kernel.org>
References: <20201202142717.9262-1-shawnguo@kernel.org>
 <20201202142717.9262-4-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_181116_234334_7A5F8409 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208230955.sKMtjGQiz4eoktNgTx-OUhn-LyUAMmO6kJhK1F71f84@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 2 Dec 2020 22:27:15 +0800, Shawn Guo wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.11
> 
> [...]

Merged into arm/dt, thanks!

merge commit: aa66be3bff6593bc74c5e09875709cd66e571b27

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
