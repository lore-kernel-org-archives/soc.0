Return-Path: <SRS0=fljr=5Y=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4329C54EAA
	for <soc@archiver.kernel.org>; Fri, 27 Jan 2023 16:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A599AC4339E; Fri, 27 Jan 2023 16:37:23 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A98F7C433D2;
	Fri, 27 Jan 2023 16:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A98F7C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id kt14so15286920ejc.3;
        Fri, 27 Jan 2023 08:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tnj0zpczhmcTzZWovcf4QbYmqlrEFwZcGfqBRwRNeFw=;
        b=MsnWXElr9sfADHXguuJLqPy9I6bjt/Kr4bqk86PguwNi4DxyXKT7C7gDREJzKHbpAu
         g1yOTQTdWPM2L6xsNlBz1zO5/YYSIU3/pzl/O1KOOvYzbQE8w/LiXydrua4F1tZV16iF
         fYISvdYQ6Z0dP7m9mzXf7hCEPfYbFSfLuKyyiOQIh3ADJiysN+t7k4EAQgsrDLvC6c/6
         mQtpTr7Y9mbWGrYllwG2QhqUwVGfMGeNNyNxw2Fgc/efXuRydjrs5CnyYOCeAEmqB1QU
         cBIaY1Xk2BK1847ZLPUlzleQ9Y7sCIiciOpLLOLo4qE7YYWY5nufOJouT19+jxqImxLE
         AvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnj0zpczhmcTzZWovcf4QbYmqlrEFwZcGfqBRwRNeFw=;
        b=odpmiZNoEblgFrMu+iSIctefOheJzgr0luLrB8uJzJWBrqJHsZ9sfAvS/nKmxf2FDV
         YR+c3ZAH67f0g6dWn7DAZnp+6CIFCO7VvDksGFkEKvcS0rgp6kBHaBqXqV5QkLCoRqJa
         oG2+77A2jYO1kIRJGE5JGS5nxCTIMu+B5+9y0pYUE/PeSxZBlvkhxJYc7dJe+mv4mLSJ
         Xj7gHUGjRbadYntUj9lKAUGoRH7gHrP6mRXWe7Rm0b1ep+pOKUlDYjEGMiy5RM2LWW4v
         h1JEq9EOdXY3hprsDOd7OREDOpEk9kJIxt2+ehilVCXCmRvKMQmMkA2dtkiT+ifv/8qM
         pVOQ==
X-Gm-Message-State: AO0yUKV/7anrgndNYQNSUaNaKpDQreDtM+yddC+CKSu0ZqWV1Ip/y87V
	G1FIsNzfD0REup3SltKBDvU0AeC2o90=
X-Google-Smtp-Source: AK7set9d6Sm1TaXTwdPVtDvQZkK7R7uhAqkPUcAYV15CuCFkVluZakTYNf9onU9UJTQ4F2qHSKDe7A==
X-Received: by 2002:a17:907:3e90:b0:87b:dac5:eb86 with SMTP id hs16-20020a1709073e9000b0087bdac5eb86mr3012143ejc.22.1674837440614;
        Fri, 27 Jan 2023 08:37:20 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id gv28-20020a1709072bdc00b0078d22b0bcf2sm2512937ejc.168.2023.01.27.08.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:37:20 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/3] dt-bindings: Changes for v6.3-rc1
Date: Fri, 27 Jan 2023 17:37:17 +0100
Message-Id: <20230127163719.460954-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.3-dt-bindings

for you to fetch changes up to 6427569ff14766aea855afca782424918668536b:

  dt-bindings: tegra: Allow #{address,size}-cells = <2> (2023-01-27 17:21:25 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.3-rc1

Device tree files for 64-bit ARM Tegra SoCs have recently had to bump
the #address-cells and #size-cells to 2 in order to support bus address
translations across the entire device tree hierarchy. Explicitly allow
this in DT schemas to prevent validation errors.

----------------------------------------------------------------
Thierry Reding (1):
      dt-bindings: tegra: Allow #{address,size}-cells = <2>

 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml   | 4 ++--
 .../devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml    | 4 ++--
 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml     | 4 ++--
 Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml      | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)
