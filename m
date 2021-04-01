Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7ADC4360C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:16:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A829C610FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A829C610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cV4iJ8ZFAhYztZ6EFGezhqqUw4B59FztgkEzswpXWSI=; b=ecMXmKbZPRSw02l6uxvI6IGD2
	2yn7j49wOKG7jIdpjrMyFPi8bg5+bSJ73q6lr4WQH7wU5r7nOIRipKslr7XYqsXWbQRd/TcmgHaVv
	3znyiEQKCQC1EyuViLnap4Rp1blrbWO3y8GrqiM+2YNNDWMBFGx6TdlGNzTOFIkRwPmf4CLP8hMjB
	HFIOEyrmZ/BA5NTse6WytxhqrB9AaarlVwgi0E93DT+Zb6Fh6gDGAW61Hd35G3pfnHTm11ceoy+IR
	NWrBlkrco9V5iMlDYRU95cRJ8aH6YsQSyf8TVityCOVzISK6GJzp20sn7SSeKArFWf3Hc02R32gyx
	Sg0nNPl9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS4eg-00B1tv-Sy; Thu, 01 Apr 2021 21:15:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS4YY-00B15t-GO; Thu, 01 Apr 2021 21:08:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C827610C7;
 Thu,  1 Apr 2021 21:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617311325;
 bh=5eoCbOT03yYdZ3SzNI2XZ+AWzU6pejyoMe7AYWXziec=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NfRarbvQZ1F9pm8NP8ZGJob4XCbo2SbHOe3eR0wf+PSKSeXaTV2uucvCbAPvhgdwB
 dvcJXoiv6p+/9MQHRAz5aOQeUAfNl2NA7y7lOXrt5sEW+dzA3N42fq1MQDb140IQOX
 1r/Pyqzshl0hnwOXMbuF6twr0687hLCTv3pAa8nAwvu22l5r4ik+aYEoLETuvDjObq
 Y5pYRuNoNZirIyZP9EgXcfpR2EzaFu57FBsfDPh+5B7GVnSD4jyelEdC3EJsCSuFSB
 zB0CmM3MI9B+N592HMYWy7wohyL5y50XBA1MYma0hWGFxgbOiZOY9/FJ/On2v5BtYI
 a/5ayeXjMbFIA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 CK HU <ck.hu@mediatek.com>, Wei Yongjun <weiyongjun1@huawei.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [GIT PULL] soc: mediatek: changes for v5.13
Date: Thu,  1 Apr 2021 23:08:36 +0200
Message-ID: <161731130321.663335.9439061446866872029.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <c47d4bdd-9e05-c0de-bacb-3a262fed936d@gmail.com>
References: <c47d4bdd-9e05-c0de-bacb-3a262fed936d@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_220851_814334_B0797D37 
X-CRM114-Status: GOOD (  11.36  )
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
Message-ID: <20210401210836.m7r70xF1AHUA-sBGGr10Dlv9ebGsAj2pNE82GeTM0n0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 16:19:45 +0200, Matthias Brugger wrote:
> Below you can find the changes for the SoC drivers. After we fixed in the last
> round the power management domain driver. This time it is the MMSYS driver. Up
> to now it held one big table with routing information for all SoCs. But that's
> not practical over time, so that was splitten up to add only per SoC structures.
> That should make it easier in the future to add support for new SoCs. At least
> one series didn't hit mainline this time, but should be ready for the next round.
> 
> Please take the patches into account for your pull request.
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 3e7f2f2980e82eb20ce73691d65d696c6994ad4c

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
