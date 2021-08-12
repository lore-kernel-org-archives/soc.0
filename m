Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E79FC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:55:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B8DE60F35
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B8DE60F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBQbsxvf4qcs8eRphQ5C73TSRsQSw5hOJY5G+RcaF50=; b=DLCxnCgUAVLhvR
	lzYAerHQfpTZJEbYw1MLiTu+b4BLMLtEc2CBfK1emyGfUQRf6a8y4fJoKoNd80HcCLWZ4axxvF1fS
	C/JKtRxPKIY/hPNMLj0sRcgCr40Y25ZNlooq6ixarcohPr0bPuu0ZogMCepjmZ6gy/6ntoBDAz/60
	R76e6M26ZCZXwgE/jC4D2XuAzYydo0RnDEaA3oObxPxM842JRb46wAnH7Dcol1bMwlvLXGA/bUolz
	U5X45Y/MHMIYoHrOcNlPG3nwB7i6i/u2+EM1h87/0xp0hvWHcfRDKqEz7KT6Qv6FN0SP0tKzHYHYs
	JPJbb0SB8VICh7CbQZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHgZ-00BFvI-CQ; Thu, 12 Aug 2021 20:52:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHYv-00BCfo-3X
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 20:44:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73EEE610CC;
 Thu, 12 Aug 2021 20:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628801064;
 bh=Ay3ro23lN4+Qil3LvptADinbyUKuwbxu40BoPTYL694=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A6InRVE52u9NzsfkyFb67JtJSRIGVZX6lr7QZpFmcM3lTV67CNnov3gGn/DBMPEKW
 Hoz8gXCQyyputUykxq94OKJ50OJB/VD9rrRpR3g3jSEhb9Thtpm3uiVFmMOVvd34GK
 F5Jqy+Yj0QiR01/wRo4I6/gUK50iTC4n1NXAcwaQmsVilV2cEDtgeUol9/SZ0+IOX6
 NarAGOZau2Ik9I3UqOyEyQteeodsT58jTrOgrc7eoLRXhAFzpTox9Vmg3LWzzYHCCQ
 520WBwvWhfdwfSuJofwFsQwR+7LExtAUAmLzskUcSldNGiCN6Ecirs2jmFKOyfB+jj
 N9WOh5dzXtHGQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org, linux-omap@vger.kernel.org
Subject: Re: [GIT PULL 2/3] Driver changes for ti-sysc for v5.15
Date: Thu, 12 Aug 2021 22:44:06 +0200
Message-ID: <162880092575.1372486.4843530883005898506.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1628153040-834155@atomide.com-2>
References: <pull-1628153040-834155@atomide.com>
 <pull-1628153040-834155@atomide.com-2>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_134425_265293_33D3A25A 
X-CRM114-Status: UNSURE (   7.52  )
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
Message-ID: <20210812204406.6DXN1Pkk7grEU7rCAFQ_MY0GQ_p-jA3h3ucxslXNzHc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 5 Aug 2021 11:46:43 +0300, Tony Lindgren wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/ti-sysc-signed
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 74953a9136cfd650dd994daded520528f737b7b3

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
