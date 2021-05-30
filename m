Return-Path: <SRS0=k3Qe=KZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B57C47091
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 May 2021 09:28:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04C0A610FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 May 2021 09:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04C0A610FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kUh7c902j8GVOUB9oDptpJbYiFYyYI+KmZncFW1tmp4=; b=ny42JpjzEbhA7W
	hEVBgCIQ7Q+6rSkxSyKbc4dNbKYPtaljcq4dXuCirBqRGfvd8+UuKyljrxd+JHFUuK/aFyVc4GE9p
	Tfo46buiVH4Rp74433d+TGj4qJgIkyygp7hlQFGRnrekMnnMjeuXxPHlMzjlzqzL/xpv0xayNq1RA
	fjd0VNNPA1c4WvbhiHsJ2Kf4glBgflIjBzj+JErlCjzIUco5/InOnlmeMDY0EOvGVuOrCVxDJGPcS
	q/wcjUqRaAMeIUkQQQeIBiC3njJ8kKEH67HCvIAPhrW1/FJTcsBxustAl4pMb2E9//ZDVaA3ydfB7
	1JsA302p3tE8+1nll3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnHjH-009NIh-FM; Sun, 30 May 2021 09:27:31 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnHiT-009NCJ-8L; Sun, 30 May 2021 09:26:43 +0000
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M4Ja3-1ln0jH2v8z-000OhJ; Sun, 30 May 2021 11:26:22 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 0/6] ARM: dts: Add Raspberry Pi 400 support
Date: Sun, 30 May 2021 11:26:09 +0200
Message-ID: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:n2h+CsFKET9/0vn5SBFheUb/aTTZ6EuKdpPV0C01U77riAHAOGl
 3/idd7GDj+7Vlc3XwNNgdTWLHREvPdoU4kdAdWqoqrWwon8NqY3BUOvvY3iWsKUA1han8Ub
 LADu4y9uXUK9SHR/Tor2vlg07F9aUMI5u48oHo2KgnVSso6b7dDExp9YrL8+JcBA1x/0fgK
 OPTS097M65tJ/01XmF+wg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:N0ncYazpDFY=:fHvpK6R0VkyuaPdpmA71p1
 oINcyQk+vRtJnI7nLZVG+kPeVMtFssMilOOE6io8sd4LTEi4KTYTjq9LLLNzLQThkAUP6kgWT
 ctnKZ/man5dipDEpYiWuHpXxWsmqzV8peN2jL2vVMqo5pHAISgv4UDHLf7XoJuxU521hmIa8N
 GoIMdlacqJ3E+TXAD325r+eM7SuWQjZKjCiDRiy+4Wbf2t3Kxxf7FnxYsnn6gBMUSEQaESKbt
 Ty9RXxqpcSwJ8N707+iOU9cEpvhtHb7VIAPiRODNYnla3DPXFa3Sl0zyIjPJXGE0jTBqnImPF
 QNwUbqb724zKJE1TFWJVGIpE3LVcOmP+oFtRry69imEld5tIdmmE+95r+kmToy3PBiFKSp9iO
 LOKJOts0KXRZzbaTJ8NLS5aYKi6K0vDNp1XRu5p3RaK6nmTHe6IBb2wmKd2b4GMQ2NuriH6mB
 XFZD8EQqsPc8WfSX4SJBEtnFNSvis7LrlmGxdoMOJ+H7zGd0iPsVFJ4Z13YVTxOQXgMQgUkFw
 POsbQdJLdg6K1fLeBHD9yQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_022641_640766_F705D6C8 
X-CRM114-Status: GOOD (  12.24  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210530092609.QKNzPDcqL1jvVaEl1C6mxQoay_n8KFs7Op9jjY4zsOY@z>

This series adds support for the Raspberry Pi 400.

Stefan Wahren (6):
  ARM: dts: bcm283x: Fix up MMC node names
  watchdog: bcm2835_wdt: consider system-power-controller property
  ARM: dts: Move BCM2711 RPi specific into separate dtsi
  dt-bindings: arm: bcm2835: Add Raspberry Pi 400 to DT schema
  ARM: dts: Add Raspberry Pi 400 support
  arm64: dts: broadcom: Add reference to RPi 400

 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              |  62 +----
 arch/arm/boot/dts/bcm2711-rpi-400.dts              | 271 +++++++++++++++++++++
 arch/arm/boot/dts/bcm2711-rpi.dtsi                 |  75 ++++++
 arch/arm/boot/dts/bcm2711.dtsi                     |   2 +-
 arch/arm/boot/dts/bcm283x.dtsi                     |   2 +-
 arch/arm64/boot/dts/broadcom/Makefile              |   3 +-
 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts   |   2 +
 drivers/watchdog/bcm2835_wdt.c                     |  10 +-
 10 files changed, 362 insertions(+), 67 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-400.dts
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts

-- 
2.7.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
