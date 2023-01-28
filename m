Return-Path: <SRS0=fJuS=5Z=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC7EC27C76
	for <soc@archiver.kernel.org>; Sat, 28 Jan 2023 19:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D57D4C433EF; Sat, 28 Jan 2023 19:38:49 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01099C433D2;
	Sat, 28 Jan 2023 19:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01099C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id k13so8078665plg.0;
        Sat, 28 Jan 2023 11:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DheN+DD7nGpGmRX9qqJxlNurtZY3b42/+dvd+k5X69c=;
        b=dRpg1zk2YBm9xXgjtEOXqFAlgEziMtwoqsmK0FiYa5agISAH3Rw/hEJ2ayMgDF2VmY
         CALC7ZIoBwWJziFURKwocsvbjesF+0H7j5uzwk4CQWv1siuHUY//7TkzjQlHY1Shij+m
         05uaoshDbhU8S6E8++Ln0JqXg1ePNUxbu0SPGQZ+3t4b1Jvkc7Xxo4PdOQAz0azkPDt0
         x8NOR3EhDi60NomZTZQHkX+ZMaZCDuZDZKVv1wpa0nOGsU3Fnf4iW7KtrNEhCVC2Yd19
         iekupwDTcXABMYUtB0pRBNhotxw8Kli5njXljanwgdbGCAln0ELibuMf40BmQj0HVp70
         +kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DheN+DD7nGpGmRX9qqJxlNurtZY3b42/+dvd+k5X69c=;
        b=SdJHZB7bmhKoFvc+TopoTnLoH2LbO1FrN7nopY4u9X0Nmsqq0o/k8IFVLCBc9BbA6w
         msLEV3DMrCsqMWcEbfNAqByEYNA0pHmAN+L0ErZ02nWQ/3SaFTqbIDNT6+JRe6w/sesc
         S7U0RAA/PhsT06z2INkbce/j4RjGO5haclpPT6BwpZwsXrmmAPDRlWOOsvWVPmm5lpXv
         UsXBeGyzrV/rn9PEcp9ZmFeRBvlfI9O1EdqSjJOIsx06Tq53jrpvale1cJ2SuuernSNs
         OM/Bq5DiCHYYNAxbkKvNfODvSHc4q8T5k4WIPqaWQ7hcaLAgsE+S+V/Wh3gwc1TZYIGB
         m/ZA==
X-Gm-Message-State: AFqh2krGvayhpUvHaH8CVWdTVI0v9Tng8oLeJcw4jZE/H26OpzxBy0oC
	gKBmz87oRLJwJonncezBanMWFnnGX00bqA==
X-Google-Smtp-Source: AMrXdXtOMlMXGKLoToxKxA2tbiQ1zosag0hiQSzORJYCgkXaWkn+ndM+50xU25WILluPUMXQkj93ew==
X-Received: by 2002:a17:90a:7802:b0:229:4a88:47de with SMTP id w2-20020a17090a780200b002294a8847demr45017531pjk.13.1674934727821;
        Sat, 28 Jan 2023 11:38:47 -0800 (PST)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id u6-20020a17090a2b8600b0022c06124ad6sm6956113pjd.36.2023.01.28.11.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 11:38:47 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/5] Broadcom drivers changes for 6.3
Date: Sat, 28 Jan 2023 11:38:44 -0800
Message-Id: <20230128193844.1628888-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.3/drivers

for you to fetch changes up to 94214f145bdf91bd5a60657c71ca6df6ec0fd0b6:

  soc: bcm: bcm2835-power: Drop empty platform remove function (2023-01-10 13:46:28 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM/ARM64 SoCs drivers updates for
6.3, please pull the following:

- Uwe removes an empty platform driver remove function in the
  bcm2835-power driver

----------------------------------------------------------------
Uwe Kleine-König (1):
      soc: bcm: bcm2835-power: Drop empty platform remove function

 drivers/soc/bcm/bcm2835-power.c | 6 ------
 1 file changed, 6 deletions(-)
