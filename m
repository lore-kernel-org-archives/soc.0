Return-Path: <SRS0=soWq=NK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B904C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 15:47:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D439B601FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 15:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D439B601FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ux/R58xwphdoPteYa4TmzYbBxvEzZfRalT+TS91tNn8=; b=xNwpEB2dW0/IS5
	8W44Y+wekNgnbV4+z135JgiVvBJTbA+gZRn+GRVlZSIfiRtXncKD8uEMadFZiZ6mnprc4NyrjTcMB
	Pc0sJSYeOe15uuZnSOOnGXbQUHDHtjp4nljb7v+pdKpa579Z/EfCVcfJ2Dda1rXprE4B+q/ZSIkLn
	7z50U4/qhjt1q864f8aOIErlpeEpSv6sAWcNmTRVsjS5BUAqsHKRPjVKwmv7tmwCgTvYz4wp8+P3b
	3TMCPpqe02oingdZDBFNA/H1nZkHU6a8jrkJnuE0XfppTV4WCE7hMSB90EJCBVyAWsnBRpaQ9PbZO
	oT8n4e1fgh0Z4PTvMCWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGkED-008qot-Vb; Thu, 19 Aug 2021 15:45:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGkE6-008qoI-7W
 for linux-arm-kernel@lists.infradead.org; Thu, 19 Aug 2021 15:45:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E73660EE4;
 Thu, 19 Aug 2021 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629387905;
 bh=mVerFQzwJGqAny4J4xXZEF+C+JcvILCRfHvCGAoXIPQ=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QbZC7L5On0xIrRC/JwILPKwgK0AfI7RsGQ2gftRTm7DOKFWoOyDzVMD6Wq9OZDiGp
 k9ipexDije329sBg6Bx9mJPq3Qmzz7CP3KYGGZboz0FCHrda0qxAkBP/5WAPxy9rnp
 wSHA5GGaGt3+ldUI3JY9FIUTWVIMx5f1f2itfqVpyvpOCBtouojdqBxmUro7kNdnRr
 Gmj8oNGCvAnTR/xy6p2XoEn0orJkT5gZGIe+gHtA5Cls7MFrWz2j1+dHPUtLTe/tyj
 uelb0qmSCCb7Y0kK98p++AjndzpL9s+I2CXxgmQFiznZeEMWQhrXUqk8d0tnA8vzzB
 fgcvUXqINtN5Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [GIT PULL] Fix for omap gpt12 timer error handling
Date: Thu, 19 Aug 2021 17:44:55 +0200
Message-ID: <162938787885.467628.7575175058025149397.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1629354796-830948@atomide.com>
References: <pull-1629354796-830948@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_084506_339116_EDD836AF 
X-CRM114-Status: UNSURE (   7.50  )
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
Message-ID: <20210819154455.Dflw765PV2e8eWO7rKWQpjezUZrj4C25C-SqYbhdIuU@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 19 Aug 2021 09:34:36 +0300, Tony Lindgren wrote:
> The following changes since commit 353b7a55dcaf5fb8758e09ebe2ddf5f3adbac7c5:
> 
>   Merge branch 'fixes-v5.14' into fixes (2021-07-27 11:25:08 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/gpt12-fix-signed
> 
> [...]

Merged into for-next, thanks!

merge commit: 1e16a40211208d2d6e217e5013607219f4272dff

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
