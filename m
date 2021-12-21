Return-Path: <SRS0=MANq=RG=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEE7C433FE
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 22:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3529C36AE8; Tue, 21 Dec 2021 22:06:52 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C12EC36AE9;
	Tue, 21 Dec 2021 22:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C12EC36AE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 8so238721pgc.10;
        Tue, 21 Dec 2021 14:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tuCdA6njNi3qm1oY35zPkXvaVCOXXsOrzk7lZ6f1QHQ=;
        b=TNK3qj7N1OmAaiNxBPyqoU1JgecaXCaB6ljFJoH2pIaNjMVxuCo9cqoaMtbA1vg4Q1
         fSQrxf6Ta9DZ2ynjSQNm1clZKIpRcP1I2eJraTQBNVabT/QSqAMhErzNJAJhp2VEdJbO
         9b/fvwa9MkL7qkad1iZRXEt5p/onMWQVrIre00yCenzmc/ZtXjORx31YXXdEoJX7DT+Y
         3ICXSRfcaEOaixUIdVvFIkGofnrLSK5ff1MrURZMzdsCsO8mZdBjkwdr7dzZtKfM//bm
         PQOQ6XNASbGNPvhVyl4tsvjco6nUKnNLE1gzJ5IFCF5m/HvjE9rp0FvFmXu1C0X1CP7Q
         FCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tuCdA6njNi3qm1oY35zPkXvaVCOXXsOrzk7lZ6f1QHQ=;
        b=wFljGWHhhrj5m76nJLJBhXCddPYFlZKMZBk8BjVLaLkd+/sver2w6Z6p2ruadBFTRq
         S0nGg06PIi2v7tCXkraCJ7ai57hIbW/xr/152MfZxECzXYYihosbQiOFEKGK6nOcsHjJ
         rmvEW9SH+vUBorlfASSph0CV/1QVmeSVVdQMDahjTyvzu6emULeg3QdU9u4HWDt1rxqQ
         im7pzYt7DG+UJkIlG+CDu8Q87rN6bsp3ztuHytNSV+32HbPdGskZIOuvQ2uUV8cULRfo
         Wzh3Ng54jKEbdftYrCFxVPtQw6JXV8J4VJn/PZp4VQUY5Lt8iEoP+JqI+S7eYTk9TCvk
         Vuhw==
X-Gm-Message-State: AOAM531JjW5inmTExCvJZLLOQrNe1FADhxfi2/Wb594gGrCwxCr+u5Tq
	rkDz5gEt/Fu45sIECn9lcc9IBJxwYJY=
X-Google-Smtp-Source: ABdhPJxo7HP6FERjJzFO9nFXFJ2d08spfHZbdufb/JrC1C3QQvHz/35PI9gvugcrgB0xtz9fHOWaGg==
X-Received: by 2002:aa7:8b07:0:b0:4a4:d003:92a9 with SMTP id f7-20020aa78b07000000b004a4d00392a9mr47529pfd.61.1640124411320;
        Tue, 21 Dec 2021 14:06:51 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id q190sm70342pgq.38.2021.12.21.14.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 14:06:50 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Wan Jiabing <wanjiabing@vivo.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 5/6] Broadcom drivers changes for 5.17
Date: Tue, 21 Dec 2021 14:06:41 -0800
Message-Id: <20211221220642.2862218-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221220642.2862218-1-f.fainelli@gmail.com>
References: <20211221220642.2862218-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.17/drivers

for you to fetch changes up to f5029f62d9ba9b99fd712514784f91f920a63d21:

  soc: bcm: brcmstb: Add of_node_put() in pm-mips (2021-11-15 09:57:14 -0800)

----------------------------------------------------------------
This pull request contains Broadcom SoCs drivers changes for v5.17,
please pull the following changes:

- Wan adds a missing of_node_put() in the power management driver for
MIPS SoCs.

----------------------------------------------------------------
Wan Jiabing (1):
      soc: bcm: brcmstb: Add of_node_put() in pm-mips

 drivers/soc/bcm/brcmstb/pm/pm-mips.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
