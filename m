Return-Path: <SRS0=fGbl=O4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43C9C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:14:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A81C061019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A81C061019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PqZNeiiTsdOXjqLTFoC+m1SCk1w6Ug1WmMvIBDIjeKs=; b=ErCh42su53j9bh
	IB9fk2rd2vJqYFt/D3et9PCXMI7mW4e/9xqSM+0sRTEI3MbtAvT9GASW8FulsgXGDcv8HBbNSBbuW
	nZZJ/xBACfLG/JA0Z5OX8brmI0CL4OgDZ36PNFV8F0+Tunot+OF59TW6dMCFoFfk6VvsFhky1hOOy
	CWM/yi24E8u9Z+wK/ltUTArat0weiQ9vcVjavTBgBsIG69GUIJUx8to9EywqCo1kUW96oC+ANTvrW
	p253PF0ZiWPEQi0kJMBBAoZMfgg5x6xLM8BDPELrJZgL7CRlsGlKedPLlankn3sNhSaVlLnqKl0KV
	9/3bZYfAMJV/c7nMwktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYwDz-0042oY-S3; Fri, 08 Oct 2021 20:12:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYwDV-0042hw-LL
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Oct 2021 20:11:42 +0000
Received: by mail-wr1-x430.google.com with SMTP id t8so33250914wri.1
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Oct 2021 13:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KNWLHFXqYdT2gh+x9edoWxDGJ0oKoVJDV2MDrZvoAMA=;
 b=ZGGG50RMsvaM0LmZv4TUd+MC7cLPHPMBm2857GtsESEqfpuTzJkSIfdJG/nhQQL2Ti
 HFmYLcVzIYd2MV2S8/vahu133dJgu4fgKCYd7dseaYgMUPwMurVdRd1t+t/zEAZ50Iip
 kksBJ3BLiQoAJpRUaSolDM3s5ztO16dwoEjTn0Fe4YbJsII7IDRjAQUGieIHH2AZlcMk
 Nt4oJmGtVAvulzUeIktBoxaJgjE+bNk+Aw9BP5590rjH3cGHUtGX3lmBgPxyd6d9GJKK
 f6gKTXdJw1ghIf/mSZiliL6DgUuglOBXxrICVgRbrgW6n6cR79YqvpZSKONWH3VLXFbB
 M3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KNWLHFXqYdT2gh+x9edoWxDGJ0oKoVJDV2MDrZvoAMA=;
 b=Xg/q0nmRaQ9AY+eM6x9+NC1k4rSA8uEyFtW0t3Ju+zs8R2cBOEjA9S7AtE7m6Jfa3d
 53obSEWTc9vwiUuEzL8Wc2gHb3Z4CF1xclu63EI+ni4fwt3uq5ujIeEqaqJJr0zMUY1d
 PMe2juOFHqVQbIXWNTBrDLkBr1BA3E/R4FHIaEJtIA7MHg4rXGJz0whVLJ/LJbMu+0JR
 KI8KLzkBQz0BxKEpdm5QS85liJIyLCkwB+5xgN6ockjlfFGdRx3mPtotZRHV2+flQIBW
 jACOVzofBOdGsxqHZEjcT6KBikXl4mQy7sczaIEOi/aMZoJZprgQdT5+YWDHflsZdlxC
 /Xcg==
X-Gm-Message-State: AOAM533DB9vbAkNJYT/w77alAcNHmD4/6X6kTcyPyknF6kfLXqWfH6eT
 NZNb+ddpksdkUiOnn4m38iE=
X-Google-Smtp-Source: ABdhPJyZqAhm8yNPkHyUdVV334CDf1LNzNHzLHaAeINNVw8lzonUpGBlNJwkIMmre4Oytgd+MRbBdA==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr6593758wrd.24.1633723900124; 
 Fri, 08 Oct 2021 13:11:40 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id f16sm286418wrr.53.2021.10.08.13.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 13:11:39 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/7] soc/tegra: Changes for v5.16-rc1
Date: Fri,  8 Oct 2021 22:11:28 +0200
Message-ID: <20211008201132.1678814-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_131141_720901_FDE63CCF 
X-CRM114-Status: GOOD (  12.91  )
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
Message-ID: <20211008201128.DH_9OiJZm-PQ90n0LD8rF1aUp3u-CTqj_16991tTbug@z>

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-soc

for you to fetch changes up to 76d89474310e05d9c592a8beed2aefe4d3396d2d:

  soc/tegra: pmc: Use devm_platform_ioremap_resource() (2021-10-08 21:42:41 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.16-rc1

This set consists of stub additions to enable compile testing for more
drivers, exposes the PMC's USB regmap on all SoC generations, removes a
state synchronization workaround that is no longer needed and adds an
error reporting driver that can help troubleshoot crashes.

To top it all off, an error handling path in the powergating code is
fixed and the devm_platform_ioremap_resource() function is used to
remove some boilerplate code.

----------------------------------------------------------------
Cai Huoqing (1):
      soc/tegra: pmc: Use devm_platform_ioremap_resource()

Christophe JAILLET (1):
      soc/tegra: Fix an error handling path in tegra_powergate_power_up()

Dmitry Osipenko (5):
      soc/tegra: fuse: Add stubs needed for compile testing
      soc/tegra: irq: Add stubs needed for compile testing
      soc/tegra: pm: Make stubs usable for compile testing
      soc/tegra: pmc: Disable PMC state syncing
      soc/tegra: pmc: Expose USB regmap to all SoCs

Mikko Perttunen (1):
      soc/tegra: Add Tegra186 ARI driver

 drivers/soc/tegra/Makefile       |  1 +
 drivers/soc/tegra/ari-tegra186.c | 80 ++++++++++++++++++++++++++++++++++++++++
 drivers/soc/tegra/pmc.c          | 28 +++++++++++---
 include/soc/tegra/fuse.h         | 31 +++++++++++++---
 include/soc/tegra/irq.h          |  9 ++++-
 include/soc/tegra/pm.h           |  2 +-
 6 files changed, 138 insertions(+), 13 deletions(-)
 create mode 100644 drivers/soc/tegra/ari-tegra186.c

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
