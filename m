Return-Path: <SRS0=cfCK=XN=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFE0C43334
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 18:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28BFDC341C7; Fri,  8 Jul 2022 18:56:27 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56EF7C385A5;
	Fri,  8 Jul 2022 18:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 56EF7C385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id x91so341773ede.1;
        Fri, 08 Jul 2022 11:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M3EJ6Gj4vVE4K1X+nxefRXGxbrM3uP5m6QimMo2Ol5c=;
        b=M05Kls/ZSYTqihjh74UetxGWN0qyA4jL08gG1oYhLxFsUWIzOqfYUZQ5i5quYBQdBF
         c9jIuwvPra5XiEMj0U6oIFIHRfHmcNbw62Gg0xayUqkCrLXWTaXuziRbWJBpW22psFzK
         l+9IDRqMp268qXsIqT3vP1bp3NJmYWVDArEHRIjsawXB48IpnpLCd7THhijz/aiOW+9C
         leEsBEGACgx6V7ViIljmKrqZyuXhYfFuqtmGq3XWnMHX64t86UMGMn6PVzOw/dA5Uu1W
         rAcG5UHASrK0aa/dqMBaCbShqVxnuUaNeY2hzHd7IjIeLDWuAuUyH1bAuDGEhNsJ8Xxg
         Gfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M3EJ6Gj4vVE4K1X+nxefRXGxbrM3uP5m6QimMo2Ol5c=;
        b=02pawXg+we8vSgbN+xrM+zTsh8WDpIJhbQGOMY7Vtox+ImTWS6M6ngOcejXIBP1kyn
         XGdiHku49YC76IzrDJbnoETqUPZp2l6l2yLbRzj51m7ar4O4vtKxcle1K5CwPPW8rdxP
         dWOPQ3riyuc5H6lgUYkzkoFEoUG9xnvUXaB98NN64qWjzaSuMZzAq64s4GYeCLW1lRbI
         6UlFWnoh2dqZd6J4UCLYvzr4T/Gwk3BJlmaf1G0GAitJQpwuCXSPqomZW3bcUIoHm9Wc
         SIpN+41OK6kWisGpSWRgdH2JPxSm3/h7gQ9thU2ZBDc+8tTSbJSS4lKKYwvzOB+8QnJX
         b4aQ==
X-Gm-Message-State: AJIora9cncrA4XLz8wuY/p3ZIpoxL1JQyos0vRS2QT5t0vZc6w9LI+n4
	Bc51NQKzef29fqqfneUMaj8ZKXcsUg0=
X-Google-Smtp-Source: AGRyM1sd37Zllw8SQbn2PN0x+8QLjIIKEpkF+CZiwqpavJ5y3nyVuL1GGFEGnVNM299qJOTG+EJnGw==
X-Received: by 2002:a05:6402:5112:b0:436:c857:7a76 with SMTP id m18-20020a056402511200b00436c8577a76mr6953006edd.263.1657306584153;
        Fri, 08 Jul 2022 11:56:24 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kx9-20020a170907774900b0072aebe7b64asm5417550ejc.222.2022.07.08.11.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 11:56:23 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/7] arm64: tegra: Default configuration updates for v5.20-rc1
Date: Fri,  8 Jul 2022 20:56:08 +0200
Message-Id: <20220708185608.676474-8-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.20-arm64-defconfig

for you to fetch changes up to 28b4dcc8f0108e2c430b63b0325c61ae97d6dc79:

  arm64: defconfig: Build Tegra OPE module (2022-06-08 15:39:04 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v5.20-rc1

Updates the arm64 default configuration to enable the OPE driver as a
module.

----------------------------------------------------------------
Sameer Pujar (1):
      arm64: defconfig: Build Tegra OPE module

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
