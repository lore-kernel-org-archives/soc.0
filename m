Return-Path: <SRS0=r7Jl=MI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03433C12002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:34:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFF076128A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFF076128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27JodURUqlTF/q1uIZ35hmcH40Wzf5SJXitfrTbm/Cc=; b=HXi0TF/ISejwHd
	WS5dpwwM81Y2cNn8Zu2qmNRnZxDS8/hmdTvbVprJ0V5oDl6uI2TJuW1Cea53JlzvKNIjNopQxS1Za
	aBmIyKXj1cIIjD8nPPBuRSR8s6JXDTj7RJa1mATNMaN5fZGOqaIJd2apv1Kv4Ym7EnLWIjlaZj8gg
	tbsLppEY3XSeula9+nS8tnVYx96e3+OQ1UwsMCK7taRFakmaT953VX5iykTYro1eBd7coAiy2Qt2N
	/lHXpHtFh6Rl9MzXLXT7/N6rdpmIanHzwT1BCGCZFsEAM8xRVQieNgzU0al+ozazFKmCAj5fyfAGp
	EVbENZj3aaO/vIhI9FaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4VRy-005L2j-Kw; Fri, 16 Jul 2021 21:32:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4VKu-005ID9-3D
 for linux-arm-kernel@lists.infradead.org; Fri, 16 Jul 2021 21:25:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0528D613C0;
 Fri, 16 Jul 2021 21:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626470731;
 bh=7P6DG6IhbonGWOaKpCz9+F5N3WELCWbes97+P9fqz10=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jvg+Ngn5KgoBWwozV10RLrckF5pSN+DGhvvu9eiQt0S//+LgNBFygho1RFlJxhuQB
 TcFwW5SPzibQ8LIuiVE2l16OlG8QOQcXhqrNNQut++6OBnSiR5v1I4D0Xtj51PgBbe
 D+KrkO/b9XY0t5BeRKNeXuO/n4+DFVoVdsHoBfFxcEeixbYk9k8o1gEgKT3ij97oYs
 GQOC/GnfVxCv+23fA0kB4LA65+XyQsGWdPLEWO9ApbQcf9vSd9rurzQ5bQXx9SXGHA
 1q6+AASvu54Zu//6Di67mLeyFN/ztmEav5lX2Y/l+Jb8wJ3i/WgQktMM7j4qBBgY52
 IbcFNvzuWaREQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v5.14-rc1
Date: Fri, 16 Jul 2021 23:24:55 +0200
Message-ID: <162647049909.3478428.7523344403761685908.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210709150220.2543875-1-thierry.reding@gmail.com>
References: <20210709150220.2543875-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_142532_242337_A1F3B9F9 
X-CRM114-Status: UNSURE (   6.37  )
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
Message-ID: <20210716212455.QQ4FOQyPTpCI3XtkS8AFKAFLHN2lWRhYh20mP_htBGk@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Jul 2021 17:02:20 +0200, Thierry Reding wrote:
> The following changes since commit c7289b1c8a4e10bbbdb7097a71a90652beb767a1:
> 
>   arm64: tegra: Enable SMMU support on Tegra194 (2021-06-11 13:33:46 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-arm64-dt-fixes
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 93346fb3f669507ba40a8876d1a349557fd0bcf1

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
