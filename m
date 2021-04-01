Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E22C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 10:26:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83150610CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 10:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83150610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aJDGr8+WdbXyuDw8yyn+0RTZn+TMmhH3/BD5w6+DbkY=; b=dPuw0YChEEjeMAAtRvgqw50AR
	rjack+z6oT7NhwqvVxyVXQxFL0EzJv+r939TvVH0VWQElXebPCBra6VIlV+aPW5frCyXOFkkEWdxR
	EOk+3NaejKK2aLumytasrCZoG1y6M0LeFMkhFhCOl00BjR5zAyVwWgsqOYOOw07cooDr0171kqj3v
	6bAS4dJ5Hc6ZtDAxLKf8nfDGVNyLXBPK+pV4NjqUqaswKsdsUxOtE9zqKAAe8396B2NckYKfApz1G
	EzSNK3sm1OiuvjRLNVDu9sk7IZuy1BqEXZ5JKNrrGHthJMOrtc+QBZYbhlgCPHRejPKoWlG5iV+VU
	7nVgzNBIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRuUv-009Cq6-Sk; Thu, 01 Apr 2021 10:24:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRuUS-009Ci6-Hh
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 10:23:57 +0000
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
To: Roy Pledge <roy.pledge@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Scott Wood <oss@buserror.net>, Arnd Bergmann <arnd@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 soc@kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] soc/fsl: qbman: fix conflicting alignment attributes
Date: Thu,  1 Apr 2021 12:23:30 +0200
Message-ID: <161727243810.583633.4915294266076534019.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323131530.2619900-1-arnd@kernel.org>
References: <20210323131530.2619900-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_112354_496173_BDC7368F 
X-CRM114-Status: UNSURE (   9.08  )
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
Message-ID: <20210401102330.AZj_JIdsq7U24aPX5X7Utc7i0GW7ZwyF47FrbapFiq0@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
