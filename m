Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB24C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:27:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F5660D07
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52F5660D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4vT/52QkQxRH+hO8IfG9SFuX4Kusc1kMScoptdP26o=; b=0QKdCCA4yuZST/
	eTxWhfP4yoWqv8Dq451gPLXvSEGZwTlKsIgsdnVvJwHJn5Eke4Yv/NOhdvLbMgaXHj5EaoRxOuu+q
	5AueTKnuxWI7sAdUWSdWOB/nt+lkuHvfHG7PPL95UiY3oNQQHyziOTNCxdZIX7hUty9ogw/Kof0FJ
	jQEnJa3lEa6b37QhRJWvt/FVDIbxK7P0rty9YpGbu9ZfwMZBCvsLBFlXlgO4ynbcBzct2dmblIFhx
	wsS4PQYoqGxcIajDSSNUmmeNb1lmKZ/K14cbxLuXyvX/IoIPhRe6A71rvB9WMF3salTpJVIwE5Ysy
	oyfHJFKDYXXTTPq5DXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdJ6g-005qjv-2e; Wed, 20 Oct 2021 21:26:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdJ6T-005qgr-7g
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 21:26:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0906E61372;
 Wed, 20 Oct 2021 21:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634765188;
 bh=ILFqD0hIgtQRhj/iA53Be2tsfeuZQD08Te1lqGwHYRU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pMGMuMhq4jTWatJY6e22EPiZeUsnz4OZ56VRAfo7gINu8AOjMozffTsM/lNkPMWGj
 yzX7BHGcCQN4rOuuj4HLziNH/1MTstq9CfzbIdDMe3shjHnv8GILjTMfCXLa/TRpb+
 REnYeaEj1047ana7ONe4KB+cr5xD/MfuLNzaLAzdxSdgu/3VLDT1PfXKWatRSE6r8w
 SLISX4ruEztChf2t4/NJeUGSTEqxuSXMpvB8zly6+haaTvNXrWkLcepdmP02Zx9CAI
 +i81KbG/JRrmUQfhrP+VBahOiW4ZQ2/62F/lTKoFAnppVS5b2cFgSd0ic5nf/trsC2
 pLMRuKqzQN/6g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Fabio Estevam <festevam@gmail.com>,
 linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
 Li Yang <leoyang.li@nxp.com>, Stefan Agner <stefan@agner.ch>,
 kernel@pengutronix.de
Subject: Re: [GIT PULL 6/6] i.MX maintainers update for 5.16
Date: Wed, 20 Oct 2021 23:25:53 +0200
Message-ID: <163476513260.4063285.15086446429701644695.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016140138.1603-6-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org>
 <20211016140138.1603-6-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_142629_318447_A879DAA8 
X-CRM114-Status: UNSURE (   5.96  )
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
Message-ID: <20211020212553.6NZu9MfwmcWOV2MBWNSBwtWpdYZSZ81q036S0fDQeUs@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 22:01:38 +0800, Shawn Guo wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-maintainers-5.16
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 17c129caec5de2190dbf469ddee78ff0d182b379

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
