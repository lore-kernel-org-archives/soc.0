Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CBBC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:20:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEE96610CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEE96610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fLwGl+ER0VUgvhaDsltIewYKxkgHELCj9YDMuLo2qYI=; b=M18vWD+eWfz1QIYumZbMPTteh
	LYbECfP3CPQE0ufjB09cs3XtWQ3Rexy8bMfac5/Tr4nQQ2fumBlrCWwE6S4MwycpR/DASw6ulK+vF
	oCXFgcrey8nI/V2emGUwK/K4yBLM0g/stgaEUn9iOCke4Wzog29CUIvzXyXJOUxGoHGJAjZwCT45T
	J+L4ZjlrretsO23jl2Ao/kGbil9RlErVWqwkmZ7I79McfxiJlgpMzkENpqOaUr/L5PDb1KOidtxwx
	04DCX2bNqxDQ597fi6iwXd8qiJgunh3A4wpqHAKtvxT3FVhj3oWYrlLT0GUhyX17smlIrmV3dzsiG
	3OapbH17A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3lZ-00AuQD-JK; Thu, 01 Apr 2021 20:18:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3jQ-00At2i-IT
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 20:16:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2ACDF610F8;
 Thu,  1 Apr 2021 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617308155;
 bh=XyOedY3GvxM8g3yhvQbM1EJ+8ZaAGE8Dtz0iDbw5w/U=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O1j085a/WXhlOcSAn7pwt/1fJwnC0jJ920Xhm8Zat9GmDecoNsPhqWymgj2Yhx4H3
 Dim9UtG+6QzwuVlP2WvmdXHOjWQ8pTWYSncqOhQtpkAuLzclk/yGD7rHBuWgChbXiB
 S6u/N1uAzn8RIhc4DKQe6+VyOTIA67Ate3SUF6OAPrlprzqc3zQmP8PNci9/WXw+Zg
 UozyY1/3tTGNA9wCxu0PvAq6hPDPM8gWreK5ZnmWFp+k1NFYBLIkJwTZgbsq2ZbBSk
 +DJbP+u1uhs2u9EkXxMDz5fYR5CVrz22ywQjjF+dr66t9ngoNanWTJNTNO9IujUkht
 4jAYZAWiU9jKQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 linux-imx@nxp.com, Li Yang <leoyang.li@nxp.com>,
 Stefan Agner <stefan@agner.ch>
Subject: Re: [GIT PULL 4/6] i.MX device tree change for 5.13
Date: Thu,  1 Apr 2021 22:15:24 +0200
Message-ID: <161730808632.655497.14668701970057565320.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331041019.31345-4-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>
 <20210331041019.31345-4-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_211557_649009_E947EF99 
X-CRM114-Status: UNSURE (   6.28  )
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
Message-ID: <20210401201524.rUQawzrWJwY3DY61VidXwyh4Zknb6UMx1PKBDz-5Ddg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 12:10:17 +0800, Shawn Guo wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.13
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4f662ba2be220044bb965f36826723c8f1e14eec

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
