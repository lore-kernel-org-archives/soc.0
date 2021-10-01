Return-Path: <SRS0=stTo=OV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148A0C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Oct 2021 09:45:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D065161267
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Oct 2021 09:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D065161267
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VY3SJRwYGpEBGr9NdCRfYqI/1CkjKE53bzxZ9N+kmCc=; b=MEIKzrL+fOnN3W
	3hG9SOGMbsmSzJqVfTXTGI76rwJ8Mfa5mPjXjLYCdOfmbKqVLR6/fZb9usPztWCBFnpET9NC8xsTX
	C2zP9PUpYBSsYZGg1W4ZZii3UJd481iAFLKdLIve1GCmzTuXAq+QsxCRj40+hWYF3P5Z/vKon+B9f
	QT+9gaFv79tgJwvjjCVFumA8vQZfvmt9k/i20d1ekSUPD1SLJNx/dFrZvgZ6x3Modaq4ByiZPHkMe
	twECuKe1P8QCE58usP38l6df2fPqOlLzf2rSvJKcmfA0c74zAYMLXhpGhOuDMz0LXgSpNDE/ItSfG
	rG7PH+kJ7Txf+zE3vlDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWF4T-00HI26-AJ; Fri, 01 Oct 2021 09:43:13 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWF4D-00HHxW-4d
 for linux-arm-kernel@lists.infradead.org; Fri, 01 Oct 2021 09:43:00 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5c32:c2e7:df7:3731])
 by laurent.telenet-ops.be with bizsmtp
 id 0Zir260011ZoSwU01ZirkJ; Fri, 01 Oct 2021 11:42:51 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mWF46-000zIj-IB; Fri, 01 Oct 2021 11:42:50 +0200
Received: from geert by rox with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mWF45-00BE6A-UA; Fri, 01 Oct 2021 11:42:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v5.16
Date: Fri,  1 Oct 2021 11:42:43 +0200
Message-ID: <cover.1633081145.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633081144.git.geert+renesas@glider.be>
References: <cover.1633081144.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_024257_372710_AA497D03 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20211001094243.3OKd4cRMleUjAtTA6Et_2eVCxl51ERzeqlx04uC_g58@z>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.16-tag1

for you to fetch changes up to 93207e415d134e6fbcee6a723ab4cf060ef3926e:

  arm64: defconfig: Enable RZG2L_ADC (2021-09-28 09:31:38 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.16

  - Enable built-in (I2C, DMAC, USB PHY control) and modular (audio,
    ADC) build of drivers for the RZ/G2L SoC and SMARC EVK board,
  - Enable modular build of the Renesas TPU PWM driver for the R-Car
    V3U SoC.

----------------------------------------------------------------
Biju Das (5):
      arm64: defconfig: Enable RIIC
      arm64: defconfig: Enable RZ/G2L USBPHY control driver
      arm64: defconfig: Enable RZ_DMAC
      arm64: defconfig: Enable SOUND_SOC_RZ
      arm64: defconfig: Enable SND_SOC_WM8978

Lad Prabhakar (1):
      arm64: defconfig: Enable RZG2L_ADC

Wolfram Sang (1):
      arm64: defconfig: Add Renesas TPU as module

 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
