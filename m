Return-Path: <SRS0=o9QH=H7=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A47AC3DA6E
	for <soc@archiver.kernel.org>; Wed, 20 Dec 2023 11:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4EB15C433CB; Wed, 20 Dec 2023 11:30:33 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C4A4C433C8;
	Wed, 20 Dec 2023 11:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C4A4C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 499FF6035A;
	Wed, 20 Dec 2023 11:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1703071830;
	bh=truEa3QfuBAMEME0k+wwNOzHU4FpTuZaTpVLIKlT97w=;
	h=From:To:Cc:Subject:Date:From;
	b=qw2bWeZ9bSMbd2PJXfn7ovGqSysu0PaOpYwETxe0RTzuFZ2lyxeZDSRr2OG0VGpi8
	 gw7CEo1QHlb84QrWmYmAzoVVBJCiji9vjC4uXBUU/LyInZ/bsIBAr/JUE2iDDgxJNW
	 y/NMdeGQgQiFUes2dfMzLUhr0yVF9Oepubah/oAtmARAmkGzApFI6yqPqC2i7zpmbq
	 Wn5jnTse+NBNYA9b11vMyVl2ej+bSdOQSL+fuNkYp9Ia1hOaKUnwCFkHuRiKOl+bxW
	 b6GadN05+uE7/0ewOnijZTP86hX/19/hXqmudGq2E4q5706DRusAgYJNsooYDd/h14
	 HCk5k6n6b8DZw==
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fix for am335x usb boot hang
Date: Wed, 20 Dec 2023 13:30:14 +0200
Message-ID: <pull-1703071616-395333@atomide.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit c72b9c33ef9695ad7ce7a6eb39a9df8a01b70796:

  ARM: OMAP2+: Fix null pointer dereference and memory leak in omap_soc_device_init (2023-11-30 13:57:00 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/am3-usb-hang-fix-signed

for you to fetch changes up to 9b6a51aab5f5f9f71d2fa16e8b4d530e1643dfcb:

  ARM: dts: Fix occasional boot hang for am3 usb (2023-12-13 08:56:10 +0200)

----------------------------------------------------------------
Fix for occasional boot hang for am335x USB

A fix for occasional boot hang for am335x USB that I've only recently
started noticing.

This can be merged naturally whenever suitable. This issue has been seen
with other similar SoCs earlier and has clearly existed for a long time.

----------------------------------------------------------------
Tony Lindgren (1):
      ARM: dts: Fix occasional boot hang for am3 usb

 arch/arm/boot/dts/ti/omap/am33xx.dtsi | 1 +
 1 file changed, 1 insertion(+)
