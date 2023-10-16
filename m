Return-Path: <SRS0=8Y9D=F6=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD9ECDB47E
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 01:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C15A4C433C9; Mon, 16 Oct 2023 01:48:38 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0014EC433C7
	for <soc@kernel.org>; Mon, 16 Oct 2023 01:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0014EC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9a6190af24aso655221066b.0
        for <soc@kernel.org>; Sun, 15 Oct 2023 18:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1697420916; x=1698025716; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MaAz3IyOUXaHfkCb9M3TM3RU1HBndDh170iebIaArlA=;
        b=UkK7qpfxuLfHf+agL61kWOTblMLmb62/rE89DlTVeifEqu8N5Exetn/SURRDYmEtrU
         0PJUO/yoMH0moa+QE+B7Am/I/OQvpJa+FUxWPC3qUFNswsgDL81EqaIMGrkCEM9VfG4t
         wWEH640ff1iizlSY8sZx54pFZnyfd/LDxbzSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697420916; x=1698025716;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MaAz3IyOUXaHfkCb9M3TM3RU1HBndDh170iebIaArlA=;
        b=XsS6ej+9u61PfgApZ7FX+uQsxTrMy054nzGTx2aqs3Seyu3HBjhrfqohHhu4vMW2er
         Wq7+x2LnVMvtnVMefgZShmiGwH1njDakDEiNNlD7fLsI8cDFcEusP0F6fr3TzjAgD+EQ
         u7PWbHLP0SpZhI11vKCK89BUJ31WtwXZE1cjz6ukDfrPo9cODdumuMAXaRUz+QLmnt9B
         jX0CUnxAXksmwn7B57VrU8VBrK5KDB878MYBa5/3Wf7yLxp0048gyRmZXuFA/Q8HkIYE
         h+HNKP146PxfxIs2JGi1nSteC8k8DSmgkjDmAVc/R7tdhvcWTvydnHkC0vONaSUBKSY/
         ok9A==
X-Gm-Message-State: AOJu0Yw6OupKEJq75+TFX0AnEHsOzFcWbhBPfvh4MMRSHscrCNW/3KdA
	zEjtSFJbEk7Df2Nb12HWpscjOm4Nz6OfG0fzyZbM1uEEPlk=
X-Google-Smtp-Source: AGHT+IHEGjJacXRMU1XLaZB2mREtkfdGJtVOmgfTvoTxAq6OGMOerGwL0+89Rjxow8S2w/zOEOF1mMDJx/Mod++P2KI=
X-Received: by 2002:a17:906:99c2:b0:9be:7b67:1674 with SMTP id
 s2-20020a17090699c200b009be7b671674mr5282372ejn.3.1697420915880; Sun, 15 Oct
 2023 18:48:35 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Oct 2023 12:18:24 +1030
Message-ID: <CACPK8XezpL-4bx0S-9t999_qde5Hik9BnuUZHcnmDHTd0KWBLA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: defconfig changes for 6.7
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello soc maintainers,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.7-defconfig

for you to fetch changes up to f1538805cf9da7a1be38c78690a0d3809e330acd:

  ARM: config: aspeed: Remove FIRMWARE_MEMMAP (2023-10-13 14:56:11 +1030)

----------------------------------------------------------------
ASPEED defconfig updates for 6.7

 * Enable SMPro and FSI drivers, the BMC to host interfaces for Ampere
   and IBM's server processors
 * Enable IPMI SSIF, the smbus transport for IPMI
 * Disable FIRMWARE_MEMMAP, an x86 only thing

----------------------------------------------------------------
Joel Stanley (4):
      ARM: config: aspeed: Add new FSI drivers
      ARM: config: aspeed: Add Ampere SMPro drivers
      ARM: config: aspeed_g5: Enable SSIF BMC driver
      ARM: config: aspeed: Remove FIRMWARE_MEMMAP

 arch/arm/configs/aspeed_g4_defconfig | 1 -
 arch/arm/configs/aspeed_g5_defconfig | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)
