Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238ECC4320A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 12:46:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC6F560F14
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 12:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC6F560F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/N4yDZq4RKHHdNBtupbTeBxXCXaS4lUhknZkzbkCiPQ=; b=FjFOhkY9jUNKJd
	rpEIHPPoMR4S+yNv6Bw12W9lL492+xghRl2TCtbMCHnRYPmnCcBU2/u3V6D8Sf4aifrfne2GeKJuc
	PJq+Ptpor1xQw6haCDYk6AXYSBx4AsmUaV3GkNinhUirnC1pICG6ljy1ssbzTROEesBUYwbjCNRVw
	hXfWORxDsFbclV7KOxC79xrrh90nLCOHU5Z+6DoJpsAPYaBhLviV4H3n4mmSXL13k8nK8Xa0gCRjh
	Q+lHBeF8MTrCn6+yzjRIGZwqaxQnhV/h9qhNGn44iPgBDOloYJkDfoOa5vdEUFwVXS+U5bA89lMuI
	AMbaLCoXnWoUDuap58gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBGGB-0061zu-14; Wed, 04 Aug 2021 12:44:35 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBGG7-0061yi-5m
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 12:44:32 +0000
Received: by mail-lf1-x133.google.com with SMTP id b6so4147362lff.10
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 04 Aug 2021 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=KThPZotl2MnbNHnYwN0Cur48hqa8t2fsEOoHY+/KM0c=;
 b=Gocdf1yXuPX8xeoaYI9oLI1JhocaQp6ZZyVcTlOJdDZI2/0vnch4E5lQGPm3MxwdUM
 giqLR8+3StPTSF4eaI9QxPRAYgsQPOy3Sgy1vk6QHMGur8WgKk9JiwpBE7Q7NqhIFwt9
 YVZHv5lFDRw148Wb0r8UWWKNpLe8xrYAqQDWLQuAbt5MPsHwKIZ92D+P+/WX5P4zRRJR
 snno7CnnmIaYZRGMeNve6R+RMLZT4vIseAntmNcFNMogNI0duS3C7Rhms//adcYhnZ1B
 JgYUmWHHnqKvaZCBz8Vai7whhh0nzb9P1JFctB31mbxCa5/w7d9XJZYYIGYyiaufHl03
 +5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=KThPZotl2MnbNHnYwN0Cur48hqa8t2fsEOoHY+/KM0c=;
 b=KVIldZZMEetjnTjX8H/sboAxM9LeDsZfDTIX6F4FupP8vKV6D1kTaYOIuzUVaYA5cC
 uOHLeOcBkx3VtwhlVcb50MZkNjLig+ARqXHJZhPTzBQJlgfnCZF4zFkontZIohrgpi3S
 yDUtvI8fv4sswXU89C9WJyfztlo2TC/f4EljycRjjThu1MtR+LS1Ev6YhhSoOx4oTLZl
 wvOWYtypVixFqpbFhw1DtqoLFp3wZCGBH4imrIBRWnOM0gk/fHoZp/vRUXfhsE39AB2C
 gqsLj1V1OdN3McEcwGfKCI3tRIqM6cxufLNhl0fTG7RJfkXf79AIj0dOmYSCm1GAXtbk
 3fAg==
X-Gm-Message-State: AOAM533xsOauSpyHFNwZtucyEJDiwiKD/oFhC2XzTi4z31kQh6rY0ycw
 2lHSi8BfnLwFO+00N9du1vLfX4P4PI8b8U3BQLj6ZA==
X-Google-Smtp-Source: ABdhPJyDDyEf+9rLZyk+tYny9g+7KdGyN7lm64G/9thaqibRNfBCYr9r5bZvfT70hWlzM4bj90OnDOt9H++74lx9/Q4=
X-Received: by 2002:ac2:4d0f:: with SMTP id r15mr12222472lfi.649.1628081069590; 
 Wed, 04 Aug 2021 05:44:29 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Aug 2021 14:44:18 +0200
Message-ID: <CACRpkdZaCosXsgp02nuUbd_nEvdxm5-z0+d0oSA97UTWQ0RQQg@mail.gmail.com>
Subject: [GIT PULL] IXP4xx driver updates for v5.15
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Guenter Roeck <linux@roeck-us.net>, 
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>, LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_054431_263589_7F11BE5B 
X-CRM114-Status: GOOD (  17.64  )
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
Message-ID: <20210804124418.MjSTpAks5ekQR7snDwhP5BPTUkJbWp1IEJc0KNMD1Ik@z>

Hi SoC maintainers,

this is a set of combined driver updates for IXP4xx targeted for the
v5.15 merge window.

I am sending it to the SoC tree because of the cross-subsystem
dependencies and since the corresponding DTS changes goes
into SoC. These will be sent separately.

Note the following:

All new DT bindings in this patch set are ACKed by bindings
maintainer Rob Herring.

The new expansion bus driver goes in through the SoC tree as is
custom for bus drivers.

The watchdog maintainer has ACKed the watchdog patch, which
also briefly affects the timer driver.

The PATA changes also have some mach dependencies.
I have informed the libata maintainer that I intend to take these
through ARM SoC.
https://lore.kernel.org/linux-ide/CACRpkdbf9TfFyObuqCzOEe_QrS=Gru8i6x-1P7v_N-a11g_iiA@mail.gmail.com/

Please pull it in!

Yours,
Linus Walleij

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-drivers-arm-soc-v5.15-1

for you to fetch changes up to 47adef20e67d657696c953f4b8023017c6005c1b:

  pata: ixp4xx: Rewrite to use device tree (2021-08-04 12:20:44 +0200)

----------------------------------------------------------------
IXP4xx driver updates for modernizing the IXP4xx platforms,
taregeted for v5.15:

- Add DT bindings to the expansion bus and PATA libata driver.

- Add a new expansion bus driver.

- Rewrite the watchdog driver to use the watchdog core and
  spawn from the timer (clocksource) driver.

- Refactor the PATA/libata driver to probe from the device
  tree and use the expansion bus driver to manipulate chip
  select timings directly.

----------------------------------------------------------------
Linus Walleij (8):
      bus: ixp4xx: Add DT bindings for the IXP4xx expansion bus
      bus: ixp4xx: Add a driver for IXP4xx expansion bus
      watchdog: ixp4xx: Rewrite driver to use core
      pata: ixp4xx: Use local dev variable
      pata: ixp4xx: Use IS_ENABLED() to determine endianness
      pata: ixp4xx: Refer to cmd and ctl rather than csN
      pata: ixp4xx: Add DT bindings
      pata: ixp4xx: Rewrite to use device tree

 .../bindings/ata/intel,ixp4xx-compact-flash.yaml   |  61 +++
 .../bus/intel,ixp4xx-expansion-bus-controller.yaml | 168 ++++++++
 MAINTAINERS                                        |   2 +
 drivers/ata/pata_ixp4xx_cf.c                       | 264 +++++++++----
 drivers/bus/Kconfig                                |  11 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/intel-ixp4xx-eb.c                      | 429 +++++++++++++++++++++
 drivers/clocksource/timer-ixp4xx.c                 |  48 ++-
 drivers/watchdog/Kconfig                           |   1 +
 drivers/watchdog/ixp4xx_wdt.c                      | 283 ++++++--------
 include/linux/platform_data/pata_ixp4xx_cf.h       |   4 +-
 11 files changed, 1014 insertions(+), 258 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/ata/intel,ixp4xx-compact-flash.yaml
 create mode 100644
Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
 create mode 100644 drivers/bus/intel-ixp4xx-eb.c

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
