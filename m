Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5434C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 14:57:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F44B60C4D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 14:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F44B60C4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPEQTafP3+i3Oj5QNcMYduaf0DmSKGMaRTruAl7XshA=; b=XRvYbZO24j/aXJ
	TjXZHX5LYSZa33LelkgmkiVPuk51X7g5V904sIWSjK5hsZKd2+MiUjvKYA+51dDgvybd6sj5+mxai
	1qynbzV0ITMWGhS1ooe2Z1JRjEJL0AoRlVpxEQZfrK1UhlGLl3yFv+pgOQyODlYFi/HgHjcZw3s1V
	OrltlZW9ArxQxxmunY4Kb5mnEkxZcX0ZbwRsbbfcMTfDvcWdXuU9lUNU7dALfrsz/tKOH/qthCcjA
	mjiLm0rQWWgmU58Fwo/8gaikIHs/p7nRaQ/8TNQkGrwaCA2Dmyjf43v+eaof4tqrhMc5Xkku57K8k
	iAxmgmVUp0Xz4K1P6hmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwhu-009q80-FQ; Mon, 11 Oct 2021 14:55:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwhS-009pyw-CL
 for linux-arm-kernel@lists.infradead.org; Mon, 11 Oct 2021 14:54:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AAC7760EE2;
 Mon, 11 Oct 2021 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633964086;
 bh=fW9ghGhlEidLIu7Ipct0Dbq2CoqrO4q+hsgNkfgtN2Q=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mY+zAmmMxPfTSTsGN3aYW7wHCfPns/4mgywBVVnZ2u+59m9KHGZRax/GJG9FZRcF+
 d18XVWRAE79TBerimudLHvuW6u0f9WAX5jhA/Pi1s0nuiJHhBlBLW2GWWH9b09T32L
 Ah84YP3Mh+tdF7Hv0fjUCCqBGOpbXwRD2+n1W/vXDexUwYbn+svaKxz8H0idh2ER2v
 FCb/slodwAQpQDXzMYF/lsPJLSkvnZ2X9NYoxZWZe71I8nyAVnxMPzjZihYsxZP9h8
 kCxd8iIBuXdjeOnp4hIahWjCdmasStgPCmoWvu8b3QJKojIJ2mKwVGshk/5XjnGVMV
 EFJOzU3gT5Aww==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/7] firmware: tegra: Changes for v5.16-rc1
Date: Mon, 11 Oct 2021 16:54:29 +0200
Message-ID: <163396399102.3170841.8099826223685361931.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211008201132.1678814-3-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
 <20211008201132.1678814-3-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_075446_476106_30252020 
X-CRM114-Status: UNSURE (   6.33  )
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
Message-ID: <20211011145429.KCXIrK6Y5cBHd-APY5sVhWpx0jyXtyMaiyneakPjrVI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Oct 2021 22:11:27 +0200, Thierry Reding wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-firmware
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: e4fb7b44112d914113466ea28f38ad334ed00175

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
