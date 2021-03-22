Return-Path: <SRS0=55Mi=IU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAF7C433C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Mar 2021 17:44:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 226806023B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Mar 2021 17:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 226806023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LxFLRhFcWRxT6g8CR2OpGcpZ7h8AADw18NKQKd1cMW0=; b=mHgs8yHmR0F95HV5wBNrBYjMNq
	yoF+kDSyK8mnVgCbmkIfF7YlE+MIrcAHOuCPexYxpxia2uNID7R2AWrdpKuTh0pAUlCli/uWQ+Sjp
	fl4T4+XIamyCi5k6efMo8g2iSY17OjZfER7BXd2+yLbFE2qxsOfF8r5eOugzudaf8OHFf+KiLViP+
	J2jZstEcCKbA+75F8cxItNonMKpJc7OErtNs0eyjdg2IhjR1TIHUManX6V18lwToNDkflulm9hes3
	XXrnh3Edme7rxl7KiZvlTBTDJXpa1qW3yaX7o5YJcj+zRHkDo7CcCE6xZVeagWabM42aLo2zmE4iR
	BnviFr0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOOZf-00CBFg-5l; Mon, 22 Mar 2021 17:42:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOOZb-00CBEz-1a
 for linux-arm-kernel@lists.infradead.org; Mon, 22 Mar 2021 17:42:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB19C61994;
 Mon, 22 Mar 2021 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616434955;
 bh=FnX0Z1CHdnjFaEH5KqqvBazlu1hFYW32+/NY1ezz+GE=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=i++MPjQ9A+nLVpfJF/El6wF9eXDiJajXZkUxgnQm+10JHlbRR1KztvjfRXuTrXMj8
 W+vDnaHbWwfQWQi5eMLRd7onONrxb9sjT5ffM33+8WRgJKhpDZ2TjBy2xF4kxckRh6
 GQqT5Gul//2U/58EBQGVOtUYCuOYGjioUcjUqZ3y3vp+wAA2LE4ASrwXIcg5WAKfx3
 CAbSe2wKsjyw129hE/Hjq6UDrfcSsm0D0457luU66wLhRdAoICdQUmHRElZjRE9iMT
 f8O0fscz5s/3Xw1QmzQKKBr7aBP0FSVNHVuMJxxKVmy2cP/iMH4qiG/SZjDcTAkRmn
 aHqUQ6Fp0TkPA==
From: Nicolas Saenz Julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, u.kleine-koenig@pengutronix.de,
 f.fainelli@gmail.com, sboyd@kernel.org, bgolaszewski@baylibre.com,
 gregkh@linuxfoundation.org, dmitry.torokhov@gmail.com, robh@kernel.org,
 thierry.reding@gmail.com
Subject: [GIT PULL] Raspberry Pi driver updates for v5.13
Date: Mon, 22 Mar 2021 18:42:32 +0100
Message-ID: <20210322174232.29549-1-nsaenz@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_174239_302829_94308D5B 
X-CRM114-Status: UNSURE (   9.76  )
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
Message-ID: <20210322174232.K_iweUmrTNWmA_5WJ43lEP2LeSO-kVUhcj7kBO00Bz4@z>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/nsaenz/linux-rpi.git tags/rpi-poe-v5.13

for you to fetch changes up to 79caa362eab6569297210eda375d6ea358a81161:

  pwm: Add Raspberry Pi Firmware based PWM bus (2021-03-22 17:59:52 +0100)

----------------------------------------------------------------
Raspberry Pi driver updates for v5.13:
  - Fix-up all RPi firmware drivers so as for unbind to happen in an
    orderly fashion
  - Support for RPi's PoE hat PWM bus

----------------------------------------------------------------
Nicolas Saenz Julienne (10):
      firmware: raspberrypi: Keep count of all consumers
      firmware: raspberrypi: Introduce devm_rpi_firmware_get()
      clk: bcm: rpi: Release firmware handle on unbind
      gpio: raspberrypi-exp: Release firmware handle on unbind
      reset: raspberrypi: Release firmware handle on unbind
      soc: bcm: raspberrypi-power: Release firmware handle on unbind
      staging: vchiq: Release firmware handle on unbind
      input: raspberrypi-ts: Release firmware handle when not needed
      dt-bindings: pwm: Add binding for RPi firmware PWM bus
      pwm: Add Raspberry Pi Firmware based PWM bus

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  20 ++
 drivers/clk/bcm/clk-raspberrypi.c                  |   2 +-
 drivers/firmware/raspberrypi.c                     |  69 ++++++-
 drivers/gpio/gpio-raspberrypi-exp.c                |   2 +-
 drivers/input/touchscreen/raspberrypi-ts.c         |   2 +-
 drivers/pwm/Kconfig                                |   9 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-raspberrypi-poe.c                  | 206 +++++++++++++++++++++
 drivers/reset/reset-raspberrypi.c                  |   2 +-
 drivers/soc/bcm/raspberrypi-power.c                |   2 +-
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  |   2 +-
 .../dt-bindings/pwm/raspberrypi,firmware-poe-pwm.h |  13 ++
 include/soc/bcm2835/raspberrypi-firmware.h         |  10 +
 13 files changed, 331 insertions(+), 9 deletions(-)
 create mode 100644 drivers/pwm/pwm-raspberrypi-poe.c
 create mode 100644 include/dt-bindings/pwm/raspberrypi,firmware-poe-pwm.h

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
