Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA4DC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:23:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81AC160E97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81AC160E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3QOoiwe6bt1IIW2lrgLL7bFbyEgzZb+2IQBwQpjTrE=; b=Qy7gwo26pRej2e
	iqTZHMOo9cBVd+KtJ2qjJkMx+ws3gKdt7dhJHrJZEuu1t5LmtwaGyhU9XvdGUQjH2tyjbHydBWega
	EGFL01rgXHVQ2NUbfRiwTTXUPwH7G+4pM17s6kqSEhYQgvHmLqRFz83seChH5sQUDf7sOhgGMMrzK
	DG/H42TCPOajUxldaSl2dGNque85jsqIwPH/8r81gC1zok83BxCa27ytqAs+xwsbKosAsvU1+sphB
	uAmxWK03Sh8GbwCuo9bCYVdW7uQH2K84tguIpi6B95pdzNASLGeTGeXXLalIiPiwB0fE7R8be9LC3
	Rlk/DPTDBW6lVIGZdo/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFk3G-000Kc7-GA; Mon, 16 Aug 2021 21:21:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFk2Y-000KNY-MH
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 21:21:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BD0260F41;
 Mon, 16 Aug 2021 21:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629148862;
 bh=Emb5YdknXpn4P/KykFLgzd9ybCudZq6evQKOErNRsXw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uY4jgdpmOYYtQcwbgBiQ6zdFzrp6bjR/5qMdlmO+L7xhifBm6K+KNROdwbUEll9iI
 LSGc6JxhYXSJL6LJW1uRbyP0Anhc+15QPqLbQsvtnNsBbOYg1CZbfmSFUL7lbdL3QE
 +ilUKJHSEIGKLM6kBld2eMde5tdYuQNfjNzoC4LHRE5mshnG6hcyIXY5Vx7WDEamug
 NQNn4WN2PKvyTq07EjwMXskHpESSktdI3KD8J4MMM69o48jmd+siNFAmcT02Jmx34S
 XIyZV8m0NT4169XO42TYWd9UJB+4+9ZvMPRX1TiNtQmjww5ZOk+c88u4GQX/e6dDWA
 xZi4dD28ysoVg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, kernel@pengutronix.de,
 Stefan Agner <stefan@agner.ch>, linux-arm-kernel@lists.infradead.org,
 Li Yang <leoyang.li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-imx@nxp.com
Subject: Re: [GIT PULL 1/4] i.MX DT bindings update for 5.15
Date: Mon, 16 Aug 2021 23:20:50 +0200
Message-ID: <162914852265.237905.13250400572485864130.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210814133853.9981-1-shawnguo@kernel.org>
References: <20210814133853.9981-1-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_142102_790403_65728D36 
X-CRM114-Status: UNSURE (   5.75  )
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
Message-ID: <20210816212050.16mexBwMP_Lsgay2HL13wGchFAp8VD6qF3d2xRoXoKo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 14 Aug 2021 21:38:50 +0800, Shawn Guo wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.15
> 
> [...]

Merged into arm/dt, thanks!

merge commit: fe3be9941e3c5cebd59d3ad02477db86af85e2da

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
