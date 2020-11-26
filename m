Return-Path: <SRS0=esR3=FA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D77C63798
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2020 21:19:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9620A21D1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2020 21:19:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nxjumxln";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTZs/3QQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9620A21D1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3IaESfad8mh939pBg4Pd8CNp1HOM6ErjEIf49OzqHKQ=; b=nxjumxlnG+B3hIRv2YB9OfVyd
	TA4Hj04OipCp7gyGqogew08uKPV+EEo91crajZa45aUo+MzL7oShjnqYftVwX4PJLYvEXhOEsQaX5
	7y+hHnZWYkixr1a664jANTf90dugrxamrsZVdXwoDTgp8Nyam1n8PSvILQV7FcQRnqqQ7N9qDneoE
	rPpPTu6CUa7Jtw+YzfHBHbsneX6gb/VhemrZnLlf8JE0dfSTIH+8MUyHVkryk5eo9lbcru90mFOBZ
	32VTTmMNxgBB+iDGI4l3FiGL3cPxMeXy4KKb3n8ose4nyXrrgiOqwxkHUHm9bV9nGf7BQvq/VlPQC
	VyGW89DDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiOeT-0005rs-NA; Thu, 26 Nov 2020 21:18:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiOeN-0005qH-Hn
 for linux-arm-kernel@lists.infradead.org; Thu, 26 Nov 2020 21:18:01 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05ABD21D1A;
 Thu, 26 Nov 2020 21:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606425478;
 bh=HSfHpyGHosM0zl4GX1qEm9Y1y0EP+ql2Rg6i1IQCpBM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HTZs/3QQQivwOss8s2lWlnqv675t9ViuuIQ42A2GwboFSssbruBT37zocGSkEZYKP
 8IITcRjfH7vt+C/6VUpvsOyBcxaYWgcf4Fz/4EAdwamRnL55BDGJy+uHwCME3SdHD7
 3yK3DtiBjSy4MQyiPfTkVO5pvCKeIF3zzKBNZuFc=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "arm@kernel.org" <arm@kernel.org>, soc@kernel.org,
 Wei Xu <xuwei5@hisilicon.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] arm64: dts: hisilicon dts updates for v5.11
Date: Thu, 26 Nov 2020 22:17:50 +0100
Message-ID: <160642546630.1426861.17643860322823735385.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <5FBDC416.5060008@hisilicon.com>
References: <5FBDC416.5060008@hisilicon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_161759_870473_133F0A83 
X-CRM114-Status: GOOD (  11.94  )
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
Cc: Salil Mehta <salil.mehta@huawei.com>, John Garry <john.garry@huawei.com>,
 Tangkunshan <tangkunshan@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 huangdaode <huangdaode@hisilicon.com>,
 "Leizhen \(ThunderTown\)" <thunder.leizhen@huawei.com>,
 Olof Johansson <olof@lixom.net>,
 "Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
 Zhangyi ac <zhangyi.ac@huawei.com>, Shiju Jose <shiju.jose@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201126211750.UDps4TdKgscuPBnF9biBDTST_HLesJbtDYnUAKFl5Vc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Nov 2020 10:40:22 +0800, Wei Xu wrote:
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei

Merged into arm/dt, thanks!

merge commit: 2df8aa0373489534a14be5ef48a2dc1215ef9270

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
