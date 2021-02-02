Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DD3C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:12:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65C0B64F91
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65C0B64F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XmtSNuzGJJHhQmrmC0InfmbMpHhzQZJqSrhMzvXdAMg=; b=oLMlZAbstd+sRdk4VZ20/we19
	HQGLBllDegCUpaZGykU93UOpzt/i6M9c5d2Vv/aedhRI7LzzpGHW7DvnBu1+yqoJU/Kyy9N8Nyvf0
	t+pNGw1/JIX0sMJ/0MvBIYqZigS8ILgQlv5gHkvqyY6a22Tv2FlGqppVQMDZ+ioqQgj9JQGEYD9iE
	omvSNizhG1DKCNXa+jh/bCHCER/Uy3KrNaGGasSXEkd07iLmUWUrrzVvPLGo9Uifzkjf2UQ6r3ebH
	34ulfLK5NFZ/t7QqiZZJYD4IEzE5mbulZft+WNkyqcWCyxNLtVdTMz6s/XB7WBYnmVHHXakY5Q1Co
	yc/dDZo3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zCg-0003Lx-JY; Tue, 02 Feb 2021 17:11:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zCN-0003C3-TM
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 17:10:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A415364ECE;
 Tue,  2 Feb 2021 17:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612285843;
 bh=PKt/QKrcZNakySp2MauPNrMbA0J8xetiZEpJ7Di6YMg=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q1IJkiCxSTonj/oIx8hTZgnYiVzG82TkMjYXoMiFR7OI/P0Ud+iP6d+Fd6GR8IP1d
 8gkb/Vc5eRc60l/Fbmo8W9lqWQoc7l6pk2uPXRHaA0rMh6cPwzWjzkIx6iReAcGofE
 MEhiNNlGTa7qPjOMfiNQYHpZb7H9RheigfOqw8IpJqdilcbOUprgXug9o3YTFkb0uZ
 CYK3ibVOQU/AFo9kSfY/FxY0srSXb0UvTEZL8F8pbphVSpwBRPy38JrZMDS03vNMcG
 JBZ0Z1gdYjxb4RVfUzQGc1jU7VzqvO/PeIkuB83XiqRdcXGfLHhuo/YrPbo0xhNMq5
 CrNBy2lD/PXPg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, soc@kernel.org, arm@kernel.org
Subject: Re: [GIT PULL 2/6] dt-bindings: tegra: Changes for v5.12-rc1
Date: Tue,  2 Feb 2021 18:10:16 +0100
Message-ID: <161228552185.1852435.3798860010482421429.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129193254.3610492-2-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
 <20210129193254.3610492-2-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_121044_080246_0905B186 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202171016.HCsWHOVJU8DjgpGHonCxfclJ0ibP6FFyn2jqBLOzadU@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 20:32:50 +0100, Thierry Reding wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-dt-bindings
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 7d1734cfa3a7060cbd7f69d5d4b817c57a1cfe10

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
