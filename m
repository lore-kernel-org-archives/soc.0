Return-Path: <SRS0=MaXK=62=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04262C6FA8E
	for <soc@archiver.kernel.org>; Thu,  2 Mar 2023 09:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C11FDC4339C; Thu,  2 Mar 2023 09:42:17 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D68B4C433D2;
	Thu,  2 Mar 2023 09:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D68B4C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id s26so64948286edw.11;
        Thu, 02 Mar 2023 01:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677750135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUKFBQwbI35+6QIiUGpOXYPYS1+8YomYb5Pups8YD7k=;
        b=KoECfQB1+QnD+tqwt6GnvSuCZVPYSrE9MNDRGpn1+g2ENCsqYCSmzJ26NgGqs29JyN
         b9FJXKKFuQApz+DXPS/esR/UmBLgi8mWhtqjABwKCNQkQMK77gPmcJpUIj0se2B0G+qB
         zfwCLaOzryKzADAvbTVnUjOf8C+V42KMOfZIyMzyd1vF5xJB4NGyf1evppArr3ODLKss
         +4O07YlE5MathjSfz80+z6Ahc3XUTMsPhL8MmMJ55010PbXokLxX76x4PF/07Y0zh8WB
         CsxMQFmxaGWqlrI5yIUZbZrLmDr9+OLKVpUq2MeOoBOv+vSo6hTjZVpKdH6JZrnWYKwK
         tm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUKFBQwbI35+6QIiUGpOXYPYS1+8YomYb5Pups8YD7k=;
        b=P+ocovUjk1XZJSz6NzLgMKXR3J9O2QKCQw2fKElSIv3tFDN9ZchpG7wsG74185ODXW
         SXezUiJKLAdxD36w0BxJ3msvFwOFKoi+RbTVgV6fvv4srefTCMI+5wvwuos+Tlky13z9
         FLfsnf9LYuhJJmGgmxcHKRT7Kr47ayezNySzi2cwIvZoFyqSea0JlnzmiTR1Ic1+Yzei
         YJc5fTOPp/rjh0tGKpxgIf2GAVEBqQj/7vuLq/Cu5Wjy7+QRKbrBticEgmmG2kFQ5vuL
         7ROvMQ5qRH3dSNC9tkXQOw5KDWivvrZCW6ZMqIyA64nipi80mZR+Y4HNb+1jku7Unrnm
         UelQ==
X-Gm-Message-State: AO0yUKWSDfb/fi4y37qtaghrUQ0NHHQ9lRqb3jgDZ++CyRTsuFXt3DLB
	JnmnD2cjvGSBkCuCCR1fzfgeJ5t5u6s=
X-Google-Smtp-Source: AK7set9011Q5GjOA4Lg+Mrnet09JcKmYXPYVDCnUgkSD1xSDRpj75bo1Z5TKkwXMwvXN/d/kNiy2xA==
X-Received: by 2002:aa7:c903:0:b0:4bc:403f:a7b3 with SMTP id b3-20020aa7c903000000b004bc403fa7b3mr1378979edt.3.1677750134750;
        Thu, 02 Mar 2023 01:42:14 -0800 (PST)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m3-20020a50d7c3000000b004accf3a63cbsm6609698edj.68.2023.03.02.01.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:42:14 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v6.3-rc1
Date: Thu,  2 Mar 2023 10:42:13 +0100
Message-Id: <20230302094213.3874449-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 682e1c498ae793ad90587171c93c1f7ec87aa208:

  arm64: tegra: Drop I2C iommus and dma-coherent properties (2023-01-27 17:08:58 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.3-arm64-dt-fixes

for you to fetch changes up to 4bb54c2ce48ffb3a06133ac0fb4086f7b48d9109:

  arm64: tegra: Bump CBB ranges property on Tegra194 and Tegra234 (2023-03-02 10:35:11 +0100)

This single fix is also available in patchwork if you prefer to pick
this up as a standalone patch:

	http://patchwork.ozlabs.org/project/linux-tegra/patch/20230214140549.3340395-1-thierry.reding@gmail.com/

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v6.3-rc1

This contains a fix for the CBB bus' ranges property on Tegra194 and
Tegra234 that restores proper translation of PCI addresses.

----------------------------------------------------------------
Thierry Reding (1):
      arm64: tegra: Bump CBB ranges property on Tegra194 and Tegra234

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
