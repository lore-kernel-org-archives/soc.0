Return-Path: <SRS0=r7Jl=MI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E851DC636CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:29:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DFAF61374
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DFAF61374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fF90ZWDoJVNhnhwg/HlzYFjJJxMWmu/aSOcy3cGD3b0=; b=g8mjTwF7zQ7IaL
	x8hybyIYGoxCLhIbJ9XBX8aa212MZRCbYHqVCFbyWe78zuoBoLHSs823MkeTYA6BfU8yr/sPGY+t4
	ugerAz6Yrk6bvGNa9srQIDipzNcvcoeXanOn+hiCUidlBY4Dk5L0kNUU40wBzxD3savuetJIOMQ/8
	v/4OSchLh7FVjAyLbLn3WriX8Dt66qpR8ns1M22ZorJgO72IB11+OnHROaZ7ciVkL9I0Vu1Hoyq84
	EXoIhFgSawF0vpNi47lqN+IbU6MQonEjn3/IX7kt72pKxSI+cL5gNPNcq3YODhI+i0eP51lZn+wAN
	xhokbeTDhD1Zbgq4KS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4VN3-005Iw3-E1; Fri, 16 Jul 2021 21:27:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4VKe-005I74-53
 for linux-arm-kernel@lists.infradead.org; Fri, 16 Jul 2021 21:25:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2E0D61374;
 Fri, 16 Jul 2021 21:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626470715;
 bh=aWXjXOv51nzgg9PZWR4nbx/YGrfN30sZk6Qomj6ADZI=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wi4yQejuuJufotKzyIkh7banQrXjMlrs89HR54ZyUvNPhCjA3PgX+I1KY7tUXUuNx
 XPoOEj4P6KjTxmlpEKZ0oS9eTnGUjLIbeDFdWYAw5Dz5IY1jypVvrjh2u/e21H+ips
 HsPWNMdQr29suT+84HclVkuFKnx0wgUuK0u8PxoB13U8iztgBvzA5Exbe03d1SbkC7
 6h5bjw5UYZxPF2qOOJ9XSFWhm0d+x6HeO6HC45v+gRTc2aDECN5pdZFhPmyfnS58ib
 laMe3KfVeNJso5LgzfBJGGQGu85B3sooGhqWIyS/ODo/ge608SnVDh9qD+TIspkRC8
 KC9z6TdPTMkoA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Stephan Gerhold <stephan@gerhold.net>, phone-devel@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 newbyte@disroot.org
Subject: Re: [PATCH] ARM: configs: Update u8500_defconfig
Date: Fri, 16 Jul 2021 23:24:48 +0200
Message-ID: <162647049954.3478428.18046978019252393704.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210712085522.672482-1-linus.walleij@linaro.org>
References: <20210712085522.672482-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_142516_290915_F03CA10A 
X-CRM114-Status: GOOD (  10.38  )
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
Message-ID: <20210716212448.5qm6rJYTqQCVQEs0iEzovgRJuTLdvmXE0IFNQws9hFg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 12 Jul 2021 10:55:22 +0200, Linus Walleij wrote:
> The platform lost the framebuffer due to a commit solving a
> circular dependency in v5.14-rc1, so add it back in by explicitly
> selecting the framebuffer.
> 
> The U8500 has also gained a few systems using touchscreens from
> Cypress, Melfas and Zinitix so add these at the same time as
> we're updating the defconfig anyway.

Applied to arm/fixes, thanks!

[1/1] ARM: configs: Update u8500_defconfig
      commit: 042f2e107a2ea34605b3793a88b11761afc8e8e0

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
