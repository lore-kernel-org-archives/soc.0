Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFADC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:10:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9D4123AFB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9D4123AFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5GSdK+1XWOmbMh8I4+rUNO99LqTndV1s/EftElqTyzY=; b=lsDHwQUCEfhBwV0bPSNQA8BZi
	yoUHmupvOlaj8l0SxiDWxJvswMn31ELcGHc9KvwjmCenIXooobNntr6njAZWijPRAISCFDqvhbckq
	6MNU7KCtIAdV+LF2ulJP1DhEh/NXy+P5vuTeMfX8mE6+nPdoQq4qhnuZxGEXDG1/481cAsdf8hmbb
	JuH/N8iE4dg5RbhVQJZjO/n8fXY96qLdlbD24IJUgI2BldS1/9he6cwn/kPdueL2T9FAaOu2nKFoY
	xu1IcX1TddSavzbkXJhcMnVKeQ509SJC1of+55oGdNfK/oipIX2tt79CYtlaN3zVbylGH/h7VK8Tq
	Pj2+PcLEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfY9-0004OM-94; Tue, 08 Dec 2020 16:09:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfXv-0004JR-6k; Tue, 08 Dec 2020 16:09:00 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, arm-soc <arm@kernel.org>,
 SoC Team <soc@kernel.org>
Subject: Re: [GIT PULL] soc: mediatek: changes for v5.11
Date: Tue,  8 Dec 2020 17:08:42 +0100
Message-ID: <160675365634.2641537.7384101128991830443.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <b03fe343-e183-c6f3-f2dc-4c58aae3146b@gmail.com>
References: <b03fe343-e183-c6f3-f2dc-4c58aae3146b@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_110859_384554_7BCCC96E 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Neal Liu <neal.liu@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208160842.89OuL0LesCGXeMjuscCQ2SGffvZhfZK9Y_ZOW1tr9xQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 29 Nov 2020 22:22:22 +0100, Matthias Brugger wrote:
> Please find below the commit for the MediaTek SoC drivers. The most important
> changes are the inclusion of two new drivers. Devapc is an TrustZone interface
> found on the mobile phone chips to identify malicious accesses from bus
> controllers. Apart from that you can find a new power domain driver. We have the
> old scpsys driver for quite some time around, But it has some limitations, that
> we could only overcome with a brand new driver with a new binding. Right now
> these new driver supports mt8192 and mt8183 but the plan is, to move all SoCs to
> the new driver model and later on retire the old driver.
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: bbecede458d042a5b71d6f10eedd471615d9ee6c

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
