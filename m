Return-Path: <SRS0=ZFoj=TL=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1A9C433EF
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 16:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E88C8C340F0; Mon, 28 Feb 2022 16:55:41 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5144BC340E7;
	Mon, 28 Feb 2022 16:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5144BC340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d187so11491449pfa.10;
        Mon, 28 Feb 2022 08:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wTcIV7uaKIKWzX6j4s2mtdRtrMtzpU55KzEcP8UT62w=;
        b=UhsOWbUgqwKm+SkrX2sjQ3YmQlQR3Pqibav1WS9RRhE/bsQZHK4U0pjP0eUp25bYwp
         5MsaVZV7QXJwCUnBqRxEFnxYYxBZA79VCMXNABhF8v0Z8hgcwqFPkuusnQwHPuiTYEZc
         faSIo0a5+w4udTHtL849viVKqzahjr+02Ty19xkIjMi2V2Mmul2TI7eE8jHA2JWfhFZE
         8irTLJj9t+hezOLwKMd9ZDsYE7xcM+6QQFP2oEgTCQB9+DzgYjYsR5sfjkpECO/dBjM9
         B0W28ItAoX7J1eBrfb5MORF5SASeNLerXbnIfP/3zmW1EeMCz109ChOg2sfqunFa/MyI
         EHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wTcIV7uaKIKWzX6j4s2mtdRtrMtzpU55KzEcP8UT62w=;
        b=IBHTHBUtZsPVnP6SbUjyO8jc+YdJ/V67TSllnzEpS3lYUq5z/ZF5Ag5KTXstb/htYH
         RG8FuHiVXomdeeznKky28+/CDizOE2Wcte3ssikwpTyX/s/OBFPyqiSxiiyERCXERlFx
         DLXHb/DlfcYEAq5VmFOeadqh463/x12ZY9VbXN6ALsk6H11vSNaLSIo6p/nvf233HGLb
         qNONpuYtuVdrcNoORCc+ur6DJl059ZF0VpomOfl4vt0+vm3lrqSte0LNe0lIY9AFbkiq
         kxxyggFMp0Wzz1pJpDZw+4QlpyU6GbwCU2l36dWo9GpgjPMW90ip9irY6NqLb7rdlDcZ
         Okhw==
X-Gm-Message-State: AOAM531WsfH4RYalfjSvjq58f18c87nWP1vxGSxOuEWo+jKJbsS1fpFm
	I/f6PNrNenyvTmagfT+L9Mx2H7CGwwY=
X-Google-Smtp-Source: ABdhPJzoDlRtpyPlAiHa2oy/0/L7Qp4fLrRv99UBFi01AjX2o9nJtf6Vf5F4WPUKzdg+E2C6Or8ILQ==
X-Received: by 2002:a05:6a02:193:b0:375:65a5:2fcd with SMTP id bj19-20020a056a02019300b0037565a52fcdmr17857833pgb.288.1646067340456;
        Mon, 28 Feb 2022 08:55:40 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d5-20020a17090acd0500b001b9c05b075dsm17915077pju.44.2022.02.28.08.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 08:55:39 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Maxime Ripard <maxime@cerno.tech>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1 RESEND] Broadcom devicetree fixes for 5.17
Date: Mon, 28 Feb 2022 08:55:37 -0800
Message-Id: <20220228165537.1950863-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cfb92440ee71adcc2105b0890bb01ac3cddb8507:

  Linux 5.17-rc5 (2022-02-20 13:07:20 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.17/devicetree-fixes

for you to fetch changes up to 515415d316168c6521d74ea8280287e28d7303e6:

  ARM: boot: dts: bcm2711: Fix HVS register range (2022-02-23 11:03:29 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
5.17, please pull the following:

- Maxime fixes the HVS (display) register range for the BCM2711
  (Raspberry Pi 4) SoC

----------------------------------------------------------------
Maxime Ripard (1):
      ARM: boot: dts: bcm2711: Fix HVS register range

 arch/arm/boot/dts/bcm2711.dtsi | 1 +
 1 file changed, 1 insertion(+)
