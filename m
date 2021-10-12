Return-Path: <SRS0=hZui=PA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75B7C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Oct 2021 12:53:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D2B360E05
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Oct 2021 12:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D2B360E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxRTMatKzpTR/h56xkYjrzPd6vFvk072rbe8Y0xtWow=; b=T3KrnC2xGLYuZx
	4SsY5LLXNmHgS3GM5i3I3WkhBjUL/iM2B/A2HYIX++EUtEi/CMJK6o/BKVvKRo+xx86jRaQmr20kV
	XgzAGqvwIwbSGRLFIwwx/vKYUFGe1X9ZoYtwmvSop/L4oQCNtte5dLDQrbst0MD7gGjqu1+AJ3AD7
	dFKbUNCT3hqcOF7E3OxJ2dp6/L9+kvVJDoDc115QRW+hIx0FDV68kLv48IHz8yyuK5woLU72LMTDI
	61N5Q4j2P+GHrrO9FJmYMaYpTcevn1JDO2ya7Q7D2ggm1ENILWk20DD0/J3JJaT38MuwCgIhHvJUp
	2UTdBc5RmNd/IsYCAUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maHEj-00CnDF-Cc; Tue, 12 Oct 2021 12:50:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maHEg-00CnCp-NR
 for linux-arm-kernel@lists.infradead.org; Tue, 12 Oct 2021 12:50:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C9A461039;
 Tue, 12 Oct 2021 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634043025;
 bh=9Pg2FRc0hGdmA3lT2GPlrQ9TDFhzdLnwHiDpCRugUkE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JxYXhDV8hBcCDzJb7WgCxFs4Am6Vg1NRecibuZppYSnAOiXclfO0WLeLnhtw2E94d
 bNjcoS+Ys2n0NhbfShf3kEDb+EKtHbyAx7vu/JcCfpyC6vwb3sJK3Zb3WIIdYj8wh3
 bUQSZeTCAU/kueL+Gq7YVDQILhdJpLog8ozt/8GZpUfjVFOhYHyoDYWhp8ESMZBLdo
 YrOTYUUCksL/je1TxhbV53cENgJTjYyTcd1UA7phbb8OHBwHPmDUD2MPJyWkcPQcoJ
 jguWP/WRGvcI8Mpjr7RmmBynBpUNUL/Li0IAD2eks3Q7C4Gl11uWQ1Ld3vkuVlLi9B
 sLVa8uXO7kx9w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [GIT PULL 7/7] arm64: tegra: Default configuration changes for
 v5.16-rc1
Date: Tue, 12 Oct 2021 14:50:20 +0200
Message-ID: <163404301508.2030452.14712807439411628487.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211008201132.1678814-8-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
 <20211008201132.1678814-8-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_055026_807342_6EAE34F8 
X-CRM114-Status: UNSURE (   6.31  )
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
Message-ID: <20211012125020.CH5mFgj6zbowXT8Qsp6AaPu1KEBmlK7jqdY9P2O0FAQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Oct 2021 22:11:32 +0200, Thierry Reding wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-arm64-defconfig
> 
> [...]

Merged into arm/defconfigs, thanks!

merge commit: 543659b3121117acd1da5ff71ecb22243c657e1c

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
