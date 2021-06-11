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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18477C48BD1
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 16:43:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E5B2E613D0; Fri, 11 Jun 2021 16:43:04 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBBD461357;
	Fri, 11 Jun 2021 16:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBBD461357
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-wr1-f47.google.com with SMTP id y7so6745825wrh.7;
        Fri, 11 Jun 2021 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yl+waXKY/FzeWxugRNcrGJPBmosE4XJtLVOq9NfoCdA=;
        b=HQ8jsuewe8HfyaOnNtZa8C5X/GJcV53S3VkxFu9yC8g9zTX4sEGzIyxPhFj+cPab3V
         Bc1Uy4NJVc/PK9rnWKkbAM8WwrY+v5Ka491sb1RZNjBm5xejxmK7Vl/0x7jNvQDogSDw
         HsjS1IKSBaKvR8YU3G8EJkPWZ/yNzuF4ckpDQbTl69fhWnZVpqTU1ae7022Cg0IFU/ed
         I2478B4vbcuO5l1mIB3jOqscm4O8u03IounH/FhRTjeeqhH8YYunXY8wyYPQSeCzETK9
         VCOodVoz5I7gq/43RNE1bJtFytMWu+twO9WRXgo2PpNjXP0GvLVK3Rbk/Ly942RzS2iD
         eDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yl+waXKY/FzeWxugRNcrGJPBmosE4XJtLVOq9NfoCdA=;
        b=TcemTjmM1MxX6p4pvSuJrqr79ZuvbPMCfp0gNbowIYJ8YE8yGw4mJ1UkVGnzhr4J9K
         1LL6EjyOe3V3ph0qGrOpgKgJTN+xixGUcFkLmSxDZjAh+cIIzx8C5G7leVqGyL1JBl1B
         NHMAEASkhuL3pQ4jBasBw18TGgjZqoK3RThDroj/qyTl36VcVxWSSc9d+zdus5kiAnHE
         u3APmiFOjgIy3ezhyHksFRTUiAb+mpIP6kmxl9jdUJBHTCNplTF3eddim7XEsBKBW2xy
         szXhXCpmuDMo3/41kKggZZK617WNYrKlTYV/prukR795irvqC4RL/lbn684lbMPyqiY/
         yBaQ==
X-Gm-Message-State: AOAM531yp/d9a1AkrSz2Sxd9w9LIzwgdErBdmkWIa8zNjwdu7rxnHLj1
	sFcS36CHttmuUXIkdWI8scXXEmQIU7k=
X-Google-Smtp-Source: ABdhPJwpr82yBKai2lqfab3eosWyqwmbA9K9CMq+OT5UOv5auo2zvPeZCX49wZ5z9RhN8vfyvCX2MA==
X-Received: by 2002:a5d:5987:: with SMTP id n7mr5118102wri.293.1623429782907;
        Fri, 11 Jun 2021 09:43:02 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r4sm8163109wre.84.2021.06.11.09.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:43:01 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] dt-bindings: Changes for v5.14-rc1
Date: Fri, 11 Jun 2021 18:44:32 +0200
Message-Id: <20210611164437.3568059-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-dt-bindings

for you to fetch changes up to 5f459cb0d67d6df6f74eac253ea10de9e9986812:

  dt-bindings: soc: tegra-pmc: Document core power domain (2021-06-01 13:45:01 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.14-rc1

This contains a conversion of the Tegra clock and reset controller
device tree bindings to the new json-schema format and adds the core
power domain to the PMC device tree bindings.

----------------------------------------------------------------
Dmitry Osipenko (2):
      dt-bindings: clock: tegra: Convert to schema
      dt-bindings: soc: tegra-pmc: Document core power domain

 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     |  35 +++++++
 .../bindings/clock/nvidia,tegra114-car.txt         |  63 -----------
 .../bindings/clock/nvidia,tegra124-car.txt         | 107 -------------------
 .../bindings/clock/nvidia,tegra124-car.yaml        | 115 +++++++++++++++++++++
 .../bindings/clock/nvidia,tegra20-car.txt          |  63 -----------
 .../bindings/clock/nvidia,tegra20-car.yaml         |  69 +++++++++++++
 .../bindings/clock/nvidia,tegra210-car.txt         |  56 ----------
 .../bindings/clock/nvidia,tegra30-car.txt          |  63 -----------
 8 files changed, 219 insertions(+), 352 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
