Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB0EC433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 10:23:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0B769610CF; Thu,  1 Apr 2021 10:23:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1318610CC;
	Thu,  1 Apr 2021 10:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617272630;
	bh=MZ3Ne7ildQK4xFvvzsF6ZSktnlVMdKCIZSj1JEw6htk=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=RJ8tvMOaVhlGiMjt6SNGdffrUCik9IPv+22Lj9ln8X1D5YKAJpPlRHI7PwxmPDXjk
	 k+tMiKCk1lzd4L7/Ijz9gq9wCP+Cg/H3kQH6noZnlfERXRR+L/Js8deCIqF6+Dx5yE
	 fLhuKtuBRc6d6GlCMN4MRQkNsG5nS1+Qf3HmRVJUbXZBLtONpUJJVd7vOFagWdCVOx
	 M5BQUh483IJcedke6tsujvWW62ZLTwC+1CcbBUKaDb1Y3YrDp+dwSSonww96LHz06i
	 nE7hrZqrxvgxeSg3clSt+LoRqErWs1rVwFX0QNaQcCqTzaPYVA4zaUMuPd5miPs7Qh
	 m/OMrKD7enkBQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Roy Pledge <roy.pledge@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Scott Wood <oss@buserror.net>,
	Arnd Bergmann <arnd@kernel.org>,
	Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lee Jones <lee.jones@linaro.org>,
	soc@kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	YueHaibing <yuehaibing@huawei.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] soc/fsl: qbman: fix conflicting alignment attributes
Date: Thu,  1 Apr 2021 12:23:30 +0200
Message-Id: <161727243810.583633.4915294266076534019.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323131530.2619900-1-arnd@kernel.org>
References: <20210323131530.2619900-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 23 Mar 2021 14:15:23 +0100, Arnd Bergmann wrote:
> When building with W=1, gcc points out that the __packed attribute
> on struct qm_eqcr_entry conflicts with the 8-byte alignment
> attribute on struct qm_fd inside it:
> 
> drivers/soc/fsl/qbman/qman.c:189:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
> 
> I assume that the alignment attribute is the correct one, and
> that qm_eqcr_entry cannot actually be unaligned in memory,
> so add the same alignment on the outer struct.

Applied to arm/fixes

[1/1] soc/fsl: qbman: fix conflicting alignment attributes
      commit: b9ab2619047edc1c6c07dc68963d84a5979f0abe

       Arnd
