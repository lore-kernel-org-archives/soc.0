Return-Path: <SRS0=HH3A=VO=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C089C433F5
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 14:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C097C385AC; Fri,  6 May 2022 14:30:11 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6703AC385A9;
	Fri,  6 May 2022 14:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6703AC385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 1-20020a05600c248100b00393fbf11a05so6934361wms.3;
        Fri, 06 May 2022 07:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nfFGbXtx8Ki2IjiN7Vk3A6jVBg+1ReA160NvfdgTTd8=;
        b=mvgmBJZ7C9mMbaPWvrP1UdwUpXFu73rh6NdL0dx1CPzgy8VdrCQdodiWy9Hi3FBTP+
         qMHMwYWBWs3qtPhUZeGeJWGyhJbE97oyNOrlBBm1GatzaY1IiQVmv0EgEMlAGM12HOOS
         7MHmZo+1ERgUWZOymxUm/H66xLqvRCW7nmc3cTUFgivl93Ba2v65rGMqxI4wpiT8vyqL
         iK1xnieIugwM+szmCfP5WYUE/65PhLZgRE80WgsWPKVRjQL+4wR8tGk9nzmYrwOFRImA
         ZOR3kX/1SOmb+mFWz+dVh/Gnrj19orDSJF2RtaNMYVLBVi+R82ndgkYRv/8P+jiGqlbY
         MEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nfFGbXtx8Ki2IjiN7Vk3A6jVBg+1ReA160NvfdgTTd8=;
        b=TzNicXbRYBAqjH0NG+ij3sGf0OVBouJV3WSqSyBugmty2QC9ricVCed4JwP6oFm/Bt
         21DHZRCTFUl/47OdMzrw5bZrepToArFkb+YKDxUa9gJuSM2iO8PbT3GgOPLI19npYW6+
         KkYESHaD/3rZ/AiCoM8gOZVTQV+5Qm+8SAoFdtXSuPumH/sa3a27CF1q2tFPKW+nAMIF
         FJ5tpFc2BRgkmQ8WRPpAi8gmbGNuCPH2Oi6MxtyFqFRNouIhsomzYW0DCIuW8aTXchm/
         TQJB8Yp4aTL1vEhtKfoaCw0dQmSJhlLaro0Syp5YC+LWBxyk4xOSD3zwarcgFFazZ2VH
         yb2g==
X-Gm-Message-State: AOAM533gOldwY8ncZG6fPGPZUkrDPJIDmhE77lFzRH2Qy4p6na3NMrNy
	3xnO/8CYsacZhObGDmrJFxsp5Dm/+VU=
X-Google-Smtp-Source: ABdhPJzRVLvTpSH9Hlb0gTRiLfi2J2Od/21ypwhu2x944HI4J+fMouNTl3zvtcmwjcogC5w/hhWomg==
X-Received: by 2002:a05:600c:2552:b0:394:65f:fbf1 with SMTP id e18-20020a05600c255200b00394065ffbf1mr3709426wma.55.1651847407991;
        Fri, 06 May 2022 07:30:07 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r190-20020a1c2bc7000000b003942a244f51sm8838909wmr.42.2022.05.06.07.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:30:06 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] ARM: tegra: Core changes for v5.19-rc1
Date: Fri,  6 May 2022 16:30:00 +0200
Message-Id: <20220506143005.3916655-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.19-arm-core

for you to fetch changes up to d5becc32308c31c6c88bfdf55c1ec8c537a8cdd1:

  ARM: tegra: Fix typos in comments (2022-04-06 15:33:14 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.19-rc1

A single fix for a typo in one of the comments in the SMP code.

----------------------------------------------------------------
Julia Lawall (1):
      ARM: tegra: Fix typos in comments

 arch/arm/mach-tegra/platsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
