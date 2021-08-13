Return-Path: <SRS0=C417=NE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E186C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 16:24:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DE3060462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 16:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DE3060462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZtEkCzTgg80xYLhqVruhh3YLgn+AC7M8SlyY1lfW9w=; b=LRcgdDdabFnHtr
	37awPUD1dKP7eiMID2VhgraV4inPgwKyjkqLBmIZNCGT22hdkUh6bLa9HyEkadcHEeJ71zg3j8iBK
	hOBpEomITWaPQ4iw9AT/ajUXD9E+1KC9XlebStT6X/1WlFGvORcL3IeA0l5JW111R6inkM+5r/iu+
	2eDC/gyva+kzAdH62WU7OqbvUH9Z9mKS3gceoaAtkIxNdpCU5iAuasKh7dmCRMaWtbNSbmPHMfLvH
	GBPE5KNIIysE3QTxPbd+oq5XmzVyFASZBlHdQ7vdE8oKDaGMgN7smpqK7fG3Lx8mCupYQmzIJR1NU
	eAU8M79qVaY48YDUNSnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEZww-00D5Fu-MH; Fri, 13 Aug 2021 16:22:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEZwc-00D5Bi-Ju
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Aug 2021 16:22:07 +0000
Received: by mail-wr1-x436.google.com with SMTP id l18so14033051wrv.5
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 13 Aug 2021 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uRtDnJs579S8DQ0elL799P54sAOR8oc9lSTGgP3ImMM=;
 b=mq/x1BjkO89XxfqlypJiDWRNrxxIHgUjX1881n5Wnsk52axruxmKwRv0CBu5966Z5i
 38BPHe4HiBfI88cAGDzWPtUEBcikX/L6vX9BPPo1eZL3Ape8nsMZRNUWbV10wpEuW8ws
 TyNB5phwmi+rcKBh9R8hjC4lvj6tOZZBm9WfhSRGIS5acy4i7ka3V+cxYTgkNe3QOv+G
 i6dL2kojTFCo5sDhLYGWDzEjvexRPtlMexEIGsEYBruScrUDKHZH/O9f0kamKI4j1dDh
 5+omiiGgTfvU0QZ4r31u4343z3BnkFJ0hgIhp0gqAlm1/aQsD6OUUhuntN1Dy4BMSbBZ
 fz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uRtDnJs579S8DQ0elL799P54sAOR8oc9lSTGgP3ImMM=;
 b=PcKlLFgvVeqaR2bnd4XF8M+9YL1rGFTkz55kYJ/CoFqzUKwwND5b8OTNQPvtQJCR4O
 rsJpWIC0wnR0THVagrF9Sa/XvS1fEvfBnhlA+CFa50RG4dtrH3ruZrrSsl5dGxkkR050
 xWJd/ftRu4b4RFhb2xzknRl2TrMs58B5sW68yqwnewer3rS78u46pyavEkdBrV23uf1u
 J/QKml0hhX8co2FP0PBrlcI418UJGzhi87r8YuOUQmZ8igy0DRenTRqqpGo7F4adehEK
 YZo/txlK+JNFrBCNz6BYIxFnOK1QBexxa+PH7lsItpJRWTawfqRbXoCtg3NJsO79AbR3
 MwUA==
X-Gm-Message-State: AOAM533/uptqVI/jNG7+L679dqO7TD6P5GsEIfjKUuyiFdrhip4/JWUb
 pgA92nWy6GKEKpTGnthTHz80YNWbVaY=
X-Google-Smtp-Source: ABdhPJwRzJ1/teEVA+58c0ZHKHWrTdY6YACsc16HWVMeCFJctL3uAmd72gnNyIbsheE4zzJdBLD+UA==
X-Received: by 2002:a5d:5592:: with SMTP id i18mr4096606wrv.271.1628871723366; 
 Fri, 13 Aug 2021 09:22:03 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id b10sm2380957wrn.9.2021.08.13.09.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 09:22:02 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] soc/tegra: Changes for v5.15-rc1
Date: Fri, 13 Aug 2021 18:21:54 +0200
Message-ID: <20210813162157.2820913-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813162157.2820913-1-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_092206_693905_65568141 
X-CRM114-Status: GOOD (  11.59  )
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
Message-ID: <20210813162154.fqTOBR3G0tosJXZtvtQUGC8Habz0wijwSyxvbj_vrik@z>

Hi ARM SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-soc

for you to fetch changes up to 59c6fceb2ecc382c3d20508a235b539bf23af1f0:

  soc/tegra: fuse: Enable fuse clock on suspend for Tegra124 (2021-08-11 11:55:56 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.15-rc1

Implements runtime PM support for the FUSE block and prepares the driver
to work better in conjunction with the CPUIDLE driver.

----------------------------------------------------------------
Cai Huoqing (1):
      soc/tegra: bpmp: Remove unused including <linux/version.h>

Dmitry Osipenko (4):
      soc/tegra: pmc: Prevent racing with cpuilde driver
      soc/tegra: fuse: Clear fuse->clk on driver probe failure
      soc/tegra: fuse: Add runtime PM support
      soc/tegra: fuse: Enable fuse clock on suspend for Tegra124

 arch/arm/mach-tegra/pm.c              |  2 +-
 arch/arm/mach-tegra/pm.h              |  6 ----
 arch/arm/mach-tegra/tegra.c           |  2 --
 drivers/soc/tegra/fuse/fuse-tegra.c   | 60 +++++++++++++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse-tegra20.c | 11 ++++---
 drivers/soc/tegra/fuse/fuse-tegra30.c | 16 +++++++---
 drivers/soc/tegra/fuse/fuse.h         |  2 ++
 drivers/soc/tegra/pmc.c               | 14 +++++++-
 drivers/soc/tegra/powergate-bpmp.c    |  1 -
 include/soc/tegra/pm.h                |  6 ++++
 10 files changed, 100 insertions(+), 20 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
