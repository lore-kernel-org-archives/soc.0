Return-Path: <SRS0=d2Xh=TI=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0D5C433FE
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 16:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD483C340E7; Fri, 25 Feb 2022 16:47:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19ED9C340F1;
	Fri, 25 Feb 2022 16:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 19ED9C340F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id d28so5408271wra.4;
        Fri, 25 Feb 2022 08:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sEAbzHBtsMRbbB0Qh6txLc9CyFxKn7iPshhwUtVfgHQ=;
        b=JDA4ZNE+ShzjxEoT7HCdrGSDHjmI4W53S9kDi82hQHtD1TB+0VeeJNszlJplwkiaLm
         XaAnydo8W5AfInN8JidJLp24J45DPfRObUUNFtPKXZAd9HTIcXra5wL/+MtDk+9DOdXC
         H36Gp4ELLLsPe2Fhaq/iK63MVgiqbmEeFNoR1YIWkAhcJ9zQ40gh/1MsCydWMzCpYkB3
         FqJNbYkoIrB6dfmRDqVFXpoHJy5ff3kvfnduw/LU5uev+BnXKmXWY1hBoBV8NxQnlgmR
         YsFBsMtxJ1KhZ7Rgr5SZBg9ODWRodMjbHfGGs8kuUOQOrfwPNaTjdtA5AkKAjmrnYyED
         NIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sEAbzHBtsMRbbB0Qh6txLc9CyFxKn7iPshhwUtVfgHQ=;
        b=ezvmKhg/ao3EZ0CwkVccMrfcU/oUpx0AqOdO+zEz7XEI0UtQ1bONlsA3fy1pKymzYW
         mhT3k22YAOnneRRMknLwG60jMyynkiXQtHy783XOm5ZvswCOJYb6LgKv9AXq4TVUnVjo
         yD6PeGfGbB2dn9VA4j8q3dK/hqDe10XyJbt2DPx2kkKncVD8f1JyQh/fMttv5fy4EpMl
         4gJXzXDaZ0SZ1EGT2qUWgg7BHgv9oN6bLWzHRxeP7IoWEr6jot2PtJtbqKbGwtNHGgiS
         a4VmPdGB7yrx7gmV5awgilmZt/XxcZ+2rwM8nVFU/6a/JIlj2l1DziAjjNWwPzwFyvGI
         SZMg==
X-Gm-Message-State: AOAM532IH1SZ/37vmdpFZmJt0xPd0LFEB0OHL2ZAhxQ/O9vz/fEBI6qr
	CIAl0++n4PBdo84syGqP1+GmSRVCqS0=
X-Google-Smtp-Source: ABdhPJwriQC0+MVdvf+aMvzIUfh6lPOimFqwgYYwA+ZqNrems5vinnQzgGzPvup8iSKetAwW57IoQg==
X-Received: by 2002:adf:9d84:0:b0:1ed:f546:bd8b with SMTP id p4-20020adf9d84000000b001edf546bd8bmr6442275wre.375.1645807668017;
        Fri, 25 Feb 2022 08:47:48 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f10-20020a05600c154a00b0037bbbc15ca7sm11923744wmg.36.2022.02.25.08.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 08:47:47 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] dt-bindings: Changes for v5.18-rc1
Date: Fri, 25 Feb 2022 17:47:38 +0100
Message-Id: <20220225164741.1064416-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225164741.1064416-1-thierry.reding@gmail.com>
References: <20220225164741.1064416-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.18-dt-bindings

for you to fetch changes up to a4ad66da3fccebdcbd53d55c035d5851b73f8bcb:

  dt-bindings: memory: Add Tegra234 PCIe memory (2022-02-24 20:00:25 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.18-rc1

This contains additions to various DT bindings includes (such as clocks,
resets, power domains, memory controller clients and SMMU stream IDs)
for Tegra234.

----------------------------------------------------------------
Akhil R (2):
      dt-bindings: Add headers for Tegra234 I2C
      dt-bindings: Add headers for Tegra234 PWM

Mohan Kumar (2):
      dt-bindings: Add HDA support for Tegra234
      dt-bindings: Document Tegra234 HDA support

Sameer Pujar (1):
      dt-bindings: Add Tegra234 APE support

Vidya Sagar (3):
      dt-bindings: Add Tegra234 PCIe clocks and resets
      dt-bindings: power: Add Tegra234 PCIe power domains
      dt-bindings: memory: Add Tegra234 PCIe memory

 .../bindings/sound/nvidia,tegra30-hda.yaml         |   3 +
 include/dt-bindings/clock/tegra234-clock.h         | 135 ++++++++++++++++++++-
 include/dt-bindings/memory/tegra234-mc.h           |  75 ++++++++++++
 include/dt-bindings/power/tegra234-powergate.h     |  22 ++++
 include/dt-bindings/reset/tegra234-reset.h         |  45 ++++++-
 5 files changed, 277 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/power/tegra234-powergate.h
