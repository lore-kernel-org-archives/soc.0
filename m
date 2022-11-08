Return-Path: <SRS0=1a0t=3I=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9943DC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Nov 2022 20:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57AEBC433C1; Tue,  8 Nov 2022 20:53:42 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25B52C433D6
	for <soc@kernel.org>; Tue,  8 Nov 2022 20:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25B52C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id b2so41731712eja.6
        for <soc@kernel.org>; Tue, 08 Nov 2022 12:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IkxXMHbI69tMoWnDejGPDCYdN94cxH/gbTnuYtuKihg=;
        b=HtlQYgBtBDmnaoA1+cAX1ZdNVfk78vV2araikox8FsUXvnv/SAcHYVF9HiB2vzVmlY
         PVsQK1D5ayyUv1qgFhAOnmXtN35yGCNEINNEmSs6sL1tl/uT/SPwhD9mXZqsELw0+X/i
         4twQaYXvAhAuRzk6D6pe0yWolLjAqD7orl+OFjTV+amgq6g4cfkh8K0np9mrEGBCNQkJ
         YhW703aTPJjR+J+hWcrHnIXyEUfK/OY5HUrvhTSjcaP0A8QvOMukmt7AvdxjaMFyQYDy
         VOYXp5i1CWL2kxxOHS7UfdiF0tZmmE0iT6+oE/Z+net1NzXYWhnqTZrHh5Uay2+MkBU3
         7aLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IkxXMHbI69tMoWnDejGPDCYdN94cxH/gbTnuYtuKihg=;
        b=vcIcDYdXBOF6W+YTCx0+uiVUm05Rcf0m+wHaL3Jn0/aPOLa7pA3TPgQ2xGvu8qv4AP
         +OrfS8mblrnri25PIBnznch/or/8tukc9Jbz15OP5kyYE2PUxE6RA0narrKeiWN4J2ac
         Ur2LRMKXUOGTLmdLd2IZ5fYNIIPmksHeIEixkQYNlHjB+AeB1Kxj4JSW4MulCZY/EBmD
         klrw1FOasLiu7p6nz3S2bb46aB2R8koeEMTYc5/OuGEvgPkgmlh+ii+F5Q7Bu2d1oxUG
         VFg6J48qQt4nkpgWZjBbFr7L3psMzutToBmfxKIC7huITY4Yw3H0uIm10/jRTY+JM+tO
         vLgA==
X-Gm-Message-State: ANoB5pkodqa16b9ibR0q4k6R2oogr73amfYbCD/08YlYUEz232AouX+p
	5LM51ywIjA3lwrJ9VkeCa11I4NiuSBIQu/DS14NyIgSsuDv/2g==
X-Google-Smtp-Source: AA0mqf6ciTBIp/r4WPh07MM5s2f45F/YWgA9/6vtLXQahl6BCttvpb6LLdYzBnzL3YnVFnz+PIJccOv/qcHld8elTu0=
X-Received: by 2002:a17:906:6acc:b0:7ae:658c:ee45 with SMTP id
 q12-20020a1709066acc00b007ae658cee45mr12813317ejs.190.1667940819382; Tue, 08
 Nov 2022 12:53:39 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 21:53:28 +0100
Message-ID: <CACRpkdaPDbJKUzZHsS2POVUQEjYi+6bjU6cvbg4ox=SKPXG2ng@mail.gmail.com>
Subject: [GIT PULL] Ux500 core changes for v6.2
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

here are a few Ux500 core patches for v6.2. Please pull
them in as appropriate. Details in the signed tag.

Yours,
Linus Walleij

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-soc-v6.2

for you to fetch changes up to 2f89fbc94bce85b4253358bf6554d9d6fc36825f:

  ARM: ux500: Drop unused register file (2022-11-08 21:18:42 +0100)

----------------------------------------------------------------
Ux500 core changes for the v6.2 kernel cycle:

- Spelling error.

- A non-urgent fix to not access IOmem for feeding entropy
  directly, instead copy and use.

- Clean out an old register file.

----------------------------------------------------------------
Jason A. Donenfeld (1):
      ARM: ux500: do not directly dereference __iomem

Linus Walleij (1):
      ARM: ux500: Drop unused register file

wangjianli (1):
      arm/mach-ux500: fix repeated words in comments

 arch/arm/mach-ux500/cpu-db8500.c  |   1 -
 arch/arm/mach-ux500/db8500-regs.h | 195 --------------------------------------
 arch/arm/mach-ux500/platsmp.c     |   2 -
 arch/arm/mach-ux500/pm.c          |   4 +-
 drivers/soc/ux500/ux500-soc-id.c  |  10 +-
 5 files changed, 5 insertions(+), 207 deletions(-)
 delete mode 100644 arch/arm/mach-ux500/db8500-regs.h
