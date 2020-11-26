Return-Path: <SRS0=esR3=FA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D104CC63777
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2020 21:20:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7347C21D1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2020 21:20:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S65k8VeR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="d82b3R7q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7347C21D1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hq689FdYhAJaoIZf9x+eWVoIhg51AucPhUFGTZGqbcY=; b=S65k8VeRYx03Yy6JJ2HCzx6gZ
	HCuETA0V0zyz9JcVy8W13RCiQ0GQLrX1kJZKqFtIehVipBYpbmL+M4Tb/D0ka9/X8vtU0pUf2n+Mv
	FHMzyv/e+MlZWTXu7GQbDoDM+wxtzVW3/+gWVFvzq1D72Hqfc/zHMEJkaWRk3/FozIN7TvA0s+KqJ
	Sjicnbh3Vnz+Dom6WRhvvFTGWNJn5GhGcpwQcRBB1F2eM/vVieskMYSeX+5alGvwdzrShD8Eh/5OE
	AkNRgJBiupdSz8et2Gaq5KR46QckTbKSYw3xC+Td0H8fdLmVRDN7fq9/e7q3f7vmZR2RR8V0yY+SJ
	fmS8PsRoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiOfF-00067a-Mm; Thu, 26 Nov 2020 21:18:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiOf9-00065h-PV
 for linux-arm-kernel@lists.infradead.org; Thu, 26 Nov 2020 21:18:49 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8FF1621D1A;
 Thu, 26 Nov 2020 21:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606425527;
 bh=P6gIUcQnKh0pETuUpedLXRB3poCI5K8TiEfJbbVqea4=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d82b3R7qEywoZg6fQViz9h5rEEMS2AHpoK2cvcFnSaGPK7BoWVtxNBO7pLjiD+HJ1
 3DfuHEN72rSeWWFjVFVirWfnOJxdzI2adc7ers9R93htU4oRTxtSwKFcenpZa/Droe
 GpKeBg01emLibdrPp5vFyX8anjmbHKP22XB/84XQ=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Li Yang <leoyang.li@nxp.com>,
	soc@kernel.org
Subject: Re: [GIT PULL] soc/fsl driver changes for next (v5.11)
Date: Thu, 26 Nov 2020 22:18:38 +0100
Message-ID: <160642550445.1427126.16824828882938559324.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201125165913.15441-1-leoyang.li@nxp.com>
References: <20201125165913.15441-1-leoyang.li@nxp.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_161847_987383_7CA8BD18 
X-CRM114-Status: GOOD (  11.80  )
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
Cc: linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201126211838.u9-dxcoTghmPmT67gW3F8RPA_Lk_1S1hZuFRt27POuI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Nov 2020 10:59:13 -0600, Li Yang wrote:
> Please find the pull request for NXP/FSL SoC drivers.
> 
> Regards,
> Leo
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: ba622a3e74a7fc05e648dbb34483d74852f5ff86

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
