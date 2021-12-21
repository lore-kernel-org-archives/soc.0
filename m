Return-Path: <SRS0=MANq=RG=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4BCC433F5
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 22:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43C87C36AE9; Tue, 21 Dec 2021 22:06:51 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7456C36AE8;
	Tue, 21 Dec 2021 22:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7456C36AE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id o63-20020a17090a0a4500b001b1c2db8145so3840160pjo.5;
        Tue, 21 Dec 2021 14:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xxl47GIuvKplsYw8LQjwvzgp46yRQpH2UETtZceqlnE=;
        b=AL97JgO6421NgYuJVK6rG5vyUEJrw1RCAP6FNnNsoZ201PGC7hvuHm+n6H9J6plu+G
         jmrx7awoxx6Dhzax0Sh5pp/HkCv081oyEZlZ3AHQXfaBz4CoxTctOzdio3a/ZtmSvpsp
         3iDHf8GCSPcz3L6/99sY9KMxD5Ud1X87m4ER/PRY9f+9eMMKdCeonuRqlm9fNg3x6wV2
         5etSZdMk/Yp9P9tvKBKadP1d9iVOpjHpfSaTprbu1G8dTEn/xJn48Vl7rigY+vjrALYe
         EgjI/PRAl2bncYZh3aGYJyE7cZLr/RffDb/LDZK6aK034VQN7OEwXGzQvXWOuly83A9Y
         zfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xxl47GIuvKplsYw8LQjwvzgp46yRQpH2UETtZceqlnE=;
        b=LM5jfsCkQSbjlJj/3o+UDagmY8KBx58/8iBpz2PLtUk2ERlDQxU6kdocxWDXN5LiXs
         zu1Nxt4I7Etyu9ZrYs+QnOu14kS7B4yjbpuLghIyqr3SaqZM9b5HwUG8cxCqzGgoJS1I
         RAgQOl3n7MFKEM5vSoSFxsOmpYhUeF5JMIki/T1rpSBTiLoHj+4zQHixDb2ZRsNrKfaT
         mpQUMUqJpYs4SPvaarxX/uVsy5yB5rbnpZ2NPFx6+obSeghsqrSv9X6DrS0FmISmLhOO
         IhbFoddKMdbn/LsE5MkZUqZVVO6fDYwWL1fZZZOT0WOjxAapMbYkueFwv1qwU1EyLppt
         OWSw==
X-Gm-Message-State: AOAM530z/Cxy2L84Qs75juWVBEp2sPCaei9AkjQ2JC3al60gnW3Td0ic
	qFpYJX1pWQIgPol/kxzpwkNbmlzXUN4=
X-Google-Smtp-Source: ABdhPJzXZh0aEzywWoWJS2IQ1jb+TqsnvtZsZWtBOgCxHlJlPbL62++pO/JdKeWfrG8oVlVrzP0xuw==
X-Received: by 2002:a17:903:244a:b0:148:b5d2:6507 with SMTP id l10-20020a170903244a00b00148b5d26507mr195245pls.145.1640124409891;
        Tue, 21 Dec 2021 14:06:49 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id q190sm70342pgq.38.2021.12.21.14.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 14:06:49 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/6] Broadcom devicetree-arm64 changes for 5.17
Date: Tue, 21 Dec 2021 14:06:40 -0800
Message-Id: <20211221220642.2862218-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221220642.2862218-1-f.fainelli@gmail.com>
References: <20211221220642.2862218-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.17/devicetree-arm64

for you to fetch changes up to d0e68d354f345873e15876a7b35be1baaf5e3ec9:

  arm64: dts: broadcom: bcm4908: add DT for Netgear RAXE500 (2021-11-15 09:52:26 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree changes
for 5.17, please pull the following:

- Rafal adds and documents the Netgear RAXE500 Wireless router based on
the BCM4908 SoC.

----------------------------------------------------------------
Rafał Miłecki (2):
      dt-bindings: arm: bcm: document Netgear RAXE500 binding
      arm64: dts: broadcom: bcm4908: add DT for Netgear RAXE500

 .../devicetree/bindings/arm/bcm/brcm,bcm4908.yaml  |  1 +
 arch/arm64/boot/dts/broadcom/bcm4908/Makefile      |  1 +
 .../broadcom/bcm4908/bcm4908-netgear-raxe500.dts   | 50 ++++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908-netgear-raxe500.dts
