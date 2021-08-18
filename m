Return-Path: <SRS0=NLw9=NJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EF2C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:03:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4843160EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4843160EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Teg2SCglPU+OLlbxv3AXjIXzKxrmtjmE+IijVqKtbA=; b=alL9XQjyQ5YWW+
	6jgo9qHllpOxEfc/HkFSuaey2cQoBAz57ikX4aNBfBqA0l63vDVBR5UeurlFvSQDgTUmtKAdqQNA/
	qGfnS3sa6e3D/QkJLH/ZRnYoaza6gqOn1FeU4VXxugr7hCsGdapfOM6XB+2ceInYdDoXNGPom0+5c
	X4lJjZQ7tvVj6Qm51rlTtKbAzNG6v1wj6vAFE+y4oNGGVBBLa04v8XR8R8f0TqU1SDOVgouD3S1hS
	wb3inZFfnBRcgsC3ySTgjoKuyN4/toVJ8XKHAUGSLbKjoTR50VIwqaouHeLhbgYR303+/++Jzlmo/
	2U3BEtOUkb80RDZdO3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGLBb-005bZd-6Q; Wed, 18 Aug 2021 13:00:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGLAi-005bIT-7r
 for linux-arm-kernel@lists.infradead.org; Wed, 18 Aug 2021 12:59:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EDBF6108F;
 Wed, 18 Aug 2021 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629291595;
 bh=1PXTrzypSqjSqKLXCyiUju9MqS/kBI767BCevYdeoKs=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DIGQFxC6E2i1ALHhOwzWr+dqcmayer9HCdoXolRewE+RRL5XCJhwuHo5hapb9t7bU
 fdPcB5JZkLeP6YE+6vvL1vhMW+vFVuEvvY5BTObS60N6O0T8nr+OANRmXXDeRLli71
 gfSnicjFvKsIzRYH6AV8OuOOH40B+l23ig/NLDdQB6w2FpXlpQI9lUc6MEJerMApzv
 9NwzvrH4oXe86D74dd9eEuzR4zw2CkxyuushYaDdTsBp31RJnKCbntoh0y7vpCT4Gw
 bPH2EdFM5cXqdFQPoVy6bjBkJPO5RQMtyYLbFs3ZyM3e1sHy/+tZK77v092egtcwXm
 RC2FD40S7EO0g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Wei Xu <xuwei5@hisilicon.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Zhangyi ac <zhangyi.ac@huawei.com>,
 "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
 John Garry <john.garry@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 huangdaode <huangdaode@huawei.com>, Arnd Bergmann <arnd@kernel.org>,
 Salil Mehta <salil.mehta@huawei.com>, Olof Johansson <olof@lixom.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Tangkunshan <tangkunshan@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Zengtao (B)" <prime.zeng@hisilicon.com>
Subject: Re: [GIT PULL] arm64: dts: hisilicon dts updates for v5.15
Date: Wed, 18 Aug 2021 14:59:27 +0200
Message-ID: <162929137204.372162.7039199681946826323.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <611B9BE9.8050904@hisilicon.com>
References: <611B9BE9.8050904@hisilicon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_055956_353755_CDF8846F 
X-CRM114-Status: UNSURE (   7.25  )
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
Message-ID: <20210818125927.O5mqbDd76i6L0f-I_LyBDRnojcloTdNVvIJYY5d_GNM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 17 Aug 2021 19:22:17 +0800, Wei Xu wrote:
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei

Merged into arm/dt, thanks!

merge commit: 911f0faf485817a1e70bcaad8121201ef0f30ae2

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
