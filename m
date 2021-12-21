Return-Path: <SRS0=MANq=RG=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47707C433F5
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 22:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F5B9C36AEA; Tue, 21 Dec 2021 22:06:48 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 68FD3C36AE8;
	Tue, 21 Dec 2021 22:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 68FD3C36AE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id v13-20020a17090a088d00b001b0e3a74cf7so2834685pjc.1;
        Tue, 21 Dec 2021 14:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3TeNEsIuHVA8o1wTu4hlVMO/ndGX+JfRPnvfZ1aB/f4=;
        b=jfeKE9evD7G5Dz5Qas3O0c1FOz9OD6XfQzhQGmtkwe5E6bZxanJeZ5L0XVVlczsymM
         z/tIBM+X42NTqu+dJqn6cbz/RCpYFNzUbsvdkUnkSc5bE8LOBL1VugJSCucs9/FgubF5
         tbYhVq15dXjvyGxyHrSm/y4fOveHADUIt3OvRsiqsJUoK/Og7kHFlPT+/znMndmF6fjF
         X2ZiXlwtaTjjDa2njBw8nDIAAaremYEKJAVre63cE2nyl64EtvEtBmw0LBUOBXgvcoYK
         7Z47dQd2JT80HFuwYfnZvRKlsrRZQLk142rRfVmHLcdn+azXAMkd8X1SiVWHI9YE89rT
         d1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3TeNEsIuHVA8o1wTu4hlVMO/ndGX+JfRPnvfZ1aB/f4=;
        b=7tfLj+KJ3t/gE0r4EHQAEFIJlvWUeY9QwNaY+ly1Fi3LWgEdR0zdPAzyFDrE8ikW/D
         wDzHgRMLj0tkh+M7xvIgMT+vLvVcLB2waDKI9svWL7wP4JwX62E7x6dU/vwA2FMTmvsu
         8oG7fAbAsnvlGGk+LWpdGrkFePYjwXc2liYOM9flVda9STaUBL7tpkibFo/op2TapCdW
         0DeHJl783vnm6TvWhaHA76+dk0xD6IOPkOfrqRSE2/ZIxQh8rz4OsMk2Km0mLlinLAtE
         Nulop2SRVAxzGOpBFgNId57wxppbcbpskjqCYfGyL+TiIAXUMYms6pO2P6W9f8KOn/1B
         8YGA==
X-Gm-Message-State: AOAM5337R2wuxa0kjzgrQ12QJdbe7jhFpuF0t7+1dFje5mOXDUjk8zaI
	MbQmDyCbHfZFAJxS2z7hAraaRL2Yg7Q=
X-Google-Smtp-Source: ABdhPJwhcwpkwx92YG21+PY/Aw2+P8t3XyxZmOjesyM85E6eUqgOyv/o01tAYHXcX3Aogjp4s6cp1w==
X-Received: by 2002:a17:903:2404:b0:148:db27:981a with SMTP id e4-20020a170903240400b00148db27981amr54471plo.31.1640124406531;
        Tue, 21 Dec 2021 14:06:46 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id q190sm70342pgq.38.2021.12.21.14.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 14:06:46 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/6] Broadcom defconfig-arm64 changes for 5.17
Date: Tue, 21 Dec 2021 14:06:38 -0800
Message-Id: <20211221220642.2862218-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221220642.2862218-1-f.fainelli@gmail.com>
References: <20211221220642.2862218-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.17/defconfig-arm64

for you to fetch changes up to c2af8fb1cf948b1c3513f03b12e487ce65cccfe3:

  arm64: defconfig: Enable additional Broadcom STB drivers (2021-11-15 09:54:12 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoC defconfig changes
for 5.17, please pull the following:

- Florian enables Broadcom STB drivers for NAND, SATA, Ethernet switch,
USB PHY and host controllers, watchdog, PWM and Ethernet controller

----------------------------------------------------------------
Florian Fainelli (1):
      arm64: defconfig: Enable additional Broadcom STB drivers

 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)
