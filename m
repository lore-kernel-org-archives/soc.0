Return-Path: <SRS0=smf9=W3=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734C0C43334
	for <soc@archiver.kernel.org>; Mon, 20 Jun 2022 17:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38B5EC341C4; Mon, 20 Jun 2022 17:07:53 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D693C3411B;
	Mon, 20 Jun 2022 17:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9D693C3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id b12-20020a17090a6acc00b001ec2b181c98so9719340pjm.4;
        Mon, 20 Jun 2022 10:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aizZHeC7IzpXlPRi9qLmGdh35BEURHmVTGC1IsDi9Ww=;
        b=SRRMB+3iVTOT6EpfuIWUKpDWCRrUY3ghJqpUkLZR1Rvl+lK+wcVaKkjRbdumh0OrMf
         PEWIQI7jNushxOlh7DG8bU1hA3Hboy3TVqwB+8ncjGMdtbzG4ggpmpn4flCTJT8u/ugQ
         cHdBpqcAo9LI9DBbd/3uFxQo2n4WhPh6aUDsXsr8/COftAEa1mE3lUnp6YhsngHrPRbY
         C3pga5VG5NG7CNiHI+oj0gCMIf/75nl/NSVcjsCkH0iW6Jhn6Sk7OoY/sjZmWDoJFMf+
         SI9VtQ2uy7Qmib6HWsI5V00WCkFVak1NeV8y6FKbG7y460mGmvZDvVPiov1LTuvQJH/C
         gNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aizZHeC7IzpXlPRi9qLmGdh35BEURHmVTGC1IsDi9Ww=;
        b=grOtnzkHiRdTAhXr9ZHvs5Cg1H+pYp8XWlatsbzNaKAc9uHNSpNRirg68RUK/BHU2q
         B5mK2vlbTF38rUOEpaTaMDCUIKeZNWpixwPX9jv/zpPSQ1z15Uk1AANr6P1cobhc9S4k
         JfQf9Bqrq4uIN3gEhDDgHZRyumORj+Ke8Brg8cS64fypvvfDv/YxtestAcN7occvripZ
         Fh+zCDXvx8WEORO/+Oe9NDuO8YTmAD35rtEjNFd7tIzlmZHiPeToyriwhXBoMGIq9Tbu
         paWnPdNluz37Rjy3147BF3HDuMXaWo0bn/PxwQlFHMteCl1i9/JBfV62Tgn9zM3qhYNU
         Fqyg==
X-Gm-Message-State: AJIora9xdjNCIIBmmzkRX9dZJoE07up71XHhK5lqI3a8VR0ETaPklSag
	dAxViOg1/Dngct+E09ACJa17xDzfGFY=
X-Google-Smtp-Source: AGRyM1tUkgh9oFbvSebOwOkhI/mD3xIbPDyGww7zWiSoMpGkkm4hept3vmUkE/sVz+qao9OBfrWusA==
X-Received: by 2002:a17:90a:4209:b0:1df:b907:ed3d with SMTP id o9-20020a17090a420900b001dfb907ed3dmr28396971pjg.40.1655744871669;
        Mon, 20 Jun 2022 10:07:51 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id y186-20020a62cec3000000b0051b9912889csm9466176pfg.101.2022.06.20.10.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:07:51 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL] Broadcom devicetree fixes for 5.19
Date: Mon, 20 Jun 2022 10:07:45 -0700
Message-Id: <20220620170745.2485199-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/devicetree-fixes

for you to fetch changes up to b9b6d4c925604b70d007feb4c77b8cc4c038d2da:

  ARM: dts: bcm2711-rpi-400: Fix GPIO line names (2022-06-17 14:53:06 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-SoC Device Tree fixes for 5.19,
please pull the following:

- Stefan fixes the Raspberry Pi 400 GPIO expander line names to match
  that of the downstream Raspberry Pi Linux tree

----------------------------------------------------------------
Stefan Wahren (1):
      ARM: dts: bcm2711-rpi-400: Fix GPIO line names

 arch/arm/boot/dts/bcm2711-rpi-400.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
