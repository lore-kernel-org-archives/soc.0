Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BAAC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:36:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C87164DDF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C87164DDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TTTqqjfmoKO6rL+KUj2zr6VmtXB4qQH5EhBHC7jU/A8=; b=oaauKBhJBMqD0MpSx80p4RQP0
	CvNw4y/n+mbV+OptymWA4MpLpZQmO1qOPc/UppurfcPi1zHiwzcZneZ0qgSSF21ISiIg8dAIxl13K
	KAtuXeHoHaKe16FyGBv+p75JvafRfTIQlizEWCSQO/vkHMRjKPLWTM6XJ4G3Oo8t//WKrRai11Pvu
	YdIkoy3Ejy+MEYndThmy2XQDdXs0L844z/9hb6DD82w34wYOceTn7omqqMkB3SxGbYQTy19efWih7
	3WL3reA92QI+VqRlu6oLmqU3TR0121TPxGlvGA8s3UZCAqSEEHDsOdRF92wr6/l7Yq6cmWZ9G+WIO
	q7ut1JU9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oXJ-0001lG-PY; Sat, 30 Jan 2021 11:35:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oWO-0001Qg-A1
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:34:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A6FC64E09;
 Sat, 30 Jan 2021 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006471;
 bh=2qs7483GGZeRLFTvVTEu2jS2FV1D6gROSm3E0p1DI+c=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h9dzqpN7F/Zumv6xvlJwvp4z5yQG8QrbwtpZTb5NBX7lQ+YI2cDitsFZ+WCNvHrkX
 scSUjSgjNBmynZbXisrqLoCyQrdKD55VLZ4UTOyEp4PFxiIUEdxd4Rct2B4ZK+suk2
 MCVyztNiJNW1ng9nSGpnZm3yt3QfIi0nrBY76m8RVKhchu9OegQ3J62u4RmgQybwgz
 iFgS0o/2aNH1HKxPBgUiDMM0zb6zoTiBrEo/iaUP+JRjx2h0x8+VWtrQ+XUsC49p4Z
 fByCdv91iTakjBiITVmOSIAeBPLV7lJmb/9Svd8ymdKRj9m/JZ3loP5IRN+Fz5o+dA
 wiv89pJx6PYNA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Subject: Re: [GIT PULL 2/2] Devicetree changes for omaps for v5.12
Date: Sat, 30 Jan 2021 12:34:14 +0100
Message-ID: <161200641696.2316427.3450006892068247288.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1611845066-809577@atomide.com-2>
References: <pull-1611845066-809577@atomide.com>
 <pull-1611845066-809577@atomide.com-2>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063432_518204_88BEABE7 
X-CRM114-Status: UNSURE (   8.93  )
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
Cc: linux-omap@vger.kernel.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130113414.ZO9NdSgAKJQYBW95QTycmL_3yzK5OoXMXcu8tm-GlZI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 28 Jan 2021 16:45:02 +0200, Tony Lindgren wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/dt-signed
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 2226c894135e536bf252a6b0570924908740b558

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
