Return-Path: <SRS0=NPTw=VM=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3970DC4332F
	for <soc@archiver.kernel.org>; Wed,  4 May 2022 21:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2353BC385A4; Wed,  4 May 2022 21:09:52 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79C89C385A8;
	Wed,  4 May 2022 21:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79C89C385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id i62so2117478pgd.6;
        Wed, 04 May 2022 14:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f6ZR+kOWRNJna1kAg2RCMnVUOe3Ij7sjBioKLojXogM=;
        b=mnZ0aDzA8i5WoJmtnNA3gMM6AYyi1AAu2PirHu9Gmo9K893iP5aPH+w9ioWUOdN+zJ
         WEz9P2atxgg0jQcow665ukcsEc3mbf5QdN+wyU38kUjM319X1NJsHGw5CNg4CpBsI4/7
         BRHq0XB+XWUjjXsE16XpNoaY78IWfSpaQUZz2/9HsNxiYtrylZR0C6n2lk1bg6VR0iV/
         dE9Tkw37a7jD8fDKWIgyHdii8JyQn+goubHu05VJ79pjHwQUKJQ1GGx6kPIZqgLn0moN
         XSb0KMPG4QoCXvn9bcMRgXIN/wb+hbqmHflwKykeiedyIsTD1uRs2m4TVBOvVPjrxHpH
         eo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f6ZR+kOWRNJna1kAg2RCMnVUOe3Ij7sjBioKLojXogM=;
        b=7EKOcPF13Q7yIMUXN1MeNK5ufa6x6u+eqPT7stz9eBiICB1+KLHKSeMvK3vh9JyPs2
         AQivL5EomUPw/JQYoytnnaKXxuAXGrNmG1iofuEzJXoTFz5jT1rSHefxYBvYzQOSxnrx
         ntGoyYRCEGfgEPo8MTWLC+h28e/g2LSPuXdtr/UuPZ/RRhswuYxnJ4kdSeFEEnclA5PT
         lNNguuy8xI6wSd4MKhkYI5TNjiN6kDY031IOE2VuB0NB4SQnZIU/QGHc/RXLDyBs+IWV
         IgQHQAyBO+0YbLVuzMBY6IcpJbsHu9aRG0WPhIhi7VnKVeWq6KmcuiKOiiAQ8/BuAZjf
         zdxQ==
X-Gm-Message-State: AOAM533u3J9iF0N70jiBgRyQcbqgeF8RKCR84PPnzc3ocNX6K79JTzNl
	GJA8GY5teCcdYE1VVucaKeS8lZ/4nfY=
X-Google-Smtp-Source: ABdhPJzSl3jzpd2lwTe2jW2iSmk9vVfOmHo09yGmOSvdaz+pB3Kq1GooDRR6eAvZTEC+rsIMdf/FBA==
X-Received: by 2002:a65:4186:0:b0:39d:6f6d:2fdf with SMTP id a6-20020a654186000000b0039d6f6d2fdfmr19556974pgq.248.1651698590732;
        Wed, 04 May 2022 14:09:50 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r11-20020a63204b000000b003aaf27b5ceasm14820457pgm.1.2022.05.04.14.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 14:09:50 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: lizhe <sensor1010@163.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	QintaoShen <unSimple1993@163.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/6] Broadcom drivers changes for 5.19
Date: Wed,  4 May 2022 14:09:40 -0700
Message-Id: <20220504210942.1838248-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504210942.1838248-1-f.fainelli@gmail.com>
References: <20220504210942.1838248-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/drivers

for you to fetch changes up to 9235d5118fa4e31f4d71c45d788b6f08d18ab6e0:

  bus: brcmstb_gisb: Remove the suppress_bind_attrs attribute of the driver (2022-04-26 09:12:45 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM/ARM64 SoCs drivers changes for
5.19, please pull the following:

- Qintao adds a missing NULL check to the Broadcom PMB driver after a
  memory allocation

- Li removes the redundant suppress_bind_attrs from the brcmstb_gisb
  driver which only has a probe and no remove function

----------------------------------------------------------------
QintaoShen (1):
      soc: bcm: Check for NULL return of devm_kzalloc()

lizhe (1):
      bus: brcmstb_gisb: Remove the suppress_bind_attrs attribute of the driver

 drivers/bus/brcmstb_gisb.c        | 1 -
 drivers/soc/bcm/bcm63xx/bcm-pmb.c | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)
