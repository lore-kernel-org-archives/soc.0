Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA03C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:14:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D41961354
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D41961354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rucavbq5DamUhxUnKOH9+ZlDX6FDjh5N+mUYaSNBnSE=; b=JKO1bR3Wt+WszK
	OlKIxe8mYN9V5h5iEZTIAWtBtWPIzbF/8kUwX8mJlZrMQytnT1qM4aF1uSWLyeDgim1fnI4SwYBXR
	Drf7MDwcLkjV572LvOn4mcDdGJaFytxPzcV/AF2AGCuCj9gXIZDb7WtZZ5N47eZUduYtMOfGeeMNF
	d/+UzX78ESXPT7LW/hGGQQJ+0dSjvuoi7NPasxdGmixWiSkSdX6U+Ga9GHW/Vg3cQuc4CSpd2ER6b
	QOKcenlhd0eTy/SRYaRA+HE8jxgSHyC9XeNjSbOBItZZEiLeckWhqI89irW4rryX5w2sHJ4+bKFsZ
	nFehoCMVWE5JUv3qYxkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdDGi-004vuh-AQ; Wed, 20 Oct 2021 15:12:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCvd-004q6F-9O
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 14:50:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 831086137C;
 Wed, 20 Oct 2021 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634741452;
 bh=TRfYW+7MPGUxn08FBnDf5ZZdhIN+j92I/689B273xSo=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TWPzRAtGzR2Ywc2xN9s11edkSebx1q9ooDcXEv35am/OCYyWYAnOKlQZiOnHOaM1T
 CHLhyisq+WTkz+weoEKV47eebcGfwwnGAavB+/Uogc8KY/RdAamMBSFuLv9OkE7GCF
 JLzXvxo7h1Jtk7/s8FG8v42z6AaFqspN3lGPj5G7B8qRb1aFzxIKHO1H78aK49pXPT
 71ddPRIhLwztCje8gK9d2F9Hgaw9EGCeb7MHy8Z74M2oH+yMwbze0JbcElCS/GCKwi
 KXYPtPEnY3HB133skaGULgPeNO78bGPmbMNQPluYTlChb6SincGMoae0fawmKA8oF7
 8xebrnO3IH7aw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL 3/6] i.MX device tree changes for 5.16
Date: Wed, 20 Oct 2021 16:50:19 +0200
Message-ID: <163474139794.4099414.13320436095409865623.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016140138.1603-3-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org>
 <20211016140138.1603-3-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_075053_452097_4A59A40F 
X-CRM114-Status: UNSURE (   7.17  )
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
Message-ID: <20211020145019.8kuEt5G4K4R8uDR59OPy30O1SgORPpOexvVHsT3ncAk@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 22:01:35 +0800, Shawn Guo wrote:
> To resolve the dependency on a fix, the pull-request is built on commit
> 9b663b34c94a ("ARM: dts: imx6dl-yapp4: Fix lp5562 LED driver probe"),
> which had landed on mainline.  Please consider to pull, thanks!
> 
> Shawn
> 
> 
> The following changes since commit 9b663b34c94a78f39fa2c7a8271b1f828b546e16:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8bd8822c83785ae669a23080d1638b0a534203b1

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
