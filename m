Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70229C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 05:36:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AFB3610D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 05:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AFB3610D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UdWz1sxGkuKqUT72SGNoRCq4gVo57vDrkPkF9wq18kM=; b=Ga9SOU32h98L/t
	2A91PCdvf768/PXTdBzhGiOv2qD3iuSVvsutqUkNGjbKyynNg9QjXur9G5pKVQ/8wOHv2b/1DKI1E
	tOgmoI9ons+t/OMUXBhO1mXyXlGQVW07XN8CI7Mf+v1sLeKuxqApXvEHYUG+Ipba5use6AHqq3wAJ
	ZCGDfiSQKv/LJO/dqavHhJlaerh9DvZIu21E6fYubJ883+rFa7tc+BsQLdv/7LfzJHy4znXEkOmfi
	2sFaLgarL9ENbtLsOJMW7bX2ECa7/9ocYVNQEVk7fpEo7wut1xicbaDNhJsRFnUkSYDAFNViH7Ytx
	AjiuKj9/sqE2lt2R+pyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdQjA-006RLN-Na; Thu, 21 Oct 2021 05:34:56 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdQj7-006RL6-8h
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Oct 2021 05:34:54 +0000
Received: by mail-qt1-x82a.google.com with SMTP id c28so5116643qtv.11
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 20 Oct 2021 22:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=GCDNxBCfQrTCgy65OYovBu7GvVP02m8fWJKotJSowI8=;
 b=W/GkOBcUgbznUu6AFf4sEGPIgLXPobT/BxjC+RQ3UsOXTtnV5s6Hu7Ehbf53dn/0dW
 die3vh2BoBfZDlbB/dS5zHgJleBKE0Qhk/wgjqtCn4fxrG4pT94SfjyDUzNfI/VGaKoC
 wFijimLQhIyC+PKSWs3jla26tom1jdJut+KGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=GCDNxBCfQrTCgy65OYovBu7GvVP02m8fWJKotJSowI8=;
 b=OBdYCr6l4OsUi3pTkcDE8etLXNsMzaKFvJlSvUo8YB3CvTf4JU6wd9YFcLd0PP8R8+
 FhIWz9gUoT1c43Dbn7O2oPBKg9Ucw1ecfDLBTgtHnXs+EuzcJzC0VFXJiweBbYle8HFH
 +I8Skh3th9FLTTcf3Ha1/DBnNya7CbND34g3buaTmlXY6CphiCO/8uIyRQjHUC4JbYgn
 SY3PJlVxR8pR140zuiR9hbiXTZIXVOSy4YhS4xGh3cmplMSgogZt3Q5o5BWTpiztSzKn
 oVIWpBGMvB4maK9UW6FTKe5BfQn/SApe8AxBMUH0NRRJGAia23zBIjf89eQIpYVNUPia
 5yHA==
X-Gm-Message-State: AOAM530++p9v9ZpYNxBUWeZGLfnhfRDk04uC5hr+2e0oxD2QahyrrckK
 RnQ9kf9iDVf7fY7rJTTql1LpX0VKQa2ND7niQHw=
X-Google-Smtp-Source: ABdhPJyMzuyXO0SBIINy0WPCXlJC1D/b24gY7qkNEliyXfFi81yGd9amHY8WRVOpNJ9LSE4dVghPNhwf5FLlVMDmErM=
X-Received: by 2002:ac8:5f06:: with SMTP id x6mr3827041qta.295.1634794491508; 
 Wed, 20 Oct 2021 22:34:51 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Oct 2021 05:34:39 +0000
Message-ID: <CACPK8Xd0mVn2Cy7d=VBTDMpU=WHrftsiihwH224ekFSDGKAbyA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: defconfig changes for 5.16
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_223453_327551_EA0F7195 
X-CRM114-Status: UNSURE (   8.19  )
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
Message-ID: <20211021053439.2icHH1WiGyn6ENfrIemG5_faNUTcRqe87XkBMR8Lo-8@z>

Hello Soc maintainers,

Here are aspeed defconfig changes for v5.16.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.16-defconfig

for you to fetch changes up to 52a490e0efac02f236295cf43e136a1cb3a786f7:

  ARM: configs: aspeed: Remove unused USB gadget devices (2021-10-15
15:02:32 +1030)

----------------------------------------------------------------
ASPEED defconfig updates for 5.16

 - Add options that are enabled in the common OpenBMC kernel

 - Re-enable DRM_FBDEV_EMULATION

 - Turn on the various sensor drivers that are used in BMC systems,
 so we can boot test where they are modelled in Qemu

----------------------------------------------------------------
Joel Stanley (6):
      ARM: configs: aspeed_g5: Reneable DRM_FBDEV_EMULATION
      ARM: configs: aspeed: Disable IPV6 SIT device
      ARM: configs: aspeed: Enable commonly used drivers
      ARM: configs: aspeed: Enable pstore and lockup detectors
      ARM: config: aspeed: Enable Network Block Device
      ARM: configs: aspeed: Remove unused USB gadget devices

 arch/arm/configs/aspeed_g4_defconfig |  1 +
 arch/arm/configs/aspeed_g5_defconfig | 35 ++++++++++++++++++++++-------------
 2 files changed, 23 insertions(+), 13 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
