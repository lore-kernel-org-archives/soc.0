Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E6DC433EF
	for <soc@archiver.kernel.org>; Tue,  9 Nov 2021 22:49:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BD465610F7; Tue,  9 Nov 2021 22:49:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A557E6108C
	for <soc@kernel.org>; Tue,  9 Nov 2021 22:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636498180;
	bh=SiIcxWybq/63+1gvhHKq04git02TUQjkE7UKZn7TUYw=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=eqdqWlmSb8oXxjhOsiirhjQVUOT4w0V8Lg+UzIgxaXPA3rBEHedh9ubQj6djeKgGq
	 C57ppqjmcpJyu86jILgpC8AjWlg0SgDJyzP+KvxDvkLd2SVbpo0dSJ3bGhnUsXNltx
	 II/CkzS83jufYW9JYYU29unXod51Fds0DY7ySGmlXytUVKgzTsMpxDsIfZd+6d3Cec
	 skuyY1OaVSdQ3pXEfApLOJCwyhAp+mqvYjaiNsR7kTwIXYP1ALTEHJbQxTjOonHlrt
	 sP8B9JG+1agtptx2IZJCp9qgbjhHyNroL1SQ4NpOOnFYO3x7nJGc+W/hzl5Dd3MNpQ
	 bZqyb6xRyDVUQ==
Received: by mail-wr1-f53.google.com with SMTP id w29so547730wra.12
        for <soc@kernel.org>; Tue, 09 Nov 2021 14:49:40 -0800 (PST)
X-Gm-Message-State: AOAM533qotdURHu9dVlBca55vX5E1GVFx1rkQyDbw0TpwBi2wecpLRhW
	9kzD3Oclg7BlsFn3bOSUps9Se3W4nYyFogm/Bb0=
X-Google-Smtp-Source: ABdhPJzKlhubrDFo6Bf8g9s0/Pug3CdQAMPemo1KixlL3jJWLLEmpKkttbYZMmnplaTmy6gtFhO4glNBpWeTFi32hIE=
X-Received: by 2002:adf:df89:: with SMTP id z9mr13728213wrl.336.1636498179182;
 Tue, 09 Nov 2021 14:49:39 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 9 Nov 2021 23:49:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a29J4j=PDZfdgKO6bJ05ZCTcqbVJx+8c=RmrU4dXmS8QA@mail.gmail.com>
Message-ID: <CAK8P3a29J4j=PDZfdgKO6bJ05ZCTcqbVJx+8c=RmrU4dXmS8QA@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.16
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Li Yang <leoyang.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 05d5da3cb11c91c39e607066d3313a6ce621796a:

  MAINTAINERS: Add maintainers for DHCOM i.MX6 and DHCOM/DHCOR
STM32MP1 (2021-10-26 17:14:37 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.16

for you to fetch changes up to 76f79231666a7a3c9a1db82c002e083125de5861:

  Merge tag 'soc-fsl-fix-v5.15-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux into arm/fixes
(2021-10-27 08:27:30 +0200)

----------------------------------------------------------------
ARM: SoC fixes for v5.16

This is one set of fixes for the NXP/FSL DPAA2 drivers, addressing
a few minor issues. I received these just after sending out the
last v5.15 fixes, and nothing in here seemed urgent enough for
a quick follow-up.

----------------------------------------------------------------
Arnd Bergmann (1):
      Merge tag 'soc-fsl-fix-v5.15-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux into arm/fixes

Meng Li (2):
      soc: fsl: dpio: replace smp_processor_id with raw_smp_processor_id
      soc: fsl: dpio: use the combined functions to protect critical zone

Robert-Ionut Alexa (1):
      soc: fsl: dpaa2-console: free buffer before returning from
dpaa2_console_read

 drivers/soc/fsl/dpaa2-console.c     | 1 +
 drivers/soc/fsl/dpio/dpio-service.c | 2 +-
 drivers/soc/fsl/dpio/qbman-portal.c | 9 +++------
 3 files changed, 5 insertions(+), 7 deletions(-)
