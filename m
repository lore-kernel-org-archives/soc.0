Return-Path: <SRS0=NPTw=VM=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C1CC433F5
	for <soc@archiver.kernel.org>; Wed,  4 May 2022 21:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5AF61C385A5; Wed,  4 May 2022 21:09:53 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0306C385A8;
	Wed,  4 May 2022 21:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0306C385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id j8so2560385pll.11;
        Wed, 04 May 2022 14:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GdCyuXXZyky6stR3MK/zwsqkqsEvNIDdWptr2uejo7k=;
        b=MzxI8ZfxnFw6b/uj5i7oftoiaOGFpCKI1S7EHqAkXA92hEOlneXrvb6oRBKfXaMPQc
         9mAFJOtWpFKuFrz8ngBEXwkjPrwTGlXVH5aySweCT9dvTaZbLUrup+H6fY2fqV6iykte
         hyHFXPl1awkjt6r+0EHJLt+PyS2DCxfp+F09RsMlaro5eESW4PZpuj3CT+f6+wtITIT+
         LiB4lD067TiDR5+fbqlWMBlLwVGq3J/hdDJHgebe0FrNy6l8MvS9mkqBaoYOOoGZCYLz
         hPjVdExHzsFPiQhuluReuWSsjF8KA2Qdpl6Ckxouiv1SdG1bqy+nx+N6CJIN5Dpyh3ad
         z/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GdCyuXXZyky6stR3MK/zwsqkqsEvNIDdWptr2uejo7k=;
        b=1ryphOj4dxl6q0z3torfi1w7Y1klrZVBcySGqzl2XEY/qtp8xvrjQ96cpWjKBEdxGB
         8qLWMlg+VgkuMasXl1nkIZKbnCnGldQoIyNgy7KvwMhR+vH4ijac4WHI0hlcVbQsj3Le
         P5CknKJkEQRZqqq6hFIXJj5MfSWk7hvvAqSdyZTIJuJM2s1pmrnxgosRcbgBDdp3hVi3
         NYQcvzs5HQrx9I4CT7mGOd9bK6NnHxRNHg48fgUYeF2DQtZxzQ+r9Fov14G0XvhZhXuD
         nMFHKMn4j2EWNC7Ddd6kBaTIM4X8lBNnPjZf4Xc8bUzpu0eqrE82Y6wTp7p5+1oFFgsV
         Ra5g==
X-Gm-Message-State: AOAM533Uwb2mVzxxh6kqOXBIhb+buJqslWew37wNFX0jUKro4BuOFzuF
	FdtDiYgIRSSSNegZvoZz2Y26PHd8F08=
X-Google-Smtp-Source: ABdhPJzB5BBpINxJ17kM73YCcnMhE7TP61MTMc4GR7zow/nnWVSZzWDueZCEUWZyL206RC7gn4lP/g==
X-Received: by 2002:a17:902:a988:b0:158:9877:6c2c with SMTP id bh8-20020a170902a98800b0015898776c2cmr23745909plb.80.1651698592006;
        Wed, 04 May 2022 14:09:52 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r11-20020a63204b000000b003aaf27b5ceasm14820457pgm.1.2022.05.04.14.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 14:09:51 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Joe Perches <joe@perches.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 5/6] Broadcom maintainers changes for 5.19
Date: Wed,  4 May 2022 14:09:41 -0700
Message-Id: <20220504210942.1838248-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504210942.1838248-1-f.fainelli@gmail.com>
References: <20220504210942.1838248-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/maintainers

for you to fetch changes up to c270a59bc4d7537c3e6bab080c65e669e459fc53:

  MAINTAINERS: Add Broadcom BCMBCA entry (2022-04-22 14:19:51 -0700)

----------------------------------------------------------------
This pull request contains Broadcom updates to the MAINTAINERS file for
5.19, please pull the following:

- Stefan adds the raspberrypi keyword to the BCM2835 section to avoid
  missing patches

- Joe updates the various entries where the Broadcom internal mailing
  list is mentioned to make it a reviewer entry

- William updates the MAINTAINERS file to include the BCMBCA SoC entry

----------------------------------------------------------------
Joe Perches (1):
      MAINTAINERS: Broadcom internal lists aren't maintainers

Stefan Wahren (1):
      MAINTAINERS: add raspberrypi to BCM2835 architecture

William Zhang (1):
      MAINTAINERS: Add Broadcom BCMBCA entry

 MAINTAINERS | 79 ++++++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 47 insertions(+), 32 deletions(-)
