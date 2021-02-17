Return-Path: <SRS0=pHIv=HT=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D684C433DB
	for <soc@archiver.kernel.org>; Wed, 17 Feb 2021 01:17:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BA6706186A; Wed, 17 Feb 2021 01:17:02 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 860A664E2F;
	Wed, 17 Feb 2021 01:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 860A664E2F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pg1-f170.google.com with SMTP id a4so5861431pgc.11;
        Tue, 16 Feb 2021 17:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qzbulnVJvkxHQqgd6L0cuy16ntsVshSWo2ZahMwyOFI=;
        b=WZ45NcvUVJENtrhS1GQ+G9m9qBfjydOd5ga9u6FyXstZJ2KkVEhYgqwQELicsKK6M6
         fayoIHiI9Dq2be/l0nsv+aWGGJxEh9ma5SJ9dNtHEl2CFvbyfxZYBR2qW66Jm4uNflby
         5oP1t7OlUtIknl4+x/Jrmi2qY/U4A+sj3dnK2LJfbclWWzE5IJ4cHHekIENdHNKy2wTX
         bRyqBse84MACBcH6nYkH0EaYLLNQtx6YyYN+SP5J8t0UvhznfULGnd/KAI/GhjE4Y6q2
         1FQfeO8JDd1gREUE5NCNRo16SKzwkwEk3dQXW3Cx6rX/1KdVcE4h0mL/cO8T12DmcVLE
         Iq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qzbulnVJvkxHQqgd6L0cuy16ntsVshSWo2ZahMwyOFI=;
        b=m30q84zpBIzIkva4xsIzwjYVxKCDkQIWDGZx6nvllRy1cGBgc7hSKWHECGcrTqDKkL
         f8Jsk7Ehlm7vALatSp4vBQAuLrvz4I35ine5YA3kygMA+fSo3Fs3NxNNC7QjCmuWrZjH
         k0svw6N2GluQeKPBgk1X2HILaH6uCxLvCuSw97ljZ6FPW8/lT9CQwjwowcApw/V69sjv
         GculgVNvW/r4yQ0ANyxEQSUamWQKtpVcMQRqeJU9Ry8dPw0wF8L8nMQt5tRaDwlSg6IP
         fO2qoifyTYQSn/Ko2J0zJYgNAPcucG4MCjEYGtNTaEnQKCE4Fw23/KQtBdMjh0dSDbVM
         OBjw==
X-Gm-Message-State: AOAM531FcSqSoLwbSyspVRB4TbYP1PR7IEyFPpx14WNcybbqvuWb46jM
	TfWFJ2lWCQ/Sa70BUggoGKBKx5C3GPw=
X-Google-Smtp-Source: ABdhPJzK31tTvES4U9HvYNcCjb38B0r2zZrB2k40n8zceRiitb7+ReZfS9GAaOsFHwb5f/PbH/Q1eA==
X-Received: by 2002:a63:c44d:: with SMTP id m13mr21706170pgg.64.1613524621621;
        Tue, 16 Feb 2021 17:17:01 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id f3sm316046pgh.75.2021.02.16.17.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 17:17:01 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maxime Ripard <mripard@kernel.org>,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom late devicetree changes for 5.12
Date: Tue, 16 Feb 2021 17:16:53 -0800
Message-Id: <20210217011654.2561426-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit a0610b409fc9f90b4861c021ebe853bfcc310bb3:

  Merge tag 'tags/bcm2835-dt-next-2021-01-28' into devicetree/next (2021-01-28 20:11:44 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/devicetree-part2

for you to fetch changes up to 443f0bb8e29fa031ec4d5beb3c3143350438dc97:

  Revert "ARM: dts: bcm2711: Add the BSC interrupt controller" (2021-02-16 17:11:40 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoC changes for 5.12,
please pull the following:

- Florian reverts the adding of the second level interrupt controller
  for HDMI BSC interrupts since they collide with the main I2C
  controller (i2c-bcm2835).

----------------------------------------------------------------
Florian Fainelli (1):
      Revert "ARM: dts: bcm2711: Add the BSC interrupt controller"

 arch/arm/boot/dts/bcm2711.dtsi | 12 ------------
 1 file changed, 12 deletions(-)
