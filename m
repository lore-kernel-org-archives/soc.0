Return-Path: <SRS0=r7Jl=MI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B697EC12002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:28:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84481613C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84481613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uvlw5u/VnNje9OU1i40IopSRQoUvCUj8Qpr9qUh1W8c=; b=K3SBXSJSpedvg6
	RvkqVc/1NnP5YLWalv/XcXSJ8FbwLJ2v/JKDzOJ76dYRQ7bkxLmg3vRNZ2wV+7fvC7Dcxjf6BXQ/U
	757nqQ8tBpghLrNjyRV+R9ik18tt95W1XWCUH2Ws4g5xFHijGa94iMzvmlV/3KYXhuN9OEe0Jzyrv
	/PUK7WGSCkNFyHiLQDCYZSegYLNBYkvWHeOAR1OjuUwUzpmgfkRciXYF6mBHyKjCD/wP8/VoOF2Da
	qfmIv2Qzbzm09XQjM5kDTIQVrdjL0PBD7g86Ydxaxs8N4WhPxT4DB7zsv0ZkXPWHUZNKwuG+PO5AJ
	tVxwbnFvu2SySshNvPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4VLM-005ILh-PO; Fri, 16 Jul 2021 21:26:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4VKV-005I4C-AM
 for linux-arm-kernel@lists.infradead.org; Fri, 16 Jul 2021 21:25:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 551A5613E3;
 Fri, 16 Jul 2021 21:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626470707;
 bh=qDVWi0rKR8obdtzuoYtx5h0eArB5K+BEGwcPu7gqtko=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C+8BXsjTDbG+fK8b1NwZxabM/bUwd9ZditDM7Q6j2bSvsb2kxRXnGhkdFeO5fNWr3
 fOJGuwpAMQbIBDuCpS9YSpkE7vc96C+fTSz0GEYlfUTaZbOsW1BIU3BVjCne5ZF7vT
 tmTSouSVh1k90meASHh5GjPUmbRHXIMMkPMw4qICMLFj2ub/J01APeWIkaXIK7rMZu
 RImKD9+sFoFwO2YMeBwtHBMAWYRuISR1AhheZKrCHy7ri3vKhxNVA9bdJ0wxR11igM
 m+7mgDkEL86zKZzzrFmVeHSLrdV3t/BVzQEvZfjKBGmlwUbGAyd7J4QhJrVOgvKSF2
 7d0SHq5gWv5+A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Joel Stanley <joel@jms.id.au>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Zev Weiss <zweiss@equinix.com>, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree fixes for 5.14
Date: Fri, 16 Jul 2021 23:24:44 +0200
Message-ID: <162647049998.3478428.1864031111660370458.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8XefdPzeOUDnDgk9cHQEs-9wF_ZSPdYQRzuNOpGZTyGUKQ@mail.gmail.com>
References: <CACPK8XefdPzeOUDnDgk9cHQEs-9wF_ZSPdYQRzuNOpGZTyGUKQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_142507_443954_4C22C7BA 
X-CRM114-Status: UNSURE (   7.71  )
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
Message-ID: <20210716212444.OlGPY2M1HqEs62CUvUh8huW7penuWb7MtweXYqRTNfg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Jul 2021 04:31:59 +0000, Joel Stanley wrote:
> Here are some minor fixes for the aspeed device trees.
> 
> The following changes since commit dd87684c7c9b82ad450cf063c58b4131074ad8f2:
> 
>   ARM: dts: aspeed: everest: Add pcie cable card indicator leds
> (2021-06-07 13:38:55 +0930)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 8825f2744d944e5666c28bb04a84abdcef27a7e6

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
