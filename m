Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398EFC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 22:14:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07FE560F3A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 22:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07FE560F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TErG+PWJ3AiJ7XETPwYyR2J+fF5d1XAjKzJae92Pczg=; b=sjJrC2qV/jvYWx
	gq2jQNlKT/12SBSQ3NCceT6GIe7+mr1cExvuhRpmKKatK8LmY0TjzRQdh3FXqVNU/05uFKS9kft6F
	oCqylF1zUjCxXEjznaFsi5ToZKDVcxiUQYuuX3dF/mDicB2v6cJvrD4nyH2/3xQ1OM7pj5G/HSDoT
	jesPicrN8LAMGfw0E5MrzGcRTDfMC+S1MLTLMnGRFawoNRfPlhHQkaoxbis7rVVxGwzfn6FviGBol
	0U0DtuqHC+E5tvUsOIEAVTe3Ux6dW9fjhAHKyg9rUUeJWDsseFtBUrYfzZL7HAXBClr+AMHzCX+IW
	T6OZcP5v6SJ82k9nGLag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma3Wx-00AqpP-MX; Mon, 11 Oct 2021 22:12:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma3Wj-00AqlU-Mj
 for linux-arm-kernel@lists.infradead.org; Mon, 11 Oct 2021 22:12:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0358961038;
 Mon, 11 Oct 2021 22:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633990329;
 bh=LYWe6xlEjwBs2m99bppMwEnOpfC4Po6sny/pkxd6Ksw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JtOy/bt4Cfie5vYvIrEqOc55vQd/uq9EB3oQkkzW2OhKHru/BVNIqWTgQiRFa5dXE
 oB64ZjJTLuBlAXc3ztmu8wt5GpkInfkxCMmygebfGkr0zIdZLTC6PUcGfrDqItpPKJ
 +PCqgIVTBuFo5NLHuP065YsIIXbZP4yIfK/iZeZHN94WRj/odYTMSlx/jvpdyZLoft
 vdzqb1Ui/zEgHXyIVi9nw9vxKDUmicPPdZHEkg7TeZnN4LeZ/PEpDApG1Kv9qSexk/
 GcGJywOUXf4VpIrdyBA5WrdMg2m7OLttziK2gHTOqVK7J8tZmQEuOZOEkiodxM2CpG
 rF9DtA0/eRa0Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org, Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jon Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/7] dt-bindings: Changes for v5.16-rc1
Date: Tue, 12 Oct 2021 00:11:45 +0200
Message-ID: <163399027732.3049179.5220035290920996455.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211008201132.1678814-2-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
 <20211008201132.1678814-2-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_151209_791839_1B8E9729 
X-CRM114-Status: UNSURE (   6.17  )
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
Message-ID: <20211011221145.VzqfcQV7nSUxh1bI5bv8FZwjfGBG8fmWyqVsDreT_6E@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Oct 2021 22:11:26 +0200, Thierry Reding wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-dt-bindings
> 
> [...]

Merged into arm/dt, thanks!

merge commit: cda490402d51dcdb4b35d873b268b432467b7b09

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
