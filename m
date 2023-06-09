Return-Path: <SRS0=ktnR=B5=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041ABC7EE2E
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 19:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6D8DC4339B; Fri,  9 Jun 2023 19:36:29 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A67CBC433D2;
	Fri,  9 Jun 2023 19:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A67CBC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-970056276acso320986966b.2;
        Fri, 09 Jun 2023 12:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686339386; x=1688931386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kO1qKhOJaKdap30fcHYTQI7lFzHq12HURBNl6AXLAwo=;
        b=HaRhe8cNwuD2aW7SSxwuWT1A2FrZDaoHZ3geyskluJFFwaEFVOedGvjQiLMOU8j1XY
         5GIJhCpMzVzBnTR1MzGpupJdQE+aXJLHXFHO97kNm2OqdyGBKWWngCFkAuRIdhfaq5pZ
         yiCZ0jUFyIE1si5Pm5Ljg9TR6BfYQWv7u1r8m+pw0saxm5H5gmXsfNZI9xcJA4NPSEfS
         ap0jrai1BIaECTrgJaynu3qxuM87ROy6kVYttPqg47t6EKah5wgaI6YegKS3ZIf+aGqH
         RNHBoFRhXijRPU6UCYqa9F1z7jU6j8QmX/cEKepJC9BVn39wof+zuEv1v9mIRyAmM92P
         3vxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686339386; x=1688931386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kO1qKhOJaKdap30fcHYTQI7lFzHq12HURBNl6AXLAwo=;
        b=V188DsCQUEdrG/RMtYxB++8RShGzmehmj9BJK24ZttwDz1DkFQUocwpb02jhYAPbiP
         WqU/tVr5OYc2XBpHqjWk5qWF3JHZZYIQmlFYniqCwUVl2LId2P9k3+5RsXpRVdMs99wa
         LN2sD8fWMEleMvBtcusnjB3mCHr0MzP6OPI0tgcg8h5KwiuTspZVG/WwbHrjnaMMK1C1
         wwCPXjOfFdd7RjJL5hFg2GGZq5uyehdwIBrsW4nkzyR19FX9t1/8r/T3/KpKpkNHG2Td
         OjUl0Pvyo2o9tIDt2hjefJ7A2lUvsgjpSaOJe502cWRuLzkSuAH0GtB/qdySu2AhwTCE
         bXQg==
X-Gm-Message-State: AC+VfDzYIo7PKOe2UJR5x6YEN35ZoXNH8N9qons8BFrRyxN96OrFODFK
	BviHXurw0S/xyTwmnfXp4bmU6lzTYCY=
X-Google-Smtp-Source: ACHHUZ7lBuR4AS4bpJEEO5SCTHfx2ULgdyWa08hXimyR75+JGLKOU5N9xxKtHZCys1P9lF6E7YlPTQ==
X-Received: by 2002:a17:907:9307:b0:973:ebbc:1d6a with SMTP id bu7-20020a170907930700b00973ebbc1d6amr2638457ejc.33.1686339386253;
        Fri, 09 Jun 2023 12:36:26 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id zo18-20020a170906ff5200b0096ae4451c65sm1658904ejb.157.2023.06.09.12.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 12:36:25 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] soc/tegra: Changes for v6.5-rc1
Date: Fri,  9 Jun 2023 21:36:15 +0200
Message-Id: <20230609193620.2275240-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.5-soc

for you to fetch changes up to c954cd7ad041251d903707c463a2c4d6cc30e5ae:

  soc/tegra: pmc: Use devm_clk_notifier_register() (2023-06-09 16:56:58 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.5-rc1

This adds initial support for identifying the Tegra264 SoC family and
fixes potential issues when reading from the FUSE block. A new software
wake event for the AON cluster is added on Tegra234 and the debugfs
initialization is drastically simplified.

----------------------------------------------------------------
Kartik (1):
      soc/tegra: fuse: Fix Tegra234 fuse size

Stefan Kristiansson (1):
      soc/tegra: fuse: Add support for Tegra264

Thierry Reding (2):
      soc/tegra: pmc: Simplify debugfs initialization
      soc/tegra: pmc: Use devm_clk_notifier_register()

Viswanath L (1):
      soc/tegra: pmc: Add AON SW Wake support for Tegra234

 drivers/soc/tegra/fuse/fuse-tegra30.c  |  2 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c |  3 ++-
 drivers/soc/tegra/pmc.c                | 31 +++++++------------------------
 include/soc/tegra/fuse.h               |  3 ++-
 4 files changed, 12 insertions(+), 27 deletions(-)
