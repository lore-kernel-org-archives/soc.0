Return-Path: <SRS0=/1iW=5H=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE09C54EBC
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 21:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E023C433F0; Tue, 10 Jan 2023 21:50:29 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E78DC433D2;
	Tue, 10 Jan 2023 21:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7E78DC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id p24so14626795plw.11;
        Tue, 10 Jan 2023 13:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gvnCLlKJgwpXuKvLOgB9yTmvjnNumFnTKvlbQ0BUr6Y=;
        b=gEGinPWjVN4L/Mvt1QeCrizWaT+3bsYJnCoOQqknTIt4cXxnsKhvar2iE9NDyGUemX
         b2gMplPRCQHK9+NBE5xzULgzyoejE3XspFcwodVwfTvqgXOQycxnIecvNSPaD2deeJW+
         1y7kPZjoP9OX2aIWiGwfe4yluCMWBSpvtgCKbzuIKOo5w2MMaT/X0HxXkGtaE5NOu9ZR
         cYzMH/nQXeExqyjY1TMgddBhpH87l/qiAfuiU/VeXKdN3AnSfx2ZHuG+VyyrN8ybVmAN
         ci1rZyeMP+SpD7AS2SynF6MyOb5Q+VPaKJHIAEMOz6qgNGW+Oq+XWmG/e5MBA9GzGrbx
         SI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvnCLlKJgwpXuKvLOgB9yTmvjnNumFnTKvlbQ0BUr6Y=;
        b=0e5xgup+Od5bPSGKN7D6DrDAbUkwfwxgbbuPT4r91xGKwAVrFzTUv3gXKJzkqqtBcM
         Fttxwo7oJgMzkpHWIN/i76WkEfekaXDGjsGRbAh6Xv9vrUSJ+2c0ktHHgsRTpN26fbFq
         6kb1YfPJfW1tjlj4a0WGkTYr7t3b+1dDMI0TlknSp8YaCSO958TAbsuty/0FHY1l+kwr
         iw0QUKZhInzMSyWQe+tO3e9H9AM9LUUFkNj1SSuA/3hxTQ4nZL1xCZVFBQMg6EQ/yQvu
         u+jm4Thijd6jQGDjuzmjasiwymtnZoZbl9vk7Zw1A9KQpGq/DAngRu5Bzz+7v4rf1ujW
         yH+Q==
X-Gm-Message-State: AFqh2kqF6zYA4Sjpp1gmRrI0hvUjIyrAmMCC94WkWl8vLxLY06bhPzL2
	sJH9qVunv71tXPXAmyaHd/zHfswPJr0=
X-Google-Smtp-Source: AMrXdXu7ADZmbSliWD3FGYLciVByXn4cC+h3NE9YRQIXRnen8tplj5nVA1FWELkh7byHQk8QqnRekQ==
X-Received: by 2002:a17:90b:3007:b0:225:e88c:33c2 with SMTP id hg7-20020a17090b300700b00225e88c33c2mr234886pjb.7.1673387427393;
        Tue, 10 Jan 2023 13:50:27 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id fs7-20020a17090af28700b00218abadb6a8sm7683663pjb.49.2023.01.10.13.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 13:50:26 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Maxime Ripard <maxime@cerno.tech>,
	kernel test robot <lkp@intel.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom drivers fixes for 6.2
Date: Tue, 10 Jan 2023 13:50:25 -0800
Message-Id: <20230110215025.1008437-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.2/drivers-fixes

for you to fetch changes up to a1904fa4dfc929e5ea36bd409cf0d800df56fb8b:

  firmware: raspberrypi: Fix type assignment (2023-01-10 13:44:04 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM/ARM64/MIPS SoCs drivers fixes
for 6.2, please pull the following:

- Maxime fixes a sparse annotation for one of the Raspberry Pi firmware
  clock request message

----------------------------------------------------------------
Maxime Ripard (1):
      firmware: raspberrypi: Fix type assignment

 include/soc/bcm2835/raspberrypi-firmware.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
