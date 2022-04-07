Return-Path: <SRS0=0sZe=UR=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21AAC433EF
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 21:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6BBACC385A8; Thu,  7 Apr 2022 21:57:47 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 952B6C385A0
	for <soc@kernel.org>; Thu,  7 Apr 2022 21:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 952B6C385A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id f23so11953625ybj.7
        for <soc@kernel.org>; Thu, 07 Apr 2022 14:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=+mwTOTKQS7Wp/Xv8f5IrshAbrRV3och300Y3ulOJBWM=;
        b=R337hkr6I8N+7oqeVTXIW4i+OzBetClse+BCPPexfTqqSr5HoopdjBBpg6uO1iY1AT
         e8HUxhjE2WVN6huCanw4h9zcQEv+WHUDSTQSbHQwustA4mdraFtXLj2yDTyojnfh+DSy
         8WysrFc8T0kVtWgkzMKf/U0R7buS+MzO5EG9NmxSWXkTQn4uoi4g6XWhiW5LRhm5pRna
         FZIlUtqbBPGFkwQkbxwpSR43chV94A+XGcOb3aQCnYCsYg0PY82Lh51u7905pccWBm6v
         JPYDB1U99YoVZGkrdsS/r3ReL4dbibwctVa4goLv1csNeJ+6to9RguoqybuftjYV7JHS
         7zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=+mwTOTKQS7Wp/Xv8f5IrshAbrRV3och300Y3ulOJBWM=;
        b=lWfdri8rHMwfyFz4Ye3IvzsTLnwCtJtPKLpYdLV0Pun8zrpKC2WUVfmLQAx+BY8Y62
         gprrhX4f7ktMmCLnWaMlMlLBbzGB+avelBP1Jp76EjdzYaGZayXnwBLGIKhj19TZLOIj
         DQazImc4AOyOdSSzDmgCB09CpxusVSG7CiWLhNRFZGjvENzrEBxS4YMqMVq8W959Npcu
         Vh9PsBaeTbKfExFYFAdfxyxl1GSTZe3xR2KLdA1UjxmltdnKYFIh28z/8LOqova7eMOP
         FYcrUpzsKyyyTy39RsHaj4xDKnB2PkdTzSrzf1PTPtrozl6NMb0zlkU3n9BOZ6TwuyJY
         XOQA==
X-Gm-Message-State: AOAM5305DKtFbXY2IeTGdGjauJX/p+iM6WJw+qIODUZAaydq7jLmEDL8
	P55/MahX7zXx3OvDBYSL4+YlCXhhXEgmvcLHlqJK/Y+UuyvIww==
X-Google-Smtp-Source: ABdhPJwoFJalhB/W2Eu4Rn3tNIE/xlIM7EAlFw6C7umYfRc+CG3YX++OoB6nFWtxGNzfA3kfLr7H3MRPC2CxwR0pzZc=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr11692986ybr.295.1649368665463; Thu, 07
 Apr 2022 14:57:45 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Apr 2022 23:57:34 +0200
Message-ID: <CACRpkdY+_Go4XNzOh+Rvc24QBnUud2k-S7VQuaH5d-j71_dJog@mail.gmail.com>
Subject: [GIT PULL] Ux500 defconfig updates for v5.18
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

please pull in these Ux500/U8500 defconfig updates for v5.18.

Yours,
Linus Walleij

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-defconfig-soc-v5.18

for you to fetch changes up to 62f6424514991ce6104f6a8becfd58e986f993b6:

  ARM: config: u8500: Re-enable AB8500 battery charging (2022-04-06
14:41:41 +0200)

----------------------------------------------------------------
Defconfig updates for kernel v5.18:

- Refresh defconfig with new and moved options
- Add some new hardware drivers
- Activate battery charging

----------------------------------------------------------------
Linus Walleij (3):
      ARM: config: Refresh U8500 defconfig
      ARM: config: u8500: Add some common hardware
      ARM: config: u8500: Re-enable AB8500 battery charging

 arch/arm/configs/u8500_defconfig | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)
