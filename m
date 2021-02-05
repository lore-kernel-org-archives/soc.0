Return-Path: <SRS0=2nFo=HH=linaro.org=manivannan.sadhasivam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6ADC433DB
	for <soc@archiver.kernel.org>; Fri,  5 Feb 2021 05:03:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6053064F4A; Fri,  5 Feb 2021 05:03:53 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3788C64F97
	for <soc@kernel.org>; Fri,  5 Feb 2021 05:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3788C64F97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=manivannan.sadhasivam@linaro.org
Received: by mail-pl1-f180.google.com with SMTP id e9so2968572plh.3
        for <soc@kernel.org>; Thu, 04 Feb 2021 21:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=hhGIihFxwHUwOnBHxZGLH6BOrh84oVSJZWFLcVUVfAk=;
        b=Y2bW//SM7hFeMStucZ2in8+Xy8+G6U0trjDPTadys3eTQlIndRGDv3eyiLoqAkD/sK
         6rWOheMVMdFAT8msJzjNd88u3a7ROyRBPb1fDP0safIXhsD6dJLn1frOfEwKfn018LHU
         XeMsiBYcp9bCiCdon53na1DrFTsgA6jg/0ypO46RAIFIz7eILyGBauQxORqDFg5HVf6K
         8C6MIGk4RkqzeTU58bVdu0+EOMDlMxebvNxr1YPWuerv5KlskvtRU8ZerXQHym4LRv8F
         YnL8pT8a65ScB98vIUyLUsigWn7SQnzI7r/Y9g2uaiFG072p8ug9S/UuCDa+8xiMumVx
         5Vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=hhGIihFxwHUwOnBHxZGLH6BOrh84oVSJZWFLcVUVfAk=;
        b=KkAWMQeVQHFFoJ7a2t3rQRp3h1R6iSYm2Ql37SD3iwX2xP7j3KaMaxkZiEATnaitga
         rHFGYMvX/JLKEMPpkZI5gg77qn5lagVcxvkgx9GkE60yEZkN/XB/YdkWLa5padtUr+3r
         3NoPoJ55YIgXGsXi4mc+Gmp6zHXXeA5vMAOKIX9+aTAfZPqR3jtXJzHgOxRiYnD+O+P6
         gSWX1kQh44g9apdV8BKfuAzBGyXexo/pKP8hV2ozexxHpNhkHJjVPNjY6YZmq4qu3XNd
         IVIn8VIPJOYnAVmlVGc2SOM1cudc1dyMU6LeJtLrT78Ve60zQswuTnrFhKDwIbuCMDmB
         s0nw==
X-Gm-Message-State: AOAM533OjIqMBfGY/M8JnyBSPjTR8nOjV5ZhQtXsg19GzYQ551Jbwmdx
	5RGXB+14YvMIN7Iab3hlEsOMQsp/w2QQ
X-Google-Smtp-Source: ABdhPJx47ypFLvfBXcjWJ83lEBbZCbqhIbDzU1RiRqn2gDmcas4g7YRdQvyzYphlaGmuK/637ZGr1g==
X-Received: by 2002:a17:90a:be10:: with SMTP id a16mr2419744pjs.78.1612501432347;
        Thu, 04 Feb 2021 21:03:52 -0800 (PST)
Received: from thinkpad ([103.66.79.45])
        by smtp.gmail.com with ESMTPSA id b14sm7550562pfi.74.2021.02.04.21.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 21:03:51 -0800 (PST)
Date: Fri, 5 Feb 2021 10:33:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: olof@lixom.net, arnd@arndb.de, afaerber@suse.de,
	linux-actions@lists.infradead.org, thomas.liau@actions-semi.com,
	cristian.ciocaltea@gmail.com
Subject: [GIT,PULL] Actions Semi ARM DT updates for 5.12
Message-ID: <20210205050346.GA7619@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

This PR aims at improving the support for Actions Semi S500 SoC and Roseapplepi
board. The details are in the signed tag as usual.

Thanks,
Mani

---

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/linux-actions.git tags/actions-arm-dt-for-v5.12

for you to fetch changes up to 7b69552264aca925e8550324027e4f10f8bf8c4f:

  arm: dts: owl-s500-roseapplepi: Add I2C pinctrl configuration (2020-12-31 13:05:33 +0530)

----------------------------------------------------------------
Actions Semi ARM DT changes for v5.12:

Updates to the existing S500 ARM SoC. Support has been added for CMU (Clock
Management Unit), Reset controller, DMA, Pinctrl/GPIO, MMC, I2C and SIRQ
(interrupt controller). Since the CMU support is added, the dummy fixed clock
used for the UART controller has been removed for all S500 based boards and
proper UART clock from CMU is used.

Added uSD support and I2C pinctrl configuration for Roseapplepi board based on
S500 SoC. This will make the board boot mainline with a distro from uSD card.
The I2C pinctrl config is added specifically for the PMIC which is currently
under review.

----------------------------------------------------------------
Cristian Ciocaltea (10):
      arm: dts: owl-s500: Add Clock Management Unit
      arm: dts: owl-s500: Set CMU clocks for UARTs
      arm: dts: owl-s500: Add Reset controller
      arm: dts: owl-s500: Add DMA controller
      arm: dts: owl-s500: Add pinctrl & GPIO support
      arm: dts: owl-s500: Add MMC support
      arm: dts: owl-s500: Add I2C support
      arm: dts: owl-s500: Add SIRQ controller
      arm: dts: owl-s500-roseapplepi: Add uSD support
      arm: dts: owl-s500-roseapplepi: Add I2C pinctrl configuration

 arch/arm/boot/dts/owl-s500-cubieboard6.dts     |   7 ---
 arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts |   7 ---
 arch/arm/boot/dts/owl-s500-labrador-base-m.dts |   7 ---
 arch/arm/boot/dts/owl-s500-roseapplepi.dts     |  97 ++++++++++++++++++++++++++++++++++++++---
 arch/arm/boot/dts/owl-s500-sparky.dts          |   7 ---
 arch/arm/boot/dts/owl-s500.dtsi                | 140 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 232 insertions(+), 33 deletions(-)
