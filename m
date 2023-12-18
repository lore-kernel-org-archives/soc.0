Return-Path: <SRS0=1Zlv=H5=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32015C35274
	for <soc@archiver.kernel.org>; Mon, 18 Dec 2023 10:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE95CC433CA; Mon, 18 Dec 2023 10:11:03 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C8E1C433C8
	for <soc@kernel.org>; Mon, 18 Dec 2023 10:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C8E1C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5e637faa52fso4753587b3.1
        for <soc@kernel.org>; Mon, 18 Dec 2023 02:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1702894260; x=1703499060; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/TELCCsM0ySD+HlHfUZJL7+M2kA5kGyaJJFtaOqRaUM=;
        b=3akEUwwlozD15Sg0B5u3eDp5v5/QrqMBwbOl6xKKN/OtQz/lvPPsvLeSKuz0/LQYnR
         otUrASRzUUCmxRl/zZU5En9vVv8FbQwSkZBLfzSQtj5+JJsDNWz1mTq/of2KVsNYKI8b
         QUSJJIupitRI2xX8TG3mhraEuJreis9qgRKMp/uRhZh4kIaNbD/OWP24j5d/wjITKc6q
         JnNG+c/O0lAcPul27TVPQfxArVOcysirhueB7eZc0wb2aez0TOhhm0iyFXYQQIlgqAIT
         s61rzp8ZUhkGHERhCh/OdlH8I4WuHewR6tRpDFRDMqqFvjw1W1KP2HvKor2fhOdz9jO6
         evyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702894260; x=1703499060;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/TELCCsM0ySD+HlHfUZJL7+M2kA5kGyaJJFtaOqRaUM=;
        b=XBsEYGW6nGiH/Th464EnR8PJ9a4hdJHF/XMLLCM4TZrTBv2cnEF8BGsbU1sEKgFEZ3
         8piiU5pJSer+6D/kI7Me8ujwIL+vuZo0eb3qcJS268k7qbaiXHI5u3jw0bogznFwiTAZ
         +WM+VyJZMmb8DQA2yyIjEr7ST5qB//5Tu62dLsI6R5wzORO/XnvOAEg+UlVhZXcbJvwC
         vBPZu2EPO+PjOhgBTLViPUOk5hfFLTT8VxG1tf8Is2gF04zV3sCBfamwYCqNaP/l4KTN
         hkA6bDOIjzFT0yifji+bNksEYBIe25vadRH/3ouK/uKHOfy/UtZ1n6RV0xTlzzqVtN4G
         J+Cg==
X-Gm-Message-State: AOJu0Yw0AMj3+3X9etqqUDCk7yZA3lv5+3OZTgbKHSUNm+ZEKk6rkCPe
	ogGtBKM8MjMuyCnBmvOXgba5f3DphFjoAQlycF6ZZNh+KGTZM8EY5h9jPg==
X-Google-Smtp-Source: AGHT+IGV666h056shhvm0ggoRUFZ8tgbRwpCUrKBWp2iT4QWC8th6qvMctGpu9n9WNJgckKK9qQRng+LGFRBGWi6KhM=
X-Received: by 2002:a0d:d886:0:b0:5e5:8b5d:c2f1 with SMTP id
 a128-20020a0dd886000000b005e58b5dc2f1mr1622927ywe.36.1702894260026; Mon, 18
 Dec 2023 02:11:00 -0800 (PST)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 18 Dec 2023 11:10:48 +0100
Message-ID: <CAHTX3dJ=6y=vEgmH7Qqe=6TJZT=D-egKDmLLER4fS0=OHJRGZA@mail.gmail.com>
Subject: [GIT PULL RESEND v2] arm64: soc: ZynqMP SoC changes for v6.8
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these patches to your tree. I am sending it again as v2 because
I see origin email in lore here
https://lore.kernel.org/soc/CAHTX3dJp_dztRCOn+-_OCeb-L6He7Pi2t-K0QeTDACaMs-xfTA@mail.gmail.com/T/#u
but I can't see it in patchwork.
I have "patched" Uwe's surname to remove no ascii char and see if that
goes through. That should be the only
difference between previous RESEND pull request.

Thanks,
Michal


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-6.8

for you to fetch changes up to 87fda1acfc3b9048261799817ef749e6deb95724:

  soc: xilinx: Add error message for invalid payload received from IPI
callback. (2023-12-13 16:55:15 +0100)

----------------------------------------------------------------
arm64: ZynqMP SoC changes for 6.8

power driver:
- Move to remove_new hook
- Report error around unsupported callback
- Fix long messages

event driver:
- Fix cpu_id handling
- Fix warning message

----------------------------------------------------------------
HariBabu Gattem (1):
      soc: xilinx: Fix for call trace due to the usage of smp_processor_id()

Michal Simek (1):
      soc: xilinx: fix quoted string split across lines

Naman Trivedi Manojbhai (1):
      soc: xilinx: Add error message for invalid payload received from
IPI callback.

Tanmay Shah (1):
      soc: xilinx: fix unhandled SGI warning message

Uwe Kleine-Konig (1):
      soc/xilinx: zynqmp_power: Convert to platform remove callback
returning void

 drivers/soc/xilinx/xlnx_event_manager.c |  7 +++++--
 drivers/soc/xilinx/zynqmp_power.c       | 16 ++++++++--------
 2 files changed, 13 insertions(+), 10 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
