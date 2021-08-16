Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AC4C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:25:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C19460E97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C19460E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUQ+iydGyf86EGqWekPNr19JVZP7DDQKYJmgy9tcQCw=; b=YjrOnkqJhIyCqb
	iKxZ0ARAZQD0mYlW7JmeWE5U5mMorfjY8QhA56xORLmEk7c8lZTU9IoOBloKB30NPjMzwUbvn/bhF
	BrY3qdLFpm2ITHvX/QcRKnGITl7FXpeO46tKBtcmViG5vYEfeXEdg//+LoeoN2PCt5WgGWtxZprVj
	xPvGUr6N4zwidkrzqWNtoKPTSLciym5IrYCrSv8NxPWTcTxE9b3B1d7L5K8l9MIJkXciILtwZzmW2
	9uHw0fnYqNKy2CAAMyRyKOx172RRDbru4zcU0BXiFu7fMS6b1YT/pMpQSRY9i92jWBLH4Cq6wdBOV
	MDQkRkb4CLEkWJXduTNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFk4o-000LJL-8h; Mon, 16 Aug 2021 21:23:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFk2g-000KQk-EY
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 21:21:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3ED660F5C;
 Mon, 16 Aug 2021 21:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629148870;
 bh=MVhs7hiwPdDtFcUQZRD8fkkOdFDOTlOTBzwc30qz4/w=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J/GVqsPFsk/4MPWj9cn07aqAmzjufvbnotRiyp/A9a2fGf1/90SnM1QXFUpcrhlqc
 v6Z9YFjnYu4L0HgJ0gtn2XiXAk/p2T0HKeQukhBvgFOJbQRHD3VAmCSApir0qKgrbV
 pV3nCDx496LU5/fjmkbVvAtGcavo+9Zj+QLQw+5Jfy+KymFi1vxHH2O7Xp3wZO9gHl
 efj6Vco7iF7h+5RpbilbZtnYixhe602zzCekV84GIDj/IyDlXjSmldUxM+Dk+r2qX6
 2MAUaJgjcpBbOEiHr9KCepbxBwcclwq9k/gVucT9HtyRTXDV+fP611F/oc6YJER0EY
 K2oMItXNfDyhg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org, Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL 6/6] arm64: tegra: Device tree changes for v5.15-rc1
Date: Mon, 16 Aug 2021 23:20:54 +0200
Message-ID: <162914852256.237905.7021775229797910596.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210813162157.2820913-6-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
 <20210813162157.2820913-6-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_142110_528977_99EF91D0 
X-CRM114-Status: UNSURE (   6.32  )
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
Message-ID: <20210816212054.5P3JspFhJLZRfop6aXTnS2z4XfvKPQ7Qz63BNoVuPwY@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 18:21:57 +0200, Thierry Reding wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-arm64-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 1de48932389887f83f0f560c741dd57cc69a40b2

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
