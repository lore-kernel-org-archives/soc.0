Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05862C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 15:04:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3CD260F24
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 15:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3CD260F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQBqDjCFh1QtPSSlMo0QLBxZxAzpqZ0g9JBgLo1oK54=; b=bd8Rzw3cPcGEzP
	1F/pFYgbo0/nv06e9RXIlTqUBh0JhChW54MxzygikBzSG8K/JItTccwjObJYNXNswr0YiSr0f+Yf1
	g/twplI+2cmxqeLX8fku2mLe4hfLeI3Wp8pBfkmdNr+ZdxO+p5uJ5rwn2xMGmnpF3Ra6oE2wLyF22
	Z+snNxoAcrnV8RlgZFOI8UGlpHuwzUfJ5Nrs53S7GcVNviEXS8X0LbXTyWsxvM1QfX1VAxVehrd80
	ZTUai3goGJIX0PFeOmAWiNteskEikepMSZYQqt2a6GS8HFzIcMS6jUMM30zvKrTgg1hNhvqVgge+E
	eDKQWtgF6+nvS9YQ49RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwoo-009seg-Hu; Mon, 11 Oct 2021 15:02:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwok-009sdb-9R
 for linux-arm-kernel@lists.infradead.org; Mon, 11 Oct 2021 15:02:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D03760EE5;
 Mon, 11 Oct 2021 15:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633964538;
 bh=ZwyU3N2J8Mch4TU5enEk7erjv+XsI0J96pO7Gg5w9fM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NTuVqc6eNk0Disrm0oLxiF2buro/TewyXJFX6pbDUZG4BI4zXi/OuUExu3eZOk7qQ
 35/Mho+W+OMNkocKuk3e081wIaSrsmGaoRWptvPmvN15Hvjc0Rif1ySNnzKFi6ScvZ
 0T3BZbcu+CJfX2mYTZZlV3pxvymlhLRl3vAikH4I64a1m0jdlyZ8vNo4+iCL8g53XY
 HgmOVQ8L9dqYkD8JaIPy9L6E4bBGi8Rwy5qlW/LIqu0GLkJLrzXWYKrmWgNaD41EpT
 Ng8U5++s0pnHkfuA1tbpdYHAvLJmqwR+YSijnjtrpFsCeogkORBwNKQvUVkZkmvDXD
 +7AKwu4wMQVnA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/3] Driver changes for ti-sysc for v5.16
Date: Mon, 11 Oct 2021 17:02:12 +0200
Message-ID: <163396452142.3536460.5044992421827827368.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1633950030-501948@atomide.com-2>
References: <pull-1633950030-501948@atomide.com>
 <pull-1633950030-501948@atomide.com-2>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_080218_374851_9661F365 
X-CRM114-Status: UNSURE (   6.87  )
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
Message-ID: <20211011150212.G0sRJQS1p1qNQC0eY9yoKvnvLfwKKTcpi1x9muAvJU8@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Oct 2021 14:02:43 +0300, Tony Lindgren wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/ti-sysc-signed
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 030f4e72aa9cb92a097022f97792154f42901feb

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
