Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEC5C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:12:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31A2464E66
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31A2464E66
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QJMTnYuAAuqXQHHHRRGFPkBOtX32UBLRqI71WaiC24w=; b=ZtAYCZhS+DmKgInTK/WF3BhHn
	alCT2FxdDdhCzirMGNCcWoukJMLyRaCOwUsJdYBYWm9vOSzKVEQkBaQUSS6LYrhoY2ttq0UL177mZ
	UQkfAj13O+FEEv0UpkQ0SayPu8lNGKLsUCdRzFY5PF1lK9O8LkVLkhDqoVsIHBPMxOUDvRauAxycD
	Lmty6w7i7hbaRlPIn6E7Nco/FX/RnvZsNIvUwZx/TmVgPEM7O5FzN6nf+uRHYBhHhEuQyL5yG6Tv2
	QnoJMMmmzWySZzFWd6xLxwF9NYUWECAXPlogvI8a4KSLe7obKdXY03KYp1B5d345OPkdFKfBT3JgF
	zzYNCoDHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9cA6-0000ti-IE; Tue, 09 Feb 2021 23:11:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9cA2-0000sd-St
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 23:11:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BA6064E57;
 Tue,  9 Feb 2021 23:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612912270;
 bh=gLU2jNlNcUYMN4jGfWiNdv5YcwiMg6/2TKOQ+C43uyg=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n1GwKzpGMiNJrXAKyzLG1nyFeowX53youFYYCD81yvrr2o3ZNLo4Qena8/zgsDqGX
 qzOnBCPpAQaM5dHmj+nyw2uEoGUKS1eVxi6owXQdLB6J8gOYKUY56+ipTVLfMlhdyt
 WQ8GIrnlXer8jyWTSt4tBsolt9Csn7uNUSPhXuPdmqCQtjau4frtmE1AXnlvxK1Kjj
 xEdBKR3QIAwmTZsaY3CTyPTM0uCC42SR+XLOi6nMBEqaRm7/Gs7kE7s+i//mX5rBdN
 lA6tjk4Edf3/n8mlxm0YEaPWkswUMgcfR8Q2fPJZIb/1Hpe+cUDfNb4iTqZk9wNQ16
 mSj8j3PZESzhA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [GIT PULL 2/6] i.MX SoC update for 5.12
Date: Wed, 10 Feb 2021 00:10:57 +0100
Message-ID: <161291223664.977272.11882603697435649662.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204120150.26186-2-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org>
 <20210204120150.26186-2-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_181111_033891_886AD7FB 
X-CRM114-Status: UNSURE (   8.29  )
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
Message-ID: <20210209231057.gtlD3q3eSbq3zRVAWEFxyvKhSujczEztDFrKrx4QUi4@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 4 Feb 2021 20:01:46 +0800, Shawn Guo wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.12
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 82e754b1ba6502bc627c2fdf04c3bc6383aefbec

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
