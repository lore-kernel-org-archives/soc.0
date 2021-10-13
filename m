Return-Path: <SRS0=qGb1=PB=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9BCC433FE
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 17:40:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A1C6061152; Wed, 13 Oct 2021 17:40:23 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76146600D3;
	Wed, 13 Oct 2021 17:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76146600D3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 133so3058608pgb.1;
        Wed, 13 Oct 2021 10:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ofaUTA2ZywTeTIKfdMxgxZ82ehjml1HUcHNnSixihZc=;
        b=jo1BJaw+Vgu6kR3hW09prRQasFJfMFQYbjHypr1yh5ASbUhsKWtSolqCYhVXkLmDQg
         xZp/1f2TKOAtj5m/0bjpbszuBhOiSJOzx9v/c7Ctfq9LQ9zPAWUkx8FhTLYLSWAeJEEI
         w6tkJajOonHfnJwnbmcPUG8Zglh55aQHpnVLulHUvoWAPhVbVb0o37TswQ/U9tYAYObx
         OnB3hmCwTkS0ytVogpGVq4AyhkQTNJYtkQOoTthJ1sXVwHBPiIXStQ7wB6Quqlw5udQF
         t9eVJ1zrfg9696FkgbaVve9ZK4iRDCX3Kye0py2lsGL7X6B/tSvAfPZ/qVC6EqqJZHhs
         PqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ofaUTA2ZywTeTIKfdMxgxZ82ehjml1HUcHNnSixihZc=;
        b=LlFDiR+jCL6dvvwK6OzmDfobMQlBxcGTfhpmyEElhgFAf2CID5PWQe0LqV0U4PyRET
         pBRYgsP6bpZJXotn5zEB51gbYq/wpcjmbo5PuYaNeiF+8aCTvMPCtdUI3+VQON/apxAO
         Yc9WJ967OjOVsPuh2F5bwWyM/kkxsMk4WrQgk0UCZa+gJu5+EO84EXQ2VT1avqEWCfT5
         ma6WhDF6wkAnuY/Y4Nw2YyCvQyko1R7gt1B08YhzSu4xM3ajvEZBSIDW4BNuZjyJacTp
         3waJI2UddpWgamWEVmWPGLTuqkw7OLcVYBCfqlnvRAjx9YLdol/qNQkUT6sBDyjpDS9p
         UVdA==
X-Gm-Message-State: AOAM533Wkq+JrsfrhSJ/NlZFNXt+br2kED2nR81+w79011B94AMOXnfK
	41v+tCxGbWkwTAuUc8jtRajTBBadExY=
X-Google-Smtp-Source: ABdhPJys0e2JMNsqY898UUxhYB9rYBqG2wAPCioZTR1y5RPy7nxN2TRUO9BOnFpo8/OVYQJnuNmxPg==
X-Received: by 2002:a63:3643:: with SMTP id d64mr437716pga.110.1634146822586;
        Wed, 13 Oct 2021 10:40:22 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id e15sm133794pfc.134.2021.10.13.10.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 10:40:21 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/3] Broadcom devicetree-arm64 changes for 5.16
Date: Wed, 13 Oct 2021 10:40:15 -0700
Message-Id: <20211013174016.831348-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013174016.831348-1-f.fainelli@gmail.com>
References: <20211013174016.831348-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.16/devicetree-arm64

for you to fetch changes up to 6c38c39ab2141f53786d73e706675e8819a3f2cb:

  arm64: dts: broadcom: bcm4908: Fix UART clock name (2021-09-14 14:36:37 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree changes
for 5.16, please pull the following:

- Rafal updates the BCM4908 DTS files to produce fewer warnings by
fixing the UART clock name, moving the reboot syscon node out of the bus
node, and finally updating the NAND controller node names.

----------------------------------------------------------------
Rafał Miłecki (3):
      arm64: dts: broadcom: bcm4908: Fix NAND node name
      arm64: dts: broadcom: bcm4908: Move reboot syscon out of bus
      arm64: dts: broadcom: bcm4908: Fix UART clock name

 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
