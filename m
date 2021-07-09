Return-Path: <SRS0=lv3s=MB=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083AEC07E99
	for <soc@archiver.kernel.org>; Fri,  9 Jul 2021 14:59:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CFC53613C8; Fri,  9 Jul 2021 14:59:48 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5C8F610E6;
	Fri,  9 Jul 2021 14:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5C8F610E6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-wr1-f50.google.com with SMTP id d2so12603999wrn.0;
        Fri, 09 Jul 2021 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jHuEH6VsYLXBeTed01/PCBU/Wx1MdyeMJ1LOOQ3q82g=;
        b=bkLFGL1Ki2kGuJjjxDQAnSYbGZ3QwNv/xzmqVljJc7TYEuwaiWAkewSqwuUHRVnoJm
         qlF+IuWNiJBnERnSAieKDBdRqrRKpBQZFTPWoQBqZqR9jqGplgJIvjljoerqn2TnwuHq
         L7KW1G1de706S0XGM8RLslnu/3sArdx4VJWyrNhS8dhOKUYkBpQJJLrhifq/g9RD703q
         +edKn9DO7WMauCKhLpOPFhBIFXhRAiakvEXO/7k/bX4LojUmja0US0untDgBdowxOGpW
         o2/8RRuDTUlyn2tbpNOG01sirdzo+Y6UjNbih9NgtWDxFVqfOKFGtJHmg+YcKN7ThPFH
         nDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jHuEH6VsYLXBeTed01/PCBU/Wx1MdyeMJ1LOOQ3q82g=;
        b=J1yUwADAtwdFoFnLHed9dNpVbgeGcnIMqSMXTOFi/ApAIXiZx4WTbxjv8hrSCZFJUV
         O29UAmro/J18eYLcuqFl3SQG0MdaMKTg0GzyPLJf64krM1Bu0f+QWxZ24UnNkmG2pwCj
         jdVjyPrJAAd6VzTbsnQeWuuxR4VVyHQ9YiaNwxp9ts/VxQm+dF4wP+mpRyU9fVF/e3zC
         9Jp/cTHZ9qbtQSaVn1VknsOjw6H8EO/Ll3QOoC6II60J8pqGapbPaSoYcLP93ShY2Hym
         e1ZzSmXnW2ePKiV393jaLgRRZ54JMyN0I6vZZHGKnjlc5fxAmlofW8Tk8oZ6L5EKRgiw
         A+2g==
X-Gm-Message-State: AOAM533XEG0OB0/ExlKeRNyVtH0GW+3wZpq2PrTMdn0dYw4HINe/zZ5d
	EFZlumBYGNkIvKCocx8HTpNRgQSpvS4=
X-Google-Smtp-Source: ABdhPJyE1Zjuu0MGKQaBtvJmvkNkwxiaUJxirymFDhJyeu7I79a7aw1xLbpCLt2jRmKbjc2YGk9obQ==
X-Received: by 2002:a5d:6e81:: with SMTP id k1mr42163312wrz.144.1625842786688;
        Fri, 09 Jul 2021 07:59:46 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y23sm5197490wmi.28.2021.07.09.07.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:59:45 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v5.14-rc1
Date: Fri,  9 Jul 2021 17:02:20 +0200
Message-Id: <20210709150220.2543875-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit c7289b1c8a4e10bbbdb7097a71a90652beb767a1:

  arm64: tegra: Enable SMMU support on Tegra194 (2021-06-11 13:33:46 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-arm64-dt-fixes

for you to fetch changes up to c667dcd4dfcd515ad2c9b3953a33d742985a0b5e:

  arm64: tegra: Enable SMMU support for USB on Tegra194 (2021-07-09 16:50:44 +0200)

This is based on the main ARM64 device tree changes pull request that I
sent out a couple of weeks ago. It'd be great to get this into v5.14-rc1
or shortly after.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v5.14-rc1

This contains two late fixes for Tegra194 device tree files to restore
USB and audio functionality after enabling system-wide IOMMU support.

----------------------------------------------------------------
Thierry Reding (2):
      arm64: tegra: Enable audio IOMMU support on Tegra194
      arm64: tegra: Enable SMMU support for USB on Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)
