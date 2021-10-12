Return-Path: <SRS0=hZui=PA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A2CC4332F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Oct 2021 12:53:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7DFB6101D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Oct 2021 12:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7DFB6101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EcnfqmtAvymM72VefSWEWBBJbkMRuvaf/HVcDIOavgI=; b=AdqW+fxGYvEalN
	ffxe2yYPITOyaENK1M/bNv6O2qTuqyJ+eEJRxyJTP4AolAU/6BHh1MshJT93k7u5QBRlneBrCbrCS
	ZU+Dw5ggDW5UxsBjeaoYex5vmDGHKdAqrRE07GQid93vXDIbw+zVImX9CiHYNBJ5qmlIHLsUOBmvi
	27Y8F3Hqqagi6Xmon+zNRttaqJTt0fNWRwSpFquaAVN7jmcO+Nl96up3YNxjFgSgFTofkscSsgRkI
	NhhObnUhSEmfmD3GQ2eNAc/lDOWl0ZVWckazF3jyckSvmu057y5Uym4fKGilnCTqWJj6Uhg1OzlsW
	x/RwXPcwMJYFU3P1pkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maHFJ-00CnHh-EE; Tue, 12 Oct 2021 12:51:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maHFA-00CnH0-1g
 for linux-arm-kernel@lists.infradead.org; Tue, 12 Oct 2021 12:50:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B2036101D;
 Tue, 12 Oct 2021 12:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634043055;
 bh=MmqGAEecEaJAEfwS1MqqZ9UO97KmaSLGVlpKcO2amKg=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gA7qf/Ht7/gD+dddW/3V/k4v7KiYpXZIukgezstljSS3i+rgIthvgF30DlUp+9BTF
 pG6tvH1ztq7EfOz87wPQoUkYoKhc+2H2sAW2EvugwcyvUNnvLpa45ySGIQk16YT79m
 KEqIQtkNBHX+qvvuKNIq9RrmUBwOMQKVh8bxIFJHbFcypHW2RMItA+fpdj/DuhZuIi
 r4WKI64Q1b5mvGnVffx5ApBok86dL0Jzis0TTAUDgr49HXz++rqUCIoODcGWA7Nuxp
 06I32xlelcb3KyFNZ/293JRVMify97njoBzGxnt9g9i1uGgS+y4TEHb3DqYu1ckRU3
 nNpT0SNH4MEog==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, arm@kernel.org
Subject: Re: [GIT PULL 1/3] SoC changes for omaps for v5.16
Date: Tue, 12 Oct 2021 14:50:52 +0200
Message-ID: <163404304082.2051682.16762434650479553122.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1633950030-501948@atomide.com>
References: <pull-1633950030-501948@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_055056_136069_AF6514CB 
X-CRM114-Status: UNSURE (   6.85  )
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
Message-ID: <20211012125052.9cnOJZILD0VDf6pM5Dasbwa0vJ8x501xGoxczKLsVsM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Oct 2021 14:02:42 +0300, Tony Lindgren wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/soc-signed
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 1f1c2323de8f9ccf89cdf63ae3c1f7a92bc19869

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
