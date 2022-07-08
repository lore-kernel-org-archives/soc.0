Return-Path: <SRS0=cfCK=XN=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE929CCA47B
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 18:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95AA7C341CB; Fri,  8 Jul 2022 18:56:20 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6ACAC341CD;
	Fri,  8 Jul 2022 18:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6ACAC341CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id x10so20546383edd.13;
        Fri, 08 Jul 2022 11:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dGzh3xxv9eIKKsR5DrTrjHmPQwa7yROT9Jik8yh6Oio=;
        b=ltNzYg2lnwhqnpCr4W8Lq4YNpjtmVBforOx6ZlZiMMmbKbftsdt6IBPVeyGymggBcH
         Phfkt/sURuhOPKAQcH1agBHdJ/QLfL5FjNgQLTkj3rTo46dwF/tuDKikqh3y9iGgmOH+
         IafqKcnq6aPvFVlkGBWgwniGls7b3a9KNquOv1X23K33gQiLzGV6IQBRxGEWjvbqk8Wb
         It7FEid1Kh3w1cOHdaE+adyo9VRURcqmYxOOY/IglTSk7oAqKljVKpaaHDEZ9eSmc7ON
         mRxp6VlULkNOW2NQZf+v0xvBle0jKXeptTfw8xt19RDqy/hzyiRMX3yrrbjcz8XzSgBI
         fE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dGzh3xxv9eIKKsR5DrTrjHmPQwa7yROT9Jik8yh6Oio=;
        b=Qe0dDkxA7TIY8D0rHTfrIH1Jtt+4LxWTORZqBaxl1Cn/cHsyVyc0pk6rzAtJqd6yu/
         2guGGE8t1yYaGtZcz6lxE1scXyAYKLtVXElTjgxVKZx2sx9nblL2ReBb0xX7p6oWP4Y6
         cv+I7f37sWc4NyT0FVA2Hw/9rFHI3cTWxdbViyKtsmVVLGZFIMWfRlP8vcn8fbA062Bs
         CrsWOHkqG8WSWjBWtK1w9YcTjKy3AWjxH7Q8eA05l3OexFAv+DW3Jns5RkRFD4NC6nhg
         VuW0Ef3OHLiJi8V5BnNsiI2dAL1q5OStAK6c/rhWbR0NCTL2/Sx3IEKJpIEm1o6IEJCl
         SjFA==
X-Gm-Message-State: AJIora9/HZe/rI/h95vDBXZvQ2nSE9h0hbyMgCqUIM+hdNpXML7SFP2q
	KfcPPx/5R+AZsqVo0IH95EQnt92I8HI=
X-Google-Smtp-Source: AGRyM1uAdivH2IpbsFx1x1So9O4Gex8cwyIsLXicnSZK6fMruqs4t50zDdJGAFbEnyGzAd1qYz/t2Q==
X-Received: by 2002:aa7:db50:0:b0:43a:6319:e2bc with SMTP id n16-20020aa7db50000000b0043a6319e2bcmr6714193edt.237.1657306577786;
        Fri, 08 Jul 2022 11:56:17 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id c10-20020a17090618aa00b0072b145124f4sm2268358ejf.155.2022.07.08.11.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 11:56:17 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/7] dt-bindings: Changes for v5.20-rc1
Date: Fri,  8 Jul 2022 20:56:04 +0200
Message-Id: <20220708185608.676474-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708185608.676474-1-thierry.reding@gmail.com>
References: <20220708185608.676474-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.20-dt-bindings

for you to fetch changes up to 015a166368d72e3bd22368aa9fc793db953ec9c4:

  dt-bindings: tegra-ccplex-cluster: Remove status from required properties (2022-07-08 16:50:30 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.20-rc1

These changes add clock, reset, memory client and power domain
definitions for various devices found on Tegra234 along with a few
device tree bindings for new hardware.

----------------------------------------------------------------
Akhil R (1):
      dt-bindings: Add headers for Tegra234 GPCDMA

Kartik (1):
      dt-bindings: timer: Add Tegra186 & Tegra234 Timer

Mikko Perttunen (1):
      dt-bindings: Add headers for Host1x and VIC on Tegra234

Sumit Gupta (3):
      dt-bindings: arm: tegra: Add NVIDIA Tegra194 CBB 1.0 binding
      dt-bindings: arm: tegra: Add NVIDIA Tegra194 AXI2APB binding
      dt-bindings: arm: tegra: Add NVIDIA Tegra234 CBB 2.0 binding

Thierry Reding (4):
      dt-bindings: power: Add Tegra234 MGBE power domains
      dt-bindings: Add Tegra234 MGBE clocks and resets
      dt-bindings: memory: Add Tegra234 MGBE memory clients
      dt-bindings: tegra-ccplex-cluster: Remove status from required properties

 .../arm/tegra/nvidia,tegra-ccplex-cluster.yaml     |   1 -
 .../arm/tegra/nvidia,tegra194-axi2apb.yaml         |  40 ++++++++
 .../bindings/arm/tegra/nvidia,tegra194-cbb.yaml    |  97 ++++++++++++++++++
 .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml    |  74 ++++++++++++++
 .../bindings/timer/nvidia,tegra186-timer.yaml      | 109 +++++++++++++++++++++
 include/dt-bindings/clock/tegra234-clock.h         | 105 ++++++++++++++++++++
 include/dt-bindings/memory/tegra234-mc.h           |  26 +++++
 include/dt-bindings/power/tegra234-powergate.h     |   2 +
 include/dt-bindings/reset/tegra234-reset.h         |  10 ++
 9 files changed, 463 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-axi2apb.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-cbb.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra186-timer.yaml
