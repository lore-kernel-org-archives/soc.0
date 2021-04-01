Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9692AC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 19:40:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16EBE610A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 19:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16EBE610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=au4WOG975VeFJruO4ayp2IgUFmfEA7YX712bKLgQhAM=; b=hAQH+fOde65HqXo/UlEBkoS0k
	er8u2x+MLiYDyM+HjAa/1ker68WnHTLBHaod/lAJadEZh4W0ArbGcyx5oEAr0Z/yKFKimgkz7UDJL
	03LIDmXzuMSmOqPGe3YBdzjmy2/2LqSMzIBEqxv0/WA3iSFL3DLt3p7/QouOWfSL0f45toyLmG6hG
	lmH7Z4RV2pi7CSSg+7zOuR5cew9fXD1LJqBzX5x1wrWuCKXTgKHJvr/ge8AxDN13QGHcX93ecQu40
	9nVk9zf9hqww1OrEjU8l9O+8GGDYyjkkTYOtjD71F2hE6H2p2dUxselJTAy7mV5EB/ag8FTMmOx1g
	RziCHbuFQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS368-00Anj3-Ss; Thu, 01 Apr 2021 19:35:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS2vm-00Am9V-HO
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 19:26:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAB4C610D2;
 Thu,  1 Apr 2021 19:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617305077;
 bh=/a2rDxtxOp4/XjgZGCA19UcmeftTo0SAm1DKhdMlO8k=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TpjUMRG15QNv+CJXFxCH7yc9WEqMgueJCyQqQEUMcjoKEEuWHMigP1JO5iymgpv3G
 U3x92txZSfwf+OHV4jjzWagHjHQdSBdZOSuQB548NYGY1ORg0juq5ZGa1USa4IksUc
 NYy+bEhzJbr/6JZkDF7hvvIQqtQWWEpJDUhOa6UIgazGO67te0lYgJ+xOQxIlL705I
 c/05KSMvs+y0sPwq3BNHJfiZodIEKwJbH6bqIurt0n4/UUQkRTn18B5JA8Obj+PmkW
 XCKbrCn9f0D6WPcfBOp+W5uyCkSd2RIItY2h5TDs5y4HgOpCCzOEdFjS5gSbtivIt5
 n3XAgzVacIdBw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/5] clk: tegra: Changes for v5.13-rc1
Date: Thu,  1 Apr 2021 21:24:16 +0200
Message-ID: <161730504512.632809.13353373466753586224.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401172622.3352990-2-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
 <20210401172622.3352990-2-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_202628_876156_981E33A7 
X-CRM114-Status: UNSURE (   6.57  )
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
Message-ID: <20210401192416.MBYHzSCUErQHimFw5TW2jiN9U-kg3iL8pSiwjt0Vmfo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 19:26:19 +0200, Thierry Reding wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-clk
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 16320d7fe7d6ca19c57523bb5a9b085942842159

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
