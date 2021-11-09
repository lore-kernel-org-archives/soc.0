Return-Path: <SRS0=2wBR=P5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C8AC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Nov 2021 00:02:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ADED610A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Nov 2021 00:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9ADED610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AEq1nCGZRkWODJCl638Dq5slDRYNKowAEACiXnn8ybk=; b=5C1GDyz8y0Xaxy
	kCBXunkVaJEsrjVw3UWet8V8AS5VOwJjkCqNfyCmy3z9o4F6Xs1h7Mcfg0ydUE3sXWwXATycEawtw
	Msc+eko41swFv2ZrwMlwSpx7HjAV+P1c68TM8r9zLssAfedo0eQ6YcW4uWVX8RN4iAF4FutOrukGV
	lEDyPM6AJK99v4s7HLQPNK8WZHuboHmAppHomMH0du8taLM5/lewSBuCPKthblkvFeAyxXcqxhebS
	uleB2a5P6HnP0CYIS4SVjSJ8aUtmr88lgTlor6kENtQncWlDR+VIJwWHyx5h9xZsjGFANeyoHFL9t
	urHfe2QQFYI1bYoUlGwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkb2e-0045Ny-QO; Wed, 10 Nov 2021 00:00:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkZvx-003bCp-3k
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Nov 2021 22:49:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACA61610CF
 for <linux-arm-kernel@lists.infradead.org>;
 Tue,  9 Nov 2021 22:49:40 +0000 (UTC)
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
Received: by mail-wr1-f48.google.com with SMTP id t30so555039wra.10
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 09 Nov 2021 14:49:40 -0800 (PST)
X-Gm-Message-State: AOAM531g9LEod/xbe+GAbc5iGwwu5ToDZ9C6t6KNcfUyRgIpoWYBcdKT
 E7OEMzNOdMPiGe4VyGGJIFSGkmL4yIS9++egFCo=
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Li Yang <leoyang.li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_144941_206355_0BF2FBBC 
X-CRM114-Status: GOOD (  10.22  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211109224923.agZ6ozCuiiY54NkY6tyOlExLlbzUxKmzafDIkFNBqa0@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
