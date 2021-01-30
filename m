Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C39AC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:27:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3B4164DDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3B4164DDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n0HgBe473m3V5TzXwpWBXx8ypqrQf4YTkIe6TYUnzBQ=; b=0SGCXJwMRONONgvWZISwidKdf
	K5civqcmBQvMr8FFBkVLrE+Df2nIWB+CKu9AhycRYaplGj0vg9QY+lQyfClymbx7xyfWTdktXEU0/
	OdmSZ1ghaPzQRU4h/HU3ZP6xRbMW5rScwsfKswvAuY5wb2N/7DXv3jyE+9ZKNCzPmljxX2SXNx2nG
	DXIGCyNIULs3D0DxLdTkYuSY9e2GQVcUF20/NMUfdYAz3EcfBD4LPH2aIhHu5flqJeTYsSZqyXCgk
	DnduAYzn1gq6W1D0w7ovAfpmA5oSNrCOfT/MhyKT4OJxxkg0kxgbLDOM4+SDwOL6cPAfesJGPSRnP
	uM91A5d+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oOf-0007B2-Bp; Sat, 30 Jan 2021 11:26:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oOc-0007AJ-RC
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:26:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4535264DDD;
 Sat, 30 Jan 2021 11:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612005989;
 bh=LyAnhlsiIorO4ir4BtES7EnTn91O/Ufswo/Eo3EMnH8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YdFTUjp8xmVmciYkSm6bcbQX8RAkIwuuffaO3CoOk9jpphHRtnxMWUejeqMiFsUcd
 NQ3vo48XcIxgPyLaOMDkpbZyPCE6jjoii2GXR8gCQKGZDPzKOZ/iOFtM6XrcRyHs2q
 4VnWTh9CuDE8GY4mBxQwi3ZBsHshNcGuSnfiLEyjS9zrV6+sBuDYcE1bF0o0VNyLjZ
 p0Jps/0RuIfoue91l4PIEavnFZiABcU9edfGkIpgL++eB/q3NDDvYtV8dQmI2xt791
 o0PyQTO0xffiys9fH8UjYRVSUHb7oUZQFafJNTlBw4ZToNAHviM54DqGoqFa88q8CA
 R+4Nh6TXATEow==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL 4/6] ARM: tegra: Default configuration changes for
 v5.12-rc1
Date: Sat, 30 Jan 2021 12:26:24 +0100
Message-ID: <161200598057.2029918.993524285173980816.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129193254.3610492-4-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
 <20210129193254.3610492-4-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_062630_958739_44237843 
X-CRM114-Status: UNSURE (   9.21  )
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
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130112624.ujKYlruzfrtrBNr6ehvFZKDf8K1R8SAQ8np5SP5Zj54@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 20:32:52 +0100, Thierry Reding wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm-defconfig
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 69e39bf1668e69ea5e1a15ac97d7dc11c367b791

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
