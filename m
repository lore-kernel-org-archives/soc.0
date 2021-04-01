Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D835C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:14:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C3E2610A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C3E2610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1x6uVk03Qmiye3xpWJ97rtghr9ARvLg2J73Ph/1Zm6Q=; b=Gaz+/RZ2Mgw5JuPSzF2ewTlcY
	3k0NY+Vt+ioAw5PLqZIR+LNrhE1JutXLgUub3ftWnTbMwpenZORq7GxbnKZwNlNgrHq+PVy/NH31H
	lHIiwC+xRI9/cyaEu0s3YEEv0F0+eeB9avpVMvmXppEp/GrrEKROBp0SPUjjqXjn9wSChmvtPlXPt
	D8DGHvxWTbSVnq39CR0EnHBbWlxtsskzfv7zgXlVuw4JNldi9ck8ULAKuDfHWx13C6C8aJ+UXxvnv
	Moi4LlDqy5C/FCHLW4X/TWJcnU9H1QtBmyaP777bYjm6wwx5/u/9v+J8kKZ11fz52BHEdu9Mg6SeG
	s2YvMsl+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS4aG-00B1Da-Gp; Thu, 01 Apr 2021 21:10:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS4WD-00B0wX-TS
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 21:06:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C481610F8;
 Thu,  1 Apr 2021 21:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617311179;
 bh=GnlnrZeHQmh5URqHOwRmdXDU7wm6gWjQ/3A4PNbkYyM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lvr+nVu3TDHOga7mUtFNACiadGLekBH4uEmnVWbw3vMQTiD+jMHfa82gRTPEPIhtr
 SvO4urmP/8pTE5ZXQ0YqzUR67bBY8SYf80M2bjaYtL+emHHjDq1Y7r2gm5Pd+Mw/iu
 Q3CjkEXDtIeDYtido8s2MRCOlRp1tl14Kcyf1D7EaEUFMM9Fg5lzA5cXLY2TbrISrX
 zAbSIOxTJ0/k152JTFkl3VfZcXcMiXCdwDNIIXULZNnx+G5UiMmHbTOTJKASCsGceI
 6M2RdRkN+3HIi8+HFV1bshgj6QGhL1aZPPxzpdbG5rb1zWVHGobTyWHZjQC89KlfBm
 5bdT4A5qMeZlg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 Olof Johansson <olof@lixom.net>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.13
Date: Thu,  1 Apr 2021 23:06:06 +0200
Message-ID: <161731114635.662954.7067488075603315200.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401162207.29299-1-nicolas.ferre@microchip.com>
References: <20210401162207.29299-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_220642_768167_0BD8DDD1 
X-CRM114-Status: UNSURE (   9.15  )
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
Message-ID: <20210401210606.kTi041dSIbw1wkQZbmDl3ouj4lyxdzkPyTMgtHfDrq4@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 18:22:07 +0200, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here are the defconfig changes for 5.13 which is bigger than usual for aligning
> with options that we use frequently and some changes which will be beneficial
> for CI.
> There is an update with savedefconfig included, tell me if you prefer the PR
> without this first patch of the series.
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 630bc9784b637eac9266d7133cb8698c5507ae7d

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
