Return-Path: <SRS0=Sd91=LF=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908F1C48BE0
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 16:43:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7205961400; Fri, 11 Jun 2021 16:43:10 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49F926141C;
	Fri, 11 Jun 2021 16:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49F926141C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-wr1-f49.google.com with SMTP id o3so6745065wri.8;
        Fri, 11 Jun 2021 09:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G2y1nNc7K+FotKmCLrE2xc9UwhEMOudxdp6Ua/dpxnA=;
        b=QVccNFWGssWk4k4ucBpwS+8fhjUb3TMNJNMl3t5FLIgQYgTmYAo8plKz5H+4I6bdxw
         IavtWULG8FSlydKvTlF5wDV05v+xD0zIIEBNiwTirCs61LpCuoDGUEAOsWTujt2xjzww
         co+cynmZegs1M4ZfA7dNcr7OVbDGxnXydXTbh5mbwDftvvdz9V8nqw1D+uLY7GJE+WmB
         tguux8FWnY87SAfKaKtLIfMIt5RD9JxTuX48qUDwRZDQqY1BZxKNIm06y9SrP5CABZzd
         3ScdNJe4dzNRoKCxM/IKKmcgvyDmbxxOWjd8lnwDWytgSCRcC5+yjQA1jvZ7W8Ngcg3E
         nS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G2y1nNc7K+FotKmCLrE2xc9UwhEMOudxdp6Ua/dpxnA=;
        b=NTkdEXrCwunF80+lZ0/vXtehXEOd4Z7mabTf/cl5lGmeBBd68GTV5GWE5nHRZ0ZwTq
         h0hzgiZDj6tgCL5SJtXrtE8jkPUg03euOmz0P+tNXEdXoiUnt4YTn7A9IWiIaBio82Wq
         KH2Wvok9fo+xwOIjbcojT6rRaKvA1sTNMUBEtFyp6YBDOVUz2V2aKGqm5yGdan3G+mHR
         UMeBlewt7ClBTHN6T6eel7cSysbMToK3SEJRLmJZGOKNTkcZT4xNrDgQM0kZIWVDmZut
         uK3JNI03kZ07fQacQcU5pXN5h6qKTbAnSr+exN7JbsPcCbpx1ITKEFe3JO2RAh8ZBYLf
         2dMw==
X-Gm-Message-State: AOAM5307cZzHI+A2Z5/q0g1DwLxi+VEKdDTvsKUc33fy04vRYf4aUUcO
	vNCfJtGUsbF18Zlk4sHUw57eiLbXyDc=
X-Google-Smtp-Source: ABdhPJxbh57z+wnedcBu6pjDDzsjRrMwjs2/RmVYmEKbEpOZMiesm6jZOqpG7ISItY/7hqRhGOo4mg==
X-Received: by 2002:adf:a195:: with SMTP id u21mr4993145wru.367.1623429788401;
        Fri, 11 Jun 2021 09:43:08 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k8sm7725414wrp.3.2021.06.11.09.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:43:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] firmware: tegra: Changes for v5.14-rc1
Date: Fri, 11 Jun 2021 18:44:34 +0200
Message-Id: <20210611164437.3568059-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611164437.3568059-1-thierry.reding@gmail.com>
References: <20210611164437.3568059-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-firmware

for you to fetch changes up to bd778b893963d67d7eb01f49d84ffcd3eaf229dd:

  firmware: tegra: bpmp: Fix Tegra234-only builds (2021-06-11 13:31:51 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.14-rc1

These changes contain two minor fixes for the Tegra BPMP driver.

----------------------------------------------------------------
Thierry Reding (1):
      firmware: tegra: bpmp: Fix Tegra234-only builds

Zhen Lei (1):
      firmware: tegra: Fix error return code in tegra210_bpmp_init()

 drivers/firmware/tegra/Makefile        | 1 +
 drivers/firmware/tegra/bpmp-private.h  | 3 ++-
 drivers/firmware/tegra/bpmp-tegra210.c | 2 +-
 drivers/firmware/tegra/bpmp.c          | 3 ++-
 4 files changed, 6 insertions(+), 3 deletions(-)
