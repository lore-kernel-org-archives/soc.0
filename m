Return-Path: <SRS0=I1vS=LG=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA505C48BE5
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 17:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 96A8661374; Sat, 12 Jun 2021 17:40:11 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D50661156
	for <soc@kernel.org>; Sat, 12 Jun 2021 17:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D50661156
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qv1-f44.google.com with SMTP id l3so11254591qvl.0
        for <soc@kernel.org>; Sat, 12 Jun 2021 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=792MN8Q01TsEjQvOuKUTJLcam45aGsdx9B+TJ/7s/WY=;
        b=Kill2/I0AYROyL7hXkgFZNPRf4ZnD0HhJM1NwjBe6GbFys+CQo9iD34/j3KokskJ9+
         GSYMIEy0plvw1gFwNOJfneSDNoaTHcfd8nU5RBG9No8mVP6+X7QI6JMo23rqz9ALJOzT
         YCqMdQlEzAoLwv8GkCpDmZdgABOoy7KhK405c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=792MN8Q01TsEjQvOuKUTJLcam45aGsdx9B+TJ/7s/WY=;
        b=rDp8lpMEIyl+tPGZWke5DvHpYAox5HHi+hsvgpZDcxHqe6mWC/BMWbPGYT3MSTmhZB
         gg5K6HA7mGY4EqWtv97vZFpvvLy0YB+5TJzPa0x0dxlRt1QGhw06yXxzAwowCsQfDl4G
         kqbJmmZrFSkYSKYtcnhabpHyPjagEUTMEcrGQsH42BgeNYd0xyLy+Y0H/SgtUbIvnTc3
         smkIR3g31a2cOnY8Poxq5biJ2uyiDkCE3y6FkvTbvHYSfhZAyQSHYBfAIJw14pOknzis
         Qizvr5B/DwBe8BnApP2R4rw5dkoFgfsnMBJUC2YKlrtz5yXVsx//PgcBLvO+QoHC9hD2
         CEKg==
X-Gm-Message-State: AOAM531RNNB1kQPoD3ydYQtHYUvH+utRJtAxC48Y/tOmUrjsoHPNqLlm
	qT+BnYVO2oigr3oo+ynnRixuYOTEHDeblOYdmfPalg==
X-Google-Smtp-Source: ABdhPJzsg8UxUaXch78d+uWHZZjCwPid4FgFs5BfE2DdGpneuGxgjKvCYQq8yl7I7K8wXeWtrlBbC2iz9MvFUV2O5qk=
X-Received: by 2002:a0c:f0c7:: with SMTP id d7mr10622178qvl.45.1623519610207;
 Sat, 12 Jun 2021 10:40:10 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Palmer <daniel@0x0f.com>
Date: Sun, 13 Jun 2021 02:39:59 +0900
Message-ID: <CAFr9PXnBb7OmOAMumDodC+0usWqRT-RXwC+YUHZ2Y43Xe_uTQQ@mail.gmail.com>
Subject: [GIT PULL] ARM: mstar for v5.14 v2
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Romain Perier <romain.perier@gmail.com>, 
	Mohammed Billoo <mohammed.billoo@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd, Olof,

Here is a fixed version of the PR with my s-o-b for Romain's patch.

Content is as before:

- Romain has stepped up to clean up some of the ~300 patch backlog for
MStar and he added support for earlyprintk in the process.
- In an effort to do things properly I've moved work on the MStar
stuff from my personal github account to one for this project. So
people can find it I've added a link in MAINTAINERS.

The following changes since commit 614124bea77e452aa6df7a8714e8bc820b489922:

 Linux 5.13-rc5 (2021-06-06 15:47:27 -0700)

are available in the Git repository at:

 https://github.com/linux-chenxing/linux.git tags/mstar-5.14-v2

for you to fetch changes up to eb5e7693630c6039d040e428840be82b7e3a8614:

 MAINTAINERS: ARM/MStar/Sigmastar SoCs: Add a link to the MStar tree
(2021-06-13 02:12:18 +0900)

----------------------------------------------------------------
Daniel Palmer (1):
     MAINTAINERS: ARM/MStar/Sigmastar SoCs: Add a link to the MStar tree

Romain Perier (1):
     ARM: debug: add UART early console support for MSTAR SoCs

MAINTAINERS            |  1 +
arch/arm/Kconfig.debug | 11 +++++++++++
2 files changed, 12 insertions(+)
