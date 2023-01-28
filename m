Return-Path: <SRS0=fJuS=5Z=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5E6C27C76
	for <soc@archiver.kernel.org>; Sat, 28 Jan 2023 19:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C97BC433EF; Sat, 28 Jan 2023 19:38:30 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D3EDC433D2;
	Sat, 28 Jan 2023 19:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1D3EDC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id p24so7996734plw.11;
        Sat, 28 Jan 2023 11:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M5sEnsa+KuqgUhdCEqGHwrs8h/4s+KqIswhmY/2TurE=;
        b=VU1YOWgWcNgUnpBVnAaOsXswy1RzoQ7urcruDqZSKd0iLMvyb4Ad+JeoFt4Tm5rNC4
         2AhiS2uPJ8WIt1KFyEJc/yjz2Yer5H5+IpUzqvrlmbXyW55RdDXGO0WvIaCuW+sLjTbd
         +56d9jOjcDZhTukmtRCgbtvWNzyHSDEa3sK3acQDXsZiNxrmOUXt6r9HQuu+2OlnSEYB
         PchgxkixeaNQtAehmwO40ngblrBcoRpVOABVFw4rownuDI2He7ZeL50OBo7Jkw5qqIgY
         qZ3RLd0g9mXmc/KYNJlnTcqPIFt+R1FDu6vkHdSVBvblT4w6/a9hNdGnSeCOKOP8S50C
         XpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5sEnsa+KuqgUhdCEqGHwrs8h/4s+KqIswhmY/2TurE=;
        b=AFJ0IA+2dR3AnSqhbYp0bla/MswoG785raqMnJNEV4L/TAr1iX5pyfiJILvnxmRJo8
         RAVpJ+2Vc0qKrPsGVxoPpZ6kieKF6x3fMg9un1uKxTfQH9WlzOmaxa8yi6sn/Uqboxvh
         LNciSPV6tnMFO405VOFAXndT4sAAQeyADg0A9e9CFOyLUPhP5eli/yICE8IfG4MeYX89
         qH9GZyb5NcfIIsRbTeoW+ve18oR/zTTg2RFD7gJ4/qxBYpcG0GywFEvGfOG6f9vFo8tN
         cO2KDHkd3X23sU7Cl3d/yu//YOEe+BxNYDZfLC/7piKwkFJloFIwqO/KkF2hzvJmdzfU
         aLMQ==
X-Gm-Message-State: AO0yUKXsKlFf3uPvwFWe0aVFK6NrMzXBsurwN7PoM4miyN2/QciwUHs2
	Vw0Sy0DkOnlR5jcbcPel4X7kKO1v4n9ITg==
X-Google-Smtp-Source: AK7set+2HQNXCDrth8I59VY85RAdyadi2fUGagT/NV3wSALpwQFgWs1ASAS6OfsarM3QVu5EWwTk9w==
X-Received: by 2002:a05:6a21:329b:b0:bc:8b20:97b7 with SMTP id yt27-20020a056a21329b00b000bc8b2097b7mr4491928pzb.28.1674934707975;
        Sat, 28 Jan 2023 11:38:27 -0800 (PST)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id l125-20020a622583000000b0058db8f8bce8sm2898399pfl.166.2023.01.28.11.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 11:38:27 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/5] Broadcom defconfig changes for 6.3
Date: Sat, 28 Jan 2023 11:38:23 -0800
Message-Id: <20230128193823.1628716-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.3/defconfig

for you to fetch changes up to 0207a7dea8b3c9087560a9631b7c91197bf8c1bb:

  ARM: bcm2835_defconfig: Switch to SimpleDRM (2023-01-19 11:18:23 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM SoCs defconfig updates for 6.3,
please pull the following:

- Stefan enables the necessary configuration options to make use of the
  framebuffer on Raspberry Pi devices

----------------------------------------------------------------
Stefan Wahren (2):
      ARM: bcm2835_defconfig: Enable the framebuffer
      ARM: bcm2835_defconfig: Switch to SimpleDRM

 arch/arm/configs/bcm2835_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
